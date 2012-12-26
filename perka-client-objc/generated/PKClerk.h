// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKAbstractUser.h"

@class PKClerk;
@class PKMerchant;
@class PKMerchantLocation;
@class PKOutboundMessage;

/** A Clerk represents either an employee identity or a role identity used by the 
*   validator app. <p> Two distinct classes of Clerks exist: <ul> <li>Named clerks, 
*   representing a user authorized to perform actions at zero or more locations 
*   <li>Anonymous clerks, representing an access role for a single location </ul> 
*   A named clerk must downgrade to an anonymous clerk in order to perform validations 
*   at a single location. This avoids the need to store any particular user's credentials 
*   in the validator app.
*/
@interface PKClerk : PKAbstractUser

/** Indicates if the Clerk is an anonymous role account used by a validator application 
*   at a single location.
*/
@property (strong, getter=isAnonymous) NSNumber *anonymous;

@property (strong) NSString *email;

/** The \link PKMerchant Merchant \endlink that owns the clerk account.
*/
@property (strong) PKMerchant *merchant;

/** The locations that the clerk is allowed to interact with.
*/
@property (strong) NSMutableArray *merchantLocations;

@property (strong) NSMutableArray *outboundMessages;

@property (strong) NSString *unconfirmedEmail;

/** Adds an item to the merchantLocations collection while maintaining a proper bi-directional association
*/
- (void)addItemToMerchantLocations:(PKMerchantLocation *)item;


/** Adds an item to the outboundMessages collection while maintaining a proper bi-directional association
*/
- (void)addItemToOutboundMessages:(PKOutboundMessage *)item;

@end
