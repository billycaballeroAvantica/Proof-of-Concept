//
//  AVTEditionDisabledTextField.m
//  Common
//
//  Created by Alex Gutierrez on 7/4/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "AVTEditionDisabledTextField.h"

@implementation AVTEditionDisabledTextField

#pragma mark -
#pragma mark Overriden Methods
#pragma mark -

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:))
        return NO;
    
    if (action == @selector(copy:))
        return NO;
    
    if (action == @selector(cut:))
        return NO;
    
    if (action == @selector(selectAll:))
        return NO;
    
    return [super canPerformAction:action withSender:sender];
}

@end
