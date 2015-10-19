/*
 * Project: cordova-plugin-forcetouch
 * Version: 1.2.2
 * File: CDVForceTouch.h
 * Author: Matteo Pisani
 * E-Mail: matteo.pisani.91@gmail.com
 * Linkedin: https://www.linkedin.com/in/matteopisani
 */

#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

@interface CDVForceTouch : CDVPlugin;
- (void)getForceTouchData:(CDVInvokedUrlCommand*)command;
@end
@class CDVForceTouchRecognizer;
@interface CDVForceTouchRecognizer : UIGestureRecognizer { CDVForceTouchRecognizer * ForceTouchRecognizer; }
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
@end
static NSMutableDictionary *ForceTouchPoints;
static UIForceTouchCapability forceTouchCapability;
