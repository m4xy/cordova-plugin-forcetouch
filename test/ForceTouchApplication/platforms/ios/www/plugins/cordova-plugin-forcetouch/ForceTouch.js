cordova.define("cordova-plugin-forcetouch.ForceTouch", function(require, exports, module) { var exec = require('cordova/exec');
var ForceTouch = function (){ exec(null, null, "ForceTouch", "initForceTouchPlugin", []); };
ForceTouch.prototype.getForceTouchData = function(onData) { exec(onData, null, "ForceTouch", "getForceTouchData", []); };
module.exports = new ForceTouch();

});
