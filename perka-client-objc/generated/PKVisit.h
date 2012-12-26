// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKCouponRedemption;
@class PKCustomer;
@class PKFeedbackItem;
@class PKMerchantLocation;
@class PKPointsActivity;
@class PKRewardAdvancement;
@class PKVisit;

/** Represents a check-in at a \link PKMerchantLocation MerchantLocation \endlink 
*   by a \link PKCustomer Customer \endlink.
*/
@interface PKVisit : PKBaseEntityGlobal

/** The \link PKCoupon Coupons \endlink that were redeemed during the visit.
*/
@property (strong) NSMutableArray *couponRedemptions;

/** The latest \link PKPointsActivity PointsActivity \endlink for the Visit's \link 
*   PKCustomer Customer \endlink at the \link PKMerchantLocation MerchantLocation 
*   \endlink. This may be null if the customer has no previous points activity at 
*   the merchant.
*/
@property (strong) PKPointsActivity *currentPointsActivity;

@property (strong) PKCustomer *customer;

/** Any feedback left by the Customer after the Visit was validated.
*/
@property (strong) PKFeedbackItem *feedbackItem;

/** Where the Visit occurred.
*/
@property (strong) PKMerchantLocation *merchantLocation;

/** The PointsActivities associated with the visit.
*/
@property (strong) NSMutableArray *pointsActivities;

/** The punches earned during the Visit, broken out by \link PKReward Reward \endlink.
*/
@property (strong) NSMutableArray *rewardAdvancements;

/** Indicates that the Visit was created via the SMS endpoint and not from an app.
*/
@property (strong, getter=isSms) NSNumber *sms;

/** The time at which the visit was confirmed by the clerk.
*/
@property (strong) NSString *validatedAt;

/** Adds an item to the couponRedemptions collection while maintaining a proper bi-directional association
*/
- (void)addItemToCouponRedemptions:(PKCouponRedemption *)item;


/** Adds an item to the pointsActivities collection while maintaining a proper bi-directional association
*/
- (void)addItemToPointsActivities:(PKPointsActivity *)item;


/** Adds an item to the rewardAdvancements collection while maintaining a proper bi-directional association
*/
- (void)addItemToRewardAdvancements:(PKRewardAdvancement *)item;

@end
