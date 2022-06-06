<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Shift_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'shifts';
        $this->primary_key = 'shift_id';
    }

    public function getListByCond($cond){

        $this->db->from($this->table);

        if (!empty($cond['staff_id'])){
            $this->db->where('staff_id', $cond['staff_id']);
        }

        if (!empty($cond['organ_id'])){
            $this->db->where('organ_id', $cond['organ_id']);
        }
        if (!empty($cond['from_time'])){
            $this->db->where("from_time >='". $cond['from_time'] ."'");
        }
        if (!empty($cond['to_time'])){
            $this->db->where("to_time <='". $cond['to_time'] ."'");
        }
        if (!empty($cond['select_datetime'])){
            $this->db->where("from_time <='". $cond['select_datetime'] ."'");
            $this->db->where("to_time >'". $cond['select_datetime'] ."'");
        }

        $this->db->where('visible', '1');

        $query = $this->db->get();

        return $query->result_array();
    }

    public function getOtherOrgansShift($cond){
        $this->db->select('sum( HOUR(TIMEDIFF(to_time, from_time))*60+ MINUTE(TIMEDIFF(to_time, from_time))) as all_time');
        $this->db->from($this->table);

        if (!empty($cond['staff_id'])){
            $this->db->where('staff_id', $cond['staff_id']);
        }

        if (!empty($cond['cur_organ_id'])){
            $this->db->where('organ_id <> '.$cond['organ_id']);
        }

        $this->db->where("(from_time >='". $cond['from_time'] ."' and from_time <'". $cond['to_time'] ."') || (to_time >'". $cond['from_time'] ."' and to_time <'". $cond['from_time'] ."')");

        $this->db->where('visible', '1');

        $query = $this->db->get();

        $result = $query->row_array();

        return $result['all_time']==null ? 0 : $result['all_time'];
    }

    public function getRecordByCond($cond){

        $this->db->from($this->table);

        if (!empty($cond['staff_id'])){
            $this->db->where('staff_id', $cond['staff_id']);
        }

        if (!empty($cond['organ_id'])){
            $this->db->where('organ_id', $cond['organ_id']);
        }
        if (!empty($cond['from_time'])){
            $this->db->where("from_time >='". $cond['from_time'] ."'");
        }
        if (!empty($cond['to_time'])){
            $this->db->where("to_time <='". $cond['to_time'] ."'");
        }

        if (!empty($cond['shift_type'])){
            $this->db->where("shift_type", $cond['shift_type']);
        }

        if (!empty($cond['select_datetime'])){
            $this->db->where("from_time <='". $cond['select_datetime'] ."'");
            $this->db->where("to_time >'". $cond['select_datetime'] ."'");
        }

        $this->db->where('visible', '1');

        $query = $this->db->get();

        return $query->row_array();
    }
    public function isExist($organ_id, $staff_id, $shift_id, $from_time, $to_time){

        $this->db->from($this->table);

        if (!empty($staff_id)){
            $this->db->where('staff_id', $staff_id);
        }

        if (!empty($organ_id)){
            $this->db->where('organ_id', $organ_id);
        }

        $this->db->where("(('".$from_time."'<from_time and from_time <'". $to_time ."') or ('".$from_time."' < to_time and to_time <'". $to_time ."'))");

        if (!empty($shift_id)){
            $this->db->where("shift_id <>'". $shift_id ."'");
        }

        $query = $this->db->get();

        return !empty($query->result_array());
    }


    function getDivideShifts($from_time, $to_time, $organ_id){
        $sql = "select * 
from
(select from_time as time from setting_count_shifts 
where from_time>='$from_time' and to_time<='$to_time' and organ_id='$organ_id'
union
select to_time as time from setting_count_shifts 
where from_time>='$from_time' and to_time<='$to_time'and organ_id='$organ_id'
union
select from_time as time from shifts
where from_time>='$from_time' and to_time<='$to_time'and organ_id='$organ_id'
union
select to_time as time from shifts
where from_time>='$from_time' and to_time<='$to_time'and organ_id='$organ_id')
tmp
order by tmp.time
";
        $query = $this->db->query($sql);

        return $query->result_array();
    }

    public function getExistCount($cond){
        $this->db->from($this->table);
        if (!empty($cond['organ_id'])){
            $this->db->where('organ_id', $cond['organ_id']);
        }
        if (!empty($cond['from_time'])){
            $this->db->where("from_time <='". $cond['from_time']. "'");
        }
        if (!empty($cond['to_time'])){
            $this->db->where("to_time >='". $cond['to_time']. "'");
        }

        $query = $this->db->get();

        return count($query->result_array());
    }

    public function getStaffShiftList($organ_id, $select_time){
        $this->db->select($this->table.".*, IF(staff_nick is NULL, CONCAT(staff_first_name,' ', staff_last_name), staff_nick) as staff_name");
        $this->db->from($this->table);

        $this->db->join('staffs', 'staffs.staff_id = shifts.staff_id', 'left');
        $this->db->where('organ_id', $organ_id);
        $this->db->where("from_time<='".$select_time."' and to_time > '".$select_time."'");

        $query = $this->db->get();
        return $query->result_array();
    }


    public function getReleationShift($organ_id, $staff_id, $time, $type){
        $this->db->select('*');
        $this->db->from($this->table);

        $this->db->where('organ_id', $organ_id);
        $this->db->where('staff_id', $staff_id);
        if ($type=='prev'){
            $this->db->where('to_time', $time);
        }
        if ($type=='next'){
            $this->db->where('from_time', $time);
        }

        $this->db->where('shift_type', 1);

        $query = $this->db->get();
        return $query->row_array();
    }


    public function isStaffActiveReserve($organ_id, $staff_id, $time){
        $this->db->select('*');
        $this->db->from($this->table);

        $this->db->where('organ_id', $organ_id);
        $this->db->where('staff_id', $staff_id);
        $this->db->where("from_time<='".$time."' and to_time>'".$time."'");

        $this->db->where('shift_type', 2);

        $query = $this->db->get();
        return !empty($query->row_array());
    }

    public function getActiveStaffCount($organ_id, $time){
        $this->db->select('count(shift_id) as staff_count');
        $this->db->from($this->table);

        $this->db->where('organ_id', $organ_id);
        $this->db->where("from_time<='".$time."' and to_time>'".$time."'");

        $this->db->where('shift_type', 2);

        $query = $this->db->get();
        $result = $query->row_array();
        return empty($result['staff_count']) ? 0 : $result['staff_count'];
    }

    public function isStaffRejectReserve($organ_id, $staff_id, $time){
        $this->db->select('*');
        $this->db->from($this->table);

        $this->db->where('organ_id', $organ_id);
        $this->db->where('staff_id', $staff_id);
        $this->db->where("from_time<='".$time."' and to_time>'".$time."'");

        $this->db->where('shift_type', '-3');

        $query = $this->db->get();
        return !empty($query->row_array());
    }

    public function getDayShift($organ_id, $select_date){
        $this->db->select($this->table.".*, 
            IF(staffs.staff_nick is NULL, 
                CONCAT(staffs.staff_first_name,' ', staffs.staff_last_name), 
                staffs.staff_nick
            ) as staff_name, staffs.staff_sex");
        $this->db->from($this->table);
        $this->db->join('staffs', 'shifts.staff_id=staffs.staff_id', 'left');

        $this->db->where('organ_id', $organ_id);
        $this->db->where("from_time like '" . $select_date . "%'");
        $this->db->where("to_time like '" . $select_date . "%'");

//        $this->db->where('shift_type', '-3');

        $query = $this->db->get();
        return $query->result_array();
    }

    public function getShiftTimeListByAuth($date, $company_id, $auth, $paList){
        $this->db->select('shifts.staff_id, shifts.from_time, shifts.to_time, TIMESTAMPDIFF(MINUTE,shifts.from_time,shifts.to_time) as shift_time');
        $this->db->from($this->table);
        $this->db->join('organs', 'organs.organ_id = shifts.organ_id', 'left');
        $this->db->join('staffs', 'staffs.staff_id = shifts.staff_id', 'left');

        $this->db->where("shifts.from_time like '".$date."%'");
        $this->db->where("organs.company_id", $company_id);
        $this->db->where("shifts.shift_type", 2);
        $this->db->where("staffs.staff_auth", $auth);

        if (!empty($paList)){
            $this->db->where("staffs.staff_id in (".$paList.")");
        }

        $query = $this->db->get();

        return $query->result_array();
    }

    public function deleteDayShift($date, $staff_id, $organ_id, $type=''){
        $this->db->where("from_time like '".$date." %'");
        $this->db->where("staff_id", $staff_id);
        $this->db->where("organ_id", $organ_id);
        if (!empty($type))
            $this->db->where("shift_type", $type);

        $this->db->delete($this->table);

    }

	public function getShiftDataByParam($cond){
        $this->db->select('*');
        $this->db->from($this->table);

        if(!empty($cond['organ_id'])){
            $this->db->where('organ_id', $cond['organ_id']);
        }
        if(!empty($cond['staff_id'])){
            $this->db->where('staff_id', $cond['staff_id']);
        }
        if(!empty($cond['from_time']) && !empty($cond['to_time'])){
            $this->db->where("to_time > '" . $cond['from_time'] . "'");
        }

        if(!empty($cond['to_time'])){
            $this->db->where("from_time < '". $cond['to_time']."'");
        }

        if(!empty($cond['shift_type'])){
            $this->db->where("shift_type", $cond['shift_type']);
        }


        $query = $this->db->get();
        return $query->result_array();
    }
}
