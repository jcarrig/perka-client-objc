// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKClerk;
@class PKMerchant;
@class PKMerchantCapability;
@class PKMerchantLocation;
@class PKMerchantUser;
@class PKPointsCatalogItem;
@class PKProgramTier;

/** Merchants operate the retail locations that offer a Perka loyalty program.
*/
@interface PKMerchant : PKBaseEntityGlobal

/** A list of Clerks, which are limited to acting on specific locations.
*/
@property (strong) NSMutableArray *clerks;

@property (strong) NSString *headline;

/** Possible values: POINT, PUNCHCARD
*/
@property (strong) NSString *loyaltyType;

@property (strong, getter=isManaged) NSNumber *managed;

@property (strong) NSMutableArray *merchantCapabilities;

@property (strong) NSMutableArray *merchantLocations;

/** Possible values: SHARED_PARENT, SIGNUP, PRELIMINARY, DESIGNING, CHANGES_REQUESTED, 
*   TRIAL, LIVE, PAUSED, SUSPENDED, SHUTDOWN, OFF
*/
@property (strong) NSString *merchantState;

@property (strong) NSMutableArray *merchantUsers;

@property (strong) NSString *name;

@property (strong) PKMerchant *parentMerchant;

/** Points-based merchants will define one or more catalog items for which points 
*   can be redeemed.
*/
@property (strong) NSMutableArray *pointsCatalogItems;

/** Points-based merchants may offer a signup bonus to new customers for signing 
*   up.
*/
@property (strong) NSObject *pointsSignupBonus;

/** Returns the MerchantStates that the Merchant user may transition to.
*/
@property (strong) NSMutableArray *possibleMerchantStates;

@property (strong) NSMutableArray *programTiers;

@property (strong, getter=isSalesDemo) NSNumber *salesDemo;

@property (strong) NSString *terms;

@property (strong) NSNumber *visitExpirationMinutes;

@property (strong) NSString *websiteUrl;

/** Adds an item to the clerks collection while maintaining a proper bi-directional association
*/
- (void)addItemToClerks:(PKClerk *)item;


/** Adds an item to the merchantCapabilities collection while maintaining a proper bi-directional association
*/
- (void)addItemToMerchantCapabilities:(PKMerchantCapability *)item;


/** Adds an item to the merchantLocations collection while maintaining a proper bi-directional association
*/
- (void)addItemToMerchantLocations:(PKMerchantLocation *)item;


/** Adds an item to the merchantUsers collection while maintaining a proper bi-directional association
*/
- (void)addItemToMerchantUsers:(PKMerchantUser *)item;


/** Adds an item to the pointsCatalogItems collection while maintaining a proper bi-directional association
*/
- (void)addItemToPointsCatalogItems:(PKPointsCatalogItem *)item;


/** Adds an item to the possibleMerchantStates collection while maintaining a proper bi-directional association
*/
- (void)addItemToPossibleMerchantStates:(NSString *)item;


/** Adds an item to the programTiers collection while maintaining a proper bi-directional association
*/
- (void)addItemToProgramTiers:(PKProgramTier *)item;

@end
