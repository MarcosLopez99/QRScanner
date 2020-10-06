#!/bin/bash
set -e
set -x

project_path=$(pwd) 
name=$PROJECT_NAME 
dir=$(dirname "${0}")

# parseJSON.js
appID=$(${dir}/parseJSON.js $project_path iosAppID)

echo "$appID \n $projecy_path \n $name \n $dir"

# Dependencies
yarn add react-native-camera@git+https://git@github.com/react-native-community/react-native-camera.git
react-native link react-native-camera

npm install react-native-qrcode-scanner --save
react-native link react-native-qrcode-scanner


# Podfile
cd ios

sed -i.bak '/RNCPushNotificationIOS/a\
  \  pod "react-native-camera", :path => "../node_modules/react-native-camera"
  ' Podfile

pod install

cd $name

# info.plist
plutil -insert GADApplicationIdentifier -string $appID info.plist

echo "configured iOS settings"





