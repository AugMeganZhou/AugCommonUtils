//
//  UILabel+Util.m
//
//  Created by Megan on 12/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import "UILabel+Util.h"

@implementation UILabel (Util)

+ (UILabel *)updateLabel:(UILabel *)label withString:(NSString *)string andFont:(UIFont *)font andColor:(UIColor *)color {
    CGSize size = CGSizeMake(302.0, 600.0);
    return [self resizeLabel:label withString:string andFont:font andColor:color andSize:size];
}

+ (UILabel *)updateLabel:(UILabel *)label withString:(NSString *)string andFont:(UIFont *)font andColor:(UIColor *)color andSize:(CGSize)size{
    return [self resizeLabel:label withString:string andFont:font andColor:color andSize:size];
}

+ (UIFont *)defaultFont {
    UIFont *font = [UIFont systemFontOfSize:12.0];
    return font;
}

+ (UIColor *)defaultColor {
    UIColor *color = [UIColor colorWithRed:102/255.0 green:102/255.0  blue:102/255.0  alpha:255.0/255.0];
    return color;
}

+ (UILabel *)resizeLabel:(UILabel *)label withString:(NSString *)string andFont:(UIFont *)font andColor:(UIColor *)color andSize:(CGSize)size
{
    [label setNumberOfLines:0];
    
    UIFont *currentfont = font ? font : [self defaultFont] ;
    UIColor *currentColor = color ? color : [self defaultColor];

    CGSize labelsize = [string sizeWithFont:currentfont constrainedToSize:size];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:currentfont, NSFontAttributeName, nil];
        CGRect frame = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
        
        labelsize = frame.size;
    }
    
    label.textColor = currentColor;
    label.text = string;
    label.font = currentfont;
    [label setFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y, labelsize.width + 10, labelsize.height+6)];
    
    return label;
}

- (CGSize)labelSize:(CGSize)maximumSize
{
    CGSize labelsize = [self.text sizeWithFont:self.font constrainedToSize:maximumSize];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.font, NSFontAttributeName, nil];
        CGRect frame = [self.text boundingRectWithSize:maximumSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDictionary context:nil];
        
        labelsize = frame.size;
    }
    
    return labelsize;
}

@end
