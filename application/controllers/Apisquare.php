<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . 'core/WebController.php';

/*
 *
 */

class Apisquare extends WebController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
    }

    public function addPayment(){
        $amount = $this->input->post('amount');
        $currency = $this->input->post('currency');
        $idempotency_key = $this->input->post('idempotency_key');
        $source_id = $this->input->post('source_id');

        $api_url = 'https://connect.squareupsandbox.com/v2/payments';
        $headers = array(
            'Content-Type:application/json',
            'Authorization: Bearer EAAAEKIA22FHeHHFFFw9NHYw_N7UiW83_IS7hXSErVp6XO2Yg7S8z4vVPgAMuaxj'
        );

        $data = array(
            'amount_money'=>array(
                'amount' => intval($amount),
                'currency' => $currency
            ),
            'idempotency_key' => $idempotency_key,
            'source_id' => $source_id
        );

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $api_url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        $result = curl_exec($ch);

        if (curl_errno($ch)) {

            $results['isPay'] = false;
        } else {
            $results['isPay'] = true;

        }
        echo json_encode($results);
    }
}
?>