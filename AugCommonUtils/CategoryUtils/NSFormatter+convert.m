//
//  NSFormatter+convert.m
//
//  Created by Megan on 3/27/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import "NSFormatter+convert.h"

@implementation NSFormatter (convert)

+ (NSDate *)stringToDate:(NSString *)stringDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [dateFormatter setTimeZone:timeZone];
    
    NSLocale *local = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setLocale:local];
    
    [dateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss Z yyyy"];
    
    return [dateFormatter dateFromString:stringDate];
}

+ (NSString *)convertimeInterVal:(NSTimeInterval)timeInterval
{
    //timeInterval/60/60/24/30/12
    
    NSString *text = @"";
    if (timeInterval/60 < 1) {
        text = @"刚刚";
    } else if (timeInterval/60 < 60) {
        text = [NSString stringWithFormat:@"%.f分钟前", timeInterval/60];
    } else if (timeInterval/3600 < 24) {
        text = [NSString stringWithFormat:@"%.f小时前", timeInterval/3600];
    } else if (timeInterval/3600/24 < 30) {
        text = [NSString stringWithFormat:@"%.f天前", timeInterval/3600/24];
    } else if (timeInterval/3600/24/30 < 12) {
        text = [NSString stringWithFormat:@"%.f月前", timeInterval/3600/24/30];
    } else {
        text = [NSString stringWithFormat:@"%.f年前", timeInterval/3600/24/30/12];
    }
    
    return text;
}

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

