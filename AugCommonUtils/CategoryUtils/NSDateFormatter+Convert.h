//
//  NSDateFormatter+Convert.h
//
//  Created by Megan on 12/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Convert)

+ (NSString *)shortDateFromFullDateTime:(NSString *)fullDateTime;
+ (NSString *)dateTimeFromFullDateTime:(NSString *)fullDateTime;
+ (NSString *)shortChineseDateFromFullDateTime:(NSString *)fullDateTime;

@end
