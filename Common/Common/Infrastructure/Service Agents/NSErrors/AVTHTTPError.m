//
//  AVTHTTPError.m
//  Common
//
//  Created by Alex Gutierrez on 2/25/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "AVTHTTPError.h"

@implementation AVTHTTPError

#pragma mark -
#pragma mark Initialization
#pragma mark -

- (id)initWithRequest:(NSURLRequest *)request response:(NSHTTPURLResponse *)response error:(NSError *)error
{
    NSDictionary *userInfo = @{
                               NSLocalizedFailureReasonErrorKey : (error.localizedFailureReason == nil) ? @"" : error.localizedFailureReason,
                               NSLocalizedDescriptionKey : (error.localizedDescription == nil) ? @"" : error.localizedDescription
                               };
    
    if(self = [super initWithDomain:kAVTErrorDomain code:response.statusCode userInfo:userInfo]) {
        self.request = request;
        self.response = response;
    }
    
    return self;
}

@end

