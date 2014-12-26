//
//  UILabel+Util.h
//
//  Created by Megan on 12/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Util)

+ (UILabel *)updateLabel:(UILabel *)label
              withString:(NSString *)string
                 andFont:(UIFont *)font
                andColor:(UIColor *)color;

+ (UILabel *)updateLabel:(UILabel *)label
              withString:(NSString *)string
                 andFont:(UIFont *)font
                andColor:(UIColor *)color
                 andSize:(CGSize)size;

+ (UIColor *)defaultColor;

- (CGSize)labelSize:(CGSize)maximumSize;

@end
