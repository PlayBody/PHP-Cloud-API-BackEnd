<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/core/AdminController.php';

class Receipt extends AdminController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct(ROLE_STAFF);
        if( $this->staff['staff_auth']<4){
            redirect('login');
        }

        $this->load->model('company_model');

        $this->header['page'] = 'epark';
        $this->header['sub_page'] = 'receipt';
        $this->header['title'] = '予約受付';

        $this->load->model('organ_model');
        $this->load->model('organ_shift_time_model');
        $this->load->model('shift_model');
        $this->load->model('reserve_model');
        $this->load->model('table_model');

    }

    /**
     * This function used to load the first screen of the user
     */
    public function index()
    {
        $company_id = 2;

        $organ_id = $this->input->post('organ_id');
        $select_date = $this->input->post('select_date');
        $mod = $this->input->post('mod');

        $organ_list = $this->organ_model->getListByCond(['company_id'=>$company_id]);

        if(empty($organ_id)) $organ_id = $organ_list[0]['organ_id'];
        if(empty($select_date)) $select_date = date('Y-m-d');
        if(empty($mod)) $mod = 'shift';

        //---------------get shift_time _min _max ----------------
        $timestamp = strtotime($select_date);
        $week_num = date('N', $timestamp);
        $organ_time_row = $this->organ_shift_time_model->getMinMaxTimeByCond([
            'organ_id' => $organ_id,
            'weekday' => $week_num
        ]);

        $organ_time_from = 24;
        $organ_time_from_minute = 0;
        $organ_time_to = 0;
        $organ_time_to_minute = 0;

        if (!empty($organ_time_row) && !empty($organ_time_row['from_time'])){
            $organ_time_from = intval(mb_split(':', $organ_time_row['from_time'])[0]);
            $organ_time_from_minute = intval(mb_split(':', $organ_time_row['from_time'])[1]);
            $organ_time_to = intval(mb_split(':', $organ_time_row['to_time'])[0]);
            $organ_time_to_minute = intval(mb_split(':', $organ_time_row['to_time'])[1]);
//            if (intval($organ_time_row['to_time'].str_split(':')[0])>0) $organ_time_to++;

        }

        $table_length = ($organ_time_to * 60 + $organ_time_to_minute)-($organ_time_from*60+$organ_time_from_minute);
        $table_start_time = $organ_time_from * 60 + $organ_time_from_minute;

        $total_length = ($organ_time_to - $organ_time_from + 1) * 60;
        //------------------------------------------------------------------

        $shifts = $this->shift_model->getDayShift($organ_id, $select_date);
        $staffs = [];
        foreach ($shifts as $shift){
            $datetime1 = date_create($shift['from_time']);
            $datetime2 = date_create($shift['to_time']);
            $diff = date_diff($datetime1, $datetime2);
            $shift_length_time = $diff->h * 60 + $diff->i;
            $shift_start_time = $datetime1->format('H') * 60 + $datetime1->format('i');

            if (!array_key_exists($shift['staff_id'], $staffs)) {
                $staffs[$shift['staff_id']] = ['name'=>$shift['staff_name'], 'sex'=>$shift['staff_sex']];
                $tmp_shift=[];
            }else{
                $tmp_shift=$staffs[$shift['staff_id']]['shifts'];
            }
            $shift['width'] = $shift_length_time;
            $shift['start'] = $shift_start_time;
            $tmp_shift[] = $shift;

            $staffs[$shift['staff_id']]['shifts'] = $tmp_shift;
        }

        $reserves = $this->reserve_model->getReserveList(array(
            'organ_id' => $organ_id,
            'select_date' => $select_date,
        ));
        if(!empty($reserves)){
            foreach ($reserves as $reserve){
                $datetime1 = date_create($reserve['reserve_time']);
                $datetime2 = date_create($reserve['reserve_exit_time']);
                $diff = date_diff($datetime1, $datetime2);
                $reserve_length_time = $diff->h * 60 + $diff->i;
                $reserve_start_time = $datetime1->format('H') * 60 + $datetime1->format('i');

                if(empty($reserve['staff_id'])){
                    $reserve['staff_id'] = 0;
                    $reserve['staff_name'] = 'フーリ';
                }
                if (!array_key_exists($reserve['staff_id'], $staffs)) {
                    $staffs[$reserve['staff_id']] = ['name'=>$reserve['staff_name'], 'sex'=>$reserve['staff_sex']];
                    $tmp_reserve=[];
                }else{
                    $tmp_reserve=empty($staffs[$reserve['staff_id']]['reserves']) ? [] : $staffs[$reserve['staff_id']]['reserves'];
                }

                $reserve['is_before'] = false;
                if($reserve['reserve_exit_time']<date('Y-m-d H:i:s')){
                    $reserve['is_before'] = true;
                }
                $reserve['from'] = $datetime1->format('H:i');
                $reserve['to'] = $datetime2->format('H:i');
                $reserve['width'] = $reserve_length_time;
                $reserve['interval'] = empty($reserve['sum_interval']) ? 0 : $reserve['sum_interval'];
                $reserve['start'] = $reserve_start_time;
                $tmp_reserve[] = $reserve;

                $staffs[$reserve['staff_id']]['reserves'] = $tmp_reserve;
            }
        }

        $table_data = $this->table_model->getTableList(['organ_id'=>$organ_id]);
        $tables = [];
        foreach($table_data as $table){
            $tmp = [];
            $tmp['table_id'] = $table['table_id'];
            $tmp['table_title'] = $table['table_title'];
            $tables[] = $tmp;
        }

        $this->data['mod'] = $mod;

        $this->data['organ_id'] = $organ_id;
        $this->data['select_date'] = $select_date;
        $this->data['organs'] = $organ_list;

        $this->data['available_time_from'] = $organ_time_from;
        $this->data['available_time_to'] = $organ_time_to;
        $this->data['one_minute_length'] = 1 / $total_length * 100;

        $this->data['staffs'] = $staffs;
        $this->data['tables'] = $tables;
        $this->data['table_length'] = $table_length;
        $this->data['table_start_time'] = $table_start_time;

        $this->load_view_with_menu("epark/receipt");
    }

}
