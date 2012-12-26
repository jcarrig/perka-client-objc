// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKCoupon;
@class PKCouponCampaign;

/** A CouponCampaign defines a relationship between what a merchant thinks of as 
*   a coupon and the collection of Coupon objects that implement the behavior. In 
*   general, a campaign consists of Coupons that span a non-contiguous set of time 
*   ranges, but that are otherwise identical in configuration.
*/
@interface PKCouponCampaign : PKBaseEntityGlobal

@property (strong) NSMutableArray *coupons;

/** Retains the original <code>RRULE</code> string used to construct the campaign.
*/
@property (strong) NSString *rrule;

@property (strong) NSString *title;

/** Adds an item to the coupons collection while maintaining a proper bi-directional association
*/
- (void)addItemToCoupons:(PKCoupon *)item;

@end
