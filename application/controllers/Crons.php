<?php

require_once APPPATH . 'core/WebController.php';

class Crons extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('user_model');
        $this->load->model('user_ticket_reset_setting_model');

    }

    public function resetUserTicket()
    {
        $date = date('Y-m-d');
        $day = 30;
        $max_day = 31;
        $week = '1';

        $days = [];
        for($i=$day ;$i<=$max_day;$i++){
            $days[] = $i;
        }

        $days = join(',', $days);

        $resetDatas = $this->user_ticket_reset_setting_model->getResetSettingList($days, '2');

        foreach ($resetDatas as $setting){
            $user = $this->user_model->getFromId($setting['user_id']);
            if (!empty($user)){
                $user['user_ticket'] = $setting['ticket_value'];
                $this->user_model->updateRecord($user, 'user_id');
            }
        }
    }
}

?>