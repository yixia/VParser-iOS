//
//  VParser.h
//  VParser
//
//  Created by erlz nuo on 7/25/13.
//  Copyright (c) 2013 yixia. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define VU_STRINGIFY(s)         	VU_TOSTRING(s)
#define VU_TOSTRING(s) 				#s
#define VU_VERSION_INT(a, b, c)		(a<<16 | b<<8 | c)
#define VU_VERSION_DOT(a, b, c) 	a ##.## b ##.## c
#define VU_VERSION(a, b, c) 		VU_VERSION_DOT(a, b, c)


#define VPARSER_VERSION_MAJOR 	1
#define VPARSER_VERSION_MINOR 	0
#define VPARSER_VERSION_MICRO 	1

#define VPARSER_VERSION_INT		VU_VERSION_INT( VPARSER_VERSION_MAJOR, \
												VPARSER_VERSION_MINOR, \
												VPARSER_VERSION_MICRO )
#define VPARSER_VERSION			VU_VERSION( VPARSER_VERSION_MAJOR, \
											VPARSER_VERSION_MINOR, \
											VPARSER_VERSION_MICRO )
#define VPARSER_VERSION_STRING	VU_STRINGIFY(VPARSER_VERSION)


#ifdef __cplusplus
#define VPARSER_EXTERN		extern "C" __attribute__((visibility ("default")))
#else
#define VPARSER_EXTERN	    extern __attribute__((visibility ("default")))
#endif



VPARSER_EXTERN NSString * const VParserWebSiteURLKey;		// @Deprecated
VPARSER_EXTERN NSString * const VParserVideoURLKey;			// @Deprecated
VPARSER_EXTERN NSString * const VParserVideoTitleKey;		// @Deprecated
VPARSER_EXTERN NSString * const VParserWebSiteHeaderKey;	// @Deprecated

VPARSER_EXTERN NSString * const VParserKeyWebSiteUrl;
VPARSER_EXTERN NSString * const VParserKeyVideoTitle;
VPARSER_EXTERN NSString * const VParserKeyWebSiteHeader;
VPARSER_EXTERN NSString * const VParserKeyVideoUrl;
VPARSER_EXTERN NSString * const VParserKeyVideoSdUrl;
VPARSER_EXTERN NSString * const VParserKeyVideoEdUrl;
VPARSER_EXTERN NSString * const VParserKeyVideoHd720Url;
VPARSER_EXTERN NSString * const VParserKeyVideoHd1080Url;


#define kParserReady @"kParserReady"
#define kParserFailed @"kParserFailed"
#define kParserExpired @"kParserExpired"

@interface VParser : NSObject

+ (NSString *)version;
+ (VParser *)defaultParser;

- (BOOL)isReady;
- (NSDictionary *)parseURL:(NSString *)urlStr;


@end
