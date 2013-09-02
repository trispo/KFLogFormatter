# KFLogFormatter

[![Version](http://cocoapod-badges.herokuapp.com/v/KFLogFormatter/badge.png)](http://cocoadocs.org/docsets/KFLogFormatter)
[![Platform](http://cocoapod-badges.herokuapp.com/p/KFLogFormatter/badge.png)](http://cocoadocs.org/docsets/KFLogFormatter)

A log message formatter for CocoaLumberjack.

The KFLogFormatter class provides a log formatter for the CocoaLunmberjack  
logging framework. It formats messages in the form:

    LOG_LEVEL  DATE, TIME -[CLASSNAME METHOD][Line LINE_NUMBER] LOG_MESSAGE
## Usage

To run the example project; clone the repo, and run `pod install` from the Project directory first.

------
The Formatter can be included into your project by importing the header:
```Obj-C
#import <KFLogFormatter/KFLogFormatter.h>
```
defining ddLogLevel:
```Obj-C
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
```
and setting it as log formatter:
```Obj-C
[DDLog addLogger:[DDTTYLogger sharedInstance]];
[[DDTTYLogger sharedInstance] setLogFormatter:[KFLogFormatter new]];
```


## Requirements
CocoaLumberjack 1.6

## Installation

KFLogFormatter is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "KFLogFormatter"

## Author

Gunnar Herzog, gunnar.herzog@kf-interactive.com

## License

KFLogFormatter is available under the MIT license. See the LICENSE file for more info.

