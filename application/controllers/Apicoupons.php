<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Apicoupons extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {

        parent::__construct();

        $this->load->model('staff_model');
        $this->load->model('coupon_model');
        $this->load->model('user_coupon_model');
        $this->load->model('user_model');
        $this->load->model('company_model');

        $this->load->model('stamp_model');
    }

    public function loadCouponList(){
        $staff_id = $this->input->post('staff_id');

        if (empty($staff_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $staff = $this->staff_model->getFromId($staff_id);

        $cond = [];
        if ($staff['staff_auth']==4){
            $cond['company_id'] = $staff['company_id'];
        }

        $coupons = $this->coupon_model->getListByCondition($cond);

        $results['isLoad'] = true;
        $results['coupons'] = $coupons;

        echo json_encode($results);

    }


    public function loadUserStampList(){
        $user_id = $this->input->post('user_id');
        $company_id = $this->input->post('company_id');

        if (empty($user_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $company = $this->company_model->getFromId($company_id);

        $cond = [];
        $cond['user_id'] = $user_id;
        //$cond['use_flag'] = 1;
        $stamps = $this->stamp_model->getStampList($cond);

//        if (empty($stamps)){
//
//            $results['isLoad'] = false;
//            echo json_encode($results);
//            return;
//        }
        $results['isLoad'] = true;
        $results['stamp_count'] = $company['stamp_count']==null ? 15: $company['stamp_count'];
        $results['stamps'] = $stamps;

        echo json_encode($results);

    }


    public function loadUserCouponList(){
//        $company_id = $this->input->post('company_id');
        $user_id = $this->input->post('user_id');

        if (empty($user_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $cond['user_id'] = $user_id;
        $cond['use_flag']='1';
        $coupons = $this->user_coupon_model->getUserCoupons($cond);

        $results['isLoad'] = true;
        $results['coupons'] = $coupons;

        echo json_encode($results);

    }

    public function loadCouponInfo(){
        $coupon_id = $this->input->post('coupon_id');
        $coupon_code = $this->input->post('coupon_code');

        if (empty($coupon_id)){
            if (!empty($coupon_code)){
                $coupon = $this->coupon_model->getCouponbyCondition(['coupon_code'=>$coupon_code]);
                $results['isLoad'] = true;
                $results['coupon'] = $coupon;
                echo json_encode($results);
                return;
            }

            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $coupon = $this->coupon_model->getFromId($coupon_id);

        $results['isLoad'] = true;
        $results['coupon'] = $coupon;

        echo json_encode($results);

    }


    public function getUserCouponInfo(){
        $user_id = $this->input->post('user_id');
        $coupon_code = $this->input->post('coupon_code');

        if (empty($coupon_code)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $coupon = $this->coupon_model->getUserCoupon($user_id, $coupon_code);
        $results['isLoad'] = true;
        $results['coupon'] = $coupon;
        echo json_encode($results);
        return;
    }
    public function deleteCouponInfo(){
        $coupon_id = $this->input->post('coupon_id');

        if (empty($coupon_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }

        $coupons = $this->coupon_model->delete_force($coupon_id, 'coupon_id');

        $results['isDelete'] = true;

        echo json_encode($results);

    }

    public function saveCoupon()
    {
        $company_id = $this->input->post('company_id');
        $coupon_id = $this->input->post('coupon_id');
        $coupon_name = $this->input->post('coupon_name');
        $coupon_code = $this->input->post('coupon_code');
        $discount_rate = empty($this->input->post('discount_rate')) ? null : $this->input->post('discount_rate');;
        $discount_amount = empty($this->input->post('discount_amount')) ? null : $this->input->post('discount_amount');
        $upper_amount = empty($this->input->post('upper_amount')) ? null : $this->input->post('upper_amount');
        $use_date = $this->input->post('use_date');
        $condition = $this->input->post('condition');
        $use_organ = $this->input->post('use_organ');
        $comment = $this->input->post('comment');

        if (empty($company_id)){
            $results['isSave'] = false;
            echo json_encode($results);
            return;
        }

        if (empty($coupon_id)){
            $coupon = array(
                'company_id' => $company_id,
                'coupon_name' => $coupon_name,
                'coupon_code' => $coupon_code,
                'discount_rate' => $discount_rate,
                'discount_amount' => $discount_amount,
                'upper_amount' => $upper_amount,
                'use_date' => $use_date,
                'condition' => $condition,
                'use_organ_id' => $use_organ,
                'comment' => $comment,
                'is_use' => 1,
                'visible' => 1
            );

            $coupon_id = $this->coupon_model->insertRecord($coupon);
        }else{
            $coupon = $this->coupon_model->getFromId($coupon_id);

            $coupon['coupon_name'] = $coupon_name;
            $coupon['coupon_code'] = $coupon_code;
            $coupon['discount_rate'] = $discount_rate;
            $coupon['discount_amount'] = $discount_amount;
            $coupon['upper_amount'] = $upper_amount;
            $coupon['use_date'] = $use_date;
            $coupon['condition'] = $condition;
            $coupon['use_organ_id'] = $use_organ;
            $coupon['comment'] = $comment;

            $this->coupon_model->updateRecord($coupon);
        }

        $results['isSave'] = true;
        $results['coupon_id'] = $coupon_id;

        echo json_encode($results);
    }

    public function saveUserCoupons(){
        $user_ids = $this->input->post('user_ids');
        $coupon_ids = $this->input->post('coupon_ids');

        $users = json_decode($user_ids);
        $coupons = json_decode($coupon_ids);

        foreach ($coupons as $coupon){
            foreach ($users as $user){
                $data = array('user_id'=>$user, 'coupon_id'=>$coupon, 'use_flag'=>'1');
                $this->user_coupon_model->insertRecord($data);
            }
        }

        $results['isSave'] = true;
        echo json_encode($results);

    }
}
?>