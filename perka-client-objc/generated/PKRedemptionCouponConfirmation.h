// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKAbstractRewardConfirmation.h"

@class PKCoupon;
@class PKRedemptionCouponConfirmation;

/** Represents the redemption of a \link PKCoupon Coupon \endlink.
*/
@interface PKRedemptionCouponConfirmation : PKAbstractRewardConfirmation

/** The coupon that is being redeemed during the associated \link PKVisit Visit 
*   \endlink.
*/
@property (strong) PKCoupon *coupon;

@end
