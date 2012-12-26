// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKCouponTarget.h"

@class PKYieldManagementTarget;

/** A coupon target that enables a coupon during a specific time range during the 
*   day. The prototypical use of this target is for happy-hour specials. <p> The 
*   redemption window is expressed as location-relative local times (e.g. <code>1530</code>).
*/
@interface PKYieldManagementTarget : PKCouponTarget

/** Returns the minutes-of-day that the redemption window closes.
*/
@property (strong) NSString *localRedemptionEndAt;

/** Returns the minutes-of-day that the redemption window opens.
*/
@property (strong) NSString *localRedemptionStartAt;

@end
