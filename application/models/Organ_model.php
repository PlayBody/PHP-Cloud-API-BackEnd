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
        $this->db->select('organs.*, companies.company_name');
        $this->db->from($this->table);

        $this->db->join('companies', 'organs.company_id = companies.company_id', 'inner');

        if (!empty($cond['company_id'])){
            $this->db->where('organs.company_id', $cond['company_id']);
        }

        $this->db->where('companies.visible', '1');
        $query = $this->db->get();
        return $query->result_array();
    }


    public function getRecordByCond($cond){
        $this->db->from($this->table);

        if (!empty($cond['company_id'])){
            $this->db->where('company_id', $cond['company_id']);
        }

        if (!empty($cond['organ_number'])){
            $this->db->where('organ_number', $cond['organ_number']);
        }

        $query = $this->db->get();
        return $query->row_array();
    }

    public function getMaxOrganNumber($company_id){
        $this->db->from($this->table);
        $this->db->where('company_id', $company_id);
        $this->db->order_by('organ_number', 'desc');

        $query = $this->db->get();
        $results = $query->row_array();

        if (empty($results)) return '001';

        $max = intval($results['organ_number'])+1;

        return substr('000'.$max, strlen('000'.$max)-3);
    }

}
