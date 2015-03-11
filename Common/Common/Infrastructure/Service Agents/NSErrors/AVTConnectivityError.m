//
//  AVTConnectivityError.m
//  Common
//
//  Created by Alex Gutierrez on 2/25/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "AVTConnectivityError.h"

static NSInteger const kAVTErrorCodeNoConnectivity = 1000;

@implementation AVTConnectivityError

#pragma mark -
#pragma mark Initialization
#pragma mark -

- (id)init
{
    NSDictionary *userInfo = @{
                               NSLocalizedFailureReasonErrorKey : AVTLS(@"No Connectivity"),
                               NSLocalizedDescriptionKey : AVTLS(@"No internet connection available")
                               };
    
    self = [super initWithDomain:kAVTErrorDomain
                            code:kAVTErrorCodeNoConnectivity
                        userInfo:userInfo];
    
    return self;
}

@end
