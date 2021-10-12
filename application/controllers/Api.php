<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Api extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('app_version_model');
        $this->load->model('oauth_info_model');
        $this->load->model('device_token_model');
        $this->load->model('message_model');
        $this->load->model('site_model');
        $this->load->model('connect_home_menu_model');
    }

    public function loadAppVersion(){
        $app_id = $this->input->post('app_id');
        $os_type= $this->input->post('os_type');
        $data = $this->app_version_model->getLastVersion($app_id, $os_type);

        $results['isLoad'] = true;
        $results['version'] = $data['version_no'];
        $results['build'] = $data['build_no'];

        echo json_encode($results);
    }

    public function loadAdminHome(){
        $company_id = $this->input->post('company_id');
        $staff_id = $this->input->post('staff_id');

        $unread_message_cnt = $this->message_model->getUnreadMessageCount('1', $company_id);

        $results['isLoad'] = true;
        $results['unread_messages'] = $unread_message_cnt;
        echo json_encode($results);
    }

    public function registerDeviceToken(){
        $user_id = $this->input->post('user_id');
        $user_type = $this->input->post('user_type');
        $device_token = $this->input->post('device_token');

        $data = $this->device_token_model->getRecordByCondition(['user_id' => $user_id, 'user_type' => $user_type]);
        if (empty($data)){
            $data = array(
                'user_id' => $user_id,
                'user_type' => $user_type,
                'device_token' => $device_token
            );
            $this->device_token_model->insertRecord($data);
        }else{
            $data['device_token'] = $device_token;

            $this->device_token_model->updateRecord($data, 'id');
        }

        $results['isSave'] = true;
        echo json_encode($results);
    }

    public function loadSaleSite(){
        $company_id = $this->input->post('company_id');
        $data = $this->site_model->getSiteInfo($company_id);

        $results['site_url'] = empty($data['site_url']) ? '' : $data['site_url'];
        echo json_encode($results);
    }

    public function loadConnectHomeMenuSetting(){
        $company_id = $this->input->post('company_id');
        if (empty($company_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $list = $this->connect_home_menu_model->getHomeMenuList($company_id);

        $results['isLoad'] = true;
        $results['menus'] = $list;

        echo json_encode($results);
    }
    public function saveConnectHomeMenuSetting(){
        $setting_id = $this->input->post('setting_id');
        $setting_value = $this->input->post('value');
        if (empty($setting_id)){
            $results['isSave'] = false;
            echo json_encode($results);
            return;
        }

        $data = $this->connect_home_menu_model->getFromId($setting_id);
        $data['is_use']=$setting_value;
        $this->connect_home_menu_model->updateRecord($data, 'id');

        $results['isSave'] = true;

        echo json_encode($results);
    }
}
?>