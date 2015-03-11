//
//  ErrorFactory.h
//  DataCenterOperations
//
//  Created by Alex Gutierrez on 11/29/13.
//  Copyright (c) 2013 Avantica Technologies. All rights reserved.
//

#import "AVTBaseFactory.h"

#import "AVTConnectivityError.h"
#import "AVTHTTPError.h"

@class AFHTTPRequestOperation;

@interface AVTErrorFactory : AVTBaseFactory

- (AVTConnectivityError *)connectivityError;
- (AVTHTTPError *)HTTPErrorWithAFNetworkingFailureError:(NSError *)error requestOperation:(AFHTTPRequestOperation *)operation;

- (NSError *)createErrorWithDomain:(NSString *)domain
                              code:(int)code
                       description:(NSString *)description;

@end
