<?php
interface crudmodel {
	
	public function getDetail($id);
	
	public function countRecord();
	
	public function getTop($column, $start, $n);
	
	public function insert($obj);
		
	public function delete($id);
	
	public function increaseView($id);
	
	public function updateRate($id, $ratecount, $ratescore);
	
}