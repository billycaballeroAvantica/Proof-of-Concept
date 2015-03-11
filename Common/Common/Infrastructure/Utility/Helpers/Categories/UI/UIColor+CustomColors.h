//
//  UIColor+CustomColors.h
//  Common
//
//  Created by Alex Gutierrez on 11/30/13.
//  Copyright (c) 2013 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface UIColor (CustomColors)

+ (UIColor *)colorWithColor:(UIColor *)color andAlpha:(CGFloat)alpha;
+ (UIColor *)exampleHexadecimalColor;

@end
