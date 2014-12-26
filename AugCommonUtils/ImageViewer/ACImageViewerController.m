//
//  ACImageViewerController.m
//
//  Created by Megan on 11/27/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import "ACImageViewerController.h"
#import "ACZoomScrollView.h"
#import "ACDefinitions.h"

@interface ACImageViewerController () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ACImageViewerController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    [self loadImages];
}

#pragma mark - Custom Method

- (void)loadImages
{
    CGRect imageViewFrame = CGRectMake(0.0, 0.0, kScreenWidth, kScreenHeight);
    
    [self resetScrollView];
    
    if(_imageArray) {
        for (int index = 0; index < _imageArray.count; index++) {
            NSString *imageUrl = _imageArray[index];
            imageViewFrame.origin.x = kScreenWidth * index;
            ACZoomScrollView *zoomScrollView = [[ACZoomScrollView alloc] initWithViewController:self andFrame:imageViewFrame];
            zoomScrollView.orignialImage = _selectedImage;
            [zoomScrollView setImage:imageUrl isAvatar:NO];
            [_scrollView addSubview:zoomScrollView];
        }
    }
    
    [_scrollView setContentOffset:CGPointMake(_selectedImageIndex * kScreenWidth, 0)];
}

- (void)resetScrollView
{
    for (UIView *view in _scrollView.subviews) {
        [view removeFromSuperview];
    }
    
    _scrollView.contentSize = CGSizeMake(kScreenWidth * _imageArray.count, kScreenHeight);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (!self.navigationController.navigationBarHidden) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
}

@end
