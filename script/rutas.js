angularAppAQ.config(['$routeProvider', function ($routeProvider) {

    $routeProvider.when('/stiff', {
        templateUrl: 'form/reportesGeneral/stiff.html?i=' + Math.random().toString(36).slice(2),
        controller: 'stiffController',
        resolve: {
            lazy: ['$ocLazyLoad', function ($ocLazyLoad) {
                return $ocLazyLoad.load([{
                    name: APPNAME,
                    files: ['script/controller/reportesGeneral/stiff.js?i=' + Math.random().toString(36).slice(2)]
                }]);
            }]
        }
    });

    $routeProvider.otherwise({
        redirectTo: '/404'
    });
}]);
