<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Apisums extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {

        parent::__construct();

        $this->load->model('history_table_model');
        $this->load->model('history_table_menu_model');
        $this->load->model('user_model');
    }

    public function loadSumSales()
    {
        $organ_id = $this->input->post('organ_id');
        $select_year = $this->input->post('select_year');
        $select_month = $this->input->post('select_month');
        $from_day = $this->input->post('from_day');
        $to_day = $this->input->post('to_day');

        $results = [];
        if (empty($organ_id) || empty($select_year) || empty($select_month) || empty($from_day) || empty($to_day)){
            $results['isLoaded'] = false;
            echo json_encode($results);
            return;
        }

        if ($select_month<10) $select_month = "0".$select_month;
        $graphs = [];
        for ($i=$from_day; $i<=$to_day;$i++){
            $tmp = [];

            $i_day = $i;
            if ($i_day<10) $i_day = "0".$i_day;

            $sel_date = $select_year . "-" . $select_month . "-" . $i_day;
            $amount = $this->history_table_model->getOrderAmount($organ_id, $sel_date, $sel_date);

            $graphs[$i]['all'] = 0;
            $graphs[$i]['cnt'] = 0;
            $graphs[$i]['average'] = 0;
            if (!empty($amount['amount'])){
                 $graphs[$i]['all'] = (int)$amount['amount'];
                 $graphs[$i]['cnt'] = (int)$amount['customer_count'];
                 if (!empty($amount['customer_count']))
                    $graphs[$i]['average'] = (int)($amount['amount'] / $amount['customer_count']);
            }

        }


        $results['isLoaded'] = true;
        $results['graphs'] = $graphs;

        echo json_encode($results);
        return;
    }

    public function loadSumSaleDetail()
    {
        $select_date = $this->input->post('select_date');
        $organ_id = $this->input->post('organ_id');

        $results = [];
        if (empty($organ_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $sales = $this->history_table_model->getSaleDetail($select_date, $organ_id);

        $sum_amount = $this->history_table_model->getTodayHistoryAmount($select_date, $organ_id);

        $results['isLoad'] = true;
        $results['sales'] = $sales;
        $results['sum_amount'] = $sum_amount;

        echo json_encode($results);
    }


    public function loadSumSaleItem()
    {
        $order_table_history_id = $this->input->post('history_id');

        $results = [];
        if (empty($order_table_history_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $table = $this->history_table_model->getFromId($order_table_history_id);

        $results['isLoad'] = true;

        if (!empty($table['user_id'])){
            $user = $this->user_model->getFromId($table['user_id']);
            $results['user'] = $user;
        }

        $menus = $this->history_table_menu_model->getListCond(['history_table_id'=>$order_table_history_id]);

        $results['table'] = $table;
        $results['menus'] = empty($menus) ? [] : $menus;

        echo json_encode($results);
    }
}
?>