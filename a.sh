#!/bin/bash

# Función para crear elementos
create_new_item() {
  read -p "Nombre de la ruta: " routeName
  read -p "Nombre del controlador: " controllerName
  read -p "Nombre de la carpeta del controlador (dentro de script/controller/): " controllerFolderName
  read -p "Nombre del servicio: " serviceName
  read -p "Ruta del archivo de servicio (relativa a script/controller/service/): " serviceFilePathRel
  read -p "Nombre de la carpeta del formulario: " formFolderName

  projectRoot=$(dirname "$0")

  # Crear ruta en ruta.js (añadiendo al final)
  routeFilePath="$projectRoot/script/ruta.js"
  echo -e "\nconsole.log('Ruta seleccionada: $routeName');" >> "$routeFilePath"

  # Crear controlador en la carpeta controller
  controllerDir="$projectRoot/script/controller/$controllerFolderName"
  mkdir -p "$controllerDir"
  controllerFilePath="$controllerDir/$controllerName.js"
  echo -e "// Controlador: $controllerName" > "$controllerFilePath"

  # Crear servicio en la carpeta service
  # serviceDir="$projectRoot/script/controller/service"
  # mkdir -p "$serviceDir"
  # serviceFile="$serviceDir/$serviceName.js"
  # serviceFilePath="$serviceDir/$serviceFilePathRel"
  # echo -e "console.log('servicio');" > "$serviceFilePath"

  # Crear archivo HTML en la carpeta especificada de form
  formDir="$projectRoot/form/$formFolderName"
  mkdir -p "$formDir"
  formFilePath="$formDir/$routeName.html"
  echo -e "<!-- HTML para $routeName -->" > "$formFilePath"

  echo "Elementos creados exitosamente"
}

# Llamar a la función para crear elementos
create_new_item
