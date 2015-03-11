//
//  AVTBaseTableViewController.m
//  Common
//
//  Created by Alex Gutierrez on 6/11/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "AVTBaseTableViewController.h"


@interface AVTBaseTableViewController ()

@end

@implementation AVTBaseTableViewController

#pragma mark -
#pragma mark View Lifecycle
#pragma mark -

- (void)viewWillDisappear:(BOOL)animated
{
    [self dismissOverlay];
}

#pragma mark -
#pragma mark Public Methods
#pragma mark -

- (void)backToPreviousView
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (MRProgressOverlayView *)showOverlayWithMessage:(NSString *)message
{
    MRProgressOverlayView *overlay = [MRProgressOverlayView showOverlayAddedTo:self.navigationController.view
                                                                         title:message
                                                                          mode:MRProgressOverlayViewModeIndeterminateSmall
                                                                      animated:YES];
    
    return overlay;
}

- (void)dismissOverlay
{
    [MRProgressOverlayView dismissAllOverlaysForView:self.navigationController.view animated:YES];
}

@end
