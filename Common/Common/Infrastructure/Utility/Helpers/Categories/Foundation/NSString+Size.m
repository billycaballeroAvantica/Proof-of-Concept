//
//  NSString+Size.m
//  Common
//
//  Created by Alex Gutierrez on 6/27/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "NSString+Size.h"
#import <CoreText/CoreText.h>

@implementation NSString (Size)

#pragma mark -
#pragma mark - Public Methods
#pragma mark -

- (CGSize)fitSizeWithinConstrainedSize:(CGSize)constrainedSize attributes:(NSDictionary *)attributes
{
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:self attributes:attributes];
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attributedString);
    CGSize fitSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, [attributedString length]), NULL, constrainedSize, NULL);
    CFRelease(framesetter);
    
    return fitSize;
}

@end
