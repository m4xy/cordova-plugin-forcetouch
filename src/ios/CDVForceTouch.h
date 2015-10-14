#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

@interface CDVForceTouch : CDVPlugin;

@property UIForceTouchCapability forceTouchCapability;
@property NSUInteger tapCount;
@property NSTimeInterval timestamp;
@property UITouchPhase phase;
@property CGFloat force;
@property CGFloat maximumPossibleForce;

- (void)getForceTouchData:(CDVInvokedUrlCommand*)command;
@end
