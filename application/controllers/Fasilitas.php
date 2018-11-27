<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class Fasilitas extends REST_Controller { 
 
    function __construct($config = 'rest') {         
    	parent::__construct($config);
    	$this->load->database();
    } 
 
    //Menampilkan all data fasilitas      
    function index_get() {

        $this->db->select('*');
        $this->db->from('fasilitas');
        $query=$this->db->get();
        
        return $this->response(array('status' => 'okee','result'=>$query->result()));  
    }

    //Menampilkan  data fasilitas byid      
    function index_post() {
        $data_fasilitas = array(
            'id_ruang' => $this->post('id_ruang'),
            'nama_fasilitas' => $this->post('nama_fasilitas'),
            'jumlah' => $this->post('jumlah')
            );

        $insert= $this->db->insert('fasilitas',$data_fasilitas);
        
        return $this->response(array('status' => '200','result'=>$data_fasilitas,'message'=>'success ditambahkan'));  
    }

    function index_delete() {         
        $id = $this->delete('id');
        //delete database
        $this->db->where('id', $id);            
        $delete = $this->db->delete('fasilitas');  
        
        return $this->response(array('status' => '200','message'=>'success dihapus')); 
    } 
    


} ?>