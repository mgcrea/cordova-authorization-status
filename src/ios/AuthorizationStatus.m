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
	
	//ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
	int authorizationStatus = ABAddressBookGetAuthorizationStatus();
	
	// Create Plugin Result
	CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:authorizationStatus];
	// Call  the Success Javascript function
	[self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackId]];

}

- (void)addressBookAskAuthorization:(CDVInvokedUrlCommand*)command {

	self.callbackId = command.callbackId;
	//NSDictionary *options = [command.arguments objectAtIndex:0];

	ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
	if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
		// Request authorization
		ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
			// Create Plugin Result
			CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:granted*1];
			// Call  the Success Javascript function
			[self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackId]];
		});
	} else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
		// Create Plugin Result
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:1];
		// Call  the Success Javascript function
		[self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackId]];;
	} else {
		// Create Plugin Result
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:0];
		// Call  the Success Javascript function
		[self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackId]];
	}

}

@end
