<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

class Apimenus extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('staff_model');
        $this->load->model('staff_organ_model');
        $this->load->model('menu_model');
        $this->load->model('menu_variation_model');
        $this->load->model('table_menu_model');
        $this->load->model('organ_model');
    }

    public function loadOrderMenus(){

    	$organ_id = $this->input->post('organ_id');
        $table_id = $this->input->post('table_id');

    	$results = [];
    	if (empty($organ_id) || empty($table_id)){
    		$results['isLoad'] = false;
    		echo json_encode($results);
    		return;
    	}

    	$settting = $this->organ_model->getFromId($organ_id);

//    	$menu_count = empty($settting['menu_count']) ? 4 : $settting['menu_count'];

    	$menus = $this->menu_model->getMenuList(['organ_id'=>$organ_id]);

        $table_menus = $this->table_menu_model->getMenuListByCond(['table_id'=>$table_id]);

        $results['isLoad'] = true;
        $results['table_menus'] = $table_menus;
        $results['menus'] = $menus;

        echo(json_encode($results));
    }

    public function loadMenuVariations(){

        $menu_id = $this->input->post('menu_id');

        if (empty($menu_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $variations = $this->menu_variation_model->getVariationList(['menu_id'=>$menu_id]);

        $results['isLoad'] = true;
        $results['variations'] = $variations;

        echo(json_encode($results));
    }

    public function registerReserveMenus(){

        $table_id = $this->input->post('table_id');
        $data = $this->input->post('data');

        $results = [];
        if (empty($table_id)){
            $results['isSave'] = false;
            echo(json_encode($results));
            return;
        }

        $this->table_menu_model->delete_force($table_id, 'table_id');

        $data = json_decode($data);

        foreach ($data as $record) {
            $insertData = [];
            $insertData = array(
                'menu_title' => $record->title,
                'menu_price' => $record->price,
                'quantity' => $record->quantity,
                'table_id' => $table_id,
                'visible' => 1,
                'create_date' => date('Y-m-d'),
                'update_date' => date('Y-m-d'),
            );
            if (!empty($record->menu_id)){
                $insertData['menu_id'] = $record->menu_id;
            }
            if (!empty($record->variation_id)){
                $insertData['variation_id'] = $record->variation_id;
            }

            $insert = $this->table_menu_model->add($insertData);

        }
        echo(json_encode(array('isSave'=>true)));
        exit(0);
    }


    public function loadMenuList(){

        $staff_id = $this->input->post('staff_id');

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

        $organ_id = $this->input->post('organ_id');

        if (empty($organ_id)) $organ_id = $organ_list[0]['organ_id'];

        $menus = $this->menu_model->getMenuList(['organ_id'=> $organ_id]);

        $data = [];
        foreach ($menus as $menu){
            $tmp = $menu;
            $variations = $this->menu_variation_model->getVariationList(['menu_id'=>$menu['menu_id']]);
            if (!empty($variations)){
                $titles= '';
                foreach ($variations as $variation) {
                    if ($titles != '') $titles .= ",";
                    $titles .= $variation['variation_title'];
                }
                $tmp['variation_titles'] = $titles;
            }

            $data[] = $tmp;
        }

        $results['organ_list'] = $organ_list;
        $results['isLoad'] = true;
        $results['menus'] = $data;
        $results['organ_id'] = $organ_id;

        echo(json_encode($results));
    }

    public function loadMenuDetail(){

        $menu_id = $this->input->post('menu_id');
        $organ_id = $this->input->post('organ_id');

        $results = [];
        if (empty($menu_id) || empty($organ_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $menu = $this->menu_model->getFromId($menu_id);

        $staffs = $this->staff_organ_model->getStaffsByOrgan($organ_id, 2);

        $variations = $this->menu_variation_model->getVariationList(['menu_id'=>$menu_id]);

        $results['isLoad'] = true;
        $results['menu'] = $menu;
        $results['staffs'] = $staffs;
        $results['variations'] = $variations;

        echo(json_encode($results));
    }

    public function saveMenu(){

        $menu_id = $this->input->post('menu_id');
        $organ_id = $this->input->post('organ_id');

        $menu_title = $this->input->post('title');
        $menu_price = $this->input->post('price');
        $menu_cost = $this->input->post('cost');
        $menu_tax = $this->input->post('tax');

        if (empty($organ_id)){
            $results['isSave'] = false;
            echo json_encode($results);
            return;
        }

        if (empty($menu_id)){
            $menu = array(
                'organ_id' => $organ_id,
                'menu_title' => $menu_title,
                'menu_price' => $menu_price,
                'menu_cost' => $menu_cost,
                'menu_tax' => $menu_tax,
                'sort_no' => $this->menu_model->getMaxOrder($organ_id),
                'visible'=>'1',
            );

            $menu_id = $this->menu_model->InsertRecord($menu);

        }else{
            $variation = $this->menu_model->getFromId($menu_id);
            $variation['menu_title'] = $menu_title;
            $variation['menu_price'] = $menu_price;
            $variation['menu_cost'] = $menu_cost;
            $variation['menu_tax'] = $menu_tax;

            $this->menu_model->updateRecord($variation, 'menu_id');

        }

        $results['isSave'] = true;

        $results['select_menu_id'] = $menu_id;
        echo(json_encode($results));
    }

    public function deleteMenu(){

        $menu_id = $this->input->post('menu_id');

        $results = [];
        if (empty($menu_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }
        $this->menu_model->delete_force($menu_id, 'menu_id');
        $this->menu_variation_model->delete_force($menu_id, 'menu_id');
        $results['isDelete'] = true;

        echo(json_encode($results));
    }

    public function loadMenuVariationRecord(){

        $variation_id = $this->input->post('variation_id');

        $results = [];
        if (empty($variation_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $variation = $this->menu_variation_model->getFromId($variation_id);

        $results['isLoad'] = true;
        $results['variation'] = $variation;

        echo(json_encode($results));
    }

    public function saveMenuVariation(){

        $variation_id = $this->input->post('variation_id');
        $menu_id = $this->input->post('menu_id');
        $variation_title = $this->input->post('title');
        $variation_price = $this->input->post('price');
        $variation_back_staff_type = $this->input->post('staff_type');
        $variation_back_staff = $this->input->post('staff');
        $variation_back_amount = $this->input->post('amount');

        $results = [];
        if (empty($menu_id)){
            $results['isSave'] = false;
            echo json_encode($results);
            return;
        }

        if (empty($variation_id)){
            $variation = array(
                'menu_id' => $menu_id,
                'variation_title' => $variation_title,
                'variation_price' => $variation_price,
                'variation_back_staff_type' => empty($variation_back_staff) ? null : 'staff',
                'variation_back_staff' => empty($variation_back_staff) ? null : $variation_back_staff,
                'variation_back_amount' => empty($variation_back_amount) ? null : $variation_back_amount,
                'visible'=>'1',
                'create_date'=>date('Y-m-d H:i:s'),
                'update_date'=>date('Y-m-d H:i:s'),
            );

            $this->menu_variation_model->add($variation);
        }else{
            $variation = $this->menu_variation_model->getFromId($variation_id);
            $variation['variation_title'] = $variation_title;
            $variation['variation_price'] = $variation_price;
            $variation['variation_back_staff_type'] = empty($variation_back_staff) ? null : 'staff';
            $variation['variation_back_staff'] = empty($variation_back_staff) ? null : $variation_back_staff;
            $variation['variation_back_amount'] = empty($variation_back_amount) ? null : $variation_back_amount;
            $variation['update_date'] = date('Y-m-d H:i:s');

            $this->menu_variation_model->edit($variation, 'variation_id');

        }
        $results['isSave'] = true;

        echo(json_encode($results));
    }

    public function deleteMenuVariation(){

        $variation_id = $this->input->post('variation_id');

        $results = [];
        if (empty($variation_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }
        $this->menu_variation_model->delete_force($variation_id, 'variation_id');
        $results['isDelete'] = true;

        echo(json_encode($results));
    }

    public function loadViewMenuList(){

        $organ_id = $this->input->post('organ_id');

        $menu_list = $this->menu_model->getListByCond(['organ_id'=>$organ_id]);

        $results['isLoad'] = true;
        $results['menus'] = $menu_list;

        echo(json_encode($results));
    }


    public function saveAdminMenu(){

        $menu_id = $this->input->post('menu_id');
        $organ_id = $this->input->post('organ_id');

        $menu_title = $this->input->post('title');
        $menu_detail = $this->input->post('detail');
        $menu_price = $this->input->post('price');
        $menu_week = $this->input->post('week');
        $menu_start_time = $this->input->post('start_time');
        $menu_end_time = $this->input->post('end_time');
        $menu_comment = empty($this->input->post('comment')) ? null : $this->input->post('comment');
        $menu_image = empty($this->input->post('image')) ? null : $this->input->post('image');

        if (empty($organ_id)){
            $results['isSave'] = false;
            echo json_encode($results);
            return;
        }

        if (empty($menu_id)){
            $menu = array(
                'organ_id' => $organ_id,
                'menu_title' => $menu_title,
                'menu_detail' => $menu_detail,
                'menu_price' => $menu_price,
                'menu_week' => $menu_week,
                'menu_start_time' => $menu_start_time,
                'menu_end_time' => $menu_end_time,
                'menu_comment' => $menu_comment,
                'menu_image' => $menu_image,
                'menu_type' => 2,
                'sort_no' => $this->menu_model->getMaxOrder($organ_id),
                'visible'=>'1',
            );

            $menu_id = $this->menu_model->InsertRecord($menu);

        }else{
            $menu = $this->menu_model->getFromId($menu_id);
            $menu['menu_title'] = $menu_title;
            $menu['menu_detail'] = $menu_detail;
            $menu['menu_price'] = $menu_price;
            $menu['menu_week'] = $menu_week;
            $menu['menu_start_time'] = $menu_start_time;
            $menu['menu_end_time'] = $menu_end_time;
            $menu['menu_comment'] = $menu_comment;
            if (!empty($menu_image)){
                $menu['menu_image'] = $menu_image;
            }

            $this->menu_model->updateRecord($menu, 'menu_id');

        }

        $results['isSave'] = true;

        $results['menu_id'] = $menu_id;
        echo(json_encode($results));
    }

    function uploadPicture() {

        $results = array();

        // user photo
        $image_path = "assets/images/menus/";
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

    public function loadAdminMenuList(){
        $company_id = $this->input->post('company_id');

        $menus = $this->menu_model->getAdminMenuList([]);

        $results['isLoad'] = true;
        $results['menus'] = $menus;

        echo json_encode($results);
    }

    public function deleteAdminMenu(){
        $menu_id = $this->input->post('menu_id');

        if (empty($menu_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }
        $this->menu_model->delete_force($menu_id, 'menu_id');
        $results['isDelete'] = true;
        echo json_encode($results);
    }

    public function loadAdminMenuInfo(){
        $menu_id = $this->input->post('menu_id');
        $menu = $this->menu_model->getFromId($menu_id);

        $results['isLoad'] = true;
        $results['menu'] = $menu;

        echo json_encode($results);
    }

}
?>