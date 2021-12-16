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
    }

    public function removeBadge(){
        $receiver_id = $this->input->post('receiver_id');
        $receiver_type = $this->input->post('receiver_type');

        $data = $this->notification_model->getBageCountRecord($receiver_id, $receiver_type);

        if (!empty($data)){
            $data['badge_count']=0;
            $this->notification_model->updateRecord($data, 'id');
        }

        $results['isRemove'] = true;

        echo json_encode($results);
    }
}
?>