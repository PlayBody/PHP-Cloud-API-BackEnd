<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Apiusers extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->model('group_user_model');
        $this->load->model('user_ticket_reset_setting_model');
    }

//    public function getUsers(){
//        $key_id = $this->input->post('key_id');
//        $key_value = $this->input->post('key_value');
//
//        if (empty($company_id)){
//            $results['isLoad'] = false;
//            echo json_encode($results);
//            return;
//        }
//
//        $users = $this->user_model->getUsersByCond(['company_id'=>$company_id]);
//
//        $results['isLoad'] = true;
//        $results['users'] = $users;
//
//        echo json_encode($results);
//    }

    public function loadUserFromQrNo(){
        $user_no = $this->input->post('user_no');

        if (empty($user_no)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $user = $this->user_model->getRecordByCond(['user_no'=>$user_no]);

        if (empty($user)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $results['isLoad'] = true;
        $results['user'] = $user;

        echo json_encode($results);
    }

    public function loadUserWithGroupList(){
        $company_id = $this->input->post('company_id');
        $group_id = $this->input->post('group_id');
        if (empty($company_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $users = $this->user_model->getUsersByCond(['company_id'=>$company_id]);

        $group_users = [];
        if (!empty($group_id)){
            $group_users = $this->group_user_model->getUsersByGroupGroup($group_id);
        }

        $results['isLoad'] = true;
        $results['users'] = $users;
        $results['group_users'] = $group_users;

        echo json_encode($results);
    }

    public function loadUserInGroupList(){
        $company_id = $this->input->post('company_id');
        $group_id = $this->input->post('group_id');
        if (empty($company_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $users = $this->user_model->getUserListInSelectGroup($company_id, $group_id);

        $results['isLoad'] = true;
        $results['users'] = $users;

        echo json_encode($results);
    }

    public function loadUserList(){
        $company_id = $this->input->post('company_id');

        if (empty($company_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $users = $this->user_model->getUsersByCond(['company_id'=>$company_id]);

        $results['isLoad'] = true;
        $results['users'] = $users;

        echo json_encode($results);
    }

    public function loadUserInfo(){
        $user_id = $this->input->post('user_id');
        if (empty($user_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $user = $this->user_model->getFromId($user_id);

        $groups = $this->group_user_model->getGroupsByUser($user_id);

        $ticket_reset = $this->user_ticket_reset_setting_model->getResetSetting(['user_id'=>$user_id]);

        if (!empty($groups)){
            $user['group'] = $groups[0];
        }
        $results['isLoad'] = true;
        $results['user'] = $user;
        $results['ticket_reset'] = empty($ticket_reset) ? null : $ticket_reset ;

        echo json_encode($results);
    }

    public function updateUserTicket(){
        $user_id = $this->input->post('user_id');
        $ticket_count = $this->input->post('ticket_count');

        $user = $this->user_model->getFromId($user_id);

        if (!empty($user)){
            $user['user_ticket'] = $ticket_count;
            $this->user_model->updateRecord($user, 'user_id');
        }

        $results['is_update'] = true;

        echo json_encode($results);
    }

    public function saveUserInfo(){
        $company_id = $this->input->post('company_id');
        $user_id = $this->input->post('user_id');

        $user_email = $this->input->post('user_email');

        $results['err_type'] = '';
        if (!empty($user_email)){
            if(empty($user_id)){
                $isEmailExist = $this->user_model->checkEmailExists($user_email);
            } else {
                $isEmailExist = $this->user_model->checkEmailExists($user_email, $user_id);
            }

            if($isEmailExist){
                $results['isSave'] =false;
                $results['err_type'] = 'mail_exist';
                echo json_encode($results);
                return;

            }
        }

        if (empty($user_id)){

            $user_code = $this->generateUserCode();

            $user = array(
                'company_id' => $company_id,
                'user_no' => $user_code,
                'user_grade' => '1',
                'user_qrcode' => $this->generateUserQRCode($user_code, $company_id),
                'user_first_name' => empty($this->input->post('user_first_name')) ? null : $this->input->post('user_first_name'),
                'user_last_name' => empty($this->input->post('user_last_name')) ? null : $this->input->post('user_last_name'),
                'user_nick' => $this->input->post('user_nick'),
                'user_email' => empty($this->input->post('user_email')) ? null : $this->input->post('user_email'),
                'user_tel' => empty($this->input->post('user_tel')) ? null : $this->input->post('user_tel'),
                'user_sex' => empty($this->input->post('user_sex')) ? null : $this->input->post('user_sex'),
                'user_birthday' => empty($this->input->post('user_birthday')) ? null : $this->input->post('user_birthday'),
                'user_ticket' => 0,
                'user_device_token' => empty($this->input->post('user_device_token')) ? '' : $this->input->post('user_device_token'),
                'visible' => 1,
            );
            $user_id = $this->user_model->insertRecord($user);
        }else{
            $user = $this->user_model->getFromId($user_id);

            if (empty($user['user_no'])){
                $user['user_no'] = $this->generateUserCode();
                $user['user_qrcode'] = $this->generateUserQRCode($user['user_no'], $company_id);
            }

            if (!empty($this->input->post('user_first_name'))) $user['user_first_name'] = $this->input->post('user_first_name');
            if (!empty($this->input->post('user_last_name'))) $user['user_last_name'] = $this->input->post('user_last_name');
            if (!empty($this->input->post('user_nick'))) $user['user_nick'] = $this->input->post('user_nick');
            if (!empty($this->input->post('user_email'))) $user['user_email'] = $this->input->post('user_email');
            if (!empty($this->input->post('user_tel'))) $user['user_tel'] = $this->input->post('user_tel');
            if (!empty($this->input->post('user_sex'))) $user['user_sex'] = $this->input->post('user_sex');
            if (!empty($this->input->post('user_birthday'))) $user['user_birthday'] = $this->input->post('user_birthday');
            if (!empty($this->input->post('user_ticket'))) $user['user_ticket'] = $this->input->post('user_ticket');

            $this->user_model->updateRecord($user, 'user_id');
        }

        if (!empty($user_id) && (!empty($this->input->post('is_reset_ticket')) || $this->input->post('is_reset_ticket')=='0' )){
            $reset_setting = $this->user_ticket_reset_setting_model->getResetSetting(['user_id'=>$user_id]);
            if (empty($reset_setting)){
                $data = array(
                    'user_id'=>$user_id,
                    'is_enable' =>$this->input->post('is_reset_ticket'),
                    'time_type'=>$this->input->post('ticket_reset_type'),
                    'time_value'=>$this->input->post('ticket_reset_day'),
                    'ticket_value'=>$this->input->post('ticket_reset_value'),
                );
                $this->user_ticket_reset_setting_model->insertRecord($data);
            }else{

                $reset_setting['is_enable'] = $this->input->post('is_reset_ticket');
                $reset_setting['time_type'] = $this->input->post('ticket_reset_type');
                $reset_setting['time_value'] = $this->input->post('ticket_reset_day');
                $reset_setting['ticket_value'] = $this->input->post('ticket_reset_value');
                $this->user_ticket_reset_setting_model->updateRecord($reset_setting, 'id');
            }

        }

        $results['isSave'] = true;
        $results['user_id'] = $user_id;

        echo json_encode($results);
    }

    public function getRegisterUserInfo(){
        $device_token = $this->input->post('device_token');
        if (empty($device_token)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $user = $this->user_model->getUserByToken($device_token);

        if (empty($user)){
            $results['isLoad'] = false;
        }else{
            $results['isLoad'] = true;
            $results['user'] = $user;
        }

        echo json_encode($results);
    }

    public function generateUserCode(){
        $user_code = 0;
        while($user_code==0){
            $tmpUserCode = rand(10000000000, 99999999999);
            $exit_code_user = $this->user_model->getRecordByCond(['user_no'=>$tmpUserCode]);
            if (empty($exit_code_user)){
                $user_code = $tmpUserCode;
            }
        }

        return $user_code;
    }
    public function generateUserQRCode($user_no, $company_id){
        $domain = '';
        if ($company_id==1) $domain = 'conceptbar.info';
        if ($company_id==2) $domain = 'riraku-kan.jp';
        if ($company_id==3) $domain = 'koritori.jp';
        if ($company_id==4) $domain = 'libero-school.com';

        $company_code = substr('000'.$company_id, strlen('000'.$company_id)-3);

        $sum_check = 0;
        foreach (str_split($user_no) as $each ){
            $sum_check = $sum_check + $each;
        }

        $qr_code = 'connect!'.$user_no.'!'.$domain.'!'.$company_code.'!'.$sum_check;

        return $qr_code;
    }

    public function deleteUser(){
        $user_id = $this->input->post('user_id');
        if (empty($user_id)){
            echo json_encode(['isDelete'=>false]);
            return;
        }
        $this->user_model->delete($user_id, 'user_id');

        echo json_encode(['isDelete'=>true]);
    }
}
?>