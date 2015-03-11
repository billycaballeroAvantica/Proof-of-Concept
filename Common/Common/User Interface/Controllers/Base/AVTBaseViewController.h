//
//  AVTBaseViewController.h
//  Common
//
//  Created by Alex Gutierrez on 11/12/13.
//  Copyright (c) 2013 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVTBaseViewController : UIViewController

- (void)backToPreviousView;
- (MRProgressOverlayView *)showOverlayWithMessage:(NSString *)message;
- (void)dismissOverlay;

@end
