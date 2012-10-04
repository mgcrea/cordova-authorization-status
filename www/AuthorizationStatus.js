//
//  AuthorizationStatus.js
//
// Created by Olivier Louvignes on 2012-10-02.
//
// Copyright 2012 Olivier Louvignes. All rights reserved.
// MIT Licensed

(function(cordova) {

	function AuthorizationStatus() {}

	AuthorizationStatus.prototype.addressBookGetAuthorizationStatus = function(callback) {
		var config = {};

		var _callback = function() {
			if(typeof callback == 'function') callback.apply(null, arguments);
		};

		// 0:kABAuthorizationStatusNotDetermined
		// 1:kABAuthorizationStatusRestricted
		// 2:kABAuthorizationStatusDenied
		// 3:kABAuthorizationStatusAuthorized

		return cordova.exec(_callback, _callback, 'AuthorizationStatus', 'addressBookGetAuthorizationStatus', [config]);
	};

	AuthorizationStatus.prototype.addressBookAskAuthorization = function(callback) {
		var config = {};

		var _callback = function() {
			if(typeof callback == 'function') callback.apply(null, arguments);
		};

		return cordova.exec(_callback, _callback, 'AuthorizationStatus', 'addressBookAskAuthorization', [config]);
	};

	cordova.addConstructor(function() {
		if(!window.plugins) window.plugins = {};
		window.plugins.authorizationStatus = new AuthorizationStatus();
	});

})(window.cordova || window.Cordova);
