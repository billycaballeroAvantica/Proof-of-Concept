//
//  NSDateFormatter+Singleton.h
//  Common
//
//  Created by Alex Gutierrez on 1/24/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const AVTDateFormatter;

@interface NSDateFormatter (Singleton)

+ (NSDateFormatter *)sharedDateFormatter;

- (NSString *)stringFromDate:(NSDate *)date withFromat:(NSString *)format;
- (NSDate *)dateFromString:(NSString *)dateString withFromat:(NSString *)format;
- (NSString *)stringUTFFromDate:(NSDate *)date withFromat:(NSString *)format;
- (NSString *)getGMTTimeZoneFromDate:(NSDate *)date;

@end
