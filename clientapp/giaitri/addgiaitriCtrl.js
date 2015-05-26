/**
 * 
 */
dulichapp.controller('addgiaitriCtrl', function($scope, $http, Upload) {
	$scope.folderimgs = FOLDER_IMGS;

	$scope.giaitri = {};
	$scope.giaitri.mo_ta = [ {
		'type' : 'text'
	} ];
	$scope.giaitri.album = [];
	$scope.giaitri.tag = [];
	
	$scope.imgmota = {};
		
	$scope.extractLink = function() {
		if (($scope.anh_dai_dien != undefined) && ($scope.anh_dai_dien != null)) {
			$name = $scope.anh_dai_dien[0].name;
			$scope.giaitri.anh_dai_dien = $name;
		}
		
		if (($scope.album != undefined) && ($scope.album != null)) {
			$scope.giaitri.album = Array($scope.album.length);
			for (var i = 0; i < $scope.album.length; i++) {
				$name = $scope.album[i].name;
				$scope.giaitri.album[i] = {"src":$name};
			}
		}
		
		for (var i=0; i<$scope.giaitri.mo_ta.length; i++) {
			if ($scope.giaitri.mo_ta[i].type == 'img') {
				$scope.giaitri.mo_ta[i].src = $scope.imgmota[i][0].name;
			}
		}
	};
	
	$scope.uploadToFolder = function(files, folder) {
		if (files && files.length) {
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				console.log(file);
				Upload.upload({
					url : HOST_SERVER +'fileupload/upload/' + folder,
					file : file
				});
			}
		}
	};
	
	$scope.result = null;
	
	$scope.add = function() {
		$scope.extractLink();
		$http({
			method : 'POST',
			url : HOST_SERVER + 'crud/add/giaitri',
			data : $scope.giaitri,
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			}
		}).success(function(res) {
			console.log(res);
			if (res.id == null) {
				$scope.result = "Error: " + res.msg;
				return;
			}
			$scope.id = res.id;
			console.log($scope.giaitri);
			$scope.uploadToFolder($scope.anh_dai_dien, 'giaitri/' + $scope.id);
			$scope.uploadToFolder($scope.album, 'giaitri/' + $scope.id);
			
			for(var i=0; i<$scope.giaitri.mo_ta.length; i++) {
				if($scope.giaitri.mo_ta[i].type == 'img') {
					$scope.uploadToFolder($scope.imgmota[i],'giaitri/' + $scope.id);
				}
			}

			$scope.result = "Đã thêm thành công vào cơ sở dữ liệu";
		});
	};
	$scope.addImg = function(it) {
		p = findLocation($scope.giaitri.mo_ta, it);
		for (var i = $scope.giaitri.mo_ta.length - 1; i > p; i--) {
			$scope.giaitri.mo_ta[i + 1] = $scope.giaitri.mo_ta[i];
		}
		$scope.giaitri.mo_ta[p + 1] = {
			'type' : 'img'
		};
	};

	$scope.addText = function(it) {
		p = findLocation($scope.giaitri.mo_ta, it);
		for (var i = $scope.giaitri.mo_ta.length - 1; i > p; i--) {
			$scope.giaitri.mo_ta[i + 1] = $scope.giaitri.mo_ta[i];
		}
		$scope.giaitri.mo_ta[p + 1] = {
			'type' : 'text'
		};
	};
	
	$scope.addTitle = function(it) {
		p = findLocation($scope.giaitri.mo_ta, it);
		for (var i = $scope.giaitri.mo_ta.length - 1; i > p; i--) {
			$scope.giaitri.mo_ta[i + 1] = $scope.giaitri.mo_ta[i];
		}
		$scope.giaitri.mo_ta[p + 1] = {
			'type' : 'title'
		};
	};
	
	$scope.addImgI = function(p) {
		for (var i = $scope.giaitri.mo_ta.length - 1; i > p; i--) {
			$scope.giaitri.mo_ta[i + 1] = $scope.giaitri.mo_ta[i];
		}
		$scope.giaitri.mo_ta[p + 1] = {
			'type' : 'img',
			'content' : null
		};
	};
	
	$scope.addTextI = function() {
		for (var i = $scope.giaitri.mo_ta.length - 1; i > p; i--) {
			$scope.giaitri.mo_ta[i + 1] = $scope.giaitri.mo_ta[i];
		}
		$scope.giaitri.mo_ta[p + 1] = {
			'type' : 'text',
			'content' : null
		};
	};

	
	$scope.del = function(it) {
		p = findLocation($scope.giaitri.mo_ta, it);
		$scope.giaitri.mo_ta.splice(p, 1);
	};

	findLocation = function(arr, it) {
		for (var i = 0; i < arr.length; i++) {
			if (arr[i] == it) {
				return i;
			}
		}
	};
	
	$scope.addtag = function() {
		$scope.giaitri.tag.push($scope.temptag);
		$scope.temptag = null;
	};
	
	$scope.removetag = function(tag) {
		p = findLocation($scope.giaitri.tag, tag);
		$scope.giaitri.tag.splice(p, 1);
	};
});
