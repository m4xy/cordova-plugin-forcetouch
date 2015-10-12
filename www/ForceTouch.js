var exec = require('cordova/exec');
var ForceTouch = function (){};
ForceTouch.prototype.getForceTouchData = function(onSuccess) { exec(onSuccess, null, "ForceTouch", "getForceTouchData", []); };
module.exports = new ForceTouch();
