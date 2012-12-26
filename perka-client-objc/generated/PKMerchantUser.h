// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKAbstractUser.h"

@class PKMerchant;
@class PKMerchantUser;
@class PKOutboundMessage;
@class PKSmsMessage;

/** Represents a business owner or manager who is allowed to modify the associated 
*   \link PKMerchant Merchant \endlink object.
*/
@interface PKMerchantUser : PKAbstractUser

@property (strong) NSString *email;

@property (strong) PKMerchant *merchant;

@property (strong) NSMutableArray *outboundMessages;

@property (strong) NSMutableArray *smsMessages;

@property (strong) NSString *unconfirmedEmail;

@property (strong, getter=isWeeklyEmailEnabled) NSNumber *weeklyEmailEnabled;

/** Adds an item to the outboundMessages collection while maintaining a proper bi-directional association
*/
- (void)addItemToOutboundMessages:(PKOutboundMessage *)item;


/** Adds an item to the smsMessages collection while maintaining a proper bi-directional association
*/
- (void)addItemToSmsMessages:(PKSmsMessage *)item;

@end
