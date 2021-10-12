<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';
class User_coupon_model extends Base_model
{

    public function __construct()
    {
        parent::__construct();
        $this->table = 'user_coupons';
        $this->primary_key = 'user_coupon_id';
    }

    public function getUserCoupons($cond){
        $this->db->select('coupons.*');
        $this->db->from($this->table);
        $this->db->join('coupons', 'coupons.coupon_id=user_coupons.coupon_id','left');

        if (!empty($cond['user_id'])){
            $this->db->where('user_coupons.user_id', $cond['user_id']);
        }
        if (!empty($cond['use_flag'])){
            $this->db->where('user_coupons.use_flag', $cond['use_flag']);
        }

        $query = $this->db->get();

        return $query->result_array();

    }
}

  