#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Author: Shane Smit <CodeWeaver@DigitalLoom.org>
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# path to the ADT tool in Flash Builder sdks
#ADT="/Applications/Adobe Flash Builder 4.6/sdks/4.6.0/bin/adt"
ADT="/Applications/Adobe CS5.5 Web Premium/Adobe Flash Builder 4.6/sdks/4.6.0/bin/adt"

# name of ANE file
ANE_NAME=bin/inAppMain.ane

# native iOS project path
IOS_PROJECT=../Native/iOS/AppPurchase

# native Android project path and jar name
ANDROID_PROJECT=../Native/Android
ANDROID_JAR_NAME=IAPAndroid.jar

# Temporary ANE build location
BUILD_PATH=./aneBuild

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# Reinitalize the build location
rm -f ${ANE_NAME}
rm -rf ${BUILD_PATH}
mkdir -p ${BUILD_PATH}
mkdir -p ${BUILD_PATH}/iPhone-ARM
#mkdir -p ${BUILD_PATH}/iPhone-ARM/res
mkdir -p ${BUILD_PATH}/Android-ARM
mkdir -p ${BUILD_PATH}/Android-ARM/res
mkdir -p ${BUILD_PATH}/default

# copy native iOS resources
cp -R ./${IOS_PROJECT}/build/Debug-iphoneos/* ${BUILD_PATH}/iPhone-ARM

# copy native Android resources
cp ./${ANDROID_PROJECT}/bin/${ANDROID_JAR_NAME} ${BUILD_PATH}/Android-ARM
cp -R ./${ANDROID_PROJECT}/res ${BUILD_PATH}/Android-ARM

# Extract 'libary.swf' from the SWC archive
unzip -q ./bin/AS.swc -d ${BUILD_PATH}
cp ${BUILD_PATH}/library.swf ${BUILD_PATH}/iPhone-ARM
cp ${BUILD_PATH}/library.swf ${BUILD_PATH}/Android-ARM
cp ${BUILD_PATH}/library.swf ${BUILD_PATH}/default
#rm ${BUILD_PATH}/library.swf
#rm ${BUILD_PATH}/catalog.xml

# Build the .ane library
#"$ADT" -package -storetype PKCS12 -keystore ./cert.p12 -storepass password -tsa none \
"$ADT" -package \
		-target ane \
		${ANE_NAME} \
		./src/extension.xml \
		-swc ./bin/AS.swc \
		-platform iPhone-ARM -C ${BUILD_PATH}/iPhone-ARM/ . \
		-platform Android-ARM -C ${BUILD_PATH}/Android-ARM/ . \
		-platform default -C ${BUILD_PATH}/default .

# Clean up the temporary build location.
rm -rf ${BUILD_PATH}
