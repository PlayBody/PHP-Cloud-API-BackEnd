<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Connect_home_menu_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'connect_home_menus';
        $this->primary_key = 'id';
    }

    public function getHomeMenuList($company_id){
        $this->db->from($this->table);
        $this->db->where('company_id', $company_id);
        $query = $this->db->get();

        return $query->result_array();
    }
}