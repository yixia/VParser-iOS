//
//  ViewController.m
//  VParser-Demo
//
//  Created by erlz nuo on 7/26/13.
//  Copyright (c) 2013 yixia. All rights reserved.
//

#import "ViewController.h"
#import "VParser.h"


@interface ViewController ()
{
	VParser *mParser;
}

@property (nonatomic, assign) IBOutlet UITextField	*siteUrlTfd;
@property (nonatomic, assign) IBOutlet UILabel		*videoUrlLbl;
@property (nonatomic, assign) IBOutlet UILabel		*titleLbl;
@property (nonatomic, assign) IBOutlet UILabel		*headerLbl;
@property (nonatomic, assign) IBOutlet UIButton		*parseBtn;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	NSLog(@"VParser version: %@", [VParser version]);
	mParser = [VParser defaultParser];

//	self.siteUrlTfd.text = @"http://v.youku.com/v_show/id_XNTAxNzIwNzQ4.html";
//	self.siteUrlTfd.text = @"http://www.m1905.com/vod/play/488044.shtml";
//	self.siteUrlTfd.text = @"http://v.youku.com/v_show/id_XNjEyNDg0NTc2.html";
//	self.siteUrlTfd.text = @"http://v.youku.com/v_show/id_XNjEzNzIwOTky.html?firsttime=604&ev=12";
//	self.siteUrlTfd.text = @"http://www.iqiyi.com/dianshiju/20100830/n31441.html";
//	self.siteUrlTfd.text = @"http://v.pptv.com/show/ibtQ3tByC8jCTEXk.html";
//	self.siteUrlTfd.text = @"http://www.letv.com/ptv/vplay/2126583.html";
//	self.siteUrlTfd.text = @"http://www.letv.com/ptv/vplay/2117459.html";

//	self.siteUrlTfd.text = @"http://v.youku.com/v_show/id_XNjIxMTM4MjY4.html?f=20390747&ev=1";
	self.siteUrlTfd.text = @"http://v.youku.com/v_show/id_XNDM3NTk5NDY0.html";
	self.siteUrlTfd.text = @"http://v.youku.com/v_show/id_XMzYwNDAyNDgw.html";
	self.siteUrlTfd.text = @"http://v.youku.com/v_show/id_XNDQ2NTk3OTY4.html";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)parseButtonAction:(id)sender
{
	self.videoUrlLbl.text = nil;
	self.titleLbl.text = nil;
	self.headerLbl.text = nil;

	NSString *siteUrl = self.siteUrlTfd.text;
	NSDictionary *retDict = [mParser parseURL:siteUrl];

	NSLog(@"NAL &&&& ... %@", retDict);

	if (retDict[VParserVideoURLKey]) {
		NSLog(@"Parse Successfully!");
	} else {
		NSLog(@"Parse failed!");
	}

	if (retDict) {
		self.videoUrlLbl.text = retDict[VParserVideoURLKey];
		self.titleLbl.text = retDict[VParserVideoTitleKey];
		self.headerLbl.text = retDict[VParserWebSiteHeaderKey];
	}


#if 0
	char *cstr = strdup([self.videoUrlLbl.text cStringUsingEncoding:NSUTF8StringEncoding]);
	self.videoUrlLbl.text = [NSString stringWithFormat:@"%s", cstr];
	NSURL *url = [NSURL URLWithString:[self.videoUrlLbl.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	NSLog(@"URL: %@", url);
	NSLog(@"URL: %s", cstr);

	NSData *bytes = [retDict[VParserKeyVideoUrl] dataUsingEncoding: NSUTF8StringEncoding];
	NSLog(@"data: %@", bytes);

	NSString *string = [NSString stringWithFormat: @"Hello%CWorld!", (unsigned short)0];
    NSData *byte = [string dataUsingEncoding: NSUTF8StringEncoding];
    NSLog(@"string: %@", string);
    NSLog(@"byte: %@", byte);
#else
	NSURL *url = [NSURL URLWithString:[self.videoUrlLbl.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	NSLog(@"URL: %@", url);
#endif
}

- (IBAction)hideButtonAction:(id)sender
{
	if ([self.siteUrlTfd isFirstResponder]) {
		[self.siteUrlTfd resignFirstResponder];
	}
}


@end
