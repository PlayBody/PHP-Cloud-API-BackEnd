<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Apishifts extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('organ_model');
        $this->load->model('shift_model');
        $this->load->model('setting_init_shift_model');
        $this->load->model('setting_count_shift_model');
        $this->load->model('staff_model');
        $this->load->model('staff_organ_model');
    }

    public function loadShifts(){

        $mode = $this->input->post('mode');
        $staff_id = $this->input->post('staff_id');
        $organ_id = $this->input->post('organ_id');
        $from_date = $this->input->post('from_date');
        $to_date = $this->input->post('to_date');

        $results = [];

        if (empty($staff_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $staff = $this->staff_model->getFromId($staff_id);

        $organ_list = $this->staff_organ_model->getOrgansByStaff($staff_id);

        if (empty($organ_id)) $organ_id=$organ_list[0]['organ_id'];

        $organ = $this->organ_model->getFromId($organ_id);

        if (empty($organ) || empty($staff)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $count_shift = [];
        $tmp_list = $this->setting_count_shift_model->getListByCond(['organ_id'=>$organ_id, 'from_time'=>$from_date. ' 00:00:00', 'to_date'=>$to_date. ' 23:59:59']);
        foreach ($tmp_list as $item) {
            $tmp = [];
            $tmp['from'] = $item['from_time'];
            $tmp['to'] = $item['to_time'];
            $tmp['count'] = $item['count'];

            $count_shift[] = $tmp;
        }

        $organ_active_start = empty($organ['active_start_time']) ? '00:00' : $organ['active_start_time'];
        $organ_active_end = empty($organ['active_end_time']) ? '24:00' : $organ['active_end_time'];

        $shift_inactive = [];
        $init_shift_list = [];
        $cur_date = $from_date;
        while($cur_date<=$to_date){
            $parseDate = date_parse($cur_date);
            $weekday = date('D', mktime(null, null, null, $parseDate['month'], $parseDate['day'], $parseDate['year']));

            if ($organ_active_start>$organ_active_end){
                $tmp = [];
                $tmp['from'] = $cur_date. ' ' .$organ_active_end;
                $tmp['to'] = $cur_date. ' ' .$organ_active_start;
                $tmp['type'] = '5';

                $shift_inactive[] = $tmp;
            }else{
                $tmp = [];
                $tmp['from'] = $cur_date. ' 00:00:00';
                $tmp['to'] = $cur_date. ' ' .$organ_active_start;
                $tmp['type'] = '5';

                $shift_inactive[] = $tmp;

                $tmp = [];
                $tmp['from'] = $cur_date. ' ' .$organ_active_end;
                $tmp['to'] = $cur_date. ' 23:59:59';
                $tmp['type'] = '5';

                $shift_inactive[] = $tmp;

            }

            $cond = [];
            $cond['organ_id'] = $organ_id;
            $cond['staff_id'] = $staff_id;
            $cond['weekday'] = $weekday;
//            if ($from_date>=date('Y-m-d') || $mode=='init'){
            if ($mode=='init'){
                $tmp_list = $this->setting_init_shift_model->getListByCond($cond);

                $shift_area = $this->setting_count_shift_model->getListByCond(['organ_id'=>$organ_id, 'from_time'=>$cur_date. ' 00:00:00', 'to_date'=>$cur_date. ' 23:59:59']);
                if (!empty($shift_area)){

                    foreach ($tmp_list as $item) {
                        $tmp = [];
                        $tmp['shift_type'] = '1';
                        foreach ($shift_area as $tmp_area){
                            if ($cur_date. ' ' . $item['from_time']>=$tmp_area['from_time'] && $cur_date. ' ' . $item['to_time']<=$tmp_area['to_time'] ){
                                $tmp['from_time'] = $cur_date. ' ' .$item['from_time'];
                                $tmp['to_time'] = $cur_date. ' ' .$item['to_time'];
                            }
                            if ($cur_date. ' ' . $item['from_time']<$tmp_area['from_time'] && $cur_date. ' ' . $item['to_time']>$tmp_area['from_time'] && $cur_date. ' ' . $item['to_time']<=$tmp_area['to_time'] ){
                                $tmp['from_time'] = $tmp_area['from_time'];
                                $tmp['to_time'] = $cur_date. ' ' .$item['to_time'];
                            }
                            if ($cur_date. ' ' . $item['from_time']>=$tmp_area['from_time'] && $cur_date. ' ' . $item['from_time']<$tmp_area['to_time'] && $cur_date. ' ' . $item['to_time']>$tmp_area['to_time'] ){
                                $tmp['from_time'] = $cur_date. ' ' .$item['from_time'];
                                $tmp['to_time'] = $tmp_area['to_time'];
                            }
                        }
                        if (!empty($tmp['from_time']))
                        $init_shift_list[] = $tmp;
                    }
                }
            }

            $diff1Day = new DateInterval('P1D');

            $curDateTime = new DateTime($cur_date);

            $curDateTime->add($diff1Day);
            $cur_date = $curDateTime->format("Y-m-d");
        }

        $cond = array();
        $cond['staff_id'] = $staff_id;
        $cond['organ_id'] = $organ_id;
        $cond['from_time'] = $from_date.' 00:00:00';
        $cond['to_time'] = $to_date.' 23:59:59';

        $staff_shift_list = $this->shift_model->getListByCond($cond);
        if ($mode == 'init'){
            foreach ($staff_shift_list as $item) {
                $this->shift_model->delete_force($item['shift_id'], 'shift_id');
            }

            $staff_shift_list = [];
            if (empty($staff_shift_list)){
                foreach ($init_shift_list as $item){
                    $add_shift = array(
                        'from_time'=>$item['from_time'],
                        'to_time' => $item['to_time'],
                        'staff_id' => $staff_id,
                        'organ_id' => $organ_id,
                        'visible' => 1,
                        'shift_type' => 1,
                    );

                    $this->shift_model->insertRecord($add_shift);
                }
                $staff_shift_list = $init_shift_list;
            }

        }


        $shift = [];

        foreach ($staff_shift_list as $item) {
            $tmp = [];
            $tmp['from'] = $item['from_time'];
            $tmp['to'] = $item['to_time'];
            $tmp['type'] = $item['shift_type'];

            $shift[] = $tmp;
        }

        $results['isLoad'] = true;
        $results['shift'] = $shift;
        $results['organ_id'] = $organ_id;
        $results['organ_list'] = $organ_list;
        $results['count_shift'] = $count_shift;
        $results['shift_inactive'] = $shift_inactive;

        echo(json_encode($results));
    }

    public function loadShiftStatus(){
        $staff_id = $this->input->post('staff_id');
        $organ_id = $this->input->post('organ_id');
        $select_datetime = $this->input->post('select_datetime');

        $cond = array();
        $cond['staff_id'] = $staff_id;
        $cond['organ_id'] = $organ_id;
        $cond['select_datetime'] = $select_datetime;
        $shifts = $this->shift_model->getListByCond($cond);

        $results = [];
        $results['isLoad'] = true;

        if (empty($shifts)){
            $results['status'] = '0';
        }else{
            $results['shift'] = $shifts[0];
        }

        echo json_encode($results);
        return;
    }

    public function submitShift(){
        $shift_id = $this->input->post('shift_id');
        $staff_id = $this->input->post('staff_id');
        $organ_id = $this->input->post('organ_id');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');

        $shift_area = $this->setting_count_shift_model->getListByCond(['organ_id'=>$organ_id, 'submit_from_time'=>$from_time, 'submit_to_time'=>$to_time]);
        if (empty($shift_area)){
            $results['isUpdate'] = false;
            $results['msg'] = 'area_error';
            echo json_encode($results);
            return;
        }

        $shift_exist = $this->shift_model->isExist($organ_id, $staff_id, $shift_id, $from_time, $to_time);
        if ($shift_exist){
            $results['isUpdate'] = false;
            $results['msg'] = 'exist_error';
            echo json_encode($results);
            return;
        }

        if (empty($shift_id)){
            $shift = array(
                'staff_id' => $staff_id,
                'organ_id' => $organ_id,
                'from_time' => $from_time,
                'to_time' => $to_time,
                'shift_type' => 1,
                'visible' => 1,
            );
            $insert = $this->shift_model->insertRecord($shift);
        }else{
            $shift = $this->shift_model->getFromId($shift_id);

            $shift['from_time'] = $from_time;
            $shift['to_time'] = $to_time;
            $shift['shift_type'] = 1;

            $this->shift_model->updateRecord($shift, 'shift_id');
        }

        $results=[];
//        if (!$insert){
//            $results['isUpdate'] = false;
//            echo json_encode($results);
//            return;
//        }

        $results['isUpdate'] = true;
        echo json_encode($results);
        return;
    }

    public function deleteShift(){
        $shift_id = $this->input->post('shift_id');

        if (!empty($shift_id)){
            $this->shift_model->delete_force($shift_id, 'shift_id');
        }

        $results['isDelete'] = true;
        echo json_encode($results);
        return;
    }

    public function actionStaffShift(){
        $shift_id = $this->input->post('shift_id');
        $status = $this->input->post('status');

        $results=[];

        if (empty($shift_id)){
            $results['isUpdate'] = false;
            echo json_encode($results);
            return;
        }

        $shift = $this->shift_model->getFromId($shift_id);

        if (empty($shift)){
            $results['isUpdate'] = false;
            echo json_encode($results);
            return;
        }

        $shift['shift_type'] = $status;

        $this->shift_model->updateRecord($shift, 'shift_id');


        $results['isUpdate'] = true;
        echo json_encode($results);
        return;

    }

    public function loadShiftManage(){
        $organ_id = $this->input->post('organ_id');
        $staff_id = $this->input->post('staff_id');
        $from_date = $this->input->post('from_date');
        $to_date = $this->input->post('to_date');

        $staff = $this->staff_model->getFromId($staff_id);

        if ($staff['staff_auth']>2){
            $cond = [];
            if ($staff['staff_auth']<4) $cond['company_id'] = $staff['company_id'];
            $organ_list = $this->organ_model->getListByCond($cond);
        }else{
            $organ_list = $this->staff_organ_model->getOrgansByStaff($staff_id);
        }

        if (empty($organ_id)) $organ_id=$organ_list[0]['organ_id'];

        $organ = $this->organ_model->getFromId($organ_id);


        $organ_active_start = empty($organ['active_start_time']) ? '00:00' : $organ['active_start_time'];
        $organ_active_end = empty($organ['active_end_time']) ? '24:00' : $organ['active_end_time'];

        $shift_inactive = [];
        $cur_date = $from_date;

        $divide_shift = [];
        while($cur_date<=$to_date){

            if ($organ_active_start>$organ_active_end){
                $tmp = [];
                $tmp['from'] = $cur_date. ' ' .$organ_active_end;
                $tmp['to'] = $cur_date. ' ' .$organ_active_start;
                $tmp['type'] = '5';

                $shift_inactive[] = $tmp;
            }else{
                $tmp = [];
                $tmp['from'] = $cur_date. ' 00:00:00';
                $tmp['to'] = $cur_date. ' ' .$organ_active_start;
                $tmp['type'] = '5';

                $shift_inactive[] = $tmp;

                $tmp = [];
                $tmp['from'] = $cur_date. ' ' .$organ_active_end;
                $tmp['to'] = $cur_date. ' 23:59:59';
                $tmp['type'] = '5';

                $shift_inactive[] = $tmp;

            }

            $area_list = $this->setting_count_shift_model->getListByCond(['organ_id'=>$organ_id, 'from_time'=>$cur_date. ' 00:00:00', 'to_time'=>$cur_date. ' 23:59:59']);

            foreach ($area_list as $area){
                $divide_list = $this->shift_model->getDivideShifts($area['from_time'], $area['to_time'], $organ_id);

                $old_time ='';
                foreach ($divide_list as $item){
                    if ($old_time==''){
                        $old_time = $item['time'];
                    }else if($item['time']==$old_time){
                        continue;
                    }else{
                        $tmp = [];
                        $tmp['from'] = $old_time;
                        $tmp['to'] = $item['time'];
                        $tmp['count'] = $area['count'];

                        $tmp['exist_count'] = $this->shift_model->getExistCount(['organ_id'=>$organ_id, 'from_time'=>$tmp['from'], 'to_time'=>$tmp['to']]);

                        $divide_shift[] = $tmp;
                        $old_time = $item['time'];
                    }

                }

            }


            $diff1Day = new DateInterval('P1D');

            $curDateTime = new DateTime($cur_date);

            $curDateTime->add($diff1Day);
            $cur_date = $curDateTime->format("Y-m-d");
        }

//        $cond = array();
//        $cond['organ_id'] = $organ_id;
//        $cond['from_time'] = $from_date.' 00:00:00';
//        $cond['to_time'] = $to_date.' 23:59:59';

//        $staff_shift_list = $this->shift_model->getListByCond($cond);

//        $shift = [];
//
//        foreach ($staff_shift_list as $item) {
//            $tmp = [];
//            $tmp['from'] = $item['from_time'];
//            $tmp['to'] = $item['to_time'];
//            $tmp['type'] = $item['shift_type'];
//
//            $shift[] = $tmp;
//        }

        $results['isLoad'] = true;
        $results['divide_shift'] = $divide_shift;
//        $results['shift'] = $shift;
        $results['organ_list'] = $organ_list;
        $results['shift_inactive'] = $shift_inactive;

        echo json_encode($results);

    }

    public function loadStaffManageStatus(){
        $organ_id = $this->input->post('organ_id');
        $select_time = $this->input->post('select_time');

        $shifts = $this->shift_model->getStaffShiftList($organ_id, $select_time);

        $results = [];
        $results['isLoad'] = true;
        $results['shifts'] = $shifts;

        echo json_encode($results);

    }

    private function isActiveTime($start_time, $end_time, $from_time, $to_time){

        $inactive = [];
        if ($start_time>$end_time){
            $tmp = [];
            $tmp['from'] = '00:00:00';
            $tmp['to'] = $end_time;
            $inactive[] = $tmp;

            $tmp = [];
            $tmp['from'] = $start_time;
            $tmp['to'] = '23:59:59';
            $inactive[] = $tmp;
        }else{
            $tmp = [];
            $tmp['from'] = $start_time;
            $tmp['to'] = $end_time;
            $inactive[] = $tmp;
        }

        $isactive = false;
        foreach ($inactive as $item){
            if ($from_time>=$item['from'] && $from_time<=$item['to'] && $to_time>=$item['from'] && $to_time<=$item['to'] ){
                $isactive = true;
                break;
            }
        }

        return $isactive;
    }
}
?>