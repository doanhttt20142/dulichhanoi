<?php
class fileupload extends CI_Controller {
	public function __construct() {
		parent::__construct ();
	}
	
	public function upload($category, $folder) {
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
			mkdir("imgs/$category/$folder");
			move_uploaded_file ( $temp, "imgs/$category/$folder/$name" );
		}
	}
}