//
//  AVTBaseFactory.m
//  Common
//
//  Created by Alex Gutierrez on 11/29/13.
//  Copyright (c) 2013 Avantica Technologies. All rights reserved.
//

#import "AVTBaseFactory.h"

@implementation AVTBaseFactory

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

@end
