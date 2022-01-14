<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

class Apiorgans extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('staff_model');
        $this->load->model('organ_model');
        $this->load->model('staff_organ_model');
        $this->load->model('organ_setting_model');
        $this->load->model('organ_time_model');
        $this->load->model('organ_shift_time_model');
    }

    public function getOrgans(){
        $company_id = $this->input->post('company_id');
        $cond = [];
        if (empty($comnpany_id)) $cond['company_id'] = $company_id;
        $organs = $this->organ_model->getListByCond($cond);

        $results['organs'] = $organs;
        echo json_encode($results);
    }

    public function getOrganInfoByOrganNumber(){
        $company_id = $this->input->post('company_id');
        $organ_number = $this->input->post('organ_number');
        $cond = [];
        $cond['company_id'] = $company_id;
        $cond['organ_number'] = $organ_number;
        $organ = $this->organ_model->getRecordByCond($cond);

        $results['organ'] = $organ;
        echo json_encode($results);
    }

    public function loadOrganList(){
        $staff_id = $this->input->post('staff_id');
        $company_id = $this->input->post('company_id');
        if (empty($staff_id)){
            $cond['company_id'] = $company_id;
            $organs = $this->organ_model->getListByCond($cond);
        }else{
            $staff = $this->staff_model->getFromId($staff_id);

            $cond = [];
            $organs = [];
            if ($staff['staff_auth']<3){
                $organs = $this->staff_organ_model->getOrgansByStaff($staff_id);
            }else{
                if ($staff['staff_auth']==3){
                    $cond['company_id'] = $staff['company_id'];
                }
                $organs = $this->organ_model->getListByCond($cond);
            }
        }

        $results['isLoad'] = true;
        $results['organs'] = $organs;
        echo(json_encode($results));

    }

    public function loadOrganInfo(){
        $organ_id = $this->input->post('organ_id');
        $organ = $this->organ_model->getFromId($organ_id);

        //$bosses = $this->staff_organ_model->getBossessByOrgan($organ_id);

        $results['isLoad'] = true;
        $results['organ'] = $organ;
        //$results['staffs'] = $bosses;
        echo(json_encode($results));

    }
    public function deleteOrgan(){
        $organ_id = $this->input->post('organ_id');

        if (empty($organ_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }

        $this->organ_model->delete_force($organ_id, 'organ_id');
        $this->staff_organ_model->delete_force($organ_id, 'organ_id');

        $results['isDelete'] = true;
        echo(json_encode($results));

    }

    public function saveOrgan(){
        $company_id = $this->input->post('company_id');
        if (empty($company_id)){
            $results['isSave'] = false;
            echo(json_encode($results));
            return;
        }
        $organ_id = $this->input->post('organ_id');
        $organ_name = $this->input->post('organ_name');

        if (empty($organ_id)){
            $organ['organ_name'] = $organ_name;
            $organ['company_id'] = $company_id;
            $organ['zip_code'] = empty($this->input->post('zip_code')) ? null : $this->input->post('zip_code');
            $organ['address'] = empty($this->input->post('address')) ? null : $this->input->post('address');
            $organ['phone'] = empty($this->input->post('phone')) ? null : $this->input->post('phone');
            $organ['comment'] = empty($this->input->post('comment')) ? null : $this->input->post('comment');
            $organ['image'] = empty($this->input->post('image')) ? null : $this->input->post('image');
            $organ['visible'] = 1;

            $organ_id = $this->organ_model->insertRecord($organ);
        }else{
            $organ = $this->organ_model->getFromId($organ_id);
            $organ['organ_name'] = $organ_name;
            $organ['zip_code'] = empty($this->input->post('zip_code')) ? null : $this->input->post('zip_code');
            $organ['address'] = empty($this->input->post('address')) ? null : $this->input->post('address');
            $organ['phone'] = empty($this->input->post('phone')) ? null : $this->input->post('phone');
            $organ['comment'] = empty($this->input->post('comment')) ? null : $this->input->post('comment');
            $organ['image'] = empty($this->input->post('image')) ? null : $this->input->post('image');

            $this->organ_model->updateRecord($organ, 'organ_id');
        }

        $results['isSave'] = true;
        $results['organ_id'] = $organ_id;

        echo(json_encode($results));

    }


    function uploadPicture() {

        $results = array();

        // user photo
        $image_path = "assets/images/organs/";
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

    public function loadOrganListByStaff(){
        $staff_id = $this->input->post('staff_id');
        if (empty($staff_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $staff = $this->staff_model->getFromId($staff_id);

        if ($staff['staff_auth']>2){
            $cond = [];

            if ($staff['staff_auth']=='3'){
                $cond['company_id'] = $staff['company_id'];
            }
            $organs = $this->organ_model->getListByCond($cond);
        }else{
            $organs = $this->staff_organ_model->getOrgansByStaff($staff_id);
        }

        $results['isLoad'] = true;
        $results['organs'] = $organs;

        echo json_encode($results);
    }

    public function loadOrganTimes(){
        $organ_id = $this->input->post('organ_id');

        if (empty($organ_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $cond['organ_id'] = $organ_id;
        $data = $this->organ_time_model->getListByCond($cond);

        $results = [];
        $results['isLoad'] = true;
        $results['data'] = $data;

        echo json_encode($results);
    }

    public function saveOrganTime(){
        $time_id = $this->input->post('time_id');
        $organ_id = $this->input->post('organ_id');
        $week_day = $this->input->post('weekday');
        $from_time  = $this->input->post('from_time');
        $to_time  = $this->input->post('to_time');

        if (empty($time_id)){
            $data = array(
                'organ_id'=>$organ_id,
                'weekday' => $week_day,
                'from_time' => $from_time,
                'to_time'=>$to_time
            );

            $time_id = $this->organ_time_model->insertRecord($data);
        }else{
            $data  = $this->organ_time_model->getFromId($time_id);
            $data['from_time'] = $from_time;
            $data['to_time'] = $to_time;

            $this->organ_time_model->updateRecord($data);
        }

        $results = [];
        $results['isSave'] = true;
        echo json_encode($results);
    }

    public function deleteOrganTime(){
        $time_id = $this->input->post('time_id');

        if (empty($time_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }

        $this->organ_time_model->delete_force($time_id, 'id');

        $results = [];
        $results['isDelete'] = true;
        echo json_encode($results);
        return;
    }

    public function loadOrganShiftTimes(){
        $organ_id = $this->input->post('organ_id');

        if (empty($organ_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $cond['organ_id'] = $organ_id;
        $data = $this->organ_shift_time_model->getListByCond($cond);

        $results = [];
        $results['isLoad'] = true;
        $results['data'] = $data;

        echo json_encode($results);
    }


    public function saveOrganShiftTime(){
        $time_id = $this->input->post('time_id');
        $organ_id = $this->input->post('organ_id');
        $week_day = $this->input->post('weekday');
        $from_time  = $this->input->post('from_time');
        $to_time  = $this->input->post('to_time');

        if (empty($time_id)){
            $data = array(
                'organ_id'=>$organ_id,
                'weekday' => $week_day,
                'from_time' => $from_time,
                'to_time'=>$to_time
            );

            $time_id = $this->organ_shift_time_model->insertRecord($data);
        }else{
            $data  = $this->organ_shift_time_model->getFromId($time_id);
            $data['from_time'] = $from_time;
            $data['to_time'] = $to_time;

            $this->organ_shift_time_model->updateRecord($data);
        }

        $results = [];
        $results['isSave'] = true;
        echo json_encode($results);
    }

    public function deleteOrganShiftTime(){
        $time_id = $this->input->post('time_id');

        if (empty($time_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }

        $this->organ_shift_time_model->delete_force($time_id, 'id');

        $results = [];
        $results['isDelete'] = true;
        echo json_encode($results);
        return;
    }

    public function loadOrganSetTableData(){
        $organ_id = $this->input->post('organ_id');
        $set_number = $this->input->post('set_number');

        $this->load->model('organ_set_table_model');

        $set_data = $this->organ_set_table_model->getRecordTable($organ_id, $set_number);

        $results = [];
        $results['isLoad'] = true;
        $results['set_data'] = $set_data;
        echo json_encode($results);
        return;
    }

    public function loadOrganShiftTime(){
        $organ_id = $this->input->post('organ_id');
        $select_date = $this->input->post('select_date');
        $sdate = new DateTime($select_date);

        $cond['organ_id'] = $organ_id;
        $cond['weekday'] = $sdate->format('N');
        $data = $this->organ_shift_time_model->getListByCond($cond);

        $results = [];
        $results['isLoad'] = true;
        $results['data'] = $data;

        echo json_encode($results);
    }

}
?>