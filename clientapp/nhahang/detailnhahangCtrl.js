/**
 *
 */
dulichapp.controller('detailnhahangCtrl', function($scope, $http, $routeParams) {
	$scope.id = $routeParams.id;
	
	$scope.folderimgs = FOLDER_IMGS + 'nhahang/';
	
	$scope.nhahang = null;
	
	$scope.result = null;
	
	$scope.basicUsageOptions = {
			$AutoPlay: true
	};
	
	$scope.refresh = function() {
		$http.get(HOST_SERVER + 'crud/detail/nhahang/' + $scope.id).success(function(data, status, headers, config) {
			$scope.nhahang = data;
			$scope.nhahang.mo_ta = JSON.parse($scope.nhahang.mo_ta);
			$scope.nhahang.album = JSON.parse($scope.nhahang.album);
		});
	};
	
	$scope.refresh();
	
});