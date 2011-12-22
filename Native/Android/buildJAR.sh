#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Author: Shane Smit <CodeWeaver@DigitalLoom.org>
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

JAR_NAME=IAPAndroid.jar

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# Remove the existing .jar file (if any)
rm -f ${JAR_NAME}
rm -f ./bin/${JAR_NAME}

# Create the JAR file
jar cf ${JAR_NAME} -C ./bin .

# Move the .jar file into the bin directory.
mv ${JAR_NAME} ./bin
