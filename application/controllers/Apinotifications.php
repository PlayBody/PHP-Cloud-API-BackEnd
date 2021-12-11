<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Apinotifications extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('notification_model');
        $this->load->model('staff_organ_model');
        $this->load->model('shift_model');
    }

    public function sendNotifications(){
        $type = $this->input->post('type');
        $title = $this->input->post('title');
        $content = $this->input->post('content');
        $sender_id = $this->input->post('sender_id');
        $sender_type = $this->input->post('sender_type');
        $receiver_ids = $this->input->post('receiver_ids');
        $receiver_type = $this->input->post('receiver_type');

        $receivers = json_decode($receiver_ids);

        foreach ($receivers as $receiver){
            $data = array(
                'notification_type' => $type,
                'notification_title' => $title,
                'notification_content' => $content,
                'sender_type' => $sender_type,
                'sender_id' => $sender_id,
                'receiver_type' => $receiver_type,
                'receiver_id' => $receiver,
                'visible' => '1'
            );

            $this->notification_model->insertRecord($data);
        }

        $results['isSend'] = true;

        echo json_encode($results);
    }
}
?>