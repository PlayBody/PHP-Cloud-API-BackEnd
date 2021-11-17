<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Apireserves extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('staff_organ_model');
        $this->load->model('organ_model');
        $this->load->model('company_model');
        $this->load->model('staff_model');
        $this->load->model('user_model');


        $this->load->model('reserve_model');
        $this->load->model('reserve_menu_model');

        $this->load->model('shift_model');
        $this->load->model('organ_time_model');
//        $this->load->model('pos_staff_shift_model');
    }

    public function loadUserReserveData()
    {
//        $user_id = '66';//$this->input->post('user_id');
//        $organ_id = '1';//$this->input->post('organ_id');
//        $staff_id = '12';// $this->input->post('staff_id');
//        $from_date ='2021-11-15';// $this->input->post('from_date');
//        $to_date = '2021-11-21';//$this->input->post('to_date');


        $user_id = $this->input->post('user_id');
        $organ_id = $this->input->post('organ_id');
        $staff_id = $this->input->post('staff_id');
        $from_date = $this->input->post('from_date');
        $to_date = $this->input->post('to_date');

        $results = [];
        if (empty($organ_id) || empty($user_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }
        $staff_list = $this->staff_organ_model->getStaffsByOrgan($organ_id, 3, false);


        $results = [];
        $regions = [];

        $cur_date = $from_date.' '.'00:00:00';

        while($cur_date<=$to_date.' 23:59:59'){
            $tmp = [];
            $tmp['time'] = $cur_date;
            $tmp['type'] = $this->getReserveTimeStatus($organ_id, $staff_id, $cur_date);

            $regions[] = $tmp;
            $diff1Day = new DateInterval('PT30M');
            $curDateTime = new DateTime($cur_date);
            $curDateTime->add($diff1Day);
            $cur_date = $curDateTime->format("Y-m-d H:i:s");
        }
        $results['isLoad'] = true;
        $results['regions'] = $regions;
        $results['staffs'] = $staff_list;

        echo(json_encode($results));

    }

    public function loadSelectStatus()
    {
        $organ_id = $this->input->post('organ_id');
        $staff_id = $this->input->post('staff_id');
        $select_time = $this->input->post('select_time');
        if (empty($organ_id) || empty($staff_id)){
            echo json_encode(['isLoad'=>false]);
            return;
        }

        $status = $this->getReserveTimeStatus($organ_id, $staff_id, $select_time);
        $results['isLoad'] = true;
        $results['status'] = $status;

        echo(json_encode($results));

    }

    function saveUserReserve(){
        $organ_id = $this->input->post('organ_id');
        $user_id = $this->input->post('user_id');
        $staff_id = $this->input->post('staff_id');
        $reserve_time = $this->input->post('reserve_time');
//        $end_time = $this->input->post('end_time');
        $reserve_menu = $this->input->post('reserve_menu');
        $coupon_id = $this->input->post('coupon_id');
        $results = [];
        if (empty($organ_id) || empty($user_id)){
            $results['isSave'] = false;
            echo json_encode($results);
            return;
        }

        $reserve = array(
            'user_id' => $user_id,
            'organ_id' => $organ_id,
            'staff_id' => empty($staff_id) ? null : $staff_id,
            'reserve_time' => $reserve_time,
            'coupon_id' => empty($coupon_id)?null:$coupon_id,
//            'end_time' => $end_time,
            'reserve_status'=>1,
            'visible' => 1,
        );

        $reserve_id = $this->reserve_model->insertRecord($reserve);

        if (empty($reserve_id)){
            $results['isSave'] = false;
            echo json_encode($results);
            return;
        }

        $data = json_decode($reserve_menu);

        foreach ($data as $record) {
            $insertData = [];
            $insertData = array(
                'reserve_id' => $reserve_id,
                'menu_id' => $record->menu_id,
            );

            $insert = $this->reserve_menu_model->insertRecord($insertData);
        }

        $results['isSave'] = true;
        echo json_encode($results);

    }

    public function loadReserveList(){
        $user_id = $this->input->post('user_id');
        $staff_id = $this->input->post('staff_id');
        $company_id = $this->input->post('company_id');

        $cond=[];

        if (!empty($staff_id)){
            $staff = $this->staff_model->getFromId($staff_id);
            if ($staff['staff_auth']==2){
                $organs = $this->staff_organ_model->getOrgansByStaff($staff_id);
                $cond['organ_ids'] = join(',' , array_column($organs,'organ_id'));
            }
            if ($staff['staff_auth']==3){
                $cond['company_id'] = $company_id;
            }
        }

        if (!empty($user_id)) $cond['user_id'] = $user_id;

        $lists = $this->reserve_model->getListByCond( $cond);

        $reserves = [];
        foreach ($lists as $item){
            $menus = $this->reserve_menu_model->getReserveMenuList($item['reserve_id']);

            $item['menus'] = $menus;
            $reserves[] = $item;
        }

        $results['isLoad'] = true;
        $results['reserves'] = $reserves;

        echo json_encode($results);
    }

    public function loadReserveInfo(){
        $reserve_id = $this->input->post('reserve_id');

        $reserve = $this->reserve_model->getFromId($reserve_id);

        $menus = $this->reserve_menu_model->getReserveMenuList($reserve['reserve_id']);

        $sum = 0;
        foreach ($menus as $menu){
            $price = $menu['menu_price']==null ? 0 : $menu['menu_price'];
            $sum = $sum + $price;
        }

        $reserve_year = substr($reserve['reserve_time'],0,4);
        $reserve['sum_amount'] = $sum;
        $reserve['menus'] = $menus;
        $reserve['reserve_year'] = $reserve_year;

        $organ = $this->organ_model->getFromId($reserve['organ_id']);

        $company = $this->company_model->getFromId($organ['company_id']);

        $user = $this->user_model->getFromId($reserve['user_id']);


        $results['isLoad'] = true;
        $results['company'] = $company;
        $results['organ'] = $organ;
        $results['user'] = $user;
        $results['reserve'] = $reserve;

        echo json_encode($results);
    }

    public function deleteReserve(){
        $reserve_id = $this->input->post('reserve_id');
        if (empty($reserve_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }

        $this->reserve_model->delete_force($reserve_id, 'reserve_id');
        $this->reserve_menu_model->delete_force($reserve_id, 'reserve_id');

        $results['isDelete'] = true;

        echo json_encode($results);
    }

    public function loadReserveStaff(){
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');
        $organ_id = $this->input->post('organ_id');

        $reserves = $this->reserve_model->getReserveStaffs($organ_id, $from_time, $to_time);

        $staffs = [];
        foreach ($reserves as $reserve){
            if (empty($reserve['staff_id'])) continue;
            $staff_id = $reserve['staff_id'];
            if (in_array($staff_id, $staffs)) continue;
            $shifts = $this->shift_model->isExist($organ_id, $staff_id, '', $from_time, $to_time);
            if (!empty($shifts)) continue;

            $staffs[] = $staff_id;
        }

        $results['isLoad'] = true;
        $results['staffs'] = $staffs;

        echo json_encode($results);
    }

    private function getReserveTimeStatus($organ_id, $staff_id, $sel_time){

        $organ = $this->organ_model->getFromId($organ_id);
        $table_count = $organ['table_count'] == null ? 10 : $organ['table_count'];

        if ($sel_time<=date('Y-m-d H:i:s')) return '0';

        $week = date('N', strtotime($sel_time));
        $time = date('H:i', strtotime($sel_time));
        $isActive = $this->organ_time_model->isActiveTime($organ_id, $week, $time);
        if (!$isActive) return '3';

        $reserve_count = $this->reserve_model->getReserveCount($organ_id, $sel_time);
        if ($reserve_count>=$table_count) return '3';

        if (empty($staff_id)) return '3';

        $staff_reserve_count = $this->reserve_model->getReserveCount($organ_id, $sel_time, $staff_id);
        if ($staff_reserve_count > 0) return '3';

        $isStaffActive = $this->shift_model->isStaffActiveReserve($organ_id, $staff_id, $sel_time);
        if (!$isStaffActive) return '2';

        return '1';
    }
}
?>