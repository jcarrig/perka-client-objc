// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKCoupon;
@class PKCouponCampaign;
@class PKCouponVisibility;

/** Represents a specific offer extended to a merchant's customer base.
*/
@interface PKCoupon : PKBaseEntityGlobal

/** The parent CouponCampaign that aggregates related Coupons.
*/
@property (strong) PKCouponCampaign *couponCampaign;

/** The CouponVisibilites that control where and to whom the Coupon is available.
*/
@property (strong) NSMutableArray *couponVisibilities;

/** The short perk icon name (e.g. <code>unicorn</code>).
*/
@property (strong) NSString *imageName;

/** This property doesn't represent a single instance in time (i.e. a number of 
*   milliseconds past the epoch in UTC time). Instead, this value must be interpreted 
*   using the user's local timezone. For example, if the exact instant stored in 
*   this value is noon UTC time on such-and-such a day, this value should be interpreted 
*   to mean noon on that same date in the user's local timezone.
*/
@property (strong) NSString *localBeginsAt;

/** See note on #localBeginsAt() on how to interpret this.
*/
@property (strong) NSString *localEndsAt;

@property (strong) NSNumber *notifyMinutesBefore;

@property (strong) NSString *perkId;

/** Indicates whether or not the Coupon will be actively pushed to customer devices, 
*   or if it is a passive coupon.
*/
@property (strong, getter=isPushEnabled) NSNumber *pushEnabled;

@property (strong) NSNumber *redemptionLimit;

@property (strong) NSString *summary;

@property (strong) NSString *title;

@property (strong) NSString *url;

/** Adds an item to the couponVisibilities collection while maintaining a proper bi-directional association
*/
- (void)addItemToCouponVisibilities:(PKCouponVisibility *)item;

@end
