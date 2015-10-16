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

static UIForceTouchCapability forceTouchCapability;
static NSUInteger tapCount;
static NSTimeInterval timestamp;
static UITouchPhase phase;
static CGFloat force;
static CGFloat maximumPossibleForce;
