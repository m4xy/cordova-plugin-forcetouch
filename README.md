# Cordova iOS Force Touch Plugin
### (cordova-plugin-forcetouch)

## Description
This plugin allows developer to manage Force Touch readable variables of supported Apple devices.
It returns Force Touch data, prefixed with "ForceTouch" object.

## Starting
Create a new Cordova Project

    $ cordova create ForceTouchApplication com.development.forcetouch ForceTouchApplication

## Installing the plugin (from GIT)
Clone the plugin

    $ git clone https://github.com/xonoxitron/cordova-plugin-forcetouch.git

Install the plugin

    $ cd ForceTouchApplication
    $ cordova -d plugin add ../cordova-plugin-forcetouch

Or alternatively

## Installing the plugin (from NPM)
Clone the plugin

    $ cd ForceTouchApplication
    $ git clone cordova-plugin-forcetouch

## Using

Edit `~/ForceTouchApplication/www/yourfile.js` and add the following code inside an `onDeviceReady` event

```js
// call the plugin for getting ForceTouch Data object
ForceTouch.getForceTouchData(function (ForceTouchData)
{
  var status = 'Force Touch Status: ';
  switch(ForceTouchData.forceTouchCapability)
  {
    case '0':
      alert(status + 'Unknown');
    break;
    case '1':
      alert(status + 'Unavailable');
    break;
    case '2':
      alert(status + 'Available');
      // reading values
      alert('tapCount: ' + ForceTouchData.tapCount);
      alert('timestamp: ' + ForceTouchData.timestamp);
      alert('phase: ' + ForceTouchData.phase);
      alert('force: ' + ForceTouchData.force); // float from 0.0 to 1.0
      alert('maximumPossibleForce: ' + ForceTouchData.maximumPossibleForce); // float
    break;
  }
});
```
## Testing
Install iOS platform

    cordova platform add ios

Run the code

    cordova run ios

Or

    cordova run ios --device

## Test Application

1. [Not Supported Device]

<img src="screens/iPhone5-1.PNG" width="250"/>&nbsp;

## ForceTouchData `(object)`
```json
{
  "forceTouchCapability" : "0",
  "tapCount" : "0",
  "timestamp" : "0.000000",
  "phase" : "0",                  
  "force" : "0.000000",
  "maximumPossibleForce" : "0.0"
}

Types

forceTouchCapability     (int enum) 0 || 1 || 2
tapCount                 (int)
timestamp                (float)
phase                    (int)
force                    (float) max value -> 1.0
maximumPossibleForce     (float)

```

## Apple Official Force Touch Documentation for iOS
```
https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITouch_Class/index.html
```

## Author
```
Matteo Pisani
E-mail: matteo.pisani.91@gmail.com
Linkedin: www.linkedin.com/in/matteopisani
```
