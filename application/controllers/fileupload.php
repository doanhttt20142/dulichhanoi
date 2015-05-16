<?php
class fileupload extends CI_Controller {
	public function __construct() {
		parent::__construct ();
	}
	
	public function upload($folder = null) {
		// properties of the uploaded file
		$name = $_FILES ["file"] ["name"];
		$type = $_FILES ["file"] ["type"];
		$size = $_FILES ["file"] ["size"];
		$temp = $_FILES ["file"] ["tmp_name"];
		$error = $_FILES ["file"] ["error"];
		
// 		echo 'NAME:'.$name;
// 		echo 'TYPE:'.$type;
// 		echo 'SIZE'.$size;
// 		echo 'TEMP'.$temp;
// 		echo 'ERROR'.$error;
		
		if ($error > 0)
			die ( "Error uploading file! code $error." );
		else {
			if ($folder != null) {
				mkdir("imgs/$folder");
				move_uploaded_file ( $temp, "imgs/$folder/$name" );
			} else {
				move_uploaded_file ( $temp, "uploaded/$name" );
			}
		}
	}
}