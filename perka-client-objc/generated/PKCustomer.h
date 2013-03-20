// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKAbstractUser.h"

@class PKCustomer;
@class PKMerchantLocation;
@class PKReward;
@class PKSmsMessage;
@class PKSocialServiceSubscription;
@class PKTierTraversal;
@class PKVisit;

/** A Customer is someone who visits a \link PKMerchantLocation MerchantLocation 
*   \endlink and engages in a retail transaction.
*/
@interface PKCustomer : PKAbstractUser

@property (strong) NSString *avatarUrl;

@property (strong) NSString *email;

@property (strong) NSMutableArray *rewards;

@property (strong) NSMutableArray *smsMessages;

@property (strong) NSMutableArray *socialServiceSubscriptions;

@property (strong, getter=isSpecialsMessagingEnabled) NSNumber *specialsMessagingEnabled;

@property (strong) NSMutableArray *tierTraversals;

@property (strong) NSMutableArray *visits;

@property (strong) PKMerchantLocation *waitingMerchantLocation;

@property (strong) NSString *waitingNameSince;

/** Adds an item to the rewards collection while maintaining a proper bi-directional association
*/
- (void)addItemToRewards:(PKReward *)item;


/** Adds an item to the smsMessages collection while maintaining a proper bi-directional association
*/
- (void)addItemToSmsMessages:(PKSmsMessage *)item;


/** Adds an item to the socialServiceSubscriptions collection while maintaining a proper bi-directional association
*/
- (void)addItemToSocialServiceSubscriptions:(PKSocialServiceSubscription *)item;


/** Adds an item to the tierTraversals collection while maintaining a proper bi-directional association
*/
- (void)addItemToTierTraversals:(PKTierTraversal *)item;


/** Adds an item to the visits collection while maintaining a proper bi-directional association
*/
- (void)addItemToVisits:(PKVisit *)item;

@end
