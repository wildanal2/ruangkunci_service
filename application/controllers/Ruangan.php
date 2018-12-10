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

        $q = "SELECT p.id, p.mulai,p.selesai,p.status,p.id_admin, k.ruang,k.nama_lab, u.nim,u.kelas,u.nama,p.img AS p_img,k.img AS k_img FROM pinjaman AS p JOIN kelas as k ON p.id_kelas=k.id JOIN users as u ON p.id_user=u.nim WHERE p.mulai>=CURDATE() and id_kelas=".$this->input->post('id');
        $riwayat = $this->db->query($q)->result();
        

        $this->db->select('*');
        $this->db->from('jadwal');
        $this->db->where('id_kelas',$this->input->post('id'));
        $jadwal=$this->db->get();

        $this->db->select('*');
        $this->db->from('fasilitas');
        $this->db->where('id_ruang',$this->input->post('id'));
        $fasilitas=$this->db->get();

        return $this->response(array('status' => 'sukses','kelas'=>$ruangan,'jadwal'=>$jadwal->result(),'fasilitas'=>$fasilitas->result(),'riwayat'=>$riwayat));  
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
                    $config['allowed_types'] = 'gif|jpg|png|JPEG'; 
                    $config['max_size']      = 0; 
                    $config['max_width']     = 0;// 0 = nolimit 
                    $config['max_height']    = 0;
                    $new_name = time();
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
            $this->response(array('status'=>'500 Fail','result' => $data_ruangan,"message"=>"Ruangan Sudah ada"));
        }
        //respose
        if ($insert){// jika sukses di insert
            $this->response(array('status'=>'200 OK','result' => $data_ruangan,"message"=>$insert_image));
        }
    }

} ?>