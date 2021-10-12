<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Crm_user_device_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'crm_user_device_tbl';
        $this->primary_key = 'id';
    }

    public function loadUserDevice($device_id){
    	$this->db->select('*');
    	$this->db->from($this->table);

    	$this->db->where('del_flag', '0');
        $this->db->where('device_id', $device_id);

    	$query = $this->db->get();
    	$result = $query->row_array();

    	return $result;
    }


}