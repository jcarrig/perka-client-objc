// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKClerk;
@class PKCouponVisibility;
@class PKMerchant;
@class PKMerchantDevice;
@class PKMerchantLocation;
@class PKStreetAddress;

/** Represents a single physical location operated by a Merchant where Customers 
*   can participate in a Perka loyalty program.
*/
@interface PKMerchantLocation : PKBaseEntityGlobal

/** The named Clerks which are allowed to operate on the MerchantLocation. This 
*   relationship is owned by the Clerk object.
*/
@property (strong) NSMutableArray *clerks;

/** Used to implicitly concatenate the <code>address</code> and <code>address2</code> 
*   fields in a friendly format.
*/
@property (strong) NSString *combinedAddress;

@property (strong) NSMutableArray *couponVisibilities;

@property (strong) NSNumber *distanceInMeters;

@property (strong) NSObject *geoLocation;

@property (strong) NSNumber *latitude;

@property (strong) NSNumber *longitude;

@property (strong) PKMerchant *merchant;

@property (strong) NSMutableArray *merchantDevices;

@property (strong) NSString *neighborhoodName;

@property (strong) NSString *phone;

@property (strong) NSString *resolvedFacebookId;

@property (strong) NSString *smsId;

/** The preferred SMS endpoint for local users.
*/
@property (strong) NSString *smsPhoneNumber;

@property (strong) PKStreetAddress *streetAddress;

@property (strong) NSString *timezone;

/** Adds an item to the clerks collection while maintaining a proper bi-directional association
*/
- (void)addItemToClerks:(PKClerk *)item;


/** Adds an item to the couponVisibilities collection while maintaining a proper bi-directional association
*/
- (void)addItemToCouponVisibilities:(PKCouponVisibility *)item;


/** Adds an item to the merchantDevices collection while maintaining a proper bi-directional association
*/
- (void)addItemToMerchantDevices:(PKMerchantDevice *)item;

@end
