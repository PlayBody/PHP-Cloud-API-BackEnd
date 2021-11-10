<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Apistaffs extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('staff_model');
        $this->load->model('staff_setting_model');
        $this->load->model('organ_model');
        $this->load->model('staff_organ_model');
        $this->load->model('attendance_model');
        $this->load->model('staff_point_setting_model');
        $this->load->model('staff_point_add_model');
    }

    public function login()
    {
        $login_data = array();
        $login_data['login_id'] = $this->input->post('email');
        $login_data['password'] = $this->input->post('password');

        $staff = $this->staff_model->login($login_data);

        $results = [];
        $results['isLogin'] = false;
        $results['staff'] = array();

        if (!empty($staff)){
            $results['isLogin'] = true;
            $results['staff'] = $staff;
        }

        echo(json_encode($results));
    }

    public function renderAvatar(){

        $staff_id = $this->input->get('staff_id');
        if($staff_id == null)
        {
            $file = 'noImage.jpg';
        }else{
            $staff = $this->staff_model->getFromId($staff_id);
            if (empty($staff) || empty($staff['staff_image'])){
                $file = 'noImage.jpg';
            }else{
                $file = $staff['staff_image'];
            }
        }

        $file = './assets/images/avatar/'.$file;
        header("Content-Type: image/png");
        header("Content-Length: " . filesize($file));
        echo file_get_contents($file);
        exit;
   }

    public function loadStaffAttendance(){
        $staff_id = $this->input->post('staff_id');

        $results = [];
        if(empty($staff_id)) {
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $organs = $this->staff_organ_model->getOrgansByStaff($staff_id);

        $results['organs'] = $organs;

        $attendance = $this->attendance_model->getLastAttendance($staff_id);

        if (empty($attendance)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $results['isLoad'] = true;
        $results['attendance'] = $attendance;

        echo json_encode($results);
    }

    public function updateStaffAttendance()
    {
        $staff_id = $this->input->post('staff_id');
        $organ_id = $this->input->post('organ_id');
        $update_status = $this->input->post('status');

        $results = [];
        if (empty($staff_id) || empty($organ_id)){
            $results['isUpdate'] = false;
            echo json_encode($results);
            return;
        }

        $attendance = array(
            'staff_id' => $staff_id,
            'organ_id' => $organ_id,
            'attendance_status' => $update_status,
            'attendance_time' => date('Y-m-d H:i:s'),
            'visible' => 1,
            'create_date' => date('Y-m-d H:i:s'),
            'update_date' => date('Y-m-d H:i:s'),
        );

        $insert = $this->attendance_model->add($attendance);


        $results['isUpdate'] = true;

        echo(json_encode($results));

    }

    public function loadStaffList(){
        $staff_id = $this->input->post('staff_id');

        $results = [];
        if (empty($staff_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $staff = $this->staff_model->getFromId($staff_id);

        if (empty($staff)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $auth = empty($staff['staff_auth']) ? 1 : $staff['staff_auth'];

        if($auth==2){
            $cond['staff_id'] = $staff_id;
            $organs = $this->staff_organ_model->getOrgansByStaff($staff_id);
        }
        if($auth>2){
            $cond = [];
            if ($auth<4) $cond['company_id'] = $staff['company_id'];
            $organs = $this->organ_model->getListByCond($cond);
        }

        if (empty($organs)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $data = [];
        foreach ($organs as $item){
            $tmp = [];
            $tmp['organ_id'] = $item['organ_id'];
            $tmp['organ_name'] = $item['organ_name'];
            $staffs = $this->staff_organ_model->getStaffsByOrgan($item['organ_id'], $auth);
            $tmp['staffs'] = $staffs;
            $data[] = $tmp;
        }

        $results['isLoad'] = true;
        $results['data'] = $data;

        echo json_encode($results);
    }


    public function loadStaffCompanyList(){
        $company_id = $this->input->post('company_id');

        $results = [];
        if (empty($company_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $cond['company_id'] = $company_id;
        $staffs = $this->staff_model->getStaffList($cond);

        $results['isLoad'] = true;
        $results['data'] = $staffs;

        echo json_encode($results);
    }

    public function loadStaffInfo(){
        $staff_id = $this->input->post('staff_id');
        $staff = $this->staff_model->getFromId($staff_id);

        echo json_encode($staff);
    }

    public function loadStaffDetail(){
        $staff_id = $this->input->post('edit_staff_id');
        $login_id = $this->input->post('login_staff_id');

        if (empty($login_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $login_staff = $this->staff_model->getFromId($login_id);
        $staff = $this->staff_model->getFromId($staff_id);

        if (empty($login_staff)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $cond = [];
//        if ($login_staff['staff_auth']<4) $cond['company_id'] = $login_staff['company_id'];

        if (empty($staff['company_id'])){
            $cond['company_id'] = $login_staff['company_id'];
        }else{
            $cond['company_id'] = $staff['company_id'];
        }
        $organs = $this->organ_model->getListByCond($cond);

        $owner_organs = $organs;

        if ($login_staff['staff_auth']==2) $owner_organs = $this->staff_organ_model->getOrgansByStaff($login_id);

        $results = [];
        $results['organs'] = $organs;
        $results['owner_organs'] = $owner_organs;

        if (empty($staff_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }


        $staff_organs = $this->staff_organ_model->getOrgansByStaff($staff_id);

        $results['isLoad'] = true;
        $results['staff'] = $staff;
        $results['staff_organs'] = $staff_organs;

        echo json_encode($results);
    }


    public function saveStaffInfo()
    {
        $staff_organs = $this->input->post('staff_organs');
        $organs = json_decode($staff_organs);

        $company_id = '';
        $isOrganCheck = true;
        foreach ($organs as $organ_id){
            $cur_organ = $this->organ_model->getFromId($organ_id);
            if (empty($company_id)){
                $company_id = $cur_organ['company_id'];
            }elseif ($cur_organ['company_id']!=$company_id){
                $isOrganCheck = false;
            }
        }

        if (!$isOrganCheck){
            $results['isSave'] =false;
            $results['err_type'] = 'organ_input_err';
            echo json_encode($results);
            return;
        }

        if (!$this->staff_model->isMailCheck($this->input->post('staff_mail'), $this->input->post('staff_id'))){
            $results['isSave'] =false;
            $results['err_type'] = 'mail_input_err';
            echo json_encode($results);
            return;
        }


        $staff_id = $this->input->post('staff_id');
        $staff_auth = empty($this->input->post('staff_auth')) ? 1 : $this->input->post('staff_auth');
        $staff_first_name = $this->input->post('staff_first_name');
        $staff_first_name = $this->input->post('staff_first_name');
        $staff_last_name = $this->input->post('staff_last_name');
        $staff_nick = $this->input->post('staff_nick');
        $staff_tel = $this->input->post('staff_tel');
        $staff_mail = $this->input->post('staff_mail');
        $staff_password = $this->input->post('staff_password');
        $staff_sex = $this->input->post('staff_sex');
        $staff_birthday = $this->input->post('staff_birthday');
        $staff_organs = $this->input->post('staff_organs');
        $staff_salary_months = empty($this->input->post('staff_salary_months')) ? null : $this->input->post('staff_salary_months');
        $staff_salary_days =  empty($this->input->post('staff_salary_days')) ? null : $this->input->post('staff_salary_days');
        $staff_salary_minutes = empty($this->input->post('staff_salary_minutes')) ? null : $this->input->post('staff_salary_minutes');
        $staff_salary_times = empty($this->input->post('staff_salary_times')) ? null : $this->input->post('staff_salary_times');
        $staff_shift = empty($this->input->post('staff_shift')) ? null : $this->input->post('staff_shift');

        $image_stream = $this->input->post('image_stream');

        if (!empty($image_stream)) {
            $data = base64_decode($image_stream);
            $im = imagecreatefromstring($data);
            if ($im !== false) {
                $file_name = 'avatar-'.date('YmdHis').'.jpg';
                $output = './assets/images/avatar/'.$file_name;
                imagejpeg($im, $output);
                // file_put_contents($output, file_get_contents($im));
            }
        }

        if (empty($staff_id)){
            $staff = [];
            $staff['staff_auth'] = 1;
            $staff['company_id'] = $company_id;
            $staff['staff_auth'] = $staff_auth;
            $staff['staff_first_name'] = $staff_first_name;
            $staff['staff_last_name'] = $staff_last_name;
            $staff['staff_nick'] = empty($staff_nick) ? null : $staff_nick;
            $staff['staff_tel'] = $staff_tel;
            $staff['staff_password'] = sha1('12345');
            $staff['staff_mail'] = $staff_mail;
            $staff['staff_shift'] = $staff_shift;
            $staff['staff_sex'] = $staff_sex;
            $staff['staff_birthday'] = $staff_birthday;
            $staff['staff_salary_months'] = empty($staff_salary_months) ? null : $staff_salary_months;
            $staff['staff_salary_days'] = empty($staff_salary_days) ? null : $staff_salary_days;
            $staff['staff_salary_minutes'] = empty($staff_salary_minutes) ? null : $staff_salary_minutes;
            $staff['staff_salary_times'] = empty($staff_salary_times) ? null : $staff_salary_times;
            $staff['visible'] = 1;
            $staff['create_date'] = date('Y-m-d H:i:s');
            $staff['update_date'] = date('Y-m-d H:i:s');

            $staff_id = $this->staff_model->add($staff);

        }else{
            $staff = $this->staff_model->getFromId($staff_id);

            $staff['staff_auth'] = $staff_auth;
            $staff['staff_first_name'] = $staff_first_name;
            $staff['staff_last_name'] = $staff_last_name;
            $staff['staff_nick'] = empty($staff_nick) ? null : $staff_nick;
            $staff['staff_tel'] = $staff_tel;
            $staff['staff_mail'] = $staff_mail;
            $staff['staff_shift'] = $staff_shift;
            $staff['staff_sex'] = $staff_sex;
            $staff['staff_birthday'] = $staff_birthday;
            $staff['staff_salary_months'] = empty($staff_salary_months) ? null : $staff_salary_months;
            $staff['staff_salary_days'] = empty($staff_salary_days) ? null : $staff_salary_days;
            $staff['staff_salary_minutes'] = empty($staff_salary_minutes) ? null : $staff_salary_minutes;
            $staff['staff_salary_times'] = empty($staff_salary_times) ? null : $staff_salary_times;

            if (!empty($staff_password))
                $staff['staff_password'] = sha1($staff_password);

            if(!empty($file_name)){
                $staff['staff_image'] = $file_name;
            }

            $staff['update_date'] = date('Y-m-d H:i:s');

            $this->staff_model->edit($staff, 'staff_id');
        }


        $old_organs = $this->staff_organ_model->getStaffOrganList(['staff_id'=>$staff_id]);
        foreach ($old_organs as $item){
            $is_exist = false;
            foreach ($organs as $organ_id){
                if ($organ_id==$item['organ_id']){
                    $is_exist = true;
                    break;
                }
            }
            if (!$is_exist){
                $this->staff_organ_model->delete_force($item['id']);
            }

        }

        foreach ($organs as $organ_id){
            $auth = $this->staff_organ_model->getAuthRecord($staff_id, $organ_id);
            if (empty($auth)){
                $auth = array(
                    'staff_id'=>$staff_id,
                    'organ_id' =>$organ_id,
                    'auth' => 1
                );
                $this->staff_organ_model->add($auth);
            }
        }

        $results['isSave'] = true;
        $results['staff_id'] = $staff_id;

        echo(json_encode($results));
    }

    public function deleteStaffInfo(){
        $staff_id = $this->input->post('staff_id');
        $login_staff_id = $this->input->post('login_staff_id');

        $results = [];
        if (empty($staff_id)||empty($login_staff_id)){
            $results['isDelete'] = false;

            echo json_encode($results);
            return;
        }

        $login_staff = $this->staff_model->getFromId($login_staff_id);
        if (empty($login_staff['staff_auth'])){
            $results['isDelete'] = false;

            echo json_encode($results);
            return;
        }
        $auth = $login_staff['staff_auth'];

        if ($auth==2){
            $staff_organs = $this->staff_organ_model->getOrgansByStaff($staff_id);
            $owner_organs = $this->staff_organ_model->getOrgansByStaff($login_staff_id);

            $ischeck=true;
            foreach ($staff_organs as $item){
                if (!in_array($item['organ_id'], array_column($owner_organs, 'organ_id'))){
                    $ischeck = false;
                    break;
                }
            }

            if (!$ischeck){
                $results['isDelete'] = false;
                $results['msg'] = 'organ_contain_err';

                echo json_encode($results);
                return;
            }
        }

//        $this->staff_model->delete_force($staff_id, 'staff_id');
//        $this->staff_organ_model->delete_force($staff_id, 'staff_id');

        $results['isDelete'] = true;

        echo json_encode($results);

    }

    public function loadStaffSetting(){
        $staff_id = $this->input->post('staff_id');

        $results = [];
        if (empty($staff_id)){
            $results['isLoad'] = false;

            echo json_encode($results);
            return;
        }

        $setting = $this->staff_setting_model->getStaffSetting($staff_id);
        if (empty($setting)){
            $setting = array(
                'staff_id' => $staff_id,
                'push' => 1,
                'face' => 1
            );

            $this->staff_setting_model->add($setting);
        }

        $results['isLoad'] = true;
        $results['setting'] = $setting;

        echo json_encode($results);

    }

    public function saveStaffSetting(){
        $staff_id = $this->input->post('staff_id');
        $option = $this->input->post('option');
        $value = $this->input->post('value');

        $results = [];
        if (empty($staff_id)){
            $results['isSave'] = false;

            echo json_encode($results);
            return;
        }

        $setting = $this->staff_setting_model->getStaffSetting($staff_id);

        if (empty($setting)){
            $results['isSave'] = false;

            echo json_encode($results);
            return;
        }

        $setting[$option] = $value;
        $this->staff_setting_model->edit($setting, 'setting_id');

        $results['isSave'] = true;

        echo json_encode($results);
    }

    public function loadStaffPoint(){
        $staff_id = $this->input->post('staff_id');
        $setting_year = $this->input->post('setting_year');
        $setting_month = $this->input->post('setting_month');

        $results = [];
        if (empty($staff_id) || empty($setting_year) || empty($setting_month)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $cond = [];
        $cond['staff_id'] = $staff_id;
        $cond['setting_year'] = $setting_year;
        $cond['setting_month'] = $setting_month;

        $point_setting = $this->staff_point_setting_model->getSettingData($cond);

        if (empty($point_setting)){
            $last_setting = $this->staff_point_setting_model->getLastSetting($staff_id, $setting_year.'-'.$setting_month);
            if (!empty($last_setting)){
                $point_setting = array(
                    'staff_id' => $staff_id,
                    'setting_year' => $setting_year,
                    'setting_month' => $setting_month,
                    'menu_response' => $last_setting['menu_response'],
                    'test_rate' => $last_setting['test_rate'],
                    'quality_rate' => $last_setting['quality_rate'],
                );

                $point_setting['id'] = $this->staff_point_setting_model->insertRecord($point_setting);
            }
        }

        $add_points = [];
        if (!empty($point_setting)){
            $add_points = $this->staff_point_add_model->getPointList(['point_setting_id' => $point_setting['id']]);
        }

        $results['isLoad'] = true;
        $results['point_setting'] = $point_setting;
        $results['point_add_list'] = $add_points;

        echo json_encode($results);
    }


    public function saveStaffPoint(){
        $staff_id = $this->input->post('staff_id');
        $setting_year = $this->input->post('setting_year');
        $setting_month = $this->input->post('setting_month');
        $setting_id = $this->input->post('setting_id');

        $results = [];
        if (empty($staff_id) || empty($setting_year) || empty($setting_month)){
            $results['isSave'] = false;
            echo json_encode($results);
            return;
        }

//        $staff = $this->staff_model->getFromId($staff_id);
//
//        $staff['menu_response'] = empty($this->input->post('menu_response')) ? null : $this->input->post('menu_response');
//        $staff['test_rate'] = empty($this->input->post('test_rate')) ? null : $this->input->post('test_rate');
//        $staff['quality_rate'] = empty($this->input->post('quality_rate')) ? null : $this->input->post('quality_rate');

        if (empty($setting_id)){
            $setting = array(
                'staff_id' => $staff_id,
                'setting_year' => $setting_year,
                'setting_month' => $setting_month,
                'menu_response' => empty($this->input->post('menu_response')) ? null : $this->input->post('menu_response'),
                'test_rate' => empty($this->input->post('test_rate')) ? null : $this->input->post('test_rate'),
                'quality_rate' => empty($this->input->post('quality_rate')) ? null : $this->input->post('quality_rate')
            );

            $setting_id = $this->staff_point_setting_model->insertRecord($setting);
        }else{
            $setting = $this->staff_point_setting_model->getFromId($setting_id);
            $setting['menu_response'] = empty($this->input->post('menu_response')) ? null : $this->input->post('menu_response');
            $setting['test_rate'] = empty($this->input->post('test_rate')) ? null : $this->input->post('test_rate');
            $setting['quality_rate'] = empty($this->input->post('quality_rate')) ? null : $this->input->post('quality_rate');
            $this->staff_point_setting_model->updateRecord($setting, 'id');
        }

        $results['isSave'] = true;
        //$results['setting_id'] = true;

        echo json_encode($results);
    }


    public function savePointAdd(){
        $point_setting_id = $this->input->post('point_setting_id');
        $comment = $this->input->post('comment');
        $value = $this->input->post('value');

        $results = [];
        if (empty($point_setting_id)){
            $results['isSave'] = false;
            echo json_encode($results);
            return;
        }

        $point = array(
            'point_setting_id' => $point_setting_id,
            'comment' => $comment,
            'value' => $value,
        );

        $this->staff_point_add_model->insertRecord($point);

        $results['isSave'] = true;

        echo json_encode($results);
    }
    public function deletePointAdd(){
        $point_add_id = $this->input->post('point_add_id');

        $results = [];
        if (empty($point_add_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }

        $this->staff_point_add_model->delete_force($point_add_id, 'id');

        $results['isDelete'] = true;

        echo json_encode($results);
    }
}
?>