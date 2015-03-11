//
//  ErrorFactory.m
//  Common
//
//  Created by Alex Gutierrez on 11/29/13.
//  Copyright (c) 2013 Avantica Technologies. All rights reserved.
//

#import "AVTErrorFactory.h"

@implementation AVTErrorFactory

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

- (AVTHTTPError *)HTTPErrorWithAFNetworkingFailureError:(NSError *)error requestOperation:(AFHTTPRequestOperation *)operation
{
    AVTHTTPError *baseError = [[AVTHTTPError alloc] initWithRequest:operation.request response:operation.response error:error];
    
    return baseError;
}

- (AVTConnectivityError *)connectivityError
{
    AVTConnectivityError *connectivityError = [[AVTConnectivityError alloc] init];
    return connectivityError;
}

- (NSError *)createErrorWithDomain:(NSString *)domain
                              code:(int)code
                       description:(NSString *)description
{
    NSError *error = [NSError errorWithDomain:domain code:code userInfo:@{NSLocalizedDescriptionKey : description}];
    
    return error;
}

@end
