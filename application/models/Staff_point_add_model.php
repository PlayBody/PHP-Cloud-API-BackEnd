<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Staff_point_add_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'staff_point_adds';
        $this->primary_key = 'id';
    }

    public function getPointList($cond){
        $this->db->from($this->table);

        if (!empty($cond['point_setting_id'])){
            $this->db->where('point_setting_id', $cond['point_setting_id']);
        }

        $query = $this->db->get();

        return $query->result_array();

    }


}