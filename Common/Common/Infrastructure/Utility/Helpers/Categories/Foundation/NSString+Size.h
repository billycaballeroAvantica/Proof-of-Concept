//
//  NSString+Size.h
//  Common
//
//  Created by Alex Gutierrez on 6/27/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

- (CGSize)fitSizeWithinConstrainedSize:(CGSize)constrainedSize attributes:(NSDictionary *)attributes;

@end
