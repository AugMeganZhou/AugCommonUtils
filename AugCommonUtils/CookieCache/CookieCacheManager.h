//
//  CookieCacheManager.h
//
//  Created by Megan on 12/22/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CookieCacheManager : NSObject

SYNTHESIZE_SINGLETON_DEFINITION(CookieCacheManager);

- (BOOL)isLogIn;
- (void)saveHttpCookie;
- (void)loadHttpCookie;
- (void)clearHttpCookie;

@end
