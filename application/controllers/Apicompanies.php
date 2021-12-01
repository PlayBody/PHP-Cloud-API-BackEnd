<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

class Apicompanies extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('company_model');
        $this->load->model('organ_model');
    }

    public function loadCompanyInfo(){
        $company_id = $this->input->post('company_id');

        if (empty($company_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $company = $this->company_model->getFromId($company_id);

        if (empty($company)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $results['isLoad'] = true;
        $results['company'] = $company;

        echo(json_encode($results));
    }

    public function loadCompanyList(){
        $companies = $this->company_model->getListByCond([]);

        $results['isLoad'] = true;
        $results['companies'] = $companies;
        echo(json_encode($results));

    }

    public function loadCompanyData(){
        $company_id = $this->input->post('company_id');

        if (empty($company_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $company = $this->company_model->getFromId($company_id);

        $organs = $this->organ_model->getListByCond(['company_id'=>$company_id]);

        $results['isLoad'] = true;
        $results['company'] = $company;
        $results['organs'] = $organs;
        echo(json_encode($results));

    }

    public function saveCompany(){
        $company_id = $this->input->post('company_id');
        $company_name = $this->input->post('company_name');
        $company_domain = $this->input->post('company_domain');


        if (empty($company_id)){
            $company['company_name'] = $company_name;
            $company['company_domain'] = $company_domain;
            $company['visible'] = 1;

            $company_id = $this->company_model->insertRecord($company);
        }else{
            $company = $this->company_model->getFromId($company_id);
            $company['company_name'] = $company_name;
            $company['company_domain'] = $company_domain;

            $this->company_model->edit($company, 'company_id');
        }

        $results['isSave'] = true;
        $results['company_id'] = $company_id;

        echo(json_encode($results));

    }

    public function saveOrgan(){
        $company_id = $this->input->post('company_id');
        $organ_id = $this->input->post('organ_id');
        $organ_name = $this->input->post('organ_name');

        if (empty($organ_id)){
            $organ['company_id'] = $company_id;
            $organ['organ_name'] = $organ_name;
            $organ['visible'] = 1;

            $organ_id = $this->organ_model->insertRecord($organ);
        }else{
            $organ = $this->organ_model->getFromId($organ_id);
            $organ['organ_name'] = $organ_name;

            $this->organ_model->updateRecord($organ, 'organ_id');
        }

        $results['isSave'] = true;

        echo(json_encode($results));

    }

    public function deleteCompany(){
        $company_id = $this->input->post('company_id');

        if (empty($company_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }

        $this->company_model->delete_force($company_id, 'company_id');
        $this->organ_model->delete_force($company_id, 'company_id');

        $results['isDelete'] = true;

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

        $this->organ_model->delete_force($organ_id, 'organ_id');

        $results['isDelete'] = true;

        echo(json_encode($results));

    }
}
?>