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
    
    //Memperbarui data User yang telah ada  
    function updateuser_post() {         
        $id = $this->post('id');
        // memasukkan data update an         
    	$data = array(                                 
    		'email' => $this->post('email'),                     
            'password' => $this->post('password')
    	);         
        
        // to get detail foto lama
        $this->db->select('*');
        $this->db->from('users');
        $this->db->where('id',$id);
        $query=$this->db->get();
        $usr = $query->first_row();

        $insert_image="";
        // jika file tidak kosong , 
        if (!empty($_FILES)){
            if ($_FILES["img"]["name"]) {
                // configurasi upload file
                $config['upload_path']   = './assets/users'; 
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
                    $data['img'] = "users/".$new_name.".".$ext; //nama unix
                    $insert_image = "upload image success";
                    //delete foto lama
                    unlink('./assets/'.$usr->img);

                }else{
                    $insert_image = "upload image failed";
                }

            }else{
                $insert_image = "Image Tidak ada Masukan";
            }

        }else{
            // jika file image kosong
            $data['img'] = "";
        }

        // update db
    	$this->db->where('id', $id);         
        $update = $this->db->update('users', $data);
        
    	if ($update) {             
    		$this->response(array('status' => 200,'result' => $data,'message' => "dihapus : ".$usr->img));         
    	} else {             
    		$this->response(array('status' => 502));         
    	}     
    } 

    // get User by id
    function User_byid_post() {

        $this->db->select('*');
        $this->db->from('users');
        $this->db->where('id',$this->input->post('id'));
        $query=$this->db->get();
        $ruangan = $query->first_row();
        
        return $this->response(array('status' => 'sukses','kelas'=>$ruangan));  
    } 

} ?>