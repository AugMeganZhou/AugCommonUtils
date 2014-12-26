//
//  NSString+Util.m
//
//  Created by Megan on 3/27/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)

- (BOOL)isEmpty
{
    if(!self || [@"" isEqualToString:self]){
        return YES;
    }
    return NO;
}

+ (NSString *)stringfyArray:(NSArray *)arr
{
    return [self stringfyArray:arr handleString:TRUE];
}

+ (NSString *)stringfyArray:(NSArray *)arr handleString:(BOOL)handle
{
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendString:@"["];
    
    if (arr == nil || [arr count] ==0) {
        [result appendString:@"]"];
        return result;
    }
    
    int flag = 0;
    NSString *valueStr = nil;
    for (id element in arr) {
        //Whether append comma.
        if (flag == 0) {
            flag++;
        } else {
            [result appendString:@","];
        }
        
        //The value is NSDictionary type
        if ([element isKindOfClass:[NSDictionary class]]) {
            valueStr = [self stringfyDictionary:element handleString:handle];
            //NSLog(@"is dict class: %@", valueStr);
            [result appendFormat:@"%@", valueStr];
            continue;
        }
        
        //Validate NSArray type.
        if ([element isKindOfClass:[NSArray class]]) {
            valueStr = [self stringfyArray:element handleString:handle];
            //NSLog(@"is array class: %@", valueStr);
            [result appendFormat:@"%@", valueStr];
            continue;
        }
        
        //The vlue is primitive type
        if ([element isKindOfClass:[NSString class]] && handle) {
            [result appendFormat:@"\"%@\"", element];
        } else {
            [result appendFormat:@"%@", element];
        }
    }
    
    [result appendString:@"]"];
    
    return result;
}

+ (NSString *)stringfyDictionary:(NSDictionary *)dict handleString:(BOOL)handle
{
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendString:@"{"];
    
    if(dict == nil || [[dict allKeys] count] == 0) {
        [result appendString:@"}"];
        return result;
    }
    
    int flag = 0;
    NSString *valueStr = nil;
    for (id key in [dict allKeys]){
        //Whether append comma.
        if (flag == 0) {
            flag++;
        } else {
            [result appendString:@","];
        }
        
        id value = [dict objectForKey:key];
        
        //The value is NSDictionary type
        if ([value isKindOfClass:[NSDictionary class]]) {
            valueStr = [self stringfyDictionary:value handleString:handle];
            // NSLog(@"is dict class: %@", valueStr);
            [result appendFormat:@"\"%@\": %@", key, valueStr];
            continue;
        }
        
        //Validate NSArray type.
        if ([value isKindOfClass:[NSArray class]]) {
            valueStr = [self stringfyArray:value handleString:handle];
            //NSLog(@"is array class: %@", valueStr);
            [result appendFormat:@"\"%@\": %@", key, valueStr];
            continue;
        }
        
        //The vlue is primitive type
        if ([value isKindOfClass:[NSString class]] && handle) {
            [result appendFormat:@"\"%@\": \"%@\"", key, value];
        }else {
            [result appendFormat:@"\"%@\": %@", key, value];
        }
        
    }
    
    [result appendString:@"}"];
    //NSLog(@"DICTION TO STRING : %@", result);
    
    return result;
}

/**
 This methoid is for the request of unity3d.
 In onStringKvBegain method, unity3d will send me one kv string, but for the common situation kv is the
 NSDictionary type.
 
 @time: 2013-12-03 15:33
 @author: Jonathan Gong
 @comment: I need to refactor the all SDK.
 */
+ (NSString *)stringfyDictionary:(NSDictionary *)dict key:(NSString *)stringKey
{
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendString:@"{"];
    
    if(dict == nil || [[dict allKeys] count] == 0) {
        [result appendString:@"}"];
        return result;
    }
    
    int flag = 0;
    NSString *valueStr = nil;
    for (id key in [dict allKeys]){
        //Whether append comma.
        if (flag == 0) {
            flag++;
        } else {
            [result appendString:@","];
        }
        
        id value = [dict objectForKey:key];
        
        //The value is NSDictionary type
        if ([value isKindOfClass:[NSDictionary class]]) {
            valueStr = [self stringfyDictionary:value key:stringKey];
            // NSLog(@"is dict class: %@", valueStr);
            [result appendFormat:@"\"%@\": %@", key, valueStr];
            continue;
        }
        
        //Validate NSArray type.
        if ([value isKindOfClass:[NSArray class]]) {
            valueStr = [self stringfyArray:value];
            //NSLog(@"is array class: %@", valueStr);
            [result appendFormat:@"\"%@\": %@", key, valueStr];
            continue;
        }
        
        //The vlue is primitive type
        if ([value isKindOfClass:[NSString class]] && ![key isEqualToString:stringKey]) {
            [result appendFormat:@"\"%@\": \"%@\"", key, value];
        }else {
            [result appendFormat:@"\"%@\": %@", key, value];
        }
        
    }
    
    [result appendString:@"}"];
    //NSLog(@"DICTION TO STRING : %@", result);
    
    return result;
}


+ (NSString *)stringfyDictionary:(NSDictionary *)dict keys:(NSArray *)array
{
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendString:@"{"];
    
    if(dict == nil || [[dict allKeys] count] == 0) {
        [result appendString:@"}"];
        return result;
    }
    
    int flag = 0;
    NSString *valueStr = nil;
    for (id key in [dict allKeys]){
        //Whether append comma.
        if (flag == 0) {
            flag++;
        } else {
            [result appendString:@","];
        }
        
        id value = [dict objectForKey:key];
        
        //The value is NSDictionary type
        if ([value isKindOfClass:[NSDictionary class]]) {
            valueStr = [self stringfyDictionary:value keys:array];
            // NSLog(@"is dict class: %@", valueStr);
            [result appendFormat:@"\"%@\": %@", key, valueStr];
            continue;
        }
        
        //Validate NSArray type.
        if ([value isKindOfClass:[NSArray class]]) {
            valueStr = [self stringfyArray:value];
            //NSLog(@"is array class: %@", valueStr);
            [result appendFormat:@"\"%@\": %@", key, valueStr];
            continue;
        }
        
        //The vlue is primitive type
        if ([value isKindOfClass:[NSString class]] && ![array containsObject:key]) {
            [result appendFormat:@"\"%@\": \"%@\"", key, value];
        }else {
            [result appendFormat:@"\"%@\": %@", key, value];
        }
        
    }
    
    [result appendString:@"}"];
    //NSLog(@"DICTION TO STRING : %@", result);
    
    return result;
}

+(NSDictionary *) dictionaryFromJsonString:(NSString *)stringJson
{
    NSData *data = [stringJson dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error ;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:&error];
    
    
    return jsonDictionary;
}

+ (NSString *)stringfyDictionary:(NSDictionary *)dict
{
    return [self stringfyDictionary:dict handleString:TRUE];
}

@end
