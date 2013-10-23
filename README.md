# VParser for iOS

A powerful iOS library to sniff the real video URL from video sites.

For more information please see [the website](http://yixia.github.io/VParser)


# How to Use

	mParser = [VParser defaultParser];
	NSDictionary *retDict = [mParser parseURL:siteUrl];
	self.videoUrlLbl.text = retDict[VParserVideoURLKey];
	self.titleLbl.text = retDict[VParserVideoTitleKey];
	self.headerLbl.text = retDict[VParserWebSiteHeaderKey];


# License


    Copyright (C) 2013 YIXIA.COM

