//
//  ACImageViewerController.h
//
//  Created by Megan on 11/27/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACImageViewerController : UIViewController

@property (strong, nonatomic) NSMutableArray *imageArray;

@property (strong, nonatomic) UIImage *selectedImage;
@property (assign, nonatomic) NSUInteger selectedImageIndex;

@end
