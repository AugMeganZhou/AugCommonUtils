//
//  ACNetworkError.m
//
//  Created by Megan on 12/22/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//


#import "ACNetworkError.h"

@implementation ACNetworkError

- (id)initWithCode:(NSInteger)code domain:(NSString *)errorDomain userInfo:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        self.errorCode = code;
        self.errorDomain = errorDomain;
        self.errorMsg = dict[kNETWORK_ERROR_MSG_KEY];
        
        // Some errorMsg need redefine
        switch (self.errorCode) {
            case kTIME_OUT_ERROR:
                self.errorMsg = @"请求超时";
                break;
            case kOFF_LINE_ERROR:
                self.errorMsg = @"网络连接失败，请重试";
                break;
            case kUNAUTHORIZED:
                self.errorMsg = @"无权访问"; // Doesn't show the message
                break;
            default:
                break;
        }
        self.errorUserInfo = dict;
    }
    
    if (!self.errorMsg) {
        self.errorMsg = @"网络连接失败，请重试";
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, \"self.errorCode == %ld, self.errorDomain == %@, self.errorMsg == %@, self.errorUserInfo == %@\"", [self class], self, (long)self.errorCode, self.errorDomain, self.errorMsg, self.errorUserInfo];
}

@end