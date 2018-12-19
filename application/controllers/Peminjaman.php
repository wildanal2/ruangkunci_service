<?php 
defined('BASEPATH') OR exit('No direct script access allowed'); 
 
require APPPATH . '/libraries/REST_Controller.php'; 
use Restserver\Libraries\REST_Controller; 
 
class Peminjaman extends REST_Controller { 
 
    function __construct($config = 'rest') {         
    	parent::__construct($config);
    	$this->load->database();
    } 

    function index_get() {
        $q = "SELECT p.id,p.id_kelas, p.mulai,time(p.selesai) as selesai,p.status,p.id_admin, k.ruang,k.nama_lab, u.nim,u.nama,p.img AS p_img,k.img AS k_img FROM pinjaman AS p JOIN kelas as k ON p.id_kelas=k.id JOIN users as u ON p.id_user=u.nim order by p.mulai DESC";
        //  WHERE p.mulai>=CURDATE()
        $get_ruangan = $this->db->query($q)->result();
        
        return $this->response(array('status' => 200,'result'=>$get_ruangan));  
    }

    function riwayatbyid_post() {
        $nim = $this->input->post('nim');

        $q = "SELECT p.id,p.id_kelas, p.mulai,time(p.selesai)as selesai,p.status,p.id_admin, k.ruang,k.nama_lab, u.nim,u.nama,p.img AS p_img,k.img AS k_img FROM pinjaman AS p JOIN kelas as k ON p.id_kelas=k.id JOIN users as u ON p.id_user=u.nim WHERE p.id_user=".$nim." order by p.mulai DESC";
        $get_ruangan = $this->db->query($q)->result();
        
        return $this->response(array('status' => 200,'result'=>$get_ruangan));  
    }
 
    //Menampilkan bynim data users      
    function CariNim_post() {
        $this->db->select('*');
        $this->db->from('users');
        $this->db->where('nim',$this->input->post('nim'));
        $query=$this->db->get();
        $row = $query->first_row();
        if ($row!=null) {
            return $this->response(array('status' => 200,'result'=>$row));  
        }else{
            return $this->response(array('status' => 400));
        }
        
    }
    
    function Meminjam_post(){
        date_default_timezone_set("Asia/Jakarta");
        $data = array(
            'id_kelas' => $this->post('id_kelas'),
            'id_user' => $this->post('id_user'),
            'mulai' => date("Y-m-d H:i:s"),
            'status' => $this->post('status'),
            'id_admin' => $this->post('id_admin'),
            );
        
        //upload foto
        $insert_image="";
            // jika file tidak kosong 
            if (!empty($_FILES)){
                if ($_FILES["img"]["name"]) {
                    // configurasi upload file
                    $config['upload_path']   = './assets/peminjam'; 
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
                        $data['img'] = "ruangan/".$new_name.".".$ext; //nama unix
                        $insert_image = "upload image success";
                    }else{
                        $insert_image = "upload image failed";
                    }

                }else{
                    $insert_image = "Image Tidak ada Masukan";
                }

            }else{
                // jika file image kosong
                $data['pinjaman'] = "";
            }

        // insert data ke db
        $insert= $this->db->insert('pinjaman',$data);
//      update DB
        $put = array(
            'status' => $this->post('status'),
            );
        $this->db->where('id', $this->post('id_kelas'));         
        $update = $this->db->update('kelas', $put);

        //respose
        if ($insert && $update){// jika sukses di insert
            $this->response(array('status'=>200,'result' => $data,"message" =>$insert_image));
        }
    }

    function kembalikan_post()
    {
        date_default_timezone_set("Asia/Jakarta");
    //  data update
        $putpeminjam = array(
            'selesai' => date("Y-m-d H:i:s"),
            'status' => "selesai"
            );
        //query update
        $this->db->where('id', $this->post('id'));         
        $update = $this->db->update('pinjaman', $putpeminjam);

        if ($update) {// jika sukses update
            //data update kelas
            $putkelas = array(
            'status' => "tersedia",
            );
            //procees update
            $this->db->where('id', $this->post('id_kelas'));         
            $update_kelas = $this->db->update('kelas', $putkelas);

            if ($update_kelas) {
                $this->response(array('status'=>200,"message" =>"Update kelas & peminjam sukses"));
            }else $this->response(array('status'=>404,"message" =>"Internal Server tb_kelas Error"));
        }else{
            $this->response(array('status'=>404,"message" =>"Internal Server tb_peminjaman Error"));
        }


    }



} ?>