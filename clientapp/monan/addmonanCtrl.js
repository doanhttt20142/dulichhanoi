/**
 * 
 */
dulichapp
		.controller(
				'addmonanCtrl',
				function($scope, $http, Upload) {
					$scope.folderimgs = FOLDER_IMGS;

					$scope.monan = {};
					$scope.tenNH=null;
					$scope.diachi=null;
					$scope.monan.mo_ta = [ {
						'type' : 'text'
					} ];
					$scope.monan.danh_sach_nha_hang = [ {
						'ten' : '',
						'diachi' : ''
					} ];

					$scope.monan.danh_sach_nha_hang = [];

					$scope.monan.album = [];
					$scope.monan.tag = [];

					$scope.imgmota = {};

					$scope.extractLink = function() {
						if (($scope.anh_dai_dien != undefined)
								&& ($scope.anh_dai_dien != null)) {
							$name = $scope.anh_dai_dien[0].name;
							$scope.monan.anh_dai_dien = $name;
						}

						if (($scope.album != undefined)
								&& ($scope.album != null)) {
							$scope.monan.album = Array($scope.album.length);
							for (var i = 0; i < $scope.album.length; i++) {
								$name = $scope.album[i].name;
								$scope.monan.album[i] = {
									"src" : $name
								};
							}
						}

						for (var i = 0; i < $scope.monan.mo_ta.length; i++) {
							if ($scope.monan.mo_ta[i].type == 'img') {
								$scope.monan.mo_ta[i].src = $scope.imgmota[i][0].name;
							}
						}
					};

					$scope.uploadToFolder = function(files, folder) {
						if (files && files.length) {
							for (var i = 0; i < files.length; i++) {
								var file = files[i];
								console.log(file);
								Upload.upload({
									url : HOST_SERVER + 'fileupload/upload/'
											+ folder,
									file : file
								});
							}
						}
					};

					$scope.result = null;

					$scope.add = function() {
						$scope.extractLink();
						$http(
								{
									method : 'POST',
									url : HOST_SERVER + 'crud/add/monan',
									data : $scope.monan,
									headers : {
										'Content-Type' : 'application/x-www-form-urlencoded'
									}
								})
								.success(
										function(res) {
											$scope.id = res;
											console.log('idddddddddddddd:'
													+ $scope.id);
											console.log($scope.monan);
											$scope.uploadToFolder(
													$scope.anh_dai_dien,
													'monan/' + $scope.id);
											$scope.uploadToFolder($scope.album,
													'monan/' + $scope.id);

											for (var i = 0; i < $scope.monan.mo_ta.length; i++) {
												if ($scope.monan.mo_ta[i].type == 'img') {
													$scope
															.uploadToFolder(
																	$scope.imgmota[i],
																	'monan/'
																			+ $scope.id);
												}
											}

											$scope.result = "Đã thêm thành công vào cơ sở dữ liệu";
										});

					};

					$scope.addImg = function(it) {
						p = findLocation($scope.monan.mo_ta, it);
						for (var i = $scope.monan.mo_ta.length - 1; i > p; i--) {
							$scope.monan.mo_ta[i + 1] = $scope.monan.mo_ta[i];
						}
						$scope.monan.mo_ta[p + 1] = {
							'type' : 'img'
						};
					};

					$scope.addText = function(it) {
						p = findLocation($scope.monan.mo_ta, it);
						for (var i = $scope.monan.mo_ta.length - 1; i > p; i--) {
							$scope.monan.mo_ta[i + 1] = $scope.monan.mo_ta[i];
						}
						$scope.monan.mo_ta[p + 1] = {
							'type' : 'text'
						};
					};
					$scope.addNhahang = function() {
						i = $scope.monan.danh_sach_nha_hang.length;
						$scope.monan.danh_sach_nha_hang[i] = {
							'ten' : $scope.tenNH,
							'diachi' : $scope.diachiNH
						};
					};

					$scope.addTitle = function(it) {
						p = findLocation($scope.monan.mo_ta, it);
						for (var i = $scope.monan.mo_ta.length - 1; i > p; i--) {
							$scope.monan.mo_ta[i + 1] = $scope.monan.mo_ta[i];
						}
						$scope.monan.mo_ta[p + 1] = {
							'type' : 'title'
						};
					};

					$scope.addImgI = function(p) {
						for (var i = $scope.monan.mo_ta.length - 1; i > p; i--) {
							$scope.monan.mo_ta[i + 1] = $scope.monan.mo_ta[i];
						}
						$scope.monan.mo_ta[p + 1] = {
							'type' : 'img',
							'content' : null
						};
					};

					$scope.addTextI = function() {
						for (var i = $scope.monan.mo_ta.length - 1; i > p; i--) {
							$scope.monan.mo_ta[i + 1] = $scope.monan.mo_ta[i];
						}
						$scope.monan.mo_ta[p + 1] = {
							'type' : 'text',
							'content' : null
						};
					};

					$scope.del = function(it) {
						p = findLocation($scope.monan.mo_ta, it);
						$scope.monan.mo_ta.splice(p, 1);
					};

					$scope.delNhahang = function(it) {
						p = findLocation($scope.monan.danh_sach_nha_hang, it);
						$scope.monan.danh_sach_nha_hang.splice(p, 1);
					};

					findLocation = function(arr, it) {
						for (var i = 0; i < arr.length; i++) {
							if (arr[i] == it) {
								return i;
							}
						}
					};

					$scope.addtag = function() {
						$scope.monan.tag.push($scope.temptag);
						$scope.temptag = null;
					};

					$scope.removetag = function(tag) {
						p = findLocation($scope.monan.tag, tag);
						$scope.monan.tag.splice(p, 1);
					};
				});
