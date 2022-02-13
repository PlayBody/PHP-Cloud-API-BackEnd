<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Apimessages extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {

        parent::__construct();

        $this->load->model('message_model');
        $this->load->model('user_model');
        $this->load->model('device_token_model');
        $this->load->model('fitness_model');
        $this->load->model('group_user_model');
        $this->load->model('staff_model');
    }

    public function loadMessageUserList(){
        $company_id = $this->input->post('company_id');
        $search = $this->input->post('search');

        if (empty($company_id) ){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $messageUsers = $this->message_model->getMessageUserLists($company_id, $search);

        $results['isLoad'] = true;
        $results['message_users'] = $messageUsers;

        echo json_encode($results);
    }

    public function loadMessages(){
        $company_id = $this->input->post('company_id');
        $user_id = $this->input->post('user_id');
        $user_type = $this->input->post('user_type');
        $is_group = $this->input->post('is_group');

        if (empty($company_id) ||  (empty($user_id) && $user_id!='0' )){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $cond = [];
        $cond['company_id'] = $company_id;
        if ($is_group == '1' ){
            $cond['group_id'] = $user_id;
        }else{
            $cond['group_id'] = '';
            $cond['user_id'] = $user_id;
        }

        $messages = $this->message_model->getMessageList($cond);

        foreach ($messages as $message){
            if ($message['type']==$user_type) {
                $message['read_flag'] = 1;
                $this->message_model->updateRecord($message, 'message_id');
            }
        }

        $results['isLoad'] = true;
        $results['messages'] = $messages;

        echo json_encode($results);

    }

    public function sendMessage()
    {
        $company_id = $this->input->post('company_id');
        $user_id =  $this->input->post('user_id');
        $staff_id = $this->input->post('staff_id');
        $content = $this->input->post('content');
        $type = $this->input->post('type');
        $file_type = $this->input->post('file_type');
        $file_url = $this->input->post('file_url');
        $file_name = $this->input->post('file_name');
        $video_url = $this->input->post('video_url');
        $is_group = $this->input->post('is_group');

        if (empty($company_id) || (empty($user_id) && $user_id!='0' )){
            $results['isSend'] = false;
            echo json_encode($results);
            return;
        }

        $group_key = null;
        if ($is_group=='1'){
            $group_key = $company_id . '-' . $user_id. '-' . date('YmdHis') . '-' . md5(uniqid(rand(), true));

            $group_id = $user_id;
            if ($group_id=='0'){
                $users = $this->user_model->getUsersByCond(['company_id'=>$company_id]);
            }else{
                $users = $this->group_user_model->getUsersByGroupGroup($group_id);
            }
        }else{
            $group_id = null;

            $users[]['user_id'] = $user_id;
        }

        $title = '';
        if ($type=='2'){
            $staff = $this->staff_model->getFromId($staff_id);
            $title = ($staff['staff_nick'] == null ? ($staff['staff_first_name'] . ' ' . $staff['staff_last_name']) : $staff['staff_nick']) . '様からメッセージが届きました。';
        }

        $is_fcm = false;
        foreach ($users as $user){
            $message = array(
                'company_id' => $company_id,
                'user_id' => $user['user_id'],
                'content' => $content,
                'file_type' => empty($file_type) ? null : $file_type,
                'file_url' => empty($file_url) ? null : $file_url,
                'file_name' => empty($file_name) ? null : $file_name,
                'video_url' => empty($video_url) ? null : $video_url,
                'type' => $type,
                'group_id' => $group_id,
                'group_key' =>$group_key,
            );

            $this->message_model->insertRecord($message);

            if ($type=='1'){
                $user = $this->user_model->getFromId($user['user_id']);
                $title = $user['user_first_name'] . ' ' . $user['user_last_name'].'様からメッセージが届きました。';

                $receive_staffs = $this->staff_model->getStaffList(['company_id'=>$company_id, 'staff_auth'=>'2']);
                foreach ($receive_staffs as $receive_staff){
                    $is_fcm = $this->sendNotifications('message', $title, $content, $user['user_id'], $receive_staff['staff_id'], '1');
                }

            }else{
                $is_fcm = $this->sendNotifications('message', $title, $content, $company_id, $user['user_id'], '2');
            }

        }


        $results['isSend'] = true;
        $results['isSendFcm'] = $is_fcm;

        echo json_encode($results);

    }


    public function loadFitnesses(){
        $company_id = $this->input->post('company_id');
        $group_id = $this->input->post('group_id');

        if (empty($company_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $cond = [];
        $cond['company_id'] = $company_id;
        if (!empty($group_id)){
            $cond['group_id'] = $group_id;
        }
        $list = $this->fitness_model->getListByCond($cond);

        $results['isLoad'] = true;
        $results['messages'] = $list;

        echo json_encode($results);

    }

    public function saveFitness(){
        $company_id = $this->input->post('company_id');
        $group_id = $this->input->post('group_id');
        $message = $this->input->post('message');
        $file_type = $this->input->post('file_type');
        $file_url = $this->input->post('file_url');

        if (empty($company_id)){
            $results['isSave'] = false;
            echo json_encode($results);
            return;
        }

        $fitness = array(
            'company_id'=>$company_id,
            'group_id'=>empty($group_id) ? null : $group_id,
            'message'=>$message,
            'file_type' => empty($file_type) ? null : $file_type,
            'file_url' => empty($file_url) ? null : $file_url,
        );

        $this->fitness_model->insertRecord($fitness);

        $results['isSave'] = true;

        echo json_encode($results);

    }

    public function getStaffUnreadCount(){
        $company_id = $this->input->post('company_id');
        $count = $this->message_model->getUnreadMessageCount('1', $company_id);

        $results['count'] = empty($count)?0 : $count;
        echo json_encode($results);

    }

    function uploadAttachment() {

        $result = array();

        // user photo
        $upload_path = "assets/messages/";
        if(!is_dir($upload_path)) {
            mkdir($upload_path);
        }
        $path  = base_url().$upload_path;
        $fileName = $_FILES['upload']['name'];
        $config = array(
            'upload_path'   => $upload_path,
            'allowed_types' => '*',
            'overwrite'     => 1,
            'file_name' 	=> $fileName
        );
        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        if (!empty($fileName)) {
            if ($this->upload->do_upload('upload')) {
                $file_url = $path.$this->upload->file_name;
                //		$data = array('username' => $username, 'picture' => $file_url, 'about_me' => $aboutme,'user_location' => $userlocation, 'user_birthday' => $userbirthday, 'latitude' => $latitude, 'longitude' => $longitude);
                //		$this->api_model->update_query("tb_user", $condition, $data);
                $result['isUpload'] = true;
            } else {
                $result['isUpload'] = false;
            }
        }else{
            $result['isUpload'] = false;
        }

        echo json_encode($result);

    }


    public function sendtest(){

        $company_id = 4;
        $user_id = 123;
        $staff_id = 2;
        $content = 'test';
        $type = '2';
        $file_type = $this->input->post('file_type');
        $file_url = $this->input->post('file_url');
        $file_name = $this->input->post('file_name');
        $video_url = $this->input->post('video_url');
        $is_group = $this->input->post('is_group');

        if (empty($company_id) || (empty($user_id) && $user_id!='0' )){
            $results['isSend'] = false;
            echo json_encode($results);
            return;
        }

        $group_key = null;
        if ($is_group=='1'){
            $group_key = $company_id . '-' . $user_id. '-' . date('YmdHis') . '-' . md5(uniqid(rand(), true));

            $group_id = $user_id;
            if ($group_id=='0'){
                $users = $this->user_model->getUsersByCond(['company_id'=>$company_id]);
            }else{
                $users = $this->group_user_model->getUsersByGroupGroup($group_id);
            }
        }else{
            $group_id = null;

            $users[]['user_id'] = $user_id;
        }

        $title = '';
        if ($type=='2'){
            $staff = $this->staff_model->getFromId($staff_id);
            $title = ($staff['staff_nick'] == null ? ($staff['staff_first_name'] . ' ' . $staff['staff_last_name']) : $staff['staff_nick']) . '様からメッセージが届きました。';
        }

        $is_fcm = false;
        foreach ($users as $user){
            $message = array(
                'company_id' => $company_id,
                'user_id' => $user['user_id'],
                'content' => $content,
                'file_type' => empty($file_type) ? null : $file_type,
                'file_url' => empty($file_url) ? null : $file_url,
                'file_name' => empty($file_name) ? null : $file_name,
                'video_url' => empty($video_url) ? null : $video_url,
                'type' => $type,
                'group_id' => $group_id,
                'group_key' =>$group_key,
            );

            // $this->message_model->insertRecord($message);

            if ($type=='1'){
                $user = $this->user_model->getFromId($user['user_id']);
                $title = $user['user_first_name'] . ' ' . $user['user_last_name'].'様からメッセージが届きました。';

                $receive_staffs = $this->staff_model->getStaffList(['company_id'=>$company_id, 'staff_auth'=>'2']);
                foreach ($receive_staffs as $receive_staff){
                    $is_fcm = $this->sendNotifications('message', $title, $content, $user['user_id'], $receive_staff['staff_id'], '1');
                }

            }else{

                $is_fcm = $this->sendNotifications('message', $title, $content, $company_id, $user['user_id'], '2');
            }

        }


        $results['isSend'] = true;
        $results['isSendFcm'] = $is_fcm;

        echo json_encode($results);
    }


}
?>