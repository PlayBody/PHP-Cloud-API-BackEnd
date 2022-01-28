<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Cart_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'carts';
        $this->primary_key = 'cart_id';
    }

    public function getRecordByCond($cond){
        $this->db->from($this->table);

        if (!empty($cond['user_id'])){
            $this->db->where('user_id', $cond['user_id']);
        }

        if (!empty($cond['company_id'])){
            $this->db->where('company_id', $cond['company_id']);
        }

        if (!empty($cond['visible'])){
            $this->db->where('visible', $cond['visible']);
        }

        if (!empty($cond['cart_type'])){
            $this->db->where('cart_type', $cond['cart_type']);
        }

        $this->db->order_by('cart_id', 'desc');
        $query = $this->db->get();

        return $query->row_array();

    }
}