//
//  ACBorderWithTintColorButton.m
//
//  Created by Megan on 3/27/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import "ACBorderWithTintColorButton.h"


@implementation ACBorderWithTintColorButton

- (void)drawRect:(CGRect)rect
{
    
    self.layer.borderColor = self.tintColor.CGColor;
    [[self layer] setMasksToBounds:YES];
    [[self layer] setBorderWidth:1];
    [[self layer] setBorderColor:self.tintColor.CGColor];
    [self.imageView setTintColor:self.tintColor];
    self.titleLabel.textColor = self.tintColor;

}

- (void)tintColorDidChange
{
    
    [super tintColorDidChange];
    [self setNeedsDisplay];
}

@end
