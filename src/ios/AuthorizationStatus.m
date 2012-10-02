//
//  AuthorizationStatus.m
//
// Created by Olivier Louvignes on 2012-10-02.
//
// Copyright 2012 Olivier Louvignes. All rights reserved.
// MIT Licensed

#import "AuthorizationStatus.h"

@implementation AuthorizationStatus

@synthesize callbackId = _callbackId;

- (void)addressBookGetAuthorizationStatus:(CDVInvokedUrlCommand*)command {

	self.callbackId = command.callbackId;
	//NSDictionary *options = [command.arguments objectAtIndex:0];
	__block BOOL isAuthorized = false;

	// Compiling options with defaults
	// Request authorization
	ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
	if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
		ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
			isAuthorized = granted;
		});
	} else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
		isAuthorized = YES;
	}
	else {
		isAuthorized = NO;
	}

	// Create Plugin Result
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:isAuthorized*1];
	// Call  the Success Javascript function
	[self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackId]];

}

@end
