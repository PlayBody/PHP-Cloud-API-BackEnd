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

        if (empty($company_id) || empty($user_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $messages = $this->message_model->getMessageList($user_id, $company_id);

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
        $user_id = $this->input->post('user_id');
        $content = $this->input->post('content');
        $type = $this->input->post('type');
        $file_type = $this->input->post('file_type');
        $file_url = $this->input->post('file_url');

        if (empty($company_id) && empty($user_id)){
            $results['isSend'] = false;
            echo json_encode($results);
            return;
        }

        $message = array(
            'company_id' => $company_id,
            'user_id' => $user_id,
            'content' => $content,
            'file_type' => empty($file_type) ? null : $file_type,
            'file_url' => empty($file_url) ? null : $file_url,
            'type' => $type
        );

        $this->message_model->insertRecord($message);
        $token_data = [];
        if ($type=='1'){
            $token_data = $this->device_token_model->getListByCondition(['user_id'=>$user_id, 'user_type'=>'2']);
        }

        if ($type=='2'){
            $user = $this->user_model->getFromId('31');
            if (!empty($user['user_device_token'])){
                $token_data[] = $user['user_device_token'];
            }

        }
//        foreach ($token_data as $item){
//
//            if (!empty($item)){
//                $this->sendFireBaseMessage('message', 'メセジが受信されました。', $content, $item);
//            }
//        }

        $results['isSend'] = true;

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


}
?>