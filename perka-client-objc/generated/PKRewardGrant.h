// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "FPBaseHasUuid.h"

@class PKAbstractRewardConfirmation;
@class PKCustomer;
@class PKRewardGrant;

/** Encapsulates one or more \link PKAbstractRewardConfirmation AbstractRewardConfirmation 
*   \endlink objects to be given to a customer. <p> This differs from a \link PKVisitConfirmation 
*   VisitConfirmation \endlink in that there's no previously-created Visit object 
*   to confirm. Instead, a RewardGrant will create a confirmed Visit and possibly 
*   create a Customer object based on an email address or SMS phone number. The 
*   UUID of the Visit object will be set to the RewardGrant's UUID to allow post-grant 
*   correlation. <p> Exactly one of <entityReference payloadName='rewardGrant'> 
*   #customerEmail()</entityReference>, <entityReference payloadName='rewardGrant'> 
*   #customerPhone()</entityReference>, or <entityReference payloadName='rewardGrant'> 
*   #customerUuid()</entityReference> must be provided to identify the customer.
*/
@interface PKRewardGrant : FPBaseHasUuid

@property (strong) PKCustomer *customer;

/** Allows the effective date of the resulting visit to be back-dated.
*/
@property (strong) NSString *effectiveAt;

/** At least one \link PKAbstractRewardConfirmation AbstractRewardConfirmation 
*   \endlink must be given.
*/
@property (strong) NSMutableArray *rewardConfirmations;

/** Adds an item to the rewardConfirmations collection while maintaining a proper bi-directional association
*/
- (void)addItemToRewardConfirmations:(PKAbstractRewardConfirmation *)item;

@end
