# Game Closure DevKit Plugin: Applovin 

This plugin allows you to display interstitials using apploving on iOS

## Usage

Install the addon with `basil install applovin`.

Include it in the `manifest.json` file under the "dependencies" section for your game:

~~~
"dependencies": {
	"applovin": "https://github.com/hashcube/applovin.git#master"
}
~~~

To specify the AppLovinSdkKey, edit the `manifest.json "ios" section as shown below:

~~~
	"ios": {
		"AppLovinSdkKey": "thekey"
	},
~~~

Note that the manifest keys are case-sensitive.

You can test for successful integration via the applovin website after successfully building and running your game on a network-connected device.

To show interstitials using applovin in your game, import the applovin object:

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
