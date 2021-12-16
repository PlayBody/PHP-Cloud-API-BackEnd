<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Organ_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'organs';
        $this->primary_key = 'organ_id';
    }

    public function getListByCond($cond){
        $this->db->select('organs.*');
        $this->db->from($this->table);

        $this->db->join('companies', 'organs.company_id = companies.company_id', 'left');

        if (!empty($cond['company_id'])){
            $this->db->where('companies.company_id', $cond['company_id']);
        }

        $this->db->where('companies.visible', '1');
        $query = $this->db->get();
        return $query->result_array();
    }

}