<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class Ruangan extends REST_Controller { 
 
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
    function RuanganDetail_post() {

        $this->db->select('*');
        $this->db->from('kelas');
        $this->db->where('id',$this->input->post('id'));
        $query=$this->db->get();
        $ruangan = $query->first_row();

        $this->db->select('*');
        $this->db->from('jadwal');
        $this->db->where('id_kelas',$this->input->post('id'));
        $jadwal=$this->db->get();

        return $this->response(array('status' => 'sukses','kelas'=>$ruangan,'jadwal'=>$jadwal->result()));  
    } 

    function TambahRuangan_post(){
        $data_ruangan = array(
            'ruang' => $this->post('ruang'),
            'nama_lab' => $this->post('nama_lab'),
            'lokasi' => $this->post('lokasi')
            );
        //select namaruangan sama
        $get_ruangan = $this->db->query("SELECT * FROM kelas WHERE ruang='".$data_ruangan['ruang']."'")->result();
        // jika nama ruangan belum dipakai
        if(empty($get_ruangan)){
                $insert_image="";
            // jika file tidak kosong 
            if (!empty($_FILES)){
                if ($_FILES["img"]["name"]) {
                    // configurasi upload file
                    $config['upload_path']   = './assets/ruangan'; 
                    $config['allowed_types'] = 'gif|jpg|png'; 
                    $config['max_size']      = 80000; 
                    $config['max_width']     = 4400; 
                    $config['max_height']    = 3320;
                    $new_name = time().md5($_FILES["img"]['name']);
                    $config['file_name'] = $new_name;  
                    
                    // load library upload
                    $this->load->library('upload', $config);
                    // jika file berhasil di upload
                    if($this->upload->do_upload('img')){
                        // mendapatkan ekstensi file
                        $path = $_FILES['img']['name'];
                        $ext = pathinfo($path, PATHINFO_EXTENSION);
                        // memberi nama pada kolom img
                        $data_ruangan['img'] = "ruangan/".$new_name.".".$ext; //nama unix
                        $insert_image = "upload image success";
                    }else{
                        $insert_image = "upload image failed";
                    }

                }else{
                    $insert_image = "Image Tidak ada Masukan";
                }

            }else{
                // jika file image kosong
                $data_ruangan['img'] = "";
            }

            // insert data ke db
            $insert= $this->db->insert('kelas',$data_ruangan);

        }else{
            // jika ruangan sama 
            $this->response(array('status'=>'500 Fail','result' => array($data_ruangan),"message"=>"Ruangan Sudah ada"));
        }
        //respose
        if ($insert){// jika sukses di insert
            $this->response(array('status'=>'200 OK','result' => array($data_ruangan),"message"=>$insert_image));
        }
    }

} ?>