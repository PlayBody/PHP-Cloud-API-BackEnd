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
        $this->load->model('rank_model');
        $this->load->model('rank_prefer_model');
    }

    public function loadCouponList(){
        $company_id = $this->input->post('company_id');
        $is_get_delete = $this->input->post('is_get_delete');

        $cond = [];
        if(empty($is_get_delete)) $cond['visible'] = 1;
        if (!empty($company_id))  $cond['company_id'] = $company_id;

        $coupons = $this->coupon_model->getListByCondition($cond);
        $data = [];
        foreach ($coupons as $coupon){
            $tmp = $coupon;
            $tmp['staffs'] = $this->user_coupon_model->getStaffListByCoupon(['coupon_id' =>$coupon['coupon_id']]);
            $data[] = $tmp;

        }

        $results['isLoad'] = true;
        $results['coupons'] = $data;

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

    public function loadStampList(){
        $condition = $this->input->post('condition');
        $cond = json_decode($condition, true);

        $stamps = $this->stamp_model->getStampList($cond);
        $results['isLoad'] = true;
        $results['stamps'] = $stamps;

        echo json_encode($results);

    }

    public function loadCoupons(){
        $condition = $this->input->post('condition');
        $cond = json_decode($condition, true);

        $coupons = $this->user_coupon_model->getUserCoupons($cond);

        $results['isLoad'] = true;
        $results['coupons'] = $coupons;

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
        $cond['use_date']=date('Y-m-d');
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
        $is_force= $this->input->post('is_force');

        if (empty($coupon_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }

        if (!empty($is_force)){
            $coupons = $this->coupon_model->delete_force($coupon_id, 'coupon_id');
        }else{
            $coupons = $this->coupon_model->delete($coupon_id, 'coupon_id');
        }


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
        $staff_id = $this->input->post('staff_id');
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
                'staff_id' => $staff_id,
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
            $coupon['staff_id'] = $staff_id;
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
        $staff_id = $this->input->post('staff_id');

        $users = json_decode($user_ids);
        $coupons = json_decode($coupon_ids);

        foreach ($coupons as $coupon){
            foreach ($users as $user){
                $data = array('user_id'=>$user, 'coupon_id'=>$coupon, 'use_flag'=>'1', 'staff_id'=>$staff_id);
                $this->user_coupon_model->insertRecord($data);
            }
        }

        $results['isSave'] = true;
        echo json_encode($results);

    }

    public function saveStamp(){
        $rank_id = $this->input->post('rank_id');
        $rank_name = $this->input->post('rank_name');
        $company_id = $this->input->post('company_id');
        $max_stamp = $this->input->post('max_stamp');

        $prefer_json = $this->input->post('prefer_json');

        $prefers = empty($prefer_json)? [] :json_decode($prefer_json, true);

        if (empty($rank_id)){
            $max_rank = $this->rank_model->getFromMaxLevel($company_id);
            $rank_data = array(
                'rank_name' => $rank_name,
                'rank_level' => $max_rank,
                'company_id' => $company_id,
                'max_stamp' => $max_stamp
            );

            $rank_id = $this->rank_model->insertRecord($rank_data);
        }else{
            $rank_data = $this->rank_model->getFromId($rank_id);
            $rank_data['rank_name'] = $rank_name;
            $rank_data['max_stamp'] = $max_stamp;

            $this->rank_model->updateRecord($rank_data, 'rank_id');
        }

        foreach ($prefers as $prefer){
            if (empty($prefer['rank_prefer_id'])){
                $prefer_data = array(
                    'rank_id' => $rank_id,
                    'stamp_count'=>$prefer['stamp_count'],
                    'menu_id' => $prefer['menu_id']
                );
                $this->rank_prefer_model->insertRecord($prefer_data);
            }else{
                if ($prefer['is_delete']=='1'){
                    $this->rank_prefer_model->delete_force($prefer['rank_prefer_id'], 'rank_prefer_id');
                }else{
                    $prefer_data = $this->rank_prefer_model->getFromId($prefer['rank_prefer_id']);
                    $prefer_data['stamp_count'] = $prefer['stamp_count'];
                    $prefer_data['menu_id'] = $prefer['menu_id'];

                    $this->rank_prefer_model->updateRecord($prefer_data, 'rank_prefer_id');
                }
            }
        }

        $results['isSave'] = true;

        echo json_encode($results);
    }

    public function loadRanks(){
        $company_id = $this->input->post('company_id');
        $max_rank = $this->input->post('max_rank');



        $ranks = $this->rank_model->getRankList(['company_id'=>$company_id, 'max_rank'=>$max_rank]);
        $results['ranks'] = $ranks;
        echo json_encode($results);
    }

    public function loadRankInfo(){
        $rank_id = $this->input->post('rank_id');

        $rank = $this->rank_model->getFromId($rank_id);

        $results['rank'] = $rank;
        echo json_encode($results);
    }

    public function loadRankPrefers(){
        $company_id = $this->input->post('company_id');
        $rank_id = $this->input->post('rank_id');

        $cond = [];

        if(!empty($company_id)) $cond['company_id'] = $company_id;
        if(!empty($rank_id)) $cond['rank_id'] = $rank_id;

        $prefers = $this->rank_prefer_model->getPreferList($cond);

        $results['prefers'] = $prefers;
        echo json_encode($results);
    }

    public function deleteRanks(){
        $rank_id = $this->input->post('rank_id');
        $rank = $this->rank_model->getFromId($rank_id);
        $this->rank_model->delete_force($rank_id, 'rank_id');
        $this->rank_prefer_model->delete_force($rank_id, 'rank_id');

        $after_ranks = $this->rank_model->getRankList(['company_id'=>$rank['company_id'], 'after_rank'=>$rank['rank_level']]);
        foreach ($after_ranks as $after_rank){
            $after_rank['rank_level']--;
            $this->rank_model->updateRecord($after_rank, 'rank_id');
        }

        $results['isDelete'] = true;
        echo json_encode($results);
    }

    public function useUserCoupon(){
        $user_coupon_id = $this->input->post('user_coupon_id');
        $user_coupon = $this->user_coupon_model->getFromId($user_coupon_id);
        $user_coupon['use_flag'] = 0;
        $this->user_coupon_model->updateRecord($user_coupon, 'user_coupon_id');

        $results['isSave'] = true;
        echo json_encode($results);
    }
}
?>
