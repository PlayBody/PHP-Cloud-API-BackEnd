<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Apitickets extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('mst_ticket_model');
        $this->load->model('ticket_model');
        $this->load->model('user_ticket_model');
    }

    public function loadMasterTicket(){
        $results['ticket_master'] = $this->mst_ticket_model->getListByCond([]);

        echo json_encode($results);
    }
    public function loadTicketList(){
        $company_id = $this->input->post('company_id');

        if (empty($company_id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $tickets = $this->ticket_model->getListByCond(['company_id'=>$company_id]);

        $results['isLoad'] = true;
        $results['tickets'] = $tickets;

        echo json_encode($results);
    }

    public function loadTicket(){
        $id = $this->input->post('id');

        if (empty($id)){
            $results['isLoad'] = false;
            echo json_encode($results);
            return;
        }

        $ticket = $this->ticket_model->getFromId($id);

        $results['isLoad'] = true;
        $results['ticket'] = $ticket;

        echo json_encode($results);
    }

    public function saveTicket(){
        $id = $this->input->post('id');
        $ticket_id = $this->input->post('ticket_id');
        $company_id = $this->input->post('company_id');

//        $ticket_title = $this->input->post('title');
        $ticket_price = $this->input->post('price');
        $ticket_cost = $this->input->post('cost');
        $ticket_tax = $this->input->post('tax');
        $ticket_count = $this->input->post('ticket_count');

        if (empty($id)){
            $ticket = array(
                'ticket_id' => $ticket_id,
//                'ticket_title' => $ticket_title,
                'company_id' => $company_id,
                'ticket_price' => $ticket_price,
                'ticket_cost' => $ticket_cost,
                'ticket_tax' => $ticket_tax,
                'ticket_count' => $ticket_count,
            );

            $this->ticket_model->insertRecord($ticket);
        }else{
            $ticket = $this->ticket_model->getFromId($id);
            $ticket['ticket_id'] = $ticket_id;
//            $ticket['ticket_title'] = $ticket_title;
            $ticket['ticket_price'] = $ticket_price;
            $ticket['ticket_cost'] = $ticket_cost;
            $ticket['ticket_tax'] = $ticket_tax;
            $ticket['ticket_count'] = $ticket_count;

            $this->ticket_model->updateRecord($ticket, 'id');
        }

        $results['isSave'] = true;

        echo json_encode($results);
    }

    public function deleteTicket(){
        $ticket_id = $this->input->post('ticket_id');

        if (empty($ticket_id)){
            $results['isDelete'] = false;
            echo json_encode($results);
            return;
        }
        $this->ticket_model->delete_force($ticket_id, 'ticket_id');
        $results['isDelete'] = true;

        echo json_encode($results);
    }

    public function loadUserTickets(){
        $company_id = $this->input->post('company_id');
        $user_id = $this->input->post('user_id');

        $tickets = $this->ticket_model->getListByCond(['company_id'=>$company_id]);

        $user_tickets = [];
        foreach ($tickets as $ticket) {
            $tmp = [];
            $tmp['ticket_id'] = $ticket['id'];
            $tmp['ticket_title'] = $ticket['ticket_name'];
            $tmp['ticket_price'] = $ticket['ticket_price'];
            $tmp['ticket_cost'] = $ticket['ticket_cost'];
            $tmp['ticket_tax'] = $ticket['ticket_tax'];
            $tmp['add_count'] = $ticket['ticket_count'];
            $tmp['user_id'] = $user_id;

            $uTicket = $this->user_ticket_model->getUserTicket(['ticket_id'=>$ticket['id'], 'user_id'=>$user_id]);
            $tmp['id'] = empty($uTicket['id']) ? '' : $uTicket['id'];
            $tmp['count'] = empty($uTicket['count']) ? 0 : $uTicket['count'];
            $tmp['is_reset'] = empty($uTicket['is_reset']) ? 0 : $uTicket['is_reset'];
            $tmp['reset_time_type'] = empty($uTicket['reset_time_type']) ? 0 : $uTicket['reset_time_type'];
            $tmp['reset_time_value'] = empty($uTicket['reset_time_value']) ? 0 : $uTicket['reset_time_value'];
            $tmp['reset_count'] = empty($uTicket['reset_count']) ? 0 : $uTicket['reset_count'];

            $user_tickets[] = $tmp;
        }

        $results['tickets'] = $user_tickets;

        echo json_encode($results);
    }
}
?>