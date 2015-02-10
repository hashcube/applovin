import util.setProperty as setProperty;

var onAdDismissed, onAdAvailable, onAdNotAvailable;

var Applovin = Class(function () {
	this.init = function(opts) {

		setProperty(this, "onAdDismissed", {
			set: function(f) {
				if (typeof f === "function") {
					onAdDismissed = f;
				} else {
					onAdDismissed = null;
				}
			},
			get: function() {
				return onOfferClose;
			}
		});

		setProperty(this, "onAdAvailable", {
			set: function(f) {
				if (typeof f === "function") {
					onAdAvailable = f;
				} else {
					onAdAvailable = null;
				}
			},
			get: function() {
				return onAdAvailable;
			}
		});

		setProperty(this, "onAdNotAvailable", {
			set: function(f) {
				if (typeof f === "function") {
					onAdNotAvailable = f;
				} else {
					onAdNotAvailable = null;
				}
			},
			get: function() {
				return onAdNotAvailable;
			}
		});

		NATIVE.events.registerHandler("ApplovinAdDismissed", function() {
			logger.log("{applovin} ad dismissed ");
			if (typeof onAdDismissed === "function") {
				onAdDismissed();
			}
		});

		NATIVE.events.registerHandler("ApplovinAdAvailable", function() {
			logger.log("{applovin} ad available");
			if (typeof onAdAvailable === "function") {
				onAdAvailable("applovin");
			}
		});

		NATIVE.events.registerHandler("ApplovinAdNotAvailable", function() {
			logger.log("{applovin} ad not available");
			if (typeof onAdNotAvailable === "function") {
				onAdNotAvailable();
			}
		});

	}
	this.showInterstitial = function() {
		NATIVE.plugins.sendEvent("ApplovinPlugin", "showInterstitial", JSON.stringify({}));
	};

	this.cacheInterstitial = function() {
		NATIVE.plugins.sendEvent("ApplovinPlugin", "cacheInterstitial", JSON.stringify({}));
	}
});

exports = new Applovin();
