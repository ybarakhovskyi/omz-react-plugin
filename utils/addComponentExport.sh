function addComponentExport() {
  local component="$1"
  local componentFile="$2"

  echo "export default ${component};" >> $componentFile
}
