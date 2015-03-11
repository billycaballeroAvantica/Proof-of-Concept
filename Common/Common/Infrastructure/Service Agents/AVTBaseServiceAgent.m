//
//  AVTBaseServiceAgent.m
//  Common
//
//  Created by Alex Gutierrez on 19/02/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "AVTBaseServiceAgent.h"
#import "Reachability.h"
#import "AVTErrorFactory.h"

static NSInteger const kAVTTimeoutInterval = 20.0;

static NSString *AVT_stringFromAVHTTPMethod(AVTHTTPMethod method)
{
    switch (method) {
        case AVTHTTPMethodGET:
            return @"GET";
            break;
        case AVTHTTPMethodPOST:
            return @"POST";
            break;
        case AVTHTTPMethodPUT:
            return @"PUT";
            break;
        case AVTHTTPMethodDELETE:
            return @"DELETE";
            break;
        default:
            return @"";
            break;
    }
}

@implementation AVTBaseServiceAgent

#pragma mark -
#pragma mark Initialization
#pragma mark -

#pragma mark Instance Methods

- (instancetype)init
{
    self = [self initWithBaseURL:nil];
    return self;
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    if (self = [super initWithBaseURL:url]) {
        self.requestSerializer =  [AFJSONRequestSerializer serializer];
        //self.securityPolicy.SSLPinningMode = AFSSLPinningModeNone;
    }
    
    return self;
}

#pragma mark Class Methods

+ (instancetype)sharedAgent
{
    static AVTBaseServiceAgent *_sharedAgent = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedAgent = [[AVTBaseServiceAgent alloc] initWithBaseURL:[NSURL URLWithString:nil]];
    });
    
    return _sharedAgent;
}

#pragma mark -
#pragma mark Public Methods
#pragma mark -

#pragma mark Reachability

- (BOOL)internetConnectionAvailable
{
    Reachability *internetReachability = [Reachability reachabilityForInternetConnection];
    BOOL isReachable = [internetReachability isReachable];
    return isReachable;
}

#pragma mark Service Calls

- (void)callServiceWithURL:(NSString *)URLString
                httpMethod:(AVTHTTPMethod)httpMethod
                parameters:(NSDictionary *)parameters
               translation:(id (^)(id))translation
           successCallback:(void (^)(id translatedObject))success
           failureCallback:(void (^)(NSError *))failure
{
    if (![self internetConnectionAvailable]) {
        AVTConnectivityError *noConnectivityError = [[AVTErrorFactory sharedFactory] connectivityError];
        if (failure != nil) {
            failure(noConnectivityError);
        }
        return;
    }
    
    NSString *httpMethodString = AVT_stringFromAVHTTPMethod(httpMethod);
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:httpMethodString
                                                                   URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString]
                                                                  parameters:parameters
                                                                       error:nil];
    request.timeoutInterval = kAVTTimeoutInterval;
    
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request
                                                                      success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                                          
                                                                        #if DEBUG
                                                                          NSLog(@"RESPONSE: %@", operation.response);
                                                                          NSLog(@"RESPONSE OBJECT: %@", responseObject);
                                                                        #endif
                                                                          
                                                                          id translatedObject = (translation != nil)? translation(responseObject) : nil;
                                                                          
                                                                          dispatch_async(dispatch_get_main_queue(), ^{
                                                                              if (success != nil) {
                                                                                  success(translatedObject);
                                                                              }
                                                                          });
                                                                          
                                                                      }
                                                                      failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                                          
                                                                        #if DEBUG
                                                                          NSLog(@"RESPONSE: %@", operation.response);
                                                                          NSLog(@"ERROR: %@", error);
                                                                        #endif
                                                                          
                                                                          AVTBaseError *baseError = [[AVTErrorFactory sharedFactory] HTTPErrorWithAFNetworkingFailureError:error requestOperation:operation];
                                                                          
                                                                          dispatch_async(dispatch_get_main_queue(), ^{
                                                                              if (failure != nil) {
                                                                                  failure(baseError);
                                                                              }
                                                                          });
                                                                      }];
    
    [self.operationQueue addOperation:operation];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [operation start];
    });
}

@end
