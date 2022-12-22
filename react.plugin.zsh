# Plugin for interacting with React components.

# Main plugin function
function react() (
  local pluginFolder="$ZSH_CUSTOM/plugins/${0%/*}"
  local componentName=""
  local makeComponentFlag="false"
  local fileExt="js"

  while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
    case $1 in
      -h | --help)
        source "$pluginFolder/utils/showHelp.sh"
        showHelp
        exit
        ;;
      -c | --component )
        shift
        componentName=$1
        makeComponentFlag="true"
        ;;
      -ts | --typescript )
        fileExt="ts"
        ;;
      --)
        shift
        break
        ;;
      -?*)
        printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
        ;;
      *)
        break
        ;;
    esac;

    shift;
  done

  if [[ "$makeComponentFlag" == "true" ]]; then
    source "$pluginFolder/utils/makeComponent.sh"

    makeComponent $componentName $fileExt
  fi
)

# Aliases
alias remc='react -c'
alias remtc='react -ts -c'
