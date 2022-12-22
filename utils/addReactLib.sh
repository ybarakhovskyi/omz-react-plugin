function addReactLib() {
  local componentFile=$1

  echo "// Vendors
import React from 'react';" >> $componentFile
}
