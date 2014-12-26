//
//  Definitions.h
//
//  Created by Megan on 12/9/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#ifndef Definitions_h
#define Definitions_h

#define kScreenWidth 1024
#define kScreenHeight 768

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#endif
