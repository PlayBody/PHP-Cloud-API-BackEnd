<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Crm_user_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'crm_user_tbl';
        $this->primary_key = 'id';
    }

    public function getUserByEmail($mail){
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where('mail_address', $mail);

        $query = $this->db->get();

        return $query->row_array();
    }


}