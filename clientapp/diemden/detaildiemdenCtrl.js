/**
 *
 */
dulichapp.controller('detaildiemdenCtrl', function($scope, $http, $routeParams) {
	$scope.id = $routeParams.id;
	
	$scope.folderimgs = FOLDER_IMGS;
	
	$scope.diemden = null;
	
	$scope.result = null;
	
	$scope.basicUsageOptions = {
			$AutoPlay: true
	};
	
	$scope.refresh = function() {
		$http.get(HOST_SERVER + 'crud/detail/diemden/' + $scope.id).success(function(data, status, headers, config) {
			$scope.diemden = data;
			$scope.diemden.mo_ta = JSON.parse($scope.diemden.mo_ta);
			$scope.diemden.album = JSON.parse($scope.diemden.album);
		});
	};
	
	$scope.refresh();
	
});