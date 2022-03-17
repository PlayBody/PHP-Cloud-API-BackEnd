<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Reserve_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'reserves';
        $this->primary_key = 'reserve_id';
    }

    public function isExistMyReserve($user_id, $organ_id, $time){
    	$this->db->select('*');
    	$this->db->from($this->table);

    	$this->db->where('user_id', $user_id);
    	$this->db->where('organ_id', $organ_id);

    	$this->db->where("start_time<='".$time."' and end_time>'".$time."'");

    	$query = $this->db->get();
    	$result = $query->row_array();

    	return !empty($result);
    }

    public function getReserveCount($organ_id, $time, $staff_id = ''){
    	$this->db->select('count(reserve_id) as count');
    	$this->db->from($this->table);

    	$this->db->where('organ_id', $organ_id);
    	$this->db->where("reserve_time<='". $time. "' and ADDDATE(reserve_exit_time, INTERVAL sum_interval MINUTE) >'".$time."'");
    	if (!empty($staff_id)){
            $this->db->where("staff_id", $staff_id);
        }

    	$query = $this->db->get();
    	$result = $query->row_array();

    	$count=0;
    	if (!empty($result['count'])) $count = $result['count'];

    	return $count;
    }


    public function getReservePeriodCount($organ_id, $from_time, $to_time, $staff_id = ''){
        $this->db->select('count(reserve_id) as count');
        $this->db->from($this->table);

        $this->db->where('organ_id', $organ_id);

        $this->db->where("((reserve_time<='". $from_time. "' and reserve_exit_time>'".$from_time."') OR (reserve_time<'". $to_time. "' and reserve_exit_time>='".$to_time."'))");
//        $this->db->where("reserve_time<'". $to_time. "' and reserve_exit_time>='".$to_time."'");
        if (!empty($staff_id)){
            $this->db->where("staff_id", $staff_id);
        }

        $query = $this->db->get();
        $result = $query->row_array();

        $count=0;
        if (!empty($result['count'])) $count = $result['count'];

        return $count;
    }

    public function isMyPeriodReserve($user_id, $from_time, $to_time){
        $this->db->from($this->table);

        $this->db->where('user_id', $user_id);

        $this->db->where("((reserve_time<='". $from_time. "' and reserve_exit_time>'".$from_time."') OR (reserve_time<'". $to_time. "' and reserve_exit_time>='".$to_time."'))");

        $query = $this->db->get();
        $result = $query->row_array();

        return !empty($result);
    }

    public function isExistStaff($staff_id, $time){
    	$this->db->select('*');
    	$this->db->from($this->table);

    	$this->db->where('staff_id', $staff_id);

    	$this->db->where("start_time<='".$time."' and end_time>'".$time."'");

    	$query = $this->db->get();
    	$result = $query->row_array();

    	return !empty($result);
    }

    public function getListByCond($cond){
        $this->db->select($this->table.".*, organs.organ_name, users.user_first_name, users.user_last_name, IF(staffs.staff_nick is NULL, 
                CONCAT(staffs.staff_first_name,' ', staffs.staff_last_name), 
                staffs.staff_nick
            ) as staff_name");
        $this->db->from($this->table);
        $this->db->join('organs', 'organs.organ_id = reserves.organ_id');
        $this->db->join('staffs', 'staffs.staff_id = reserves.staff_id');
        $this->db->join('users', 'users.user_id = reserves.user_id');

        if (!empty($cond['staff_id'])){
            $this->db->where('reserves.staff_id', $cond['staff_id']);
        }

        if (!empty($cond['from_time'])){
            $this->db->where("reserve_time>='". $cond['from_time']."'");
        }
        if (!empty($cond['to_time'])){
            $this->db->where("reserve_time<='". $cond['to_time']."'");
        }

        if (!empty($cond['reserve_time'])){
            $this->db->where("reserve_time", $cond['reserve_time']);
        }
        if (!empty($cond['user_id'])){
            $this->db->where("reserves.user_id", $cond['user_id']);
        }

        if (!empty($cond['company_id'])){
            $this->db->where("organs.company_id",  $cond['company_id']);
        }
        if (!empty($cond['organ_ids'])){
            $this->db->where("reserves.organ_id in (". $cond['organ_ids'] .")");
        }


        $this->db->order_by($this->table.'.update_date', 'desc');
        $query = $this->db->get();
        $result = $query->result_array();

        return $result;
    }

    public function getOtherReserveCount($cond){
        $this->db->select('reserve_time, count(reserve_id) as count');
        $this->db->from($this->table);

        if (!empty($cond['from_time'])){
            $this->db->where("reserve_time>='". $cond['from_time']."'");
        }
        if (!empty($cond['to_time'])){
            $this->db->where("reserve_time<='". $cond['to_time']."'");
        }

        if (!empty($cond['staff_id'])){
            $this->db->where('staff_id', $cond['staff_id']);
        }
        if (!empty($cond['user_id'])){
            $this->db->where('user_id<>'.$cond['user_id']);
        }

        $this->db->group_by('reserve_time');

        $query = $this->db->get();
        $result = $query->result_array();

        return $result;
    }

    public function getReserveStaffs($organ_id, $from_time, $to_time){
        $this->db->from($this->table);
        $this->db->where('organ_id', $organ_id);
        $this->db->where("reserve_time >='".$from_time."' and reserve_time<'".$to_time."'");

        $query = $this->db->get();
        return $query->result_array();
    }

    public function getUserReserveData($from_time, $to_time, $user_id, $organ_id){
        $this->db->from($this->table);
        $this->db->where('user_id', $user_id);
        $this->db->where('organ_id', $organ_id);
        $this->db->where("reserve_time >='".$from_time."' and reserve_exit_time<'".$to_time."'");

        $this->db->where("reserve_status <= 3");

        $query = $this->db->get();
        return $query->result_array();
    }


    public function getMonthReserves($staff_id, $month){
        $this->db->from($this->table);
        $this->db->where('staff_id', $staff_id);
        $this->db->where("reserve_time like '%".$month."-%'");

        $query = $this->db->get();
        return $query->result_array();
    }

    public function getReserveList($cond){
        $this->db->select($this->table.".*, 
            IF(staffs.staff_nick is NULL, 
                CONCAT(staffs.staff_first_name,' ', staffs.staff_last_name), 
                staffs.staff_nick
            ) as staff_name, 
            IF(users.user_first_name is NULL, 
                users.user_nick,
                CONCAT(users.user_first_name,' ', users.user_last_name)
            ) as user_name, users.user_sex");
        $this->db->from($this->table);
        $this->db->join('staffs', 'reserves.staff_id=staffs.staff_id', 'left');
        $this->db->join('users', 'reserves.user_id=users.user_id', 'left');

        if (!empty($cond['staff_id']))
            $this->db->where($this->table.'.staff_id', $cond['staff_id']);

        if (!empty($cond['organ_id']))
            $this->db->where('organ_id', $cond['organ_id']);

        if (!empty($cond['from_time']))
            $this->db->where("reserve_time >= '".$cond['from_time']."'");

        if (!empty($cond['to_time']))
            $this->db->where("reserve_exit_time <= '". $cond['to_time']."'");

        if (!empty($cond['reserve_status']))
            $this->db->where("reserve_status", $cond['reserve_status']);

        if (!empty($cond['max_status']))
            $this->db->where("reserve_status<=". $cond['max_status']);

        $query = $this->db->get();
        return $query->result_array();
    }

    public function getReserveRecord($cond){
        $this->db->from($this->table);
        if (!empty($cond['staff_id']))
            $this->db->where('staff_id', $cond['staff_id']);

        if (!empty($cond['organ_id']))
            $this->db->where('organ_id', $cond['organ_id']);

        if (!empty($cond['reserve_time']))
            $this->db->where("reserve_time", $cond['reserve_time']);

        if (!empty($cond['reserve_exit_time']))
            $this->db->where("reserve_exit_time", $cond['reserve_exit_time']);

        $query = $this->db->get();
        return $query->row_array();

    }

    public function getReserverLastRecord($cond){

        $this->db->from($this->table);
        if (!empty($cond['staff_id']))
            $this->db->where('staff_id', $cond['staff_id']);

        if (!empty($cond['organ_id']))
            $this->db->where('organ_id', $cond['organ_id']);

        if (!empty($cond['user_id']))
            $this->db->where('user_id', $cond['user_id']);

        $this->db->order_by('create_date', 'desc');
        $query = $this->db->get();

        return $query->row_array();
    }


    public function getReserveNowData($cond){
        $this->db->from($this->table);
        if (!empty($cond['staff_id']))
            $this->db->where('staff_id', $cond['staff_id']);

        if (!empty($cond['organ_id']))
            $this->db->where('organ_id', $cond['organ_id']);

        if (!empty($cond['from_time']))
            $this->db->where("reserve_time >= '".$cond['from_time']."'");

        if (!empty($cond['to_time']))
            $this->db->where("reserve_time <= '". $cond['to_time']."'");

        if (!empty($cond['reserve_status']))
            $this->db->where("reserve_status", $cond['reserve_status']);

        $query = $this->db->get();
        return $query->result_array();
    }

    public function getVisitCount($organ_id, $user_id){
        $this->db->select('count(reserve_id) as cnt');
        $this->db->from($this->table);
        $this->db->where('organ_id', $organ_id);
        $this->db->where('user_id', $user_id);
        $this->db->where("visit_time like '" . date('Y-m-d') . " %'");

        $query = $this->db->get();

        $result = $query->row_array();
        return empty($result['cnt']);

    }
}