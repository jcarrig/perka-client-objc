// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKCoupon;
@class PKCouponRedemption;
@class PKVisit;

/** Represents a \link PKCustomer Customer \endlink's redemption of a particular 
*   \link PKCoupon Coupon \endlink.
*/
@interface PKCouponRedemption : PKBaseEntityGlobal

@property (strong) PKCoupon *coupon;

@property (strong) NSString *redeemedAt;

@property (strong) PKVisit *visit;

@end
