#import "OxenCoinPlugin.h"
#import <oxen_coin/oxen_coin-Swift.h>
//#include "../External/android/monero/include/wallet2_api.h"

@implementation OxenCoinPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOxenCoinPlugin registerWithRegistrar:registrar];
}
@end
