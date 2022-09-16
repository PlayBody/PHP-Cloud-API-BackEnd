<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Crm_reserve_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'crm_reserve_tbl';
        $this->primary_key = 'id';
    }

    public function isExistMyReserve($user_id, $member_id, $time){
    	$this->db->select('*');
    	$this->db->from($this->table);

    	$this->db->where('del_flag', '0');
    	$this->db->where('user_id', $user_id);
    	$this->db->where('member_id', $member_id);

    	$this->db->where("start_time<='".$time."' and end_time>'".$time."'");

    	$query = $this->db->get();
    	$result = $query->row_array();

    	return !empty($result);
    }

    public function getReserveCount($member_id, $time){
    	$this->db->select('count(id) as count');
    	$this->db->from($this->table);

    	$this->db->where('del_flag', '0');
    	$this->db->where('member_id', $member_id);

    	$this->db->where("start_time<='".$time."' and end_time>'".$time."'");

    	$query = $this->db->get();
    	$result = $query->row_array();

    	$count=0;
    	if (!empty($result['count'])) $count = $result['count'];

    	return $count;
    }

    public function isExistStaff($staff_id, $time){
    	$this->db->select('*');
    	$this->db->from($this->table);

    	$this->db->where('del_flag', '0');
    	$this->db->where('staff_id', $staff_id);

    	$this->db->where("start_time<='".$time."' and end_time>'".$time."'");

    	$query = $this->db->get();
    	$result = $query->row_array();

    	return !empty($result);
    }

    public function getListByCondition($condition){
        $this->db->select('*');
        $this->db->from($this->table);

        $this->db->where('del_flag', '0');

        if (!empty($condition['staff_id'])){
            $this->db->where('staff_id', $condition['staff_id']);
        }

        if (!empty($condition['from_date'])){
            $this->db->where("start_time >= '".$condition['from_date']."'");
        }

        if (!empty($condition['to_date'])){
            $this->db->where("end_time <= '".$condition['to_date']."'");
        }

        $query = $this->db->get();
        $result = $query->result_array();

        return $result;
    }

}