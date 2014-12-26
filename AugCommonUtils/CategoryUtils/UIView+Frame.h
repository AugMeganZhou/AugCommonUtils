//
//  UIView+Frame.h
//
//  Created by Megan on 12/9/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

- (CGFloat)originX;
- (CGFloat)originY;
- (CGPoint)origin;
- (CGFloat)width;
- (CGFloat)height;
- (CGSize)size;

- (void)setOriginX:(CGFloat)x;
- (void)setOriginY:(CGFloat)y;
- (void)setOrigin:(CGPoint)origin;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setSize:(CGSize)size;

- (void)setOriginX:(CGFloat)x originY:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

@end
