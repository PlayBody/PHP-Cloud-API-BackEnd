<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Apishiftsettings extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('organ_model');
        $this->load->model('setting_init_shift_model');
        $this->load->model('setting_count_shift_model');
        $this->load->model('staff_model');
        $this->load->model('staff_organ_model');
    }

    public function loadShift(){
        $staff_id = $this->input->post('staff_id');
        $organ_id = $this->input->post('organ_id');

        $results = [];

        if (empty($staff_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $staff = $this->staff_model->getFromId($staff_id);

        $organ_list = $this->staff_organ_model->getOrgansByStaff($staff_id);

        if (empty($organ_id)) $organ_id = $organ_list[0]['organ_id'];

        $organ = $this->organ_model->getFromId($organ_id);

        if (empty($organ) || empty($staff)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $organ_active_start = empty($organ['active_start_time']) ? '00:00' : $organ['active_start_time'];
        $organ_active_end = empty($organ['active_end_time']) ? '24:00' : $organ['active_end_time'];

        $cond = array();
        $cond['staff_id'] = $staff_id;
        $cond['organ_id'] = $organ_id;
        $initData = $this->setting_init_shift_model->getListByCond($cond);

        $results['isLoad'] = true;
        $results['organ_id'] = $organ_id;
        $results['organ_list'] = $organ_list;

        $results['shifts'] = $initData;
        $results['active_time']['from'] = $organ_active_start;
        $results['active_time']['to'] = $organ_active_end;


        echo(json_encode($results));
    }

    public function loadStatus(){
        $staff_id = $this->input->post('staff_id');
        $organ_id = $this->input->post('organ_id');
        $weekday = $this->input->post('weekday');
        $select_time = $this->input->post('select_time');

        $cond = array();
        $cond['staff_id'] = $staff_id;
        $cond['organ_id'] = $organ_id;
        $cond['select_time'] = $select_time;
        $cond['weekday'] = $weekday;

        $shifts = $this->setting_init_shift_model->getListByCond($cond);

        $results = [];
        $results['isLoad'] = true;

        if (empty($shifts)){
            $results['status'] = '0';
        }else{
            $results['status'] = '1';
            $results['shift'] = $shifts[0];
        }

        echo json_encode($results);
        return;
    }

    public function saveShift(){
        $staff_id = $this->input->post('staff_id');
        $organ_id = $this->input->post('organ_id');
        $setting_id = $this->input->post('setting_id');
        $weekday = $this->input->post('weekday');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');

        $organ = $this->organ_model->getFromId($organ_id);
        $active_start_time = empty($organ['active_start_time'])? '00:00:00' : $organ['active_start_time'];
        $active_end_time = empty($organ['active_end_time'])? '24:00:00' : $organ['active_end_time'];

        $isactive = $this->isActiveTime($active_start_time, $active_end_time, $from_time, $to_time);

        if (!$isactive){
            $results['isUpdate'] = false;
            $results['err'] = 'active_err';
            echo json_encode($results);
            return;
        }

        $cond = [];
        $cond['staff_id'] = $staff_id;
        $cond['organ_id'] = $organ_id;
        $cond['weekday'] = $weekday;
        $cond['input_time'] = $from_time;
        $shifts_from = $this->setting_init_shift_model->getListByCond($cond, $setting_id);
        $cond['input_time'] = $to_time;
        $shifts_to = $this->setting_init_shift_model->getListByCond($cond, $setting_id);

        if (!empty($shifts_from) || !empty($shifts_to)){
            $results['isUpdate'] = false;
            $results['err'] = 'duplicate_err';
            echo json_encode($results);
            return;
        }

        if (empty($setting_id)){
            $shift = array(
                'staff_id' => $staff_id,
                'organ_id' => $organ_id,
                'weekday' => $weekday,
                'from_time' => $from_time,
                'to_time' => $to_time,
            );

            $this->setting_init_shift_model->insertRecord($shift);
        }else{
            $shift = $this->setting_init_shift_model->getFromId($setting_id);
            $shift['from_time'] = $from_time;
            $shift['to_time'] = $to_time;

            $this->setting_init_shift_model->updateRecord($shift);
        }

        $results['isUpdate'] = true;
        echo json_encode($results);
        return;
    }

    public function deleteShift(){
        $setting_id = $this->input->post('setting_id');

        if (empty($setting_id)){
            echo json_encode(['isDelete'=>false]);
            return;
        }

        $this->setting_init_shift_model->delete_force($setting_id, 'id');

        $results['isDelete'] = true;
        echo json_encode($results);
        return;
    }


    public function loadShiftCount(){
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

        if ($staff['staff_auth']==2){
            $organ_list = $this->staff_organ_model->getOrgansByStaff($staff_id);
        }
        if ($staff['staff_auth']==3){
            $cond=[];
            $cond['company_id'] = $staff['company_id'];
            $organ_list = $this->organ_model->getListByCond($cond);
        }

        if (empty($organ_id)) $organ_id = $organ_list[0]['organ_id'];

        $organ = $this->organ_model->getFromId($organ_id);

        if (empty($organ) || empty($staff)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $organ_active_start = empty($organ['active_start_time']) ? '00:00' : $organ['active_start_time'];
        $organ_active_end = empty($organ['active_end_time']) ? '23:59' : $organ['active_end_time'];

        $cond = array();
        $cond['organ_id'] = $organ_id;
        $cond['from_time'] = $from_date. ' 00:00:00';
        $cond['to_time'] = $to_date. ' 23:59:59';
        $shift_list = $this->setting_count_shift_model->getListByCond($cond);


        $results['isLoad'] = true;
        $results['organ_id'] = $organ_id;
        $results['organ_list'] = $organ_list;
        $results['shifts'] = $shift_list;

        $results['active_time']['from'] = $organ_active_start;
        $results['active_time']['to'] = $organ_active_end;

        echo(json_encode($results));
    }

    public function loadCountShiftStatus(){
        $organ_id = $this->input->post('organ_id');
        $select_time = $this->input->post('select_time');

        $cond = array();
        $cond['organ_id'] = $organ_id;
        $cond['select_time'] = $select_time;

        $shifts = $this->setting_count_shift_model->getListByCond($cond);

        $results = [];
        $results['isLoad'] = true;

        if (empty($shifts)){
            $results['status'] = '0';
        }else{
            $results['status'] = '1';
            $results['shift'] = $shifts[0];
        }

        echo json_encode($results);
        return;
    }

    public function saveShiftCount(){
        $organ_id = $this->input->post('organ_id');
        $setting_id = $this->input->post('setting_id');
        $select_date = $this->input->post('select_date');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');
        $count = $this->input->post('count');

        $organ = $this->organ_model->getFromId($organ_id);
        $active_start_time = empty($organ['active_start_time'])? '00:00:00' : $organ['active_start_time'];
        $active_end_time = empty($organ['active_end_time'])? '23:59:59' : $organ['active_end_time'];

        $isactive = $this->isActiveTime($active_start_time, $active_end_time, $from_time, $to_time);

        if (!$isactive){
            $results['isUpdate'] = false;
            $results['err'] = 'active_err';
            echo json_encode($results);
            return;
        }

        $cond = [];
        $cond['organ_id'] = $organ_id;
        $cond['input_time'] = $select_date. ' '. $from_time;
        $shifts_from = $this->setting_count_shift_model->getListByCond($cond, $setting_id);
        $cond['input_time'] = $select_date. ' '. $to_time;
        $shifts_to = $this->setting_count_shift_model->getListByCond($cond, $setting_id);

        if (!empty($shifts_from) || !empty($shifts_to)){
            $results['isUpdate'] = false;
            $results['err'] = 'duplicate_err';
            echo json_encode($results);
            return;
        }

        if (empty($setting_id)){
            $shift = array(
                'organ_id' => $organ_id,
                'from_time' => $select_date. ' '. $from_time,
                'to_time' => $select_date. ' '. $to_time,
                'count' => $count,
            );

            $this->setting_count_shift_model->insertRecord($shift);
        }else{
            $shift = $this->setting_count_shift_model->getFromId($setting_id);
            $shift['from_time'] = $select_date. ' '. $from_time;
            $shift['to_time'] = $select_date. ' '. $to_time;
            $shift['count'] = $count;

            $this->setting_count_shift_model->updateRecord($shift, 'id');
        }

        $results['isUpdate'] = true;
        echo json_encode($results);
        return;
    }

    public function deleteShiftCount(){
        $setting_id = $this->input->post('setting_id');

        if (empty($setting_id)){
            echo json_encode(['isDelete'=>false]);
            return;
        }

        $this->setting_count_shift_model->delete_force($setting_id, 'id');

        $results['isDelete'] = true;
        echo json_encode($results);
        return;
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