/**
 * 
 */
dulichapp.controller('topdiemdenCtrl', function($scope, $http) {
	D = 5;
	column = 'viewcount';
	$scope.countRecord;
	$scope.data = [];
	
	$scope.hasMore = true;
	
	$scope.folderimgs = FOLDER_IMGS;
	
	$scope.loadmore = function(){
		$http.get(HOST_SERVER + 'crud/top/diemden/' + column + '/' + $scope.data.length +'/' + D).success(function(data, status, headers, config) {
			$scope.data = $scope.data.concat(data);
			if ($scope.data.length >= $scope.countRecord)
				$scope.hasMore = false;
			else
				$scope.hasMore = true;
		});
	};
	
	$scope.getCountRecord = function() {
		$http.get(HOST_SERVER + 'crud/countRecord/diemden/').success(function(data, status, headers, config) {
			$scope.countRecord = data;
		});
	};
	
	$scope.rateCollumn = function() {
		if (column == 'rate')
			return;
		column = 'rate';
		$scope.data = [];
		$scope.getCountRecord();
		$scope.loadmore();
	};
	
	$scope.viewCollumn = function() {
		if (column == 'viewcount')
			return;
		column = 'viewcount';
		$scope.data = [];
		$scope.getCountRecord();
		$scope.loadmore();
	};
	
	$scope.getCountRecord();
	
	$scope.loadmore();
});