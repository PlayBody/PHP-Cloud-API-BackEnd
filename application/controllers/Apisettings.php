<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

class Apisettings extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('organ_model');
        $this->load->model('staff_organ_model');
        $this->load->model('staff_model');
    }

    public function loadOrganSetting(){
        $organ_id = $this->input->post('organ_id');
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
            $organ_list = $this->staff_organ_model->getOrgansByStaff($staff_id);
        }
        if ($auth>2){
            $cond = [];
            if ($auth==3) $cond['company_id'] = $staff['company_id'];
            $organ_list = $this->organ_model->getListByCond($cond);
        }


        if (empty($organ_list)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        if (empty($organ_id)){
            $organ_id = $organ_list[0]['organ_id'];
        }

        $organ = $this->organ_model->getfromId($organ_id);

//            $setting = $this->organ_setting_model->getOrganSetting($organ_id);

//    	if (empty($setting)) {
//            $results['isLoad'] = false;
//
//            echo(json_encode($results));
//            return;
//        }

        $results['isLoad'] = true;
        $results['organ'] = $organ;
        $results['organ_list'] = $organ_list;

        echo(json_encode($results));
    }

    public function saveOrganSetting(){

        $organ_id = $this->input->post('organ_id');

        $results = [];
        if (empty($organ_id)){
            $results['isUpdate'] = false;
            echo json_encode($results);
            return;
        }

        $organ = $this->organ_model->getFromId($organ_id);

        $organ['organ_id'] = $organ_id;
        $organ['table_count'] = empty($this->input->post('table_count')) ? null : $this->input->post('table_count');
        $organ['set_time'] = empty($this->input->post('set_time')) ? null : $this->input->post('set_time');
        $organ['set_number'] =  $this->input->post('set_number');
        $organ['set_amount'] = empty($this->input->post('set_amount')) ? null : $this->input->post('set_amount');
        $organ['table_amount'] = empty($this->input->post('table_amount')) ? null : $this->input->post('table_amount');
        $organ['active_start_time'] = empty($this->input->post('active_start_time')) ? null : $this->input->post('active_start_time');
        $organ['active_end_time'] = empty($this->input->post('active_end_time')) ? null : $this->input->post('active_end_time');
        $organ['zip_code'] = empty($this->input->post('zip_code')) ? null : $this->input->post('zip_code');
        $organ['address'] = empty($this->input->post('address')) ? null : $this->input->post('address');
        $organ['phone'] = empty($this->input->post('tel_phone')) ? null : $this->input->post('tel_phone');
        $organ['open_balance'] = empty($this->input->post('open_balance')) ? null : $this->input->post('open_balance');
        $organ['lat'] = empty($this->input->post('lat')) ? null : $this->input->post('lat');
        $organ['lon'] = empty($this->input->post('lon')) ? null : $this->input->post('lon');
        $organ['distance'] = empty($this->input->post('distance')) ? null : $this->input->post('distance');
        $organ['business_weight'] = empty($this->input->post('business_weight')) ? null : $this->input->post('business_weight');
        $organ['divide_point'] = empty($this->input->post('divide_point')) ? null : $this->input->post('divide_point');
        $organ['promotional_point'] = empty($this->input->post('promotional_point')) ? null : $this->input->post('promotional_point');
        $organ['optional_acquisition_point'] = empty($this->input->post('optional_acquisition_point')) ? null : $this->input->post('optional_acquisition_point');
        $organ['next_reservation_point'] = empty($this->input->post('next_reservation_point')) ? null : $this->input->post('next_reservation_point');
        $organ['extension_point'] = empty($this->input->post('extension_point')) ? null : $this->input->post('extension_point');
        $organ['open_business_point'] = empty($this->input->post('open_business_point')) ? null : $this->input->post('open_business_point');
        $organ['close_business_point'] = empty($this->input->post('close_business_point')) ? null : $this->input->post('close_business_point');
        $organ['checkin_ticket_consumption'] = $this->input->post('checkin_ticket_consumption');

        if (!empty($this->input->post('print_logo_file'))){
            $organ['print_logo_file'] = $this->input->post('print_logo_file');
        }

        if (empty($organ['organ_id'])){
            $this->organ_model->insertRecord($organ);
        }else{
            $this->organ_model->updateRecord($organ, 'organ_id');
        }

        $this->load->model('organ_set_table_model');
        $setData = $this->organ_set_table_model->getRecordTable($organ_id, $organ['set_number']);
        if (empty($setData)){
            $setData = array(
                'organ_id'=>$organ_id,
                'set_number' => $organ['set_number'],
                'set_time' => $organ['set_time'],
                'set_amount' => $organ['set_amount'],
                'table_amount' => $organ['table_amount']
            );

            $this->organ_set_table_model->insertRecord($setData);
        }else{
            $setData['set_time'] = $organ['set_time'];
            $setData['set_amount'] = $organ['set_amount'];
            $setData['table_amount'] = $organ['table_amount'];
            $this->organ_set_table_model->updateRecord($setData, 'organ_set_table_id');
        }

        $results['isUpdate'] = true;
        echo(json_encode($results));
    }

    public function updateOrganTitle()
    {
        $organ_id = $this->input->post('organ_id');
        $update_title = $this->input->post('update_title');

        $results = [];
        if (empty($organ_id)){
            $results['isUpdate'] = false;

            echo(json_encode($results));
            exit(0);
        }

        $organ = $this->organ_model->getFromId($organ_id);

        if (empty($organ)){
            $results['isUpdate'] = false;

            echo(json_encode($results));
            exit(0);
        }

        $organ['organ_name'] = $update_title;

        $result = $this->organ_model->updateRecord($organ,'organ_id');

        $results['isUpdate'] = true;
        $results['title'] = $update_title;

        echo(json_encode($results));

    }


    function uploadPrintPicture() {

        $results = array();

        // user photo
        $image_path = "assets/images/prints/";
        if(!is_dir($image_path)) {
            mkdir($image_path);
        }
        $image_url  = base_url().$image_path;
        $fileName = $_FILES['picture']['name'];
        $config = array(
            'upload_path'   => $image_path,
            'allowed_types' => '*',
            'overwrite'     => 1,
            'file_name' 	=> $fileName
        );
        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        $results['isUpload'] = false;
        if (!empty($_FILES['picture']['name'])) {
            if ($this->upload->do_upload('picture')) {
                $file_url = $image_url.$this->upload->file_name;
                $results['isUpload'] = true;
                $results['picture'] = $file_url;
            }
        }

        echo json_encode($results);

    }
}
?>