# Game Closure DevKit Plugin: Applovin 

This plugin allows you to display interstitials using apploving on iOS

## Usage

Install the addon with `basil install applovin`.

Include it in the `manifest.json` file under the "addons" section for your game:

~~~
"addons": [
	"applovin"
],
~~~

To specify your game's AppLovinSdkKey, edit the `manifest.json "ios" section as shown below:

~~~
	"ios": {
		"AppLovinSdkKey": "thekey"
	},
~~~

Note that the manifest keys are case-sensitive.

You can test for successful integration via the Chartboost website after successfully building and running your game on a network-connected device.

To show interstitials using Chartboost in your game, import the chartboost object:

~~~
import plugins.applovin.applovin as applovin;
~~~

Cache interstitials by calling:

~~~
applovin.cacheInterstitial();
~~~

Then show them by calling:

~~~
applovin.showInterstitial();
~~~

Subscribe to other events like ad cached and ad dismissed and ad not available:

When ad is available,
~~~
applovin.onAdAvailable(function() {
	applovin.cacheInterstitial();
});
~~~

When ad is not available
~~~
applovin.onAdNotAvailable(function() {
	//get next ad
});
~~~

When ad is dismissed 
~~~
applovin.onAdDismissed(function() {
	//enable audio
});
~~~
