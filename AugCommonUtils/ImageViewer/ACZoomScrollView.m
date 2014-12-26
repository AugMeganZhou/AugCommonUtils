//
//  ACZoomScrollView.m
//
//  Created by Megan on 11/27/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import "ACZoomScrollView.h"

#define kSingleTapNum 1
#define kDoubleTapNum 2

@interface ACZoomScrollView() <UIScrollViewDelegate>

@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImageView *orignialImageView;
@property (assign, nonatomic) BOOL hideBavBar;
@property (assign, nonatomic) BOOL isAvatar;
@property (assign, nonatomic) BOOL isAvatarScroll;

@end

@implementation ACZoomScrollView

- (id)initWithViewController:(UIViewController *)viewController andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _viewController = viewController;
        _hideBavBar = NO;
        _isAvatarScroll = NO;

        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.tag = 1;
        
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        
        [self addSubview:_imageView];
        
        self.backgroundColor = [UIColor clearColor];
		self.delegate = self;
		self.showsHorizontalScrollIndicator = NO;
		self.showsVerticalScrollIndicator = NO;
		self.decelerationRate = UIScrollViewDecelerationRateFast;
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return self;
}

- (void)setImage:(NSString *)imageUrl isAvatar:(BOOL)isAvatar
{
    _isAvatar = isAvatar;
    
    // Reset
    self.maximumZoomScale = 1;
    self.minimumZoomScale = 1;
    self.zoomScale = 1;
    self.contentSize = CGSizeMake(0, 0);
   
    if (imageUrl) {
        // Set image
        [_imageView setImage:[UIImage imageNamed:imageUrl]];
//        [_imageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:_orignialImage];
        UIImage *image = nil;
        
        if (_orignialImage) {
            image = _orignialImage;
        } else {
            image = _imageView.image;
        }
        
       // Setup photo frame
        CGRect photoImageViewFrame;
        photoImageViewFrame.origin = CGPointZero;
        photoImageViewFrame.size = image.size;
        
        if (photoImageViewFrame.size.width > self.frame.size.width) {
            photoImageViewFrame.size.width = photoImageViewFrame.size.width-1;
        }
        
        _imageView.frame = photoImageViewFrame;
        _imageView.center = self.center;
        self.contentSize = photoImageViewFrame.size;
        
        // Set zoom to minimum zoom
        [self setMaxMinZoomScalesForCurrentBounds];
        
    } else {
        // Hide image view
        _imageView.hidden = YES;
    }
    
    [self setNeedsLayout];
}

- (void)setImage:(UIImage *)image
{
    // Reset
    self.maximumZoomScale = 1;
    self.minimumZoomScale = 1;
    self.zoomScale = 1;
    self.contentSize = CGSizeMake(0, 0);
    
    if (image) {
        // Set image
        
        [_imageView setImage:image];
        UIImage *image = nil;
        
        if (_orignialImage) {
            image = _orignialImage;
        } else {
            image = _imageView.image;
        }
        
        // Setup photo frame
        CGRect photoImageViewFrame;
        photoImageViewFrame.origin = CGPointZero;
        photoImageViewFrame.size = image.size;
        _imageView.frame = photoImageViewFrame;
        _imageView.center = self.center;
        self.contentSize = photoImageViewFrame.size;
        
        // Set zoom to minimum zoom
        [self setMaxMinZoomScalesForCurrentBounds];
        
    } else {
        // Hide image view
        _imageView.hidden = YES;
    }
    
    [self setNeedsLayout];
}

- (void)showFromView:(UIImageView *)imageView
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];

    _orignialImageView = imageView;
    _orignialImageView.alpha = 0;
    
    [UIView animateWithDuration:0.4 animations:^{
        _imageView.frame = CGRectMake(0.0, 0.0, self.frame.size.width, _imageView.frame.size.height * (self.frame.size.width/_imageView.frame.size.width));
        _imageView.center = self.center;
    } completion:^(BOOL finished) {
        // Do nothing
    }];
}

- (void)hideView
{
    [UIView animateWithDuration:0.4 animations:^{
        CGRect originalImageViewFrame = _orignialImageView.frame;
        originalImageViewFrame.origin.y += 64.0;
        _imageView.frame = originalImageViewFrame;
        _orignialImageView.alpha = 1;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


#pragma mark - Setup

- (void)setMaxMinZoomScalesForCurrentBounds {
	// Reset
	self.maximumZoomScale = 1;
	self.minimumZoomScale = 1;
	self.zoomScale = 1;
	
	// Bail
	if (_imageView.image == nil) return;
	
	// Sizes
    CGSize boundsSize = self.bounds.size;
    CGSize imageSize = _imageView.frame.size;
    
    // Calculate Min
    CGFloat xScale = boundsSize.width / imageSize.width;
    CGFloat yScale = boundsSize.height / imageSize.height;
    CGFloat minScale = MIN(xScale, yScale);
	
	// Make sure image at min scale of 1
	if (xScale > 1 && yScale > 1) {
		minScale = 1.0;
	}
    
	CGFloat maxScale = 4.0;
    
	if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
		maxScale = maxScale / [[UIScreen mainScreen] scale];
	}
	
	// Set
	self.maximumZoomScale = maxScale;
	self.minimumZoomScale = minScale;
	self.zoomScale = minScale;
	
	// Reset position
	_imageView.frame = CGRectMake(0, 0, _imageView.frame.size.width, _imageView.frame.size.height);
	
    [self setNeedsLayout];
}

#pragma mark - Layout

- (void)layoutSubviews
{
	[super layoutSubviews];
    
    if (_isAvatar && !_isAvatarScroll) {
        return;
    }
	
    // Center the image as it becomes smaller than the size of the screen
    CGSize boundsSize = self.bounds.size;
    CGRect frameToCenter = _imageView.frame;
    
    // Horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = floorf((boundsSize.width - frameToCenter.size.width) / 2.0);
	} else {
        frameToCenter.origin.x = 0;
	}
    
    // Vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = floorf((boundsSize.height - frameToCenter.size.height) / 2.0);
	} else {
        frameToCenter.origin.y = 0;
	}
    
	// Center
	if (!CGRectEqualToRect(_imageView.frame, frameToCenter))
		_imageView.frame = frameToCenter;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];

    if (touch.tapCount < kDoubleTapNum) {
        [self performSelector:@selector(handleSingleTap) withObject:nil afterDelay:0.2];
    } else if (kDoubleTapNum == touch.tapCount) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        [self handleDoubleTap:[touch locationInView:_imageView]];
    } else {
        // Do nothing
    }
}

- (void)handleSingleTap
{
    [_viewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)handleDoubleTap:(CGPoint)touchPoint {
	if (self.zoomScale == self.maximumZoomScale) { // Zoom in
		[self setZoomScale:self.minimumZoomScale animated:YES];
	} else { // Zoom out
		[self zoomToRect:CGRectMake(touchPoint.x, touchPoint.y, 1, 1) animated:YES];
	}
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _isAvatarScroll = YES;
    [self layoutSubviews];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return _imageView;
}

@end
