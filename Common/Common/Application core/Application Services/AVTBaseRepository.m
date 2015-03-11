//
//  AVTBaseRepository.m
//  Common
//
//  Created by Alex Gutierrez on 11/12/13.
//  Copyright (c) 2013 Avantica Technologies. All rights reserved.
//

#import "AVTBaseRepository.h"


@interface AVTBaseRepository ()

@end

@implementation AVTBaseRepository

#pragma mark -
#pragma mark Initialization
#pragma mark -

+ (instancetype)sharedRepository
{
    static id _sharedRepository = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedRepository = [[self class] new];
    });
    return _sharedRepository;
}

@end
