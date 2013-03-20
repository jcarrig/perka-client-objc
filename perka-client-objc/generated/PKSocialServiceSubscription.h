// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKCustomer;
@class PKSocialServiceSubscription;

/** Represents a customer's preference to have a specific social event posted to 
*   a specific social backend.
*/
@interface PKSocialServiceSubscription : PKBaseEntityGlobal

@property (weak) PKCustomer *customer;

/** Possible values: POST_CHECKINS, POST_REWARDS
*/
@property (strong) NSString *socialAction;

/** Possible values: FACEBOOK, TWITTER, FOURSQUARE
*/
@property (strong) NSString *socialService;

@end
