<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Organ_special_time_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'organ_special_times';
        $this->primary_key = 'organ_special_time_id';
    }

    public function getTimeList($organ_id){

        $this->db->from($this->table);

        $this->db->where('organ_id', $organ_id);
        $this->db->order_by('from_time');

        $query = $this->db->get();

        return $query->result_array();
    }

}