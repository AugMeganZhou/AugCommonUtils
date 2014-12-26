//
//  ACZoomScrollView.h
//
//  Created by Megan on 11/27/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACZoomScrollView : UIScrollView

@property (strong, nonatomic) UIImage *orignialImage;

- (id)initWithViewController:(UIViewController *)viewController andFrame:(CGRect)frame;

- (void)setImage:(NSString *)imageUrl isAvatar:(BOOL)isAvatar;

- (void)showFromView:(UIImageView *)imageView;

- (void)setImage:(UIImage *)image;

@end
