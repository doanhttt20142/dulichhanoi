/**
 *
 */
dulichapp.controller('detailgiaitriCtrl', function($scope, $http, $routeParams) {
	$scope.id = $routeParams.id;
	
	$scope.folderimgs = FOLDER_IMGS + 'giaitri/';
	
	$scope.giaitri = null;
	
	$scope.result = null;
	
	$scope.basicUsageOptions = {
			$AutoPlay: true
	};
	
	$scope.refresh = function() {
		$http.get(HOST_SERVER + 'crud/detail/giaitri/' + $scope.id).success(function(data, status, headers, config) {
			$scope.giaitri = data;
			$scope.giaitri.mo_ta = JSON.parse($scope.giaitri.mo_ta);
			$scope.giaitri.album = JSON.parse($scope.giaitri.album);
		});
	};
	
	$scope.refresh();
	
});