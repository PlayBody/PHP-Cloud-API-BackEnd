<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Organ_shift_time_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'organ_shift_times';
        $this->primary_key = 'id';
    }

    public function getListByCond($cond){
        $this->db->from($this->table);

        if (!empty($cond['organ_id'])){
            $this->db->where('organ_id', $cond['organ_id']);
        }
        if (!empty($cond['weekday'])){
            $this->db->where('weekday', $cond['weekday']);
        }

        $query = $this->db->get();
        return $query->result_array();

    }


}