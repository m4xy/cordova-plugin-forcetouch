/*
 * Project: cordova-plugin-forcetouch
 * Version: 1.1.9
 * File: CDVForceTouch.m
 * Author: Matteo Pisani
 * E-Mail: matteo.pisani.91@gmail.com
 * Linkedin: https://www.linkedin.com/in/matteopisani
 */

#import <Cordova/CDV.h>
#import "CDVForceTouch.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface CDVForceTouch () {}
@end

@implementation CDVForceTouch

- (void)initForceTouchPlugin:(CDVInvokedUrlCommand*)command
{
    ForceTouchPoints = [NSMutableDictionary dictionary];
    forceTouchCapability = [self.webView.traitCollection forceTouchCapability];
    CDVForceTouchRecognizer * ForceTouchRecognizer = [[CDVForceTouchRecognizer alloc] initWithTarget:self action:nil];
    ForceTouchRecognizer.delegate = self;
    self.webView.multipleTouchEnabled = YES;
    [self.webView setUserInteractionEnabled:YES];
    [self.webView addGestureRecognizer: ForceTouchRecognizer];
}

- (void)getForceTouchData:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary* ForceTouchData = [NSMutableDictionary dictionaryWithCapacity:2];
    [ForceTouchData setObject:[NSString stringWithFormat:@"%ld",(long)forceTouchCapability] forKey:@"forceTouchCapability"];
    [ForceTouchData setObject:ForceTouchPoints forKey:@"touches"];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:ForceTouchData];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
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
    [self cleanForceTouchData:touches withEvent:event];
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self cleanForceTouchData:touches withEvent:event];
}

- (void)setForceTouchData:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeTouches)
    {
        NSUInteger touchIndex = 0;
        for (UITouch *touch in touches)
        {
            NSMutableDictionary* TouchData = [NSMutableDictionary dictionaryWithCapacity:5];
            [TouchData setObject:[NSString stringWithFormat:@"%ld",(unsigned long)touch.tapCount] forKey:@"tapCount"];
            [TouchData setObject:[NSString stringWithFormat:@"%f",touch.timestamp] forKey:@"timestamp"];
            [TouchData setObject:[NSString stringWithFormat:@"%ld",(long)touch.phase] forKey:@"phase"];
            if(touch.force > 0.0)
                [TouchData setObject:[NSString stringWithFormat:@"%f",touch.force/touch.maximumPossibleForce] forKey:@"force"];
            else
                [TouchData setObject:@"0.0" forKey:@"force"];
            [TouchData setObject:[NSString stringWithFormat:@"%f",touch.maximumPossibleForce] forKey:@"maximumPossibleForce"];
            NSDictionary* TouchDataObject = [NSDictionary dictionaryWithDictionary:TouchData];
            [ForceTouchPoints setObject:TouchDataObject forKey:[NSString stringWithFormat:@"%d",touchIndex++]];
        }
    }
}

- (void)cleanForceTouchData:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ForceTouchPoints = [NSMutableDictionary dictionary];
}

@end
