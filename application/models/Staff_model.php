<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Staff_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'staffs';
        $this->primary_key = 'staff_id';
    }

    function login($data)
    {
        if(empty($data['login_id']) || empty($data['password'])) {
            return false;
        }

        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where('staff_mail',$data['login_id']);
        $this->db->where('staff_password',sha1($data['password']));
        $this->db->where("visible", 1);
        return $this->db->get()->row_array();
    }


    function getStaffList($cond)
    {
        $this->db->select('*');
        $this->db->from($this->table);

        if (!empty($cond['staff_mail']))
            $this->db->where("staff_mail", $cond['staff_mail']);

        return $this->db->get()->result_array();
    }

    function getStaffsByOrganId($organ_id){
        $this->db->from($this->table);
        $this->db->where('visible', '1');

        $this->db->where("staff_belongs like '%_".$organ_id."_%'");

        $query = $this->db->get();
        return $query->result_array();
    }

    function isMailCheck($email, $staff_id){
        $this->db->from($this->table);
        $this->db->where('staff_mail', $email);

        if (!empty($staff_id)){
            $this->db->where("staff_id <>".$staff_id);
        }

        $query = $this->db->get();

        return empty($query->row_array());
    }


}