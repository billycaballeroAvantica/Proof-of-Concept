//
//  AVTAlertViewFactory.m
//  Common
//
//  Created by Alex Gutierrez on 11/12/13.
//  Copyright (c) 2013 Avantica Technologies. All rights reserved.
//

#import "AVTAlertViewFactory.h"
#import "AVTErrorFactory.h"

static NSString *const kAVTAlertViewDefaultCancelButtonTitle = @"OK";

@implementation AVTAlertViewFactory

#pragma mark -
#pragma mark Initialization
#pragma mark -

+ (instancetype)sharedFactory
{
    static id _sharedFactory = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedFactory = [[self class] new];
    });
    return _sharedFactory;
}

#pragma mark -
#pragma mark Public Methods
#pragma mark -

- (UIAlertView *)alertViewWithTitle:(NSString *)title andMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:kAVTAlertViewDefaultCancelButtonTitle
                                              otherButtonTitles: nil];
    
    return alertView;
}

@end
