<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class Jadwal extends REST_Controller { 
 
    function __construct($config = 'rest') {         
    	parent::__construct($config);
    	$this->load->database();
    } 
 
    //Menampilkan all data jadwal      
    function index_get() {

        $this->db->select('*');
        $this->db->from('jadwal');
        $query=$this->db->get();
        
        return $this->response(array('status' => 'okee','result'=>$query->result()));  
    }

    //Menampilkan  data jadwal byid      
    function index_post() {
        $data_jadwal = array(
            'id_kelas' => $this->post('id_kelas'),
            'hari' => $this->post('hari'),
            'waktu_mulai' => $this->post('waktu_mulai'),
            'waktu_selesai' => $this->post('waktu_selesai'),
            'matkul' => $this->post('matkul'),
            'sks' => $this->post('sks'),
            'jam' => $this->post('jam'),
            'kelas' => $this->post('kelas'),
            'pengajar' => $this->post('pengajar')
            );

        $insert= $this->db->insert('jadwal',$data_jadwal);
        
        return $this->response(array('status' => '200','result'=>$data_jadwal,'message'=>'success ditambahkan'));  
    }

    //hAPUS  data jadwal 
    function index_delete() {         
        $id = $this->delete('id');
        //delete database
        $this->db->where('id', $id);            
        $delete = $this->db->delete('jadwal');  
        
        return $this->response(array('status' => '200','message'=>'success dihapus')); 
    } 
    


} ?>