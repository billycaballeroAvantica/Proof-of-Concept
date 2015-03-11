//
//  AVTHTTPError.h
//  Common
//
//  Created by Alex Gutierrez on 2/25/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "AVTBaseError.h"

@interface AVTHTTPError : AVTBaseError

@property (strong, nonatomic) NSURLRequest *request;
@property (strong, nonatomic) NSHTTPURLResponse *response;

- (instancetype)initWithRequest:(NSURLRequest *)request response:(NSHTTPURLResponse *)response error:(NSError *)error;


@end
