#import "PluginManager.h"
#import "applovin-ios-sdk-2.4.1/headers/ALSdk.h"
#import "applovin-ios-sdk-2.4.1/headers/ALInterstitialAd.h"

@interface ApplovinPlugin : GCPlugin <ALAdLoadDelegate, ALAdDisplayDelegate>

@property (strong, atomic) ALAd* cachedAd;

@end
