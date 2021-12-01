<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Shift_lock_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'shift_locks';
        $this->primary_key = 'shift_lock_id';
    }

    public function getLockRecord($cond){

        $this->db->from($this->table);

        if (!empty($cond['organ_id'])){
            $this->db->where('organ_id', $cond['organ_id']);
        }

        if (!empty($cond['from_time'])){
            $this->db->where('from_time', $cond['from_time']);
        }
        if (!empty($cond['to_time'])){
            $this->db->where('to_time', $cond['to_time']);
        }

        $query = $this->db->get();

        return $query->row_array();
    }

}