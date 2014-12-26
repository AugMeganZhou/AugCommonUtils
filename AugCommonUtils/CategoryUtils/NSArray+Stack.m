//
//  NSArray+Stack.m
//
//  Created by Megan on 3/27/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import "NSArray+Stack.h"

@implementation NSArray (Stack)

- (id)preObject:(id)currentObject;
{
    NSInteger currentIndex = [self indexOfObject:currentObject];
    
    if (currentIndex > 0) {
        return self[currentIndex-1];
    }
    
    return nil;
}

@end
