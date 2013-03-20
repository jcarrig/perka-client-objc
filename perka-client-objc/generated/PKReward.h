// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKCustomer;
@class PKMerchant;
@class PKProgram;
@class PKReward;
@class PKRewardAdvancement;

/** A punchcard that a customer has filled or is in the process of filling. These 
*   objects represent an aggregated view of the effects of applying \link PKPunchRewardConfirmation 
*   PunchRewardConfirmation \endlink. A Reward may be redeemed once it has been 
*   activated.
*/
@interface PKReward : PKBaseEntityGlobal

@property (strong) NSString *activatedAt;

@property (weak) PKCustomer *customer;

@property (strong) PKMerchant *merchant;

@property (strong) PKProgram *program;

@property (strong) NSNumber *punchesEarned;

@property (strong) NSString *redeemedAt;

@property (strong) NSMutableArray *rewardAdvancements;

@property (strong) NSString *skuRedeemed;

@property (strong) NSString *transferredAt;

@property (strong) NSString *type;

/** Adds an item to the rewardAdvancements collection while maintaining a proper bi-directional association
*/
- (void)addItemToRewardAdvancements:(PKRewardAdvancement *)item;

@end
