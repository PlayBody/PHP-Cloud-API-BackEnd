<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Staff_point_setting_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'staff_point_settings';
        $this->primary_key = 'id';
    }

    public function getSettingData($cond){
        $this->db->from($this->table);

        if (!empty($cond['staff_id'])){
            $this->db->where('staff_id', $cond['staff_id']);
        }

        if (!empty($cond['setting_year'])){
            $this->db->where('setting_year', $cond['setting_year']);
        }
        if (!empty($cond['setting_month'])){
            $this->db->where('setting_month', $cond['setting_month']);
        }

        $query = $this->db->get();

        return $query->row_array();

    }


}