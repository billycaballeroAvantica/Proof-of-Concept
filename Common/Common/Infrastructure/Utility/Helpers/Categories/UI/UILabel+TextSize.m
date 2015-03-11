//
//  UILabel+TextSize.m
//  Common
//
//  Created by Alex Gutierrez on 1/23/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "UILabel+TextSize.h"

@implementation UILabel (TextSize)

#pragma mark -
#pragma mark - Public Methods
#pragma mark -

- (CGRect)textRectWithMaxWidth:(float)maxWidth
{
    return [self.text boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX)
                                   options:NSStringDrawingUsesLineFragmentOrigin
                                attributes:@{ NSFontAttributeName:self.font }
                                   context:nil];
}

@end
