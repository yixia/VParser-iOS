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

	self.siteUrlTfd.text = @"http://v.youku.com/v_show/id_XNTAxNzIwNzQ4.html";
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
}

- (IBAction)hideButtonAction:(id)sender
{
	if ([self.siteUrlTfd isFirstResponder]) {
		[self.siteUrlTfd resignFirstResponder];
	}
}


@end
