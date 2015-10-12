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
    if(ForceTouch.isSupported)
    {
      console.log('tapCount: '+ForceTouch.tapCount);
      console.log('timestamp: '+ForceTouch.timestamp);
      console.log('phase: '+ForceTouch.phase);
      console.log('force: '+ForceTouch.force);
      console.log('maximumPossibleForce: '+ForceTouch.maximumPossibleForce);
    }
    else
      console.log('Force Touch not available on your device.');
```
Install iOS platform

    cordova platform add ios

Run the code

    cordova run

## Author
Matteo Pisani
e-mail: matteo.pisani.91@gmail.com
linkedin: www.linkedin.com/in/matteopisani
