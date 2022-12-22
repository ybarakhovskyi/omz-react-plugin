function makeUntypedComponent() (
  local componentName=$1
  local componentFile=$2

  echo "
const ${componentName} = () => (
  <div>${componentName} body</div>
);

${componentName}.propTypes = {};
" >> "${componentFile}"
)
