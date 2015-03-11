//
//  NSAttributedString+Fonts.h
//  Common
//
//  Created by Alex Gutierrez on 1/28/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Fonts)

+ (NSAttributedString *)attributedStringWithStringsAndAttributesDictionaries:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION;
+ (NSAttributedString *)attributedStringWithStringsAndFonts:(id)firstObject, ... NS_REQUIRES_NIL_TERMINATION;

@end
