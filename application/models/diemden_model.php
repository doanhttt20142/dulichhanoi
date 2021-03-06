<?php
require_once 'application/models/crudmodel.php';

class diemden_model extends CI_Model implements crudmodel{
	public function getDetail($id = ''){
		$this->load->database();
		$query = $this->db->get_where('diemden', array('id' => $id));
		$result_object = $query->result_object();
		if ($result_object == null)
			return null;
		else {
			$result = $result_object[0];
			return $result;
		}
	}
	
	public function countRecord() {
		$this->load->database();
		$sql = 'SELECT COUNT(id) as count FROM diemden';
		$query = $this->db->query($sql);
		return $query->result_object()[0]->count;
	}
	
	public function getTop($column, $start, $n) {
		$column2;
		if ($column == 'rate') {
			$column2 = 'viewcount';
		}
		else if ($column == 'viewcount') {
			$column2 = 'rate';
		}
		
		$this->load->database();
		$sql = "SELECT id, ten, anh_dai_dien, tom_tat, viewcount, rate FROM diemden ORDER BY $column DESC, $column2 DESC LIMIT ?, ?";
		$query = $this->db->query($sql, array($start, $n));
		return $query->result_object();
	}
	
	public function insert($obj) {
		$result = new stdClass();
		try {
			$obj->mo_ta = json_encode($obj->mo_ta);
			$obj->tag = json_encode($obj->tag);
			$obj->album = json_encode($obj->album);
			$data = (array)$obj;
			$this->load->database();
			$this->db->insert('diemden', $data);
			$result->id = mysql_insert_id();
		} catch (Exception $e) {
			$result->id = null;
			$result->msg = $e->getMessage();
		} finally {
			return $result;
		}
	}
		
	public function delete($id) {
		$this->db->delete('diemden', array('id' => $id));
	}
	
	public function increaseView($id) {
		$obj = $this->getDetail($id);
		$viewcount = $obj->viewcount;
		$viewcount++;
		$this->load->database();
		$this->db->where('id', $id);
		$this->db->update('diemden', array(
				'viewcount' => $viewcount,
		));
	}
	
	public function updateRate($id, $ratecount, $ratescore) {
		$rate = $ratescore/$ratecount;
		$this->load->database();
		$this->db->where('id', $id);
		$this->db->update('diemden', array(
				'ratecount' => $ratecount,
				'ratescore' => $ratescore,
				'rate' => $rate
		));
	}
}

?>