// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKCompositeTarget;
@class PKCouponTarget;
@class PKMerchant;

/** The CustomerClass hierarchy defines memberships rules that have been defined 
*   by a Merchant.
*/
@interface PKCouponTarget : PKBaseEntityGlobal

@property (strong) PKMerchant *merchant;

/** An optional child-to-parent relationship that allows behaviors to be aggregated 
*   together.
*/
@property (weak) PKCompositeTarget *parent;

@end
