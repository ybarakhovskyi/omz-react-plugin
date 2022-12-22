local pluginFolder="${0%/*}"

source "$pluginFolder/addReactLib.sh"
source "$pluginFolder/addComponentExport.sh"

# Creates new folder and component by given name
function makeComponent() {
  local componentName=$1
  local fileExt=$2
  local componentPath="./$1"
  local componentFile="${componentName}.${fileExt}x"

  mkdir -p $componentName && cd $componentPath
  echo "export { default } from '${componentPath}';" >> "index.${fileExt}"

  touch "${componentFile}"
  addReactLib $componentFile

  echo "$pluginFolder $fileExt"

  if [[ "${fileExt}" == "ts" ]]; then
    echo "Creating typed ${componentName} component ..."
    source "$pluginFolder/makeTypedComponent.sh"
    makeTypedComponent $componentName $componentFile
  else
    echo "JavaScript component creating..."
    source "$pluginFolder/makeUntypedComponent.sh"
    makeUntypedComponent $componentName $componentFile
  fi

  addComponentExport $componentName $componentFile
}
