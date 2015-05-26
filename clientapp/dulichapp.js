/**
 * Khai báo module dulichapp
 * Khai báo các hằng số chung được dùng trong chương trình
 */
var dulichapp = angular.module("dulichapp", ["ngRoute","ngFileUpload", "angular-carousel"]);
var BASE_LINK_APP = "http://localhost:81/dulichhanoi/clientapp/";
var HOST_SERVER = "http://localhost:81/dulichhanoi/index.php/";
var FOLDER_IMGS = "http://localhost:81/dulichhanoi/imgs/";

dulichapp.config(["$routeProvider", function($routeProvider) {
	$routeProvider
	.when('/index.html', {
		templateUrl: "menu/menu.html",
		controller: "menuCtrl"
	})
	.when('/khachsan', {
		templateUrl: "khachsan/topkhachsan.html",
		controller: "topkhachsanCtrl"
	})
	.when('/khachsan/:id', {
		templateUrl: "khachsan/detailkhachsan.html",
		controller: "detailkhachsanCtrl"
	})
	.when('/nhahang', {
		templateUrl: "nhahang/topnhahang.html",
		controller: "topnhahangCtrl"
	})
	.when('/nhahang/add', {
		templateUrl: "nhahang/addnhahang.html",
		controller: "addnhahangCtrl"
	})
	.when('/nhahang/:id', {
		templateUrl: "nhahang/detailnhahang.html",
		controller: "detailnhahangCtrl"
	})
	.when('/diemden', {
		templateUrl: "diemden/topdiemden.html",
		controller: "topdiemdenCtrl"
	})
	.when('/diemden/add', {
		templateUrl: "diemden/adddiemden.html",
		controller: "adddiemdenCtrl"
	})
	.when('/diemden/:id', {
		templateUrl: "diemden/detaildiemden.html",
		controller: "detaildiemdenCtrl"
	})
	.when('/diemden/:id/update', {
		templateUrl: "diemden/updatediemden.html",
		controller: "detaildiemdenCtrl"
	})
	.when('/monan', {
		templateUrl: "monan/topmonan.html",
		controller: "topmonanCtrl"
	})
	.when('/monan/add', {
		templateUrl: "monan/addmonan.html",
		controller: "addmonanCtrl"
	})
	.when('/monan/:id', {
		templateUrl: "monan/detailmonan.html",
		controller: "detailmonanCtrl"
	})
	.when('/tour', {
		templateUrl: "tour/toptour.html",
		controller: "toptourCtrl"
	})
	.when('/tour/:id', {
		templateUrl: "tour/detailtour.html",
		controller: "detailtourCtrl"
	})
	.when('/giaitri', {
		templateUrl: "giaitri/topgiaitri.html",
		controller: "topgiaitriCtrl"
	})
	.when('/giaitri/add', {
		templateUrl: "giaitri/addgiaitri.html",
		controller: "addgiaitriCtrl"
	})
	.when('/giaitri/:id', {
		templateUrl: "giaitri/detailgiaitri.html",
		controller: "detailgiaitriCtrl"
	})
	.when('/timkiem/:query', {
		templateUrl: "timkiem/searchresult.html",
		controller: "searchresultCtrl"
	})
	.otherwise({
		redirectTo: '/index.html'
	});
}]);

dulichapp.factory('dlhn_crud',function($http) {
	var crud = {};
	
	crud.add = function(category, data, recall) {
		$http({
			method : 'POST',
			url : HOST_SERVER + 'crud/add/' + category,
			data : data,
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			}
		}).success(function(res) {
			recall.call(this, res);
		});
	};
	
	
	
	return crud;
});

dulichapp.directive('script', function() {
    return {
      restrict: 'E',
      scope: false,
      link: function(scope, elem, attr) {
        if (attr.type === 'text/javascript-lazy') {
          var code = elem.text();
          var f = new Function(code);
          f();
        }
      }
    };
});

dulichapp.directive('album', function($timeout) {
	  return {
		    restrict: 'AE',
		    replace: true,
		    scope: {
		      images: '='
		    },
		    link: function(scope, elem, attrs) {
		   	 scope.currentIndex = 0; // Initially the index is at the first image
		   	 
		   	 scope.next = function() {
		   	   scope.currentIndex < scope.images.length - 1 ? scope.currentIndex++ : scope.currentIndex = 0;
		   	 };
		   	  
		   	 scope.prev = function() {
		   	   scope.currentIndex > 0 ? scope.currentIndex-- : scope.currentIndex = scope.images.length - 1;
		   	 };
		   	 
		   	 scope.$watch('currentIndex', function() {
		   		  scope.images.forEach(function(image) {
		   		    image.visible = false; // make every image invisible
		   		  });
		   		 
		   		  scope.images[scope.currentIndex].visible = true; // make the current image visible
		   		});
		    },
		    templateUrl: 'templatedir/albumtemplate.html'
		  };
});
