// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "FPBaseHasUuid.h"

@class PKAbstractRewardConfirmation;
@class PKCustomer;
@class PKMerchant;
@class PKVisit;
@class PKVisitConfirmation;

/** Confirms a previously-created \link PKVisit Visit \endlink that was the result 
*   of a \link PKCustomer Customer \endlink checking into a location.
*/
@interface PKVisitConfirmation : FPBaseHasUuid

/** The \link PKCustomer Customer \endlink associated with the \link PKVisit Visit 
*   \endlink. This property is usually inferred from the associated \link PKVisit 
*   Visit \endlink.
*/
@property (strong) PKCustomer *customer;

/** The \link PKMerchant Merchant \endlink associated with the \link PKVisit Visit 
*   \endlink. This property is usually inferred from the associated \link PKVisit 
*   Visit \endlink.
*/
@property (strong) PKMerchant *merchant;

/** The rewards associated with the visit (e.g. punches earned, coupons redeemed).
*/
@property (strong) NSMutableArray *rewardConfirmations;

/** The previously-created \link PKVisit Visit \endlink that is associated with 
*   a customer checkin.
*/
@property (strong) PKVisit *visit;

/** Adds an item to the rewardConfirmations collection while maintaining a proper bi-directional association
*/
- (void)addItemToRewardConfirmations:(PKAbstractRewardConfirmation *)item;

@end
