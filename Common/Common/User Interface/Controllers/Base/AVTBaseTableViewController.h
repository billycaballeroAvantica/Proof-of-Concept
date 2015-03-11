//
//  AVTBaseTableViewController.h
//  Common
//
//  Created by Alex Gutierrez on 6/11/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVTAlertViewFactory.h"

@interface AVTBaseTableViewController : UITableViewController

- (void)backToPreviousView;
- (MRProgressOverlayView *)showOverlayWithMessage:(NSString *)message;
- (void)dismissOverlay;

@end
