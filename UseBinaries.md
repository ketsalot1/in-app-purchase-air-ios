  1. Download the zip file corresponding to the extension
  1. Unzip the contents. You should see 3 Files 1. XXX.ane (NativeExtension) 2. swc file exposing API 3. Text file mentioning extension ID
  1. Import the swc file in you projects libs so that you can call various functions provided. (Make sure the swc linkage type is external and **NOT** Merged into Code)
  1. In the app-xml of you project add following tag

> Place as a child of Main Application Tag

```xml


<extensions>

<extensionID>[Given in the text file]

Unknown end tag for &lt;/extensionID&gt;





Unknown end tag for &lt;/extensions&gt;



```
5.    While packaging provide the -extdir switch at the end of the ADT Package command for eg -extdir <Dir containing ane file>. For more Information on packging ipa using command line see http://www.riaspace.com/2011/03/packaging-air-application-for-ios-devices-with-adt-command-and-ant-script/ (ADT is a tool that comes with AIR SDK. You can find it in [SDK](AIR.md)/bin/adt)

6.    For more info see the ADC Article links on homepage.