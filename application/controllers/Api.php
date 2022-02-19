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
        $results['test_flag'] = $data['test_flag'];

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
        $is_admin = $this->input->post('is_admin');
        if (empty($company_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $list = $this->connect_home_menu_model->getHomeMenuList($company_id, $is_admin);

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


    public function updateOrderHomeMenu(){
        $company_id = $this->input->post('company_id');
        $menu_id = $this->input->post('menu_id');
        $mode = $this->input->post('mode');
        if (empty($company_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $menu = $this->connect_home_menu_model->getFromId($menu_id);

        $sort = $menu['sort'];
        if ($mode=='up'){
            $prev_menu = $this->connect_home_menu_model->getHomePrevMenu($company_id, $sort);
            if (!empty($prev_menu)){
                $prev_sort = $prev_menu['sort'];
                $prev_menu['sort'] = $sort;
                $this->connect_home_menu_model->updateRecord($prev_menu, 'id');

                $menu['sort'] = $prev_sort;
                $this->connect_home_menu_model->updateRecord($menu, 'id');
            }
        }
        if ($mode=='down'){
            $next_menu = $this->connect_home_menu_model->getHomeNextMenu($company_id, $sort);
            if (!empty($next_menu)){
                $next_sort = $next_menu['sort'];
                $next_menu['sort'] = $sort;
                $this->connect_home_menu_model->updateRecord($next_menu, 'id');

                $menu['sort'] = $next_sort;
                $this->connect_home_menu_model->updateRecord($menu, 'id');
            }
        }

        $results['isUpdate'] = true;

        echo json_encode($results);
    }

    public function loadOrganPrintMaxOrder(){
        $organ_id = $this->input->post('organ_id');
        $print_date = $this->input->post('print_date');

        $this->load->model('organ_print_order_model');

        $record = $this->organ_print_order_model->getMaxOrder($organ_id, $print_date);

        $max=1;
        if (empty($record)){
            $this->organ_print_order_model->insertRecord(['organ_id'=>$organ_id,'print_date'=>$print_date, 'order_number'=>1]);
        }else{
            $max = $record['order_number']+1;
            $record['order_number'] = $max;
            $this->organ_print_order_model->updateRecord($record, 'id');
        }

        $results['isLoad'] = true;
        $results['max_order'] = $max;

        echo json_encode($results);
    }

    public function isFileCheck(){
        $path = $this->input->post('path');

        $results['isFile'] = is_file($path);

        echo json_encode($results);
    }

}
?>