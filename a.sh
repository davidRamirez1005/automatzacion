#!/bin/bash
# Función para crear elementos
create_new_item() {
  read -p "Nombre de la ruta: " routeName
  read -p "Nombre del controlador: " controllerName
  read -p "Nombre de la carpeta del controlador (dentro de script/controller/): " controllerFolderName
  read -p "Nombre de la carpeta del formulario: " formFolderName
  projectRoot=$(dirname "$0")/../..
  # Cambiar al directorio raíz del proyecto
  cd "$projectRoot" || exit
  # Crear ruta en ruta.js (añadiendo al final)
  routeFilePath="script/rutas.js"
  routeConfig="\$routeProvider.when('/$routeName', {
        templateUrl: 'form/$formFolderName/$routeName.html?i=' + Math.random().toString(36).slice(2),
        controller: '${controllerName}Controller',
        resolve: {
            lazy: ['$ocLazyLoad', function (\$ocLazyLoad) {
                return \$ocLazyLoad.load([{
                    name: APPNAME,
                    files: ['script/controller/$controllerFolderName/$controllerName.js?i=' + Math.random().toString(36).slice(2)]
                }]);
            }]
        }
    });"
  echo -e "\n$routeConfig" >> "$routeFilePath"
  # Crear controlador en la carpeta controller
  controllerDir="script/controller/$controllerFolderName"
  mkdir -p "$controllerDir"
  controllerFilePath="$controllerDir/$controllerName.js"
  controllerCode="angular.module(APPNAME).controller('${controllerName}Controller', function (\$scope, configuracionGlobal, \$rootScope, servicioGeneral, servicioConfiguracion, servicioAdministracion) {
});"
  echo -e "$controllerCode" > "$controllerFilePath"
  # Crear archivo HTML en la carpeta especificada de form
  formDir="form/$formFolderName"
  mkdir -p "$formDir"
  formFilePath="$formDir/$routeName.html"
  echo -e "<!-- HTML para $routeName -->" > "$formFilePath"
  echo "Elementos creados exitosamente"
}
# Llamar a la función para crear elementos
create_new_item
