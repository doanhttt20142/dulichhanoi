<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class crud extends CI_Controller{
	public function __construct(){
		parent::__construct();
	}
	
	/**
	 * lấy về thông tin chi tiết của một thực thể thông tin
	 * @param string $category
	 * @param int $id
	 */
	public function detail( $category, $id ){
		$modelname = $category.'_model';
		$this->load->model($modelname);
		$this->{$modelname}->increaseView($id);
	    $result =  $this->{$modelname}->getDetail($id);
		echo json_encode($result);
	}
	
	public function countRecord( $category ) {
		$modelname = $category.'_model';
		$this->load->model($modelname);
		$countRecord =  $this->{$modelname}->countRecord();
		echo $countRecord;
	}
	
	/**
	 * Lấy về một danh sách thông tin tóm tắt của các thực thể thông tin nổi bật nhất
	 * @param string $column
	 * @param int $start
	 * @param int $n
	 */
	public function top( $category, $column, $start, $n ) {
		$modelname = $category.'_model';
		$this->load->model($modelname);
		$result_object =  $this->{$modelname}->getTop($column, (int)$start, (int)$n);
		echo json_encode($result_object);
	}
	
	/**
	 * Thêm một thực thể thông tin mới
	 * @param string $category
	 */
	public function add( $category ) {
		//check quyền admin
		$obj = json_decode(file_get_contents('php://input'));
		$modelname = $category.'_model';
		$this->load->model($modelname);
		$id = $this->{$modelname}->insert($obj);
		echo $id;
	}
	
	public function addbrief( $category ) {
		$json = $_POST['json'];
		$modelname = $category.'_model';
		$this->load->model($modelname);
		$obj = json_decode($json);
		$this->{$modelname}->addbrief($obj);
	}
	
	/**
	 * Cập nhật 1 thực thể thông tin cũ
	 * @param unknown $category
	 * @param unknown $json
	 */
	public function update( $category ) {
		//check quyền admin
		$json = $_POST['json'];
		$modelname = $category.'_model';
		$this->load->model($modelname);
		$obj = json_decode($json);
		$this->{$modelname}->insert($obj);
	}
	
	/**
	 * Xóa một thực thể thông tin
	 * @param unknown $category
	 * @param unknown $id
	 */
	public function delete( $category, $id ) {
		//Check quyền admin
		$modelname = $category.'_model';
		$this->load->model($modelname);
		$this->{$modelname}->delete($id);
	}
	
	/**
	 * thêm 1 đánh giá cho 1 thực thể thông tin
	 * @param unknown $category
	 * @param unknown $id
	 * @param unknown $score
	 */
	public function rate( $category, $id, $score ) {
		//Kiểm tra tất cả các tham số đầu vào đảm bảo hợp lệ
		//category tồn tại, score thuộc đoạn [1, 5]...
		
		//Lấy ra ratecount cũ, ratescore cũ 
		$modelname = $category.'_model';
		$this->load->model($modelname);
		$obj =  $this->{$modelname}->getDetail($id);
		$ratecount = $obj->ratecount;
		$ratescore = $obj->ratescore;
		$ratecount++;
		$ratescore += $score;
		$this->{$modelname}->updateRate($id, $ratecount, $ratescore);
		
		//Update lại ratecount mới, ratescore mới và rate mới trong cơ sở dữ liệu
		
	}
	
	public function test() {
		phpinfo();
	}
}
?>