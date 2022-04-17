<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Rank_prefer_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'rank_prefers';
        $this->primary_key = 'rank_prefer_id';
    }

    public function getPreferList($cond){
        $this->db->select($this->table.'.*, menus.menu_title as menu_name');
        $this->db->from($this->table);
        $this->db->join('menus', 'menus.menu_id=rank_prefers.menu_id', 'left');
        $this->db->join('ranks', 'ranks.rank_id=rank_prefers.rank_id', 'left');

        if(!empty($cond['company_id'])){
            $this->db->where('ranks.company_id', $cond['company_id']);
        }

        if(!empty($cond['rank_id'])){
            $this->db->where('rank_prefers.rank_id', $cond['rank_id']);
        }

        $query = $this->db->get();
        return $query->result_array();
    }

}