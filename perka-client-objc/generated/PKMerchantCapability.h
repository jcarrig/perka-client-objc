// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKMerchant;
@class PKMerchantCapability;

/** Describes a limitation placed upon a Merchant. This type associates a Merchant, 
*   a Type, and a integral count describing the actual limit.
*/
@interface PKMerchantCapability : PKBaseEntityGlobal

@property (weak) PKMerchant *merchant;

@end
