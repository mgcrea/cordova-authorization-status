//
//  AuthorizationStatus.h
//
// Created by Olivier Louvignes on 2012-10-02.
//
// Copyright 2012 Olivier Louvignes. All rights reserved.
// MIT Licensed

#import <Foundation/Foundation.h>
#import <AddressBook/ABAddressBook.h>
#import <Cordova/CDVPlugin.h>

@interface AuthorizationStatus : CDVPlugin {
}

#pragma mark - Properties

@property (nonatomic, copy) NSString* callbackId;

#pragma mark - Instance methods

- (void)addressBookGetAuthorizationStatus:(CDVInvokedUrlCommand*)command;

@end
