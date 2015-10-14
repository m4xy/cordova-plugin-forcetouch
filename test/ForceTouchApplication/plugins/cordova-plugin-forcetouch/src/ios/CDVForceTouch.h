#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

@interface CDVForceTouch : CDVPlugin
@property(nonatomic, readonly) UIForceTouchCapability forceTouchCapability;
@property(nonatomic, readonly) NSUInteger tapCount;
@property(nonatomic, readonly) NSTimeInterval timestamp;
@property(nonatomic, readonly) UITouchPhase phase;
@property(nonatomic, readonly) CGFloat force;
@property(nonatomic, readonly) CGFloat maximumPossibleForce;

- (void)getForceTouchData:(CDVInvokedUrlCommand*)command;
@end
