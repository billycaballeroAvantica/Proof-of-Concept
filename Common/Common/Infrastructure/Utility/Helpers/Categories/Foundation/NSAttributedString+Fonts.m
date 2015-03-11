//
//  NSAttributedString+Fonts.m
//  Common
//
//  Created by Alex Gutierrez on 1/28/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "NSAttributedString+Fonts.h"

@implementation NSAttributedString (Fonts)

#pragma mark -
#pragma mark - Public Methods
#pragma mark -

+ (NSAttributedString *)attributedStringWithStringsAndAttributesDictionaries:(id)firstObject, ...
{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:@""];
    
    int counter = 0;
    NSString *lastSubstring = nil;
    NSDictionary *lastSubstringAttributes = nil;
    
    id object;
    va_list argumentList;
    
    va_start(argumentList, firstObject);
    object = firstObject;
    
    while(1)
    {
        if (object == nil)
            break;
        
        counter++;
        
        if (counter % 2 != 0) { // odd objects are NSString
            
            lastSubstring = (NSString *)object;
            
        }
        else { // even objects are attributes NSDictionary
            
            lastSubstringAttributes = (NSDictionary *)object;
            
            // create the attributed substring with the last substring and its attributes, and append it to the "main string"
            
            NSAttributedString * attributedSubstring = [[NSAttributedString alloc] initWithString:lastSubstring attributes:lastSubstringAttributes];
            [attributedString appendAttributedString:attributedSubstring];
            
            //clean the temporal variables
            
            lastSubstring = nil;
            lastSubstringAttributes = nil;
            
        }
        
        object = va_arg(argumentList, id);
    }
    
    va_end(argumentList);
    
    return attributedString;
}

+ (NSAttributedString *)attributedStringWithStringsAndFonts:(id)firstObject, ...
{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:@""];
    
    int counter = 0;
    NSString *lastSubstring = nil;
    UIFont *lastSubstringFont = nil;
    
    id object;
    va_list argumentList;
    
    va_start(argumentList, firstObject);
    object = firstObject;
    
    while(1)
    {
        if (object == nil)
            break;
        
        counter++;
        
        if (counter % 2 != 0) { // odd objects are NSString
            
            lastSubstring = (NSString *)object;
            
        }
        else { // even objects are fonts
            
            lastSubstringFont = (UIFont *)object;
            
            NSDictionary *lastSubstringAttributes = @{ NSFontAttributeName : lastSubstringFont };
            NSAttributedString * attributedSubstring = [[NSAttributedString alloc] initWithString:lastSubstring attributes:lastSubstringAttributes];
            [attributedString appendAttributedString:attributedSubstring];
            
            //clean the temporal variables
            
            lastSubstring = nil;
            lastSubstringFont = nil;
            
        }
        
        object = va_arg(argumentList, id);
    }
    
    va_end(argumentList);
    
    return attributedString;
}

@end
