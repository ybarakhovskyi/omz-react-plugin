function makeTypedComponent() (
  local componentName=$1
  local componentFile=$2

  echo "
export type ${componentName}Props = {};

const ${componentName}: React.FC<${componentName}Props> = () => (
  <div>${componentName} body</div>
);
" >> "${componentFile}"
)
