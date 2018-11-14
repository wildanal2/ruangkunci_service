<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class Kelas extends REST_Controller { 
 
    function __construct($config = 'rest') {         
    	parent::__construct($config);
    	$this->load->database();
    } 
 
    //Menampilkan all data kelas      
    function RuanganAll_get() {

        $this->db->select('*');
        $this->db->from('kelas');
        $query=$this->db->get();
        
        return $this->response(array('status' => 'okee','result'=>$query->result()));  
    }
    
    // get ruangan id
    function ruangan_post() {

        $this->db->select('*');
        $this->db->from('kelas');
        $this->db->where('id',$this->input->post('id'));
        $query=$this->db->get();
        $row = $query->first_row();

        return $this->response(array('status' => 'okee','result'=>$row));  
    } 


} ?>