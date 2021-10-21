<?php //if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH . '/models/Base_model.php';

class Stamp_model extends Base_model
{
    public function __construct()
    {
        parent::__construct();
        $this->table = 'stamps';
        $this->primary_key = 'stamp_id';
    }



}