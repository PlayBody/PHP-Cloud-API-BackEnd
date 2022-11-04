<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Staff_organ_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'staff_organs';
        $this->primary_key = 'id';
    }

    public function getStaffOrganList($cond){
        $this->db->from($this->table);

        if (!empty($cond['staff_id']))
            $this->db->where('staff_id', $cond['staff_id']);
        $query = $this->db->get();


        return $query->result_array();
    }

    public function getOrgansByStaff($staff_id){
        $this->db->select('organs.*');
        $this->db->from($this->table);

        $this->db->join('organs', 'organs.organ_id = staff_organs.organ_id', 'inner');

        $this->db->where('staff_id', $staff_id);

//        $this->db->where('organs.visible', '1');

        $query = $this->db->get();

        return $query->result_array();
    }

    public function getStaffsByOrgan($organ_id, $auth, $isGetGuest = true, $isStaff = true){
        $this->db->select("staffs.*, ".$this->table.".auth, IF(staff_nick is NULL, CONCAT(staff_first_name,' ', staff_last_name), staff_nick) as sort_name");
        $this->db->from($this->table);

        $this->db->join('staffs', 'staffs.staff_id = staff_organs.staff_id', 'left');
        $this->db->where('staffs.visible', '1');
        $this->db->where('organ_id', $organ_id);
        $this->db->where('staff_auth<'.$auth);
        if (!$isGetGuest)
            $this->db->where('staff_auth>0');
        if (!$isStaff)
            $this->db->where('staff_auth>1');

        $this->db->order_by('staffs.sort_no', 'asc');
        $query = $this->db->get();

        return $query->result_array();
    }

    public function getAuthRecord($staff_id, $organ_id){
        $this->db->from($this->table);
        $this->db->where('staff_id', $staff_id);
        $this->db->where('organ_id', $organ_id);
        $query = $this->db->get();

        return $query->row_array();
    }

    public function getStaffs($cond){
        $this->db->select('staffs.*');
        $this->db->from($this->table);
        $this->db->join('staffs', 'staffs.staff_id = staff_organs.staff_id', 'left');

        if (!empty($cond['organ_id'])){
            $this->db->where('organ_id', $cond['organ_id']);
        }
        if (!empty($cond['staff_id'])){
            $this->db->where('staffs.staff_id', $cond['staff_id']);
        }
        if (!empty($cond['staff_sex'])){
            $this->db->where('staff_sex', $cond['staff_sex']);
        }

        $this->db->where('staff_auth > 0');

        $query = $this->db->get();

        return $query->result_array();
    }

}
