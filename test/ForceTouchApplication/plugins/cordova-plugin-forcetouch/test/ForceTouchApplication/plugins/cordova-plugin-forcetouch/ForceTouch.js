var exec = require('cordova/exec');
var ForceTouch = function (){ exec(null, null, "ForceTouch", "initForceTouchDataRecognizer", []); };
ForceTouch.prototype.getForceTouchData = function(onData) { exec(onData, null, "ForceTouch", "getForceTouchData", []); };
module.exports = new ForceTouch();
