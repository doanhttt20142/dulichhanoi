<?php

/**
 * 
 * @author tuantri
 *
 */


class tag_model extends CI_Model {
	/************************Define Exception Const*************************/
	const TAGNAMENOTEXIST_ID = 201;
	const TAGNAMENOTEXIST_MS = 'tagname is not exist';
	const DUPLICATEDOC_ID = 202;
	const DUPLICATEDOC_MS = 'duplicate doc in a tagname';
	const DOCNOTEXIST_ID = 203;
	const DOCNOTEXIST_MSG = 'doc not exist';
	
	/***************************Define Function*****************************/
	/**
	 * Trả lại danh sách tên của tất cả các tag hiện có trong cơ sở dữ liệu
	 * @return string[]
	 */
	public function getAllTag() {
		$this->load->database();
		$query = $this->db->query('SELECT name FROM tag');
		return $query->result_array();
	}
	
	/**
	 * Trả về danh sách tối đa là n tag gợi ý cho từ khóa $key mà người dùng nhập vào.
	 * @param string $key
	 * @return string[]
	 */
	public function getHint($key, $n) {
		//Bước 1: Truy vấn trong cơ sở dữ liệu
		$this->load->database();
		$query = $this->db->query("SELECT name FROM tag WHERE hint LIKE '$key%' LIMIT $n");
		return $query->result_array();
		//có thể sử dụng hàm levenshtein($str1, $str2);
	}
	
	/**
	 * Kiểm tra 1 tag đã tồn tại trong cơ sở dữ liệu hay chưa.
	 * Nếu tồn tại rồi thì return true
	 * Nếu chưa tồn tại thì return false
	 * @param string $tagname
	 * @return boolean
	 */
	public function checkTagExist($tagname) {
		//FIXME không phân biệt được 'tâm linh' và 'tam linh'
		$tagname = $this->normalizedTag($tagname);
		$this->load->database();
		$query = $this->db->get_where('tag', array('name'=>$tagname));
		if ($query->num_rows() > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * Trả về các id của các tài liệu mà những tài liệu này được gắn tag là $tagname.
	 * {'diemden':[id1, id2, ...], 'khachsan':[id1, id2, ...], ...}
	 * Nếu tagname không tồn tại thì throw exception
	 * @param string $tagname
	 * @return mixed
	 * @throws Exception
	 */
	public function getDocIDs($tagname) {
		$this->load->database();
		$query = $this->db->get_where('tag', array('name'=>$tagname));
		if ($query->num_rows() <= 0) {
			throw new Exception(tag_model::TAGNAMENOTEXIST_MS, tag_model::TAGNAMENOTEXIST_ID);
		}
		else {
			return $query->result_object()[0];
		}
	}
	
	/**
	 * Thêm một tag mới vào cơ sở dữ liệu.
	 * Nếu tag đã tồn tại thì trả về false.
	 * Ngược lại thì trả về true.
	 * @param string $tagname
	 */
	public function addTagName($tagname) {
		$tagname = $this->normalizedTag($tagname);
		$this->load->database();
		$data = array(
			'name' => $tagname,
			'hint' => $tagname
		);
		$this->db->insert('tag', $data);
		return ($this->db->affected_rows() != 1) ? false : true;
	}
	
	/**
	 * Thêm một docid mới vào 1 tag.
	 * Nếu $tagname không tồn tại hoặc tồn tại nhưng đã có $id thì throw Exception
	 * 
	 * @param string $tagname
	 * @param string $category
	 * @param int $id
	 * @throws Exception
	 * @return boolean
	 */
	public function addDocsToTagName($tagname, $category, $id) {
		$this->load->database();
		$query = $this->db->get_where('tag', array('name'=>$tagname));
		if ($query->num_rows() != 1) {
			throw new Exception(tag_model::TAGNAMENOTEXIST_MS, tag_model::TAGNAMENOTEXIST_ID);
		}
		$obj = $query->result_object()[0];
		if ($obj->{$category} != null) {
			$obj->{$category} = json_decode($obj->{$category});
		}
		else {
			$obj->{$category} = array();
		}
		if (in_array($id, $obj->{$category}) == true) {
			throw new Exception(tag_model::DUPLICATEDOC_MS, tag_model::DUPLICATEDOC_ID);
		}
		array_push($obj->{$category}, $id);
		$obj->{$category} = json_encode($obj->{$category});
		$result = $this->updateTag($tagname, $obj);
		return $result;
	}
	
	/**
	 * Remove một docid ra khỏi tag.
	 * Nếu tagname ko tồn tại, hoặc docid không tồn tại thì throw Exception
	 * @param st $tagname
	 * @param string $category
	 * @param int $id
	 * @throws Exception
	 * @return boolean
	 */
	public function removeDocsFromTagName($tagname, $category, $id) {
		$this->load->database();
		$query = $this->db->get_where('tag', array('name'=>$tagname));
		if ($query->num_rows() != 1) {
			throw new Exception(tag_model::TAGNAMENOTEXIST_MS, tag_model::TAGNAMENOTEXIST_ID);
		}
		$obj = $query->result_object()[0];
		if ($obj->{$category} != null) {
			$obj->{$category} = json_decode($obj->{$category});
		}
		else {
			throw new Exception(tag_model::DOCNOTEXIST_MSG, tag_model::DOCNOTEXIST_ID);
		}
		if (in_array($id, $obj->{$category}) == false) {
			throw new Exception(tag_model::DOCNOTEXIST_MSG, tag_model::DOCNOTEXIST_ID);
		}
		$obj->{$category} = array_diff($obj->{$category}, array($id));
		$obj->{$category} = json_encode($obj->{$category});
		$result = $this->updateTag($tagname, $obj);
		return $result;
	}
	
	/**
	 * update tag
	 * @param string $tagname
	 * @param mixed $obj
	 * @return boolean
	 */
	public function updateTag($tagname, $obj) {
		$this->load->database();
		$this->db->where('name', $tagname);
		$this->db->update('tag', $obj);
		return ($this->db->affected_rows() != 1) ? false : true;
	}
	
	public function deleteTagName($tagname) {
		$this->load->database();
		
	}
	
	/**
	 * Chuẩn hóa tag: Loại bỏ tất cả các dấu câu, dấu cách dư thừa, chuyển tất cả về chữ thường.
	 * @param string $tagname
	 * @return string
	 */
	private function normalizedTag($tagname) {
		//FIXME
		return mb_strtolower($tagname, "utf8");
	}
}