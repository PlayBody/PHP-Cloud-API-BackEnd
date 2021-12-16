<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/core/AdminController.php';

class Dashboard extends AdminController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct(ROLE_STAFF);

        //チャットボット
        $this->header['page'] = 'dashboard';
        $this->header['title'] = '管理画面【企業用】';
        $this->header['staff'] = $this->staff;

        $this->load->model('scenario_model');
        $this->load->model('bot_model');
        $this->load->model('user_model');
    }

    /**
     * This function used to load the first screen of the user
     */
    public function index()
    {
        //$this->data['all_scenario_count'] =$this->scenario_model->getScenarioList($this->user['company_id'],true);
        //$this->data['user_count'] =$this->user_model->getListCount();

       // $analysisData = $this->bot_model->getAnalysisData($this->user['company_id']);
//        var_dump($analysisData);die;
        //セッション数、
        $this->data['visit_count'] = empty($analysisData['visit'])?0:$analysisData['visit'];
        //シナリオ選択数
        $this->data['scenario_count'] =empty($analysisData['scenario'])?0:$analysisData['scenario'];
        //FAQ数
        $this->data['faq_count'] = empty($analysisData['faq'])?0:$analysisData['faq'];
        //チャット数
        $this->data['chat_count'] = empty($analysisData['chat'])?0:$analysisData['chat'];

        $this->_load_view("dashboard");
    }

    /**
     * Page not found : error 404
     */
    function pageNotFound()
    {
        $this->global['pageTitle'] = '404エラー';

        $this->loadViews("404", $this->global, NULL, NULL);
    }
}

?>