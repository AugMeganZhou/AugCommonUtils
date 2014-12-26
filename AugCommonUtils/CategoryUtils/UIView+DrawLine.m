
//
//  UIView+DrawLine.m
//
//  Created by Megan on 11/5/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import "UIView+DrawLine.h"
#import "UIView+frame.h"

@implementation UIView (DrawLine)

- (void)addOnePixelBottomBorder:(CGPoint)orign width:(CGFloat)aWidth
{
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.borderColor = [self defaultColor].CGColor;
    bottomBorder.borderWidth = kOnePixel;
    bottomBorder.frame = CGRectMake(orign.x, orign.y, aWidth, kOnePixel);
    
    [self.layer addSublayer:bottomBorder];
}

- (UIColor *)defaultColor
{
    return [UIColor colorWithRed:227.0/255.0 green:227.0/255.0 blue:227.0/255.0 alpha:1.0];
}

@end
