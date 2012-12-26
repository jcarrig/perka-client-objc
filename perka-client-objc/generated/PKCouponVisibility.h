// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKCoupon;
@class PKCouponTarget;
@class PKCouponVisibility;
@class PKMerchantLocation;

/** Allows a particular \link PKCoupon Coupon \endlink to be offered at a single 
*   \link PKMerchantLocation MerchantLocation \endlink. The visiblity of the \link 
*   PKCoupon Coupon \endlink will be further filtered to a \link PKCustomer Customer 
*   \endlink based on the associated \link PKCouponTarget CouponTarget \endlink.
*/
@interface PKCouponVisibility : PKBaseEntityGlobal

@property (strong) PKCoupon *coupon;

@property (strong) PKCouponTarget *couponTarget;

@property (strong) NSString *couponTargetType;

@property (strong) PKMerchantLocation *merchantLocation;

@end
