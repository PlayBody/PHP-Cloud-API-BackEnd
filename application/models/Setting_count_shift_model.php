<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Setting_count_shift_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'setting_count_shifts';
        $this->primary_key = 'id';
    }

    public function getListByCond($cond, $setting_id=''){

        $this->db->from($this->table);

        if (!empty($cond['organ_id'])){
            $this->db->where('organ_id', $cond['organ_id']);
        }

        if (!empty($cond['input_time'])){
            $this->db->where("from_time <'". $cond['input_time'] ."'");
            $this->db->where("to_time >'". $cond['input_time'] ."'");
        }

        if (!empty($cond['select_time'])){
            $this->db->where("from_time <='". $cond['select_time'] ."'");
            $this->db->where("to_time >'". $cond['select_time'] ."'");
        }

        if (!empty($cond['from_time'])){
            $this->db->where("from_time >='". $cond['from_time'] ."'");
        }

        if (!empty($cond['to_time'])){
            $this->db->where("to_time <='". $cond['to_time'] ."'");
        }

        if (!empty($cond['inner_from_time'])){
            $this->db->where("from_time <='". $cond['inner_from_time'] ."'");
        }

        if (!empty($cond['inner_to_time'])){
            $this->db->where("to_time >='". $cond['inner_to_time'] ."'");
        }

        if (!empty($cond['submit_from_time'])){
            $this->db->where("from_time <='". $cond['submit_from_time'] ."'");
        }

        if (!empty($cond['submit_to_time'])){
            $this->db->where("to_time >='". $cond['submit_to_time'] ."'");
        }

        if (!empty($cond['select_date'])){
            $this->db->where("from_time >='". $cond['select_date'] ." 00:00:00'");
            $this->db->where("to_time <='". $cond['select_date'] ." 23:59:59'");
        }

        if (!empty($cond['date_month'])){
            $this->db->where("from_time like '". $cond['date_month'] ."-%'");
        }

        if (!empty($setting_id)){
            $this->db->where("id <> '". $setting_id ."'");
        }

        $query = $this->db->get();

        return $query->result_array();
    }


}