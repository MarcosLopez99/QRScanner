#!/bin/bash
set -e
set -x

project_path=$(pwd) 
dir=$(dirname "${0}")

# parseJSON.js
appID=$(${dir}/parseJSON.js $project_path andAppID)

# Dependencies
yarn add react-native-camera@git+https://git@github.com/react-native-community/react-native-camera.git
react-native link react-native-camera

npm install react-native-qrcode-scanner --save
react-native link react-native-qrcode-scanner


# build.gradle
cd android/app

sed -i.bak '/defaultConfig {/a\
missingDimensionStrategy "react-native-camera", "general"
' build.gradle

sed -i.bak '/defaultConfig {/a\
  missingDimensionStrategy "react-native-camera", "mlkit"
' build.gradle


echo "configured Android settings"


