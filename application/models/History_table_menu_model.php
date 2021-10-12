<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class History_table_menu_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'history_table_menus';
        $this->primary_key = 'history_table_menu_id';
    }

    public function getListCond($cond){
        $this->db->from($this->table);
        $this->db->where('visible', '1');

        if(!empty($cond['history_table_id'])){
            $this->db->where('history_table_id', $cond['history_table_id']);
        }

        $query = $this->db->get();

        return $query->result_array();
    }
}