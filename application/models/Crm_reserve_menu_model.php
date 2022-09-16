<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Crm_reserve_menu_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'crm_reserve_menu_tbl';
        $this->primary_key = 'id';
    }



}