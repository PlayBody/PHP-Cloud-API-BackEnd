<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class History_table_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'history_tables';
        $this->primary_key = 'order_table_history_id';
    }

    public function getOrderAmount($organ_id, $from_date, $to_date){

        $sql = "SELECT count(history_tables.order_table_history_id) as customer_count, sum(amount) as amount
            FROM history_tables 
            WHERE history_tables.organ_id = '" . $organ_id . "'
            and history_tables.start_time>='" . $from_date . " 00:00:00' and history_tables.start_time<='" . $to_date . " 23:59:59'
            and history_tables.end_time>='" . $from_date . " 00:00:00' and history_tables.end_time<='" . $to_date . " 23:59:59'
        ";

        $query = $this->db->query($sql);

        return $query->row_array();

    }

    public function getSaleDetail($select_date, $organ_id){
        $sql = "select order_table_history_id, amount, start_time, table_position, count(history_table_menu_id) as menu_count, person_count
                    from history_tables
                    LEFT JOIN history_table_menus on history_tables.order_table_history_id = history_table_menus.history_table_id
                    where start_time like '".$select_date."%'
                    and organ_id = ".$organ_id."
                    
                    GROUP BY order_table_history_id
                    ORDER BY history_tables.start_time";

        $query = $this->db->query($sql);

        return $query->result_array();

    }

    public function getTodayHistoryAmount($select_date, $organ_id){
        $this->db->select('sum(amount) as amount');
        $this->db->from($this->table);
        $this->db->where('organ_id', $organ_id);

        $this->db->where('pay_method', 1);

        $this->db->where('date(end_time)', $select_date);

        $query = $this->db->get();
        $result = $query->row_array();

        if (empty($result['amount'])) return 0;

        return $result['amount'];

    }
}