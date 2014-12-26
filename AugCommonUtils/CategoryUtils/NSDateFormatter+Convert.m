//
//  NSDateFormatter+Convert.m
//
//  Created by Megan on 12/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "NSDateFormatter+Convert.h"

@implementation NSDateFormatter (Convert)

+ (NSString *)convertDateString:(NSString *)dateTime WithDateFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss zzzz yyyy"];
    
    NSLocale *local = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setLocale:local];
    
    NSDate *date = [dateFormatter dateFromString:dateTime];
    
    [dateFormatter setDateFormat:dateFormat];
    
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)shortDateFromFullDateTime:(NSString *)fullDateTime
{
    return [self convertDateString:fullDateTime WithDateFormat:@"yyyy-MM-dd"];
}

+ (NSString *)shortChineseDateFromFullDateTime:(NSString *)fullDateTime
{
    return [self convertDateString:fullDateTime WithDateFormat:@"yyyy年MM月dd日"];
}

+ (NSString *)dateTimeFromFullDateTime:(NSString *)fullDateTime
{
    return [self convertDateString:fullDateTime WithDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end
