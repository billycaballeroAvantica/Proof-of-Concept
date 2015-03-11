//
//  AVTAlertViewFactory.h
//  Common
//
//  Created by Alex Gutierrez on 11/12/13.
//  Copyright (c) 2013 Avantica Technologies. All rights reserved.
//

#import "AVTBaseFactory.h"

@class PFError;
@class PFSessionExpiredError;

extern NSInteger const kPFAlertViewSessionExpiredTag;

@interface AVTAlertViewFactory : AVTBaseFactory

- (UIAlertView *)alertViewWithTitle:(NSString *)title andMessage:(NSString *)message;

@end
