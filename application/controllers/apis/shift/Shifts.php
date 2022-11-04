<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 * Shift Controller
 */

class Shifts extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->model('shift_model');
        $this->load->model('setting_count_shift_model');
        $this->load->model('shifts/shift_rest_model');
    }

    public function saveStaffInput(){
        $shift_id = $this->input->post('shift_id');
        $organ_id = $this->input->post('organ_id');
        $staff_id = $this->input->post('staff_id');
        $from_time = $this->input->post('from_time');
        $to_time = $this->input->post('to_time');
        $shift_type = $this->input->post('shift_type');


        if ($shift_type==SHIFT_STATUS_ME_REJECT){
            $shift = $this->shift_model->getFromId($shift_id);
            if (empty($shift)){
                $results['isSave'] = false;
                echo json_encode($results);
            }

            if (empty($shift['old_shift'])){
                $this->shift_model->delete_force($shift_id, 'shift_id');
            }else{
                $shift['shift_type'] = $shift['old_shift'];
                $shift['old_shift'] = null;
                $this->shift_model->updateRecord($shift, 'shift_id');

                $this->mergeShift($shift_id, $staff_id, $organ_id, $from_time, $to_time, $shift['shift_type']);
            }
            $results['isSave'] = true;
            echo json_encode($results);
            return;
        }
//        if ($shift_type==SHIFT_STATUS_ME_REPLY){
//            $shift = $this->shift_model->getFromId($shift_id);
//
//            $shift['shift_type'] = $shift_type;
//            $this->shift_model->updateRecord($shift, 'shift_id');
//
//            $results['isSave'] = true;
//            echo json_encode($results);
//            return;
//        }

        if($shift_type==SHIFT_STATUS_REST){
            $shifts = $this->shift_model->getListByCond([
                'staff_id'=>$staff_id,
                'organ_id' => $organ_id,
                'select_date' => substr($from_time, 0,10),
            ]);

            if(!empty($shifts)){
                $results['isSave'] = false;
                $results['message'] = 'シフトが存在します。 休憩を設定するには、シフトを削除してください。';
                echo json_encode($results);
                return;
            }

            $shift = array(
                'staff_id' => $staff_id,
                'organ_id' => $organ_id,
                'from_time' => substr($from_time, 0,10). ' 00:00:00',
                'to_time' => substr($from_time, 0,10). ' 23:59:59',
                'shift_type' => $shift_type,
                'visible' => 1,
            );
            $this->shift_model->insertRecord($shift);
            $results['isSave'] = true;
            echo json_encode($results);
            return;

        }else{
            $this->shift_model->deleteDayShift(substr($from_time, 0,10), $staff_id, $organ_id, SHIFT_STATUS_REST);
        }

        $exist_other_shifts = $this->shift_model->getListByCond([
            'staff_id'=>$staff_id,
            'organ_id' => $organ_id,
            'in_from_time' => $from_time,
            'in_to_time' => $to_time,
            'no_shift' => $shift_id,
        ]);

        if (!empty($exist_other_shifts)){
            $results['isSave'] = false;
            $results['message'] = '入力したシフトが重複しました。時間を確認してください。';
            echo json_encode($results);
            return;
        }

        $isReadyCount = $this->isInCount($organ_id, $from_time, $to_time);
        if(!$isReadyCount){
            $results['isSave'] = false;
            $results['message'] = '勤務計画が準備されていません。';
            echo json_encode($results);
            return;
        }

        if (empty($shift_id)){
            $shift = array(
                'organ_id' => $organ_id,
                'staff_id' => $staff_id,
                'from_time' => $from_time,
                'to_time' => $to_time,
                'shift_type' => $shift_type,
                'visible' => 1,
            );

            $prev_shift = $this->shift_model->getOneByParam([
                'staff_id' => $staff_id,
                'organ_id' => $organ_id,
                'to_time' => $from_time,
                'shift_type' => $shift_type
            ]);

            $next_shift = $this->shift_model->getOneByParam([
                'staff_id' => $staff_id,
                'organ_id' => $organ_id,
                'from_time' => $to_time,
                'shift_type' => $shift_type
            ]);

            if (!empty($prev_shift)){
                $prev_shift['to_time'] = $to_time;
                $this->shift_model->updateRecord($prev_shift, 'shift_id');
                $shift_id = $prev_shift['shift_id'];
                $from_time = $prev_shift['from_time'];
            }elseif (!empty($next_shift)){
                $next_shift['from_time'] = $from_time;
                $this->shift_model->updateRecord($next_shift, 'shift_id');
                $shift_id = $next_shift['shift_id'];
                $to_time = $next_shift['to_time'];
            }else{
                $shift_id = $this->shift_model->insertRecord($shift);
            }
        }else{
            $shift = $this->shift_model->getFromId($shift_id);
            $shift['from_time'] = $from_time;
            $shift['to_time'] = $to_time;
            $shift['shift_type'] = $shift_type;

            $this->shift_model->updateRecord($shift, 'shift_id');
        }

        $this->mergeShift($shift_id, $staff_id, $organ_id, $from_time, $to_time, $shift_type);


        $result['isSave'] = true;
        echo json_encode($result);
    }

    /*
     * Merge with old shift.
     *
     */
    private function mergeShift($shift_id, $staff_id, $organ_id, $from_time, $to_time, $shift_type){
        $prev_shift = $this->shift_model->getOneByParam([
            'staff_id' => $staff_id,
            'organ_id' => $organ_id,
            'to_time' => $from_time,
            'shift_type' => $shift_type
        ]);

        if (!empty($prev_shift)){
            $prev_shift['to_time'] = $to_time;
            $this->shift_model->updateRecord($prev_shift, 'shift_id');
            $this->shift_model->delete_force($shift_id, 'shift_id');

            $from_time = $prev_shift['from_time'];
            $shift_id = $prev_shift['shift_id'];
        }

        $next_shift = $this->shift_model->getOneByParam([
            'staff_id' => $staff_id,
            'organ_id' => $organ_id,
            'from_time' => $to_time,
            'shift_type' => $shift_type
        ]);

        if (!empty($next_shift)){
            $next_shift['from_time'] = $from_time;
            $this->shift_model->updateRecord($next_shift, 'shift_id');
            $this->shift_model->delete_force($shift_id, 'shift_id');
        }

        return true;
    }

    private function isInCount($organ_id, $from_time, $to_time){
        $counts = $this->setting_count_shift_model->getListByCond([
            'organ_id'=>$organ_id,
            'in_from_time'=>$from_time,
            'in_to_time'=>$to_time,
        ]);
        $link_counts = [];
        $last = [];
        if (count($counts)==1){
            $link_counts = $counts;
        } else{
            foreach ($counts as $count){
                if (empty($last)){
                    $last = $count;
                }else{
                    if ($last['to_time']==$count['from_time']){
                        $last['to_time'] = $count['to_time'];
                    }else{
                        $link_counts[] = $last;
                        $last = $count;
                    }
                }
            }
            $link_counts[] = $last;
        }

        foreach ($link_counts as $count){
            if ($count['from_time']<=$from_time && $count['to_time']>=$to_time) return true;
        }
        return false;
    }
}
?>
