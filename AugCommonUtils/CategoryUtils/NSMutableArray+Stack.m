//
//  NSMutableArray+Stack.m
//
//  Created by Megan on 3/3/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (id)pop
{
    if (self.count == 0) {
        return nil;
    } else {
        id object = [self lastObject];
        [self removeLastObject];
        
        return object;
    }
}

@end
