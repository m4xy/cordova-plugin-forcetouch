#import <Cordova/CDV.h>
#import "CDVForceTouch.h"

@interface CDVForceTouch () {}
@end

@implementation CDVForceTouch

- (void)pluginInitialize
{
    self.forceTouchCapability = [self.webView.traitCollection forceTouchCapability];
    UITapGestureRecognizer *ForceTouch = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    ForceTouch.numberOfTapsRequired = 1;
    ForceTouch.delegate = self;
    [self.webView addGestureRecognizer:ForceTouch];
}

- (void)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    self.tapCount = touch.tapCount;
    self.timestamp = touch.timestamp;
    self.phase = touch.phase;
    self.force = touch.force;
    self.maximumPossibleForce = touch.maximumPossibleForce;

    NSDictionary* ForceTouchData = [self ForceTouchData];
    for (id key in ForceTouchData)
        NSLog(@"key: %@, value: %@ \n", key, [ForceTouchData objectForKey:key]);
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
    [data setObject:[NSString stringWithFormat:@"%ld",(long)self.forceTouchCapability] forKey:@"forceTouchCapability"];
    [data setObject:[NSString stringWithFormat:@"%ld",(unsigned long)self.tapCount] forKey:@"tapCount"];
    [data setObject:[NSString stringWithFormat:@"%f",self.timestamp] forKey:@"timestamp"];
    [data setObject:[NSString stringWithFormat:@"%ld",(long)self.phase] forKey:@"phase"];
    [data setObject:[NSString stringWithFormat:@"%f",self.force] forKey:@"force"];
    [data setObject:[NSString stringWithFormat:@"%f",self.maximumPossibleForce] forKey:@"maximumPossibleForce"];
    NSDictionary* cordovaData = [NSDictionary dictionaryWithDictionary:data];
    return cordovaData;
}

@end
