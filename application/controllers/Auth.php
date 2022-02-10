<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('form_validation');
    }

    public function index()
    {
        $this->form_validation->set_rules('email','Alamat Email','required|trim|valid_email',[
            'required'=>'Email Harus diisi',
            'valid_email'=>'Email Tidak Benar'
        ]);

        $this->form_validation->set_rules('password','Password','required|trim',[
            'required'=>'Password Harus diisi',
        ]);

        if($this->form_validation->run()==false){
            $data['judul']='Halaman Login';
            $this->load->view('templates/auth_header',$data);
            $this->load->view('auth/login');
            $this->load->view('templates/auth_footer');
        }else{
            $this->_login();
        }
 
    }

    private function _login(){
        $email=htmlspecialchars($this->input->post('email',true));
        $password=$this->input->post('password',true);

        $user=$this->db->get_where('user',['email'=>$email])->row_array();

        if($user)
        {
            if($user['is_active'] == 1){
                if(password_verify($password,$user['password'])){
                    $data=[
                        'email'=>$user['email'],
                        'role_id'=>$user['role_id']
                    ];
    
                    $this->session->set_userdata($data);
                    redirect('barang');
                }else{
                    $this->session->set_flashdata('message','<div class="alert alert-danger alert-message" role="alert"> Passward Salah</div>');
                    redirect('auth');
                   
                }
            }else{
                 $this->session->set_flashdata('message','<div class="alert alert-danger alert-message" role="alert"> User Belum diaktivasi</div>');
                redirect('auth');
            }
        }else{
            $this->session->set_flashdata('message','<div class="alert alert-danger alert-message" role="alert"> Email Tidak Terdaftar</div>');
            redirect('auth'); 
        }
        $this->session->set_flashdata('message','<div class="alert alert-success" role="alert">
            Passward Salah
          </div>');
          //redirect('auth'); 
        
    }

    public function registration()
    {
        $data['judul']='Registrasi';
   
        $this->form_validation->set_rules('name','Name','required|trim');
        $this->form_validation->set_rules('email','Email','required|trim|valid_email|is_unique[user.email]',
        [
            'is_unique' =>'This email has already registered!'
        ]);

        $this->form_validation->set_rules('password1','Password','required|trim|min_length[3]|matches[password2]',
        [
            'matches'=>'password dont match',
            'min_length'=> 'password too short!'
        ]);
        $this->form_validation->set_rules('password2','Password','required|trim|matches[password1]');

        if ($this->form_validation->run()==false)
        {
            $this->load->view('templates/auth_header',$data);
            $this->load->view('auth/registration');
            $this->load->view('templates/auth_footer');
        }
        else
        {
            $data=[
                'name'=>htmlspecialchars($this->input->post('name',true)),
                'email'=>htmlspecialchars($this->input->post('email',true)),
                'image'=>'default.jpg',
                'password'=>password_hash($this->input->post('password1'),PASSWORD_DEFAULT),
                'role_id'=>2,
                'is_active'=>1,
                'date_create'=>time()

            ];
            $this->db->insert('user',$data);
            $this->session->set_flashdata('message','<div class="alert alert-success" role="alert">
            Berhasil disimpan silahkan login
          </div>');
            redirect('auth');
        
        }

    }

    public function logout()
    {
        $this->session->unset_userdata('email');
        $this->session->unset_userdata('password');

        $this->session->set_flashdata('message','<div class="alert alert-success" role="alert">
        Anda Telah Logout </div>');
        redirect('auth');
    }
}