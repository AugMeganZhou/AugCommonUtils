//
//  ACNetworkError.h
//
//  Created by Megan on 12/22/14.
//  Copyright (c) 2014 Megan. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const kNETWORK_ERROR_MSG_KEY = @"kACNetworkError";

@interface ACNetworkError : NSError

typedef enum {
    kFILE_IS_EMPTY = 10100,
    kFILE_TYPE_ERROR = 10101,
    kFILE_BEYOND_MAXSIZE,
    kFILE_ABSENT_MINSIZE,
    kFILE_UPLOAD_ERROR,
    kFILE_PATH_FORMAT_ERROR,
}ECFileErrorCode;

typedef enum {
    kIMAGE_VALIDATE_ERROR = 10200,
    kIMAGE_BEYOND_MAXWIDTH,
    kIMAGE_BEYOND_MAXHEIGHT,
    kIMAGE_ABSENT_MINWIDTH,
    kIMAGE_ABSENT_MINHEIGHT,
    kIMAGE_CONVERT_SIZE_ERROR
}ECImageErrorCode;

typedef enum {
    kBAD_REQUEST = 400,
    kUNAUTHORIZED = 403,
    kSERVER_ERROR = 500,
    kSERVER_UNAVALIABLE = 503,
    kTIME_OUT_ERROR = -1001,
    kOFF_LINE_ERROR = -1009,
    kINVALID_PARAMETER = 10400
}ECMiscErrorCode;

typedef enum {
    kWechatDomain = -10100,
    kUnsupportedVersion = -10101,
}ECWechatShare;

@property(strong, nonatomic) NSString *errorDomain;
@property(assign, nonatomic) NSInteger errorCode;
@property(strong, nonatomic) NSString *errorMsg;
@property(strong, nonatomic) NSDictionary *errorUserInfo;

- (id)initWithCode:(NSInteger)code domain:(NSString *)errorDomain userInfo:(NSDictionary *)dict;

@end
