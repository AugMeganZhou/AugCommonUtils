//
//  NSFormatter+convert.h
//
//  Created by Megan on 3/27/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFormatter (convert)

+ (NSDate *)stringToDate:(NSString *)stringDate;

+ (NSString *)convertimeInterVal:(NSTimeInterval)timeInterval;

+ (NSString *)shortDateFromFullDateTime:(NSString *)fullDateTime;
+ (NSString *)dateTimeFromFullDateTime:(NSString *)fullDateTime;
+ (NSString *)shortChineseDateFromFullDateTime:(NSString *)fullDateTime;

@end
