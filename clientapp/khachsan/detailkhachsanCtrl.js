
/**
*
*/
dulichapp.controller('detailkhachsanCtrl', function($scope, $http, $routeParams) {
	$scope.id = $routeParams.id;
	
	$scope.folderimgs = FOLDER_IMGS + 'khachsan/';
	
	$scope.khachsan = null;
	
	$scope.result = null;
	
	$scope.basicUsageOptions = {
			$AutoPlay: true
	};
	
	$scope.refresh = function() {
		$http.get(HOST_SERVER + 'crud/detail/khachsan/' + $scope.id).success(function(data, status, headers, config) {
			$scope.khachsan = data;
			$scope.khachsan.mo_ta = JSON.parse($scope.khachsan.mo_ta);
			$scope.khachsan.album = JSON.parse($scope.khachsan.album);
		});
	};
	
	$scope.refresh();
	
});