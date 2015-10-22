# WinObjC-Samples
Samples for #WinObjC (aka Project Islandwood or Bridge for iOS)

How to run the samples.

1. Download and install WinObjC in your windows machine (https://github.com/Microsoft/WinObjC). If you don't to build the bridge just grab the latest binaries and install them.
2. Clone the repo in your windows machine
3. Set the WINOBJC_HOME environment variable to the value where WinObjC is installed (e.g. C:\WinObjC).
4. Go to the folder where you cloned this repo
5. Run the import.bat file. This **will copy** the contents of the XCode folder in a folder called test.
6. Run the create.bat file with the project you want to import (name of subfolder in the new test folder created in previous step) (e.g. create ViewUris).
7. VSImporter.exe should be invoked and a .sln file should be created in the corresponding subfolder of text).
8. Open Visual Studio 2015 and just hit F5.

All samples work both with XCode and the iOS simulator and with Visual Studio 2015 and Windows 10 when converted with WinObjC.  Conditional compilation with WINOBJC define is used to achieve this.
