/**
 * 
 */
dulichapp.controller('displayCtrl', function($scope, $route) {
	$scope.displayNavi = false;
	
	$scope.displayAd = false;
	
	$scope.$on('$routeChangeSuccess', function(next, current) {
		if(current.controller == 'menuCtrl') {
			$scope.displayAd = false;
			$scope.displayNavi = false;
		} else {
			$scope.displayAd = true;
			$scope.displayNavi = true;
		}
	});
});