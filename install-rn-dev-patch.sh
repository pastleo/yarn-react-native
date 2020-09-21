#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
node_modules_path="$( cd "$( yarn bin )/.." >/dev/null 2>&1 && pwd )"

if [ "$DISABLE_RN_DEV_PATCH" ]; then
  exit
fi

if [ -z "$node_modules_path" ]; then
  exit
fi

echo "node project detected"
echo "node_modules_path: $node_modules_path"

if ! [ -d "$node_modules_path/react-native" ]; then
  exit
fi

# to create patch file, from a rn project with original/modified node_modules:
# rm -rf node_modules
# DISABLE_RN_DEV_PATCH=true yarn
# cp -r node_modules node_modules-ori
# ... make changes to node_modules
# diff -Naur node_modules-ori node_modules > $DIR/rn-node-modules.patch
# rm -rf node_modules-ori

echo "react-native project detected, applying patch...."
cd "$node_modules_path/.."
patch -N -p0 < "$DIR/rn-node-modules.patch"
cd "$DIR"

echo 'Done.'
