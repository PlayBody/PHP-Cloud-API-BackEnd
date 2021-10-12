<?php
defined('BASEPATH') or exit('No direct script access allowed');
require_once APPPATH . 'core/AdminController.php';

class Chat extends AdminController
{

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *        http://example.com/index.php/welcome
     *    - or -
     *        http://example.com/index.php/welcome/index
     *    - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see https://codeigniter.com/user_guide/general/urls.html
     */
    public function index($uuid='')
    {
        if(empty($uuid)) {
            redirect('Error_404');
            exit;
        }
        $company = $this->company_model->getFromUUID($uuid);
        $id = 0;
        $list = $this->_scenario($id,$company['company_id']);

        $data['uuid'] = $company['uuid'];
        $data['bot_name'] = 'チャットボット';
        $data['root'] = json_encode(array(
            'id' => rand(1, 1000),
            'type' => 'button',
            'shouldBlockInput' => false,
            'buttons' => $list['child'],
            'messages' => array(
                $list['parent'],
            ),
        ));

        $this->load->view('chat/index', $data);
    }

    public function js($uuid)
    {
//        header("Cache-Control: max-age=604800, public");
        $company = $this->company_model->getFromUUID($uuid);
        if(empty($company)) {
            redirect('Error_404');
            exit;
        }
        $company['company_wix_widget'] = str_ireplace('<script type="text/javascript">','',$company['company_wix_widget']);
        $company['company_wix_widget'] = str_ireplace('</script>','',$company['company_wix_widget']);

        $data = array(
            'company'=>$company,
            'uuid'=>$uuid,
            'api_url'=> base_url().'api/',//https://prozbot.com/admin_scenario/
            'faq_url'=>'',
            'mail_url'=>'',
            'bot_name'=>'チャットサポート',
        );

        $id = 0;
        $list = $this->_scenario($id,$company['company_id']);

        $data['root'] = json_encode(array(
            'id' => rand(1, 1000),
            'type' => 'button',
            'shouldBlockInput' => false,
            'buttons' => $list['child'],
            'messages' => array(
                $list['parent'],
            ),
        ));

        header("Content-Type: application/javascript");
        $this->load->library('parser');
        $js = $this->parser->parse('chat/js', $data);
        echo $this->js_pack($js);
        //$this->load->view('chat/js', $data);
    }

    function js_pack($data="") {
        require_once APPPATH . 'third_party/class.JavaScriptPacker.php';
        $ret = "";
        if($data){
            $packer = new JavaScriptPacker($data);
            $ret    = $packer->pack();
        }
        return $ret;
    }

    public function test()
    {
        $id = 0;
        $list = $this->_scenario($id);

        $data['root'] = json_encode(array(
            'id' => rand(1, 1000),
            'type' => 'button',
            'shouldBlockInput' => false,
            'buttons' => $list['child'],
            'messages' => array(
                $list['parent'],
            ),
        ));

        $this->load->view('chat/test', $data);

    }

    /**
     * This function is used to load the add new form
     */
    function _scenario($scenario_id ,$company_id )
    {
        $this->load->model('scenario_model');
        if ($scenario_id == 0) {
            $parent = array(
                'content' => 'お問合せの内容を以下からお選びいただくか、ご質問を直接入力してください。',
                'typingDelay' => 1000
            );
        } else {
            $parent = $this->scenario_model->getDetail($scenario_id,$company_id);

            //シナリオ選択数
            $this->scenario_model->counter($scenario_id);

            $parent['content'] = $this->_search_url($parent['content']);
        }
        $child = $this->scenario_model->getChild(array("parent_id" => $scenario_id,'company_id'=>$company_id));
        $data = array(
            'parent' => $parent,
            'child' => $child,
        );
        return $data;
    }

}
