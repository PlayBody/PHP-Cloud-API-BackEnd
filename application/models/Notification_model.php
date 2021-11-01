<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Notification_model extends Base_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'notifications';
        $this->primary_key = 'id';
    }

    public function getListByCond($cond){
        $this->db->from($this->table);

        if (!empty($cond['receiver_type'])){
            $this->db->where('receiver_type', $cond['receiver_type']);
        }
        if (!empty($cond['receiver_id'])){
            $this->db->where('receiver_id', $cond['receiver_id']);
        }

        $query = $this->db->get();

        return $query->result_array();
    }
}