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
        $this->load->model('organ_shift_time_model');
        $this->load->model('shift_lock_model');
        $this->load->model('reserve_model');
    }

    public function getShiftCounts(){
        $organ_id = $this->input->post('organ_id');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');

        $cond = [];
        $cond['organ_id'] = $organ_id;
        $cond['from_time'] = $from_time;
        $cond['to_time'] = $to_time;
        $shift_counts = $this->setting_count_shift_model->getListByCond($cond);

        $results['counts'] = $shift_counts;

        echo json_encode($results);
    }

    public function getStaffShifts(){
        $staff_id = $this->input->post('staff_id');
        $organ_id = $this->input->post('organ_id');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');
        $mode =  $this->input->post('mode');
        $pattern = $this->input->post('pattern');


        $cond['organ_id'] = $organ_id;
        $cond['staff_id'] = $staff_id;
        $cond['from_time'] = $from_time;
        $cond['to_time'] = $to_time;

        $shifts = $this->shift_model->getListByCond($cond);

        if ($mode == 'init'){
            $pattern = empty($pattern) ? 1 : $pattern;
            foreach ($shifts as $item) {
                $this->shift_model->delete_force($item['shift_id'], 'shift_id');
            }

            $condInit['staff_id'] = $staff_id;
            $condInit['organ_id'] = $organ_id;
            $condInit['pattern'] = $pattern;
            $initData = $this->setting_init_shift_model->getListByCond($condInit);
            foreach ($initData as $item){
                $diff1Day = new DateInterval('P'.($item['weekday']-1).'D');
                $curDateTime = new DateTime($from_time);
                $curDateTime->add($diff1Day);
                $sel_date = $curDateTime->format("Y-m-d");

                $condR = [];
                $condR['organ_id'] = $organ_id;
                $condR['from_time'] = $sel_date . ' 00:00:00';
                $condR['to_time'] = $sel_date . ' 23:59:59';

                $shift_counts = $this->setting_count_shift_model->getListByCond($condR);
                $item_from = $sel_date . ' ' . $item['from_time'];
                $item_to = $sel_date . ' ' . $item['to_time'];
                foreach ($shift_counts as $count){
                    if ($item_from<$count['to_time'] && $item_to>$count['from_time']){

                        $_from  = $item_from>=$count['from_time'] ? $item_from : $count['from_time'];
                        $_to  = $item_to<=$count['to_time'] ? $item_to : $count['to_time'];
                        $add_shift = array(
                            'from_time'=> $_from,// $input_from,
                            'to_time' => $_to, //$input_to,
                            'staff_id' => $staff_id,
                            'organ_id' => $organ_id,
                            'visible' => 1,
                            'shift_type' => empty($item['shift_type']) ? 1 : $item['shift_type'],
                        );

                        $this->shift_model->insertRecord($add_shift);
                    }
                }

            }

            $shifts = $this->shift_model->getListByCond($cond);
        }

        $results['shifts'] = $shifts;

        echo json_encode($results);
    }

    public function getStaffReserves(){
        $staff_id = $this->input->post('staff_id');
        $organ_id = $this->input->post('organ_id');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');

        $staff = $this->staff_model->getFromId($staff_id);

        $reserves = $this->reserve_model->getReserveList(['organ_id'=>$organ_id, 'staff_id'=>$staff_id, 'from_time'=>$from_time, 'to_time'=>$to_time, 'max_status'=>'2']);

        $results['isLoad'] = true;

        $results['reserves'] = $reserves;

        echo(json_encode($results));
    }


    public function getActiveShifts(){
        $organ_id = $this->input->post('organ_id');
        $shift_times = $this->organ_shift_time_model->getListByCond(['organ_id'=>$organ_id]);
        $results['shift_times'] = $shift_times;
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
            $shift_count = $this->setting_count_shift_model->getListByCond(['organ_id'=>$organ_id, 'select_time'=>$select_datetime]);
            if (!empty($shift_count)){
                $results['count_shift'] = $shift_count[0];
            }

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
        $shift_type = $this->input->post('shift_type');


        $shift_exist = $this->shift_model->isExist($organ_id, $staff_id, $shift_id, $from_time, $to_time);
        if ($shift_exist){
            $results['isUpdate'] = false;
            $results['msg'] = 'exist_error';
            echo json_encode($results);
            return;
        }

        $shift_area = $this->setting_count_shift_model->getListByCond(['organ_id'=>$organ_id,
            'select_date'=>date('Y-m-d', strtotime($from_time))]);


        if (empty($shift_area)){
            $results['isUpdate'] = false;
            $results['msg'] = 'area_error';
            echo json_encode($results);
            return;
        }

        $is_add = false;
        foreach ($shift_area as $record){
            $_start = $record['from_time'];
            $_end = $record['to_time'];
            $from = $from_time;
            $to = $to_time;

            if ($from>=$_end || $to<=$_start) continue;
            if ($from>$_start) $input_from = $from; else $input_from = $_start;
            if ($to>$_end) $input_to = $_end; else $input_to = $to;

            $shift = array(
                'staff_id' => $staff_id,
                'organ_id' => $organ_id,
                'from_time' => $input_from,
                'to_time' => $input_to,
                'shift_type' => $shift_type,
                'visible' => 1,
            );
            $is_add = true;
            $this->shift_model->insertRecord($shift);
        }

        if (!$is_add){
            $results['isUpdate'] = false;
            $results['msg'] = 'area_error';
            echo json_encode($results);
            return;
        }

        if (!empty($shift_id)){
            $this->shift_model->delete_force($shift_id, 'shift_id');
        }

//
//        if (empty($shift_id)){
//            $shift = array(
//                'staff_id' => $staff_id,
//                'organ_id' => $organ_id,
//                'from_time' => $from_time,
//                'to_time' => $to_time,
//                'shift_type' => 1,
//                'visible' => 1,
//            );
//            $shift_id = $this->shift_model->insertRecord($shift);
//        }else{
//            $shift = $this->shift_model->getFromId($shift_id);
//
//            $shift['from_time'] = $from_time;
//            $shift['to_time'] = $to_time;
//            $shift['shift_type'] = 1;
//
//            $this->shift_model->updateRecord($shift, 'shift_id');
//        }

//        $prev_shift = $this->shift_model->getReleationShift($organ_id, $staff_id, $from_time, 'prev');
//        if (!empty($prev_shift)){
//            $shift['shift_id'] = $shift_id;
//            $shift['from_time'] = $prev_shift['from_time'];
//            $this->shift_model->updateRecord($shift, 'shift_id');
//            $this->shift_model->delete_force($prev_shift['shift_id'], 'shift_id');
//        }
//
//        $next_shift = $this->shift_model->getReleationShift($organ_id, $staff_id, $to_time, 'next');
//        if (!empty($next_shift)){
//            $shift['shift_id'] = $shift_id;
//            $shift['to_time'] = $next_shift['to_time'];
//            $this->shift_model->updateRecord($shift, 'shift_id');
//            $this->shift_model->delete_force($next_shift['shift_id'], 'shift_id');
//        }

        $results=[];
//        if ($shift['shift_type']=='1'){
//            $results['isSend'] = $this->sendNotificationToStaffShiftRequest($organ_id, $staff_id,  $shift['from_time'], $shift['to_time']);
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

        if ($staff['staff_auth']>3){
            $cond = [];
            if ($staff['staff_auth']<5) $cond['company_id'] = $staff['company_id'];
            $organ_list = $this->organ_model->getListByCond($cond);
        }else{
            $organ_list = $this->staff_organ_model->getOrgansByStaff($staff_id);
        }

        if (empty($organ_id)) $organ_id=$organ_list[0]['organ_id'];

        $organ = $this->organ_model->getFromId($organ_id);

        $shift_times = $this->organ_shift_time_model->getListByCond(['organ_id'=>$organ_id]);
        $organ_active_start = empty($organ['active_start_time']) ? '00:00' : $organ['active_start_time'];
        $organ_active_end = empty($organ['active_end_time']) ? '23:59' : $organ['active_end_time'];

        $shift_inactive = [];
        $cur_date = $from_date;

        $divide_shift = [];
        while($cur_date<=$to_date){
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

        $shift_counts = $this->setting_count_shift_model->getListByCond(['organ_id'=>$organ_id, 'from_time'=>$from_date. ' 00:00:00', 'to_time'=>$to_date. ' 23:59:59']);
        $shifts = $this->shift_model->getListByCond(['organ_id'=>$organ_id, 'from_time'=>$from_date. ' 00:00:00', 'to_time'=>$to_date. ' 23:59:59']);

        $results['isLoad'] = true;
        $results['active_time']['from'] = $organ_active_start;
        $results['active_time']['to'] = $organ_active_end;

        $results['shift_counts'] = $shift_counts;
        $results['shifts'] = $shifts;
        $results['divide_shift'] = $divide_shift;
        $results['shift_times'] = $shift_times;
        $results['organ_list'] = $organ_list;
        $results['shift_inactive'] = $shift_inactive;

        echo json_encode($results);

    }

    public function loadStaffManageStatus(){
        $organ_id = $this->input->post('organ_id');

        $staffs = $this->staff_organ_model->getStaffsByOrgan($organ_id, 4);

        $results['isLoad'] = true;
        $results['staffs'] = $staffs;

        echo json_encode($results);

    }

    public function saveShiftComplete(){
        $cur_staff_id = $this->input->post('cur_staff_id');
        $organ_id = $this->input->post('organ_id');
        $staff_id = $this->input->post('staff_id');
        $shift_id = $this->input->post('shift_id');
        $shift_type = $this->input->post('shift_type');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');

        $update_value = '4';
        if ($shift_type=='1') $update_value = '2';
        if ($shift_type=='-4') $update_value = '-3';

        if (empty($shift_id)){
            $shift = array(
                'organ_id' => $organ_id,
                'staff_id' => $staff_id,
                'shift_type' => $update_value,
                'from_time' => $from_time,
                'to_time' => $to_time,
                'visible' => '1'
            );
            $this->shift_model->insertRecord($shift);
        }else{
            $shift = $this->shift_model->getFromId($shift_id);
            $shift['shift_type'] = $update_value;
            $this->shift_model->updateRecord($shift, 'shift_id');
        }

        if ($staff_id!=$cur_staff_id){
            if ($update_value==4 || $update_value==2){
                $this->sendNotificationToStaffShiftRequest($organ_id, $cur_staff_id, $staff_id, $from_time, $to_time, $update_value);
            }
        }

        $results['isSave'] = true;
        echo json_encode($results);

    }

    private function sendNotificationToStaffShiftRequest($organ_id, $sender_id, $receiver_id, $from_time, $to_time, $update_value){
        $strMsg = $update_value==4 ? '出勤要請が入りました' : '出勤が承認されました。';
        $curstaff = $this->staff_model->getFromId($sender_id);
        $title = ($curstaff['staff_nick'] == null ? ($curstaff['staff_first_name'] . ' ' . $curstaff['staff_last_name']) : $curstaff['staff_nick']) .  '様から'.$strMsg;


        $fdate = new DateTime($from_time);
        $tdate = new DateTime($to_time);

        $content = $fdate->format('n月j日 H時i分').'から'. $tdate->format('H時i分') . 'まで'.$strMsg;

        $is_fcm = $this->sendNotifications($update_value==4 ? 'shift_request' : 'shift_accept', $title, $content, $receiver_id, $sender_id, '1');

        return true;

    }

    private function isCountTime($count_times, $sel_date, $from_time, $to_time){

        $isActive = false;
        foreach ($count_times as $record){
            $_start = $record['from_time'];
            $_end = $record['to_time'];
            $from = $sel_date . ' ' . $from_time;
            $to = $sel_date . ' ' . $to_time;
            if ($_start<=$from && $_end>=$to){
                $isActive = true;
                break;
            }
        }

        return $isActive;
    }

    public function loadOtherOrganExist(){
        $staff_id = $this->input->get('staff_id');
        $cur_organ_id = $this->input->get('cur_organ_id');
        $from_time = $this->input->get('from_time');
        $to_time = $this->input->get('to_time');

        $cond['staff_id'] = $staff_id;
        $cond['cur_organ_id'] = $cur_organ_id;
        $cond['from_time'] = $from_time;
        $cond['to_time'] = $to_time;

        $all_time = $this->shift_model->getOtherOrgansShift($cond);

        $results['all_time'] = $all_time;

        echo json_encode($results);

    }

    public function loadLockStatus(){
        $organ_id = $this->input->post('organ_id');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');

        $cond['organ_id'] = $organ_id;
        $cond['from_time'] = $from_time;
        $cond['to_time'] = $to_time;

        $lock = $this->shift_lock_model->getLockRecord($cond);
        $is_lock = false;
        if (!empty($lock)){
            $is_lock = $lock['lock_status'] == 1 ? true : false;
        }

        $results['isLoad'] = true;
        $results['is_lock'] = $is_lock;
        echo json_encode($results);
    }
    public function updateLockStatus(){
        $organ_id = $this->input->post('organ_id');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');
        $lock_status = $this->input->post('lock_status');

        $cond['organ_id'] = $organ_id;
        $cond['from_time'] = $from_time;
        $cond['to_time'] = $to_time;

        $lock = $this->shift_lock_model->getLockRecord($cond);

        if (empty($lock)){
            $lock = array(
                'organ_id' => $organ_id,
                'from_time' => $from_time,
                'to_time' => $to_time,
                'lock_status' => $lock_status
            );
            $this->shift_lock_model->insertRecord($lock);
        }else{
            $lock['lock_status'] = $lock_status;
            $this->shift_lock_model->updateRecord($lock, 'shift_lock_id');
        }

        $results['isSave'] = true;
        echo json_encode($results);
    }

    public function sendNotificationToStaffInputRequest(){
        $organ_id = $this->input->post('organ_id');
        $staff_id = $this->input->post('staff_id');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');

        $fdate = new DateTime($from_time);
        $tdate = new DateTime($to_time);
        $curstaff = $this->staff_model->getFromId($staff_id);
        $title = ($curstaff['staff_nick'] == null ? ($curstaff['staff_first_name'] . ' ' . $curstaff['staff_last_name']) : $curstaff['staff_nick']) .  '様からシフト入力要請が来ました。';
        $content = $fdate->format('n月j日').'から'. $tdate->format('n月j日') . 'までの希望シフトを入力してください。';
        $staffs = $this->staff_organ_model->getStaffsByOrgan($organ_id, 3, false);
        foreach ($staffs as $staff){
            if ($staff_id == $staff['staff_id']) continue;

            $shifts = $this->shift_model->getListByCond(['organ_id'=>$organ_id, 'staff_id'=>$staff['staff_id'], 'from_time'=>$from_time, 'to_time'=>$to_time]);

            if (empty($shifts)){
                $is_fcm = $this->sendNotifications('shift_require', $title, $content, $staff_id, $staff['staff_id'], '1');
            }
        }

        echo json_encode(['isSend'=>true]);

    }

    public function loadDailyDetail(){
        $organ_id = $this->input->post('organ_id');
        $select_date = $this->input->post('select_date');
        $shifts = $this->shift_model->getDayShift($organ_id, $select_date);

        $results['shifts'] = $shifts;

        echo json_encode($results);
    }

    public function applyOrRejectRequestShift   (){
        $organ_id = $this->input->post('organ_id');
        $staff_id = $this->input->post('staff_id');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');
        $update_shift_type = $this->input->post('update_shift_type');

        $shift = $this->shift_model->getRecordByCond([
            'staff_id' => $staff_id,
            'organ_id' => $organ_id,
            'from_time' => $from_time,
            'to_time' => $to_time,
            'shit_type' => '4'
        ]);

        if (empty($shift)){
            $results['isUpdate'] = false;
            echo json_encode($results);
            return;
        }

        $shift['shift_type'] = $update_shift_type;

        $this->shift_model->updateRecord($shift, 'shift_id');

        $results['isUpdate'] = true;

        echo json_encode($results);
    }
}
?>