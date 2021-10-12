<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';
class User_model extends Base_model
{

    public function __construct()
    {
        parent::__construct();
        $this->table = 'users';
        $this->primary_key = 'user_id';
    }

    public function getRecordByCond($cond){
        $this->db->from($this->table);
        $this->db->where('visible', '1');

        if (!empty($cond['user_no'])){
            $this->db->where('user_no', $cond['user_no']);
        }

        $query = $this->db->get();
        return $query->row_array();

    }

    public function getUsersByCond($cond){
        $this->db->from($this->table);

        if (!empty($cond['company_id'])){
            $this->db->where('company_id', $cond['company_id']);
        }

        $query = $this->db->get();
        return $query->result_array();

    }

    public function getUserListWithSelectGroup($company_id, $group_id){

        $sql = "select users.*, tmp.group_id from 
                                  users left join 
                                      (select * from group_users where group_users.group_id=$group_id) tmp on users.user_id = tmp.user_id 
                where users.company_id = $company_id order by users.user_nick";

        $query = $this->db->query($sql);

        return $query->result_array();

    }

    public function getUserListInSelectGroup($company_id, $group_id){

        $sql = "select users.* from 
                                  users left join group_users on users.user_id = group_users.user_id 
                where users.company_id = $company_id and group_users.group_id = $group_id order by users.user_nick";

        $query = $this->db->query($sql);

        return $query->result_array();

    }

    public function checkEmailExists($email, $userId=''){
        $this->db->from($this->table);
        $this->db->where('user_email', $email);
        if (!empty($userId)){
            $this->db->where('user_id <> '. $userId);
        }

        $query = $this->db->get();

        return !empty($query->result_array());
    }

    public function getUserByToken($token){
        $this->db->from($this->table);
        $this->db->where('user_device_token', $token);
        $query = $this->db->get();
        return $query->row_array();
    }

}

  