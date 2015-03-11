//
//  AVTBaseServiceAgent.h
//  Common
//
//  Created by Alex Gutierrez on 19/02/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "AVTErrorFactory.h"

typedef enum _AVTHTTPMethod {
    AVTHTTPMethodGET = 0,
    AVTHTTPMethodPOST = 1,
    AVTHTTPMethodPUT = 2,
    AVTHTTPMethodDELETE = 3
} AVTHTTPMethod;

@interface AVTBaseServiceAgent : AFHTTPRequestOperationManager

- (instancetype)initWithBaseURL:(NSURL *)url;

+ (instancetype)sharedAgent;

- (BOOL)internetConnectionAvailable;

- (void)callServiceWithURL:(NSString *)URLString
                httpMethod:(AVTHTTPMethod)httpMethod
                parameters:(NSDictionary *)parameters
               translation:(id (^)(id responseObject))translation
           successCallback:(void (^)(id translatedObject))success
           failureCallback:(void (^)(NSError *error))failure;

@end
