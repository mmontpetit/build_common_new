# Default Values
_artifacts=${CIRCLE_ARTIFACTS:-.}
_build_number=${BUILD_NUMBER:-0}

VER=$(node -e "console.log(require('./package.json').version.replace(/-[0-9]+/, '-${_build_number}'))")
echo "$VER" > ${_artifacts}/version.txt