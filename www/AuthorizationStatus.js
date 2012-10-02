//
//  AuthorizationStatus.js
//
// Created by Olivier Louvignes on 2012-10-02.
//
// Copyright 2012 Olivier Louvignes. All rights reserved.
// MIT Licensed

(function(cordova) {

	function AuthorizationStatus() {}

	AuthorizationStatus.prototype.addressBook = function(callback) {
		var config = {};

		var _callback = function() {
			if(typeof callback == 'function') callback.apply(null, arguments);
		};

		return cordova.exec(_callback, _callback, 'AuthorizationStatus', 'addressBookGetAuthorizationStatus', [config]);
	};

	cordova.addConstructor(function() {
		if(!window.plugins) window.plugins = {};
		window.plugins.authorizationStatus = new AuthorizationStatus();
	});

})(window.cordova || window.Cordova);
