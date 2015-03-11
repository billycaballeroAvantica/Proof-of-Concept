//
//  AVTBaseAppearanceManager.m
//  Common
//
//  Created by Alex Gutierrez on 1/25/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "AVTBaseAppearanceManager.h"

@implementation AVTBaseAppearanceManager

#pragma mark -
#pragma mark Initialization
#pragma mark -

+ (instancetype)sharedManager
{
    static id _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self class] new];
    });
    return _sharedManager;
}

#pragma mark -
#pragma mark Public Methods
#pragma mark -

- (void)setAppearance
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

@end
