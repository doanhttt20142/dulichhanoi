/**
 * 
 */
dulichapp.controller('detailmonanCtrl', function($scope, $http, $routeParams) {
	$scope.id = $routeParams.id;

	$scope.folderimgs = FOLDER_IMGS;

	$scope.monan = null;

	$scope.result = null;

	$scope.refresh = function() {
		$http.get(HOST_SERVER + 'crud/detail/monan/' + $scope.id).success(
				function(data, status, headers, config) {
					$scope.monan = data;
					$scope.monan.mo_ta = JSON.parse($scope.monan.mo_ta);
					$scope.monan.danh_sach_nha_hang = JSON
							.parse($scope.monan.danh_sach_nha_hang);

					$scope.monan.album = JSON.parse($scope.monan.album);
				});
	};

	$scope.refresh();
});