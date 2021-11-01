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



    public function sendShiftRequestNotifications(){
        $staff_id = $this->input->post('staff_id');
        $organ_id = $this->input->post('organ_id');
        $from_date = $this->input->post('from_date');
        $to_date = $this->input->post('to_date');

        $staffs = $this->staff_organ_model->getStaffsByOrgan($organ_id, 2);

        foreach ($staffs as $staff){
            $cond = [];
            $cond['staff_id'] = $staff['staff_id'];
            $cond['organ_id'] = $organ_id;
            $cond['from_time'] = $from_date. ' 00:00:00';
            $cond['to_time'] = $to_date. ' 23:59:59';

            $shifts = $this->shift_model->getListByCond($cond);
            if (empty($shifts)){
                $data = array(
                    'notification_type' => 2,
                    'notification_title' => 'シフト入力要求',
                    'notification_content' => $from_date . ' ~ ' . $to_date . '期間のシフト要求を入力してください。',
                    'sender_type' => '1',
                    'sender_id' => $staff_id,
                    'receiver_type' => '1',
                    'receiver_id' => $staff['staff_id'],
                    'del_flag' => '0'
                );

                $this->notification_model->insertRecord($data);
            }
        }

        $results['isSend'] = true;

        echo json_encode($results);
    }
}
?>