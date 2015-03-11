//
//  UIColor+CustomColors.m
//  Common
//
//  Created by Alex Gutierrez on 11/30/13.
//  Copyright (c) 2013 Avantica Technologies. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

#pragma mark -
#pragma mark - Public Methods
#pragma mark -

+ (UIColor *)colorWithColor:(UIColor *)color andAlpha:(CGFloat)alpha
{
    const CGFloat* components = CGColorGetComponents(color.CGColor);
    
    return [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:alpha];
}

+ (UIColor *)exampleHexadecimalColor
{
    return UIColorFromRGB(0xED2725);
}

@end
