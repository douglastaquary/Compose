fastlane documentation
================
# Installation
```
sudo gem install fastlane
```
# Available Actions
## iOS
### ios change_version_number
```
fastlane ios change_version_number
```
Change version number with prompt
### ios patch
```
fastlane ios patch
```
Create pull request to publish new Pod version

Increment Patch version
### ios minor
```
fastlane ios minor
```
Increment minor version
### ios major
```
fastlane ios major
```
Increment major version
### ios validate_pr
```
fastlane ios validate_pr
```
This lane is just testing the app and checked if the podspec validate

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [https://fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [GitHub](https://github.com/fastlane/fastlane/tree/master/fastlane).
