<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class User extends REST_Controller { 

 
    function __construct($config = 'rest') {         
    	parent::__construct($config);
    	$this->load->database();
    } 
 
    //Menampilkan all data kelas      
    function UserAll_get() {

        $this->db->select('*');
        $this->db->from('users');
        $query=$this->db->get();
        
        return $this->response(array('status' => 200,'result'=>$query->result()));  
    }

    function index_post(){
        $data = array(
                'nim' => $this->post('nim'),
                'nama' => $this->post('nama'),
                'email' => $this->post('email'),
                'password' => $this->post('password'),
                'img' => $this->post('img'),
                'kelas' => $this->post('kelas'),
                'level' => $this->post('level')
            );

        $insert = $this->db->insert('users', $data);
        if ($insert){
            $this->response($data, 200);
        }else{
            $this->response(array('status' => 'fail', 502));
        }
    }
    

} ?>