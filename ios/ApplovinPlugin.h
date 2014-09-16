#import "PluginManager.h"
#import "applovin-ios-sdk/headers/ALSdk.h"
#import "applovin-ios-sdk/headers/ALInterstitialAd.h"

@interface ApplovinPlugin : GCPlugin <ALAdLoadDelegate, ALAdDisplayDelegate>

@property (strong, atomic) ALAd* cachedAd;

@end
