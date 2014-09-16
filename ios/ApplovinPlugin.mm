#import "ApplovinPlugin.h"

@implementation ApplovinPlugin

// The plugin must call super dealloc.
- (void) dealloc {
	[super dealloc];
}

// The plugin must call super init.
- (id) init {
	self = [super init];
	if (!self) {
		return nil;
	}

	return self;
}

- (void) initializeWithManifest:(NSDictionary *)manifest appDelegate:(TeaLeafAppDelegate *)appDelegate {

	[ALSdk initializeSdk];

	NSLog(@"{applovin} Initialized with applovin");
}

- (void) cacheInterstitial:(NSDictionary *)jsonObject {
	[[[ALSdk shared] adService] loadNextAd: [ALAdSize sizeInterstitial] andNotify: self];
}

- (void) showInterstitial:(NSDictionary *)jsonObject {
	ALInterstitialAd* inter = [[ALInterstitialAd alloc] initWithSdk: [ALSdk shared]];

	inter.adDisplayDelegate = self;

	[inter showOver: [[UIApplication sharedApplication] keyWindow] andRender: self.cachedAd];    
}

-(void) ad:(ALAd *) ad wasDisplayedIn: (UIView *)view {
	NSLog(@"{applovin} displayed interstitial");
}

-(void) ad:(ALAd *) ad wasClickedIn: (UIView *)view {
	NSLog(@"{applovin} clicked interstitial");
}

-(void) ad:(ALAd *) ad wasHiddenIn: (UIView *)view {
	NSLog(@"{applovin} dismissed interstitial");
	[[PluginManager get] dispatchJSEvent:[NSDictionary dictionaryWithObjectsAndKeys:
		@"ApplovinAdDismissed",@"name",
		nil]];
}

-(void) adService:(ALAdService *)adService didLoadAd:(ALAd *)ad {
	self.cachedAd = ad;
	NSLog(@"{applovin} interstitial cached");
	[[PluginManager get] dispatchJSEvent:[NSDictionary dictionaryWithObjectsAndKeys:
		@"ApplovinAdAvailable",@"name",
		nil]];
}

-(void) adService:(ALAdService *)adService didFailToLoadAdWithError:(int)code {
	// Ad could not be loaded (network timeout or no-fill)
	NSLog(@"{applovin} failure to load interstitial");
	[[PluginManager get] dispatchJSEvent:[NSDictionary dictionaryWithObjectsAndKeys:
		@"ApplovinAdNotAvailable",@"name",
		nil]];
}

@end
