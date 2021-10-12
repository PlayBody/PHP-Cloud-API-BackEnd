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
//        $this->load->model('pos_staff_shift_model');
    }

    public function loadUserReserveData()
    {
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

        $staff_list = $this->staff_organ_model->getStaffsByOrgan($organ_id, 3);

        $organ = $this->organ_model->getFromId($organ_id);

        if (empty($organ['active_start_time'])) $organ['active_start_time'] = '00:00:00';
        if (empty($organ['active_end_time'])) $organ['active_end_time'] = '23:59:59';
        if (empty($organ['table_count'])) $organ['table_count'] = '7';

        $results = [];

        $cur_date = $from_date;
        while($cur_date<=$to_date){
            if ($cur_date<date('Y-m-d')){
                    $tmp = [];
                    $tmp['from_time'] = $cur_date. ' ' .'00:00:00';
                    $tmp['to_time'] = $cur_date. ' ' .'23:59:59';
                    $tmp['type'] = '0';

                    $reserve_time_data[] = $tmp;
            }else{
                if ($organ['active_start_time']<$organ['active_end_time']){
                    $tmp['from_time'] = $cur_date. ' ' .'00:00:00';
                    $tmp['to_time'] = $cur_date. ' ' .$organ['active_start_time'];
                    $tmp['type'] = '0';
                    $reserve_time_data[] = $tmp;
                    $tmp['from_time'] = $cur_date. ' ' .$organ['active_end_time'] ;
                    $tmp['to_time'] = $cur_date. ' ' .'23:59:59';
                    $tmp['type'] = '0';
                    $reserve_time_data[] = $tmp;
                }else{
                    $tmp['from_time'] = $cur_date. ' ' .$organ['active_end_time'];
                    $tmp['to_time'] = $cur_date. ' ' .$organ['active_start_time'];
                    $tmp['type'] = '0';
                    $reserve_time_data[] = $tmp;
                    $reserve_time_data[] = $tmp;
                }

//                for ($i=$organ['active_start_time']; $i<$organ['active_end_time'];$i++) {
//                    $tmp = [];
//
//                    $ii = $i;
//                    $iadd = $i+1;
//                    if ($ii<10) $ii = '0'.$ii;
//                    if ($iadd<10) $iadd = '0'.$iadd;
//
//                    $tmp['from_time'] = $cur_date. ' ' .$ii.':00:00';
//                    $tmp['to_time'] = $cur_date. ' ' .$iadd.':00:00';
//                    $tmp['type'] = '1'; //free
//
//                    $cur_time = $cur_date. ' ' .$ii.':00:00';
//
//                    $isReserve = $this->reserve_model->isExistMyReserve($user_id, $organ_id, $cur_time);
//                    if ($isReserve){
//                        $tmp['type'] = '2'; //owner reserve
//                    }else{
//                        $reserveCount = $this->reserve_model->getReserveCount($organ_id, $cur_time);
//                        if ($organ['table_count']<=$reserveCount){
//                            $tmp['type'] = '3';
//                        }else{
//                            if (!empty($staff_id)){
//                                $isExistStaff = $this->reserve_model->isExistStaff($staff_id, $cur_time);
//                                if ($isExistStaff){
//                                    $tmp['type'] = '3';
//                                }else{
////                                    $isStaffShiftReject = $this->pos_staff_shift_model->isStaffShiftReject($staff_id, $cur_time);
////                                    if ($isStaffShiftReject){
////                                        $tmp['type'] = '3';
////                                    }
//
//                                }
//                            }
//                        }
//                    }

//                    $reserve_time_data[] = $tmp;
//                }

            }
            $diff1Day = new DateInterval('P1D');

            $curDateTime = new DateTime($cur_date);

            $curDateTime->add($diff1Day);
            $cur_date = $curDateTime->format("Y-m-d");
        }

        //other_reserves
        $cond=[];
        $cond['user_id'] = $user_id;
        $cond['from_time'] = date('Y-m-d')." 00:00:00";
        $cond['to_time'] = $to_date." 23:59:59";
        $other_list = $this->reserve_model->getOtherReserveCount($cond);
        foreach ($other_list as $item){
            if ($item['count']<$organ['table_count']) continue;

            $tmp = [];
            $tmp['from_time'] = $item['reserve_time'];

            $curDateTime = new DateTime($item['reserve_time']);
            $curDateTime->add(new DateInterval('PT1H'));
            $tmp['to_time'] = $curDateTime->format("Y-m-d H:i:s");
            $tmp['type'] = '3';
            $reserve_time_data[] = $tmp;
        }

        if (!empty($staff_id)){
            $cond=[];
            $cond['user_id'] = $user_id;
            $cond['from_time'] = date('Y-m-d')." 00:00:00";
            $cond['to_time'] = $to_date." 23:59:59";
            $cond['staff_id'] = $staff_id;
            $staff_reserve = $this->reserve_model->getOtherReserveCount($cond);
            foreach ($staff_reserve as $item){
                $tmp = [];
                $tmp['from_time'] = $item['reserve_time'];
                $curDateTime = new DateTime($item['reserve_time']);
                $curDateTime->add(new DateInterval('PT1H'));
                $tmp['to_time'] = $curDateTime->format("Y-m-d H:i:s");
                $tmp['type'] = '3';
                $reserve_time_data[] = $tmp;
            }
        }


        $cond=[];
        $cond['user_id'] = $user_id;
        if (!empty($staff_id)) $cond['staff_id'] = $staff_id;
        $cond['from_time'] = date('Y-m-d')." 00:00:00";
        $cond['to_time'] = $to_date." 23:59:59";
        $reserve_list = $this->reserve_model->getListByCond($cond);

        foreach ($reserve_list as $item){
            $tmp = [];
            $tmp['from_time'] = $item['reserve_time'];

            $curDateTime = new DateTime($item['reserve_time']);
            $curDateTime->add(new DateInterval('PT1H'));
            $tmp['to_time'] = $curDateTime->format("Y-m-d H:i:s");
            $tmp['type'] = '2';
            $reserve_time_data[] = $tmp;
        }

        $results['isLoad'] = true;
        $results['reserve_time_data'] = $reserve_time_data;
        $results['staffs'] = $staff_list;
        $results['active_start_time'] = $organ['active_start_time'];
        $results['active_end_time'] = $organ['active_end_time'];

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
            if ($staff['staff_auth']>2){
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
}
?>