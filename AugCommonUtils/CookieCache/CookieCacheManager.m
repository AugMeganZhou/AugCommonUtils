//
//  CookieCacheManager.m
//
//  Created by Megan on 12/22/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import "CookieCacheManager.h"

@implementation CookieCacheManager

SYNTHESIZE_SINGLETON_IMPLEMENTION(CookieCacheManager);

- (BOOL)isLogIn
{
    if ([self cachedCookiesArray].count > 0) {
        return YES;
    }
    
    return NO;
}

- (void)saveHttpCookie {
    NSData *cookies = [NSKeyedArchiver archivedDataWithRootObject:[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies];
    [[NSUserDefaults standardUserDefaults] setObject:cookies forKey:@"cookies"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loadHttpCookie {
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (NSHTTPCookie *cookie in [self cachedCookiesArray]) {
        [cookieStorage setCookie:cookie];
    }
}

- (void)clearHttpCookie {
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *tmpArray = [NSArray arrayWithArray:[cookieStorage cookies]];
    for (id cookie in tmpArray) {
        [cookieStorage deleteCookie:cookie];
    }

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"cookies"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSArray *)cachedCookiesArray {
    return [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"cookies"]];
}

@end
