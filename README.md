### cordova-plugin-forcetouch
# Cordova iOS Force Touch Plugin

This plugin allows developer to manage Force Touch readable variables of supported Apple devices.
It returns Force Touch data, prefixed with "ForceTouch" object.

## Using
Clone the plugin

    $ git clone https://github.com/xonoxitron/cordova-plugin-forcetouch.git

Create a new Cordova Project

    $ cordova create ForceTouchApplication com.development.forcetouch ForceTouchApplication

Install the plugin

    $ cd ForceTouchApplication
    $ cordova plugin add ../cordova-plugin-forcetouch


Edit `www/js/index.js` and add the following code inside `onDeviceReady`

```js
  // call the plugin for getting ForceTouch Data object
  ForceTouch.getForceTouchData(function (ForceTouchData)
  {
    switch(ForceTouchData.forceTouchCapability)
    {
      case '0':
        alert('Force Touch Capability: Unknown');
      break;
      case '1':
        alert('Force Touch: Unavailable');
      break;
      case '2':
        alert('Force Touch: Available');
        // reading values
        alert('tapCount: '+ForceTouchData.tapCount);
        alert('timestamp: '+ForceTouchData.timestamp);
        alert('phase: '+ForceTouchData.phase);
        alert('force: '+ForceTouchData.force); // float from 0.0 to 1.0
        alert('maximumPossibleForce: '+ForceTouchData.maximumPossibleForce); // float
      break;
    }
});
```
Install iOS platform

    cordova platform add ios

Run the code

    cordova run ios

    or

    cordova run ios --device

## Apple Force Touch Documentation
```
https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITouch_Class/index.html
```

## Author
```
Matteo Pisani
e-mail: matteo.pisani.91@gmail.com
linkedin: www.linkedin.com/in/matteopisani
```
