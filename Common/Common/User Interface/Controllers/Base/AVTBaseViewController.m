//
//  AVTBaseViewController.m
//  Common
//
//  Created by Alex Gutierrez on 11/12/13.
//  Copyright (c) 2013 Avantica Technologies. All rights reserved.
//

#import "AVTBaseViewController.h"

@interface AVTBaseViewController ()

@end

@implementation AVTBaseViewController

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
