// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKAbstractUser.h"

@class PKMerchant;
@class PKMerchantUser;

/** Represents a business owner or manager who is allowed to modify the associated 
*   \link PKMerchant Merchant \endlink object.
*/
@interface PKMerchantUser : PKAbstractUser

@property (strong) NSString *email;

@property (weak) PKMerchant *merchant;

@property (strong) NSString *unconfirmedEmail;

@property (strong, getter=isWeeklyEmailEnabled) NSNumber *weeklyEmailEnabled;

@end
