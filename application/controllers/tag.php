<?php
class tag extends CI_Controller{
	public function __construct(){
		parent::__construct();
	}
	
	public function getHintTag() {
		header('Content-Type: application/json');
		$str = $_GET['q'];
		$this->load->model('tag_model');
		
		try {
			$hint = $this->tag_model->getHint($str, 10);
			for ($i = 0; $i < sizeof($hint); $i++) {
				$hint[$i] = $hint[$i]['name'];
			}
			echo json_encode($hint);
		} catch (Exception $e) {
			echo $e->getMessage();
		}
	}
	
	public function tagExist($tag) {
		
	}
	
	public function addTag($tag) {
		
	}
	
	public function addDocToTag($tagname, $category, $docid) {
		
	}
	
}
