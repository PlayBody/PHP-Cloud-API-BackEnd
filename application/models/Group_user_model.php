<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Group_user_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'group_users';
        $this->primary_key = 'group_id';
    }

    public function getGroupsByUser($user_id){
        $this->db->select('groups.*');
        $this->db->from($this->table);
        $this->db->join('groups', 'groups.group_id=group_users.group_id', 'left');
        $this->db->where($this->table.'.user_id', $user_id);

        $query = $this->db->get();
        return $query->result_array();
    }

    public function getUserGroup($user_id, $group_id){
        $this->db->from($this->table);
        $this->db->where('user_id', $user_id);
        $this->db->where('group_id', $group_id);

        $query = $this->db->get();
        return $query->row_array();
    }

    public function getUsersByGroupGroup($group_id){
        $this->db->from($this->table);
        $this->db->where('group_id', $group_id);

        $query = $this->db->get();
        return $query->result_array();
    }
}