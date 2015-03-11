//
//  NSDateFormatter+Singleton.m
//  Common
//
//  Created by Alex Gutierrez on 1/24/14.
//  Copyright (c) 2014 Avantica Technologies. All rights reserved.
//

#import "NSDateFormatter+Singleton.h"

NSString *const AVTDateFormatter = @"MM/dd/yyyy hh:mm a";

@implementation NSDateFormatter (Singleton)

#pragma mark -
#pragma mark Initialization
#pragma mark -

+ (NSDateFormatter *)sharedDateFormatter
{
    static id _sharedDateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDateFormatter = [[NSDateFormatter alloc] init];
        [(NSDateFormatter *)_sharedDateFormatter setDateFormat:AVTDateFormatter];
    });
    return _sharedDateFormatter;
}

#pragma mark -
#pragma mark - Public Methods
#pragma mark -

- (NSString *)stringFromDate:(NSDate *)date withFromat:(NSString *)format
{
    if (format)
        [self setDateFormat:format];
    return [self stringFromDateAndSetBackFormat:date];
}

- (NSDate *)dateFromString:(NSString *)dateString withFromat:(NSString *)format
{
    if (format)
        [self setDateFormat:format];
    return [self dateFromStringAndSetBackFormat:dateString];
}

- (NSString *)stringUTFFromDate:(NSDate *)date withFromat:(NSString *)format
{
    [self setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    if (format)
        [self setDateFormat:format];
    return [self stringFromDateAndSetBackFormat:date];
}

- (NSString *)getGMTTimeZoneFromDate:(NSDate *)date
{
    NSString *timeZone = [self stringFromDate:date withFromat:@"Z"]; //Get -0800 or  +0500
    [self setDateFormat:AVTDateFormatter];
    return [NSString stringWithFormat:@"GMT%@:%@", [timeZone substringToIndex:3], [timeZone substringFromIndex:3]];
}

#pragma mark - 
#pragma mark - Private Methods
#pragma mark -

- (NSDate *)dateFromStringAndSetBackFormat:(NSString *)dateString
{
    NSDate *date = [self dateFromString:dateString];
    [self setDateFormat:AVTDateFormatter];
    return date;
}

- (NSString *)stringFromDateAndSetBackFormat:(NSDate *)date
{
    NSString *dateString = [self stringFromDate:date];
    [self setDateFormat:AVTDateFormatter];
    return dateString;
}

@end
