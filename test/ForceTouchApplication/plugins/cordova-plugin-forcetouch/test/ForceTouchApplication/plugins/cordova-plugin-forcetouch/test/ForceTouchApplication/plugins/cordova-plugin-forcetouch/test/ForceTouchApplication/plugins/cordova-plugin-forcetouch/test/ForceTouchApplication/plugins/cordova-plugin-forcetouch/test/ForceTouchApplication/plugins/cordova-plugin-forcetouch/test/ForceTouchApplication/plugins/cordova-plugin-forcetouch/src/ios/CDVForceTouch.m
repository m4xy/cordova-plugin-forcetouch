#import <Cordova/CDV.h>
#import "CDVForceTouch.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface CDVForceTouch () {}
@end

@implementation CDVForceTouch

- (void)initForceTouchDataRecognizer:(CDVInvokedUrlCommand*)command
{
    forceTouchCapability = [self.webView.traitCollection forceTouchCapability];
    CDVForceTouchRecognizer * ForceTouchRecognizer = [[CDVForceTouchRecognizer alloc] initWithTarget:self action:nil];
    ForceTouchRecognizer.delegate = self;
    self.webView.multipleTouchEnabled = NO;
    [self.webView setUserInteractionEnabled:YES];
    [self.webView addGestureRecognizer: ForceTouchRecognizer];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getForceTouchData:(CDVInvokedUrlCommand*)command
{
    NSDictionary* ForceTouchData = [self ForceTouchData];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:ForceTouchData];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (NSDictionary*)ForceTouchData
{
    NSMutableDictionary* data = [NSMutableDictionary dictionaryWithCapacity:6];
    [data setObject:[NSString stringWithFormat:@"%ld",(long)forceTouchCapability] forKey:@"forceTouchCapability"];
    [data setObject:[NSString stringWithFormat:@"%ld",(unsigned long)tapCount] forKey:@"tapCount"];
    [data setObject:[NSString stringWithFormat:@"%f",timestamp] forKey:@"timestamp"];
    [data setObject:[NSString stringWithFormat:@"%ld",(long)phase] forKey:@"phase"];
    [data setObject:[NSString stringWithFormat:@"%f",force] forKey:@"force"];
    [data setObject:[NSString stringWithFormat:@"%f",maximumPossibleForce] forKey:@"maximumPossibleForce"];
    NSDictionary* cordovaData = [NSDictionary dictionaryWithDictionary:data];
    return cordovaData;
}

@end

@implementation CDVForceTouchRecognizer

- (void) ignoreTouch:(UITouch *)touch forEvent:(UIEvent *)event{}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self setForceTouchData:touches withEvent:event];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [self setForceTouchData:touches withEvent:event];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self restoreForceTouchData:touches withEvent:event];
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self restoreForceTouchData:touches withEvent:event];
}

- (void)setForceTouchData:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeTouches)
    {
        for (UITouch *touch in touches)
        {
            tapCount = touch.tapCount;
            timestamp = touch.timestamp;
            phase = touch.phase;
            force = touch.force/touch.maximumPossibleForce;
            maximumPossibleForce = touch.maximumPossibleForce;
        }
    }
}

- (void)restoreForceTouchData:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    tapCount = 0;
    timestamp = 0.0;
    phase = 0;
    force = 0.0;
    maximumPossibleForce = 0.0;
}

@end
