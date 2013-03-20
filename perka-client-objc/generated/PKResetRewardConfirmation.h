// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKAbstractRewardConfirmation.h"

@class PKResetRewardConfirmation;
@class PKReward;

/** Allows a previously-redeemed Reward to be redeemed again. This can be used as 
*   part of a \link PKRewardGrant RewardGrant \endlink or \link PKVisitConfirmation 
*   VisitConfirmation \endlink.
*/
@interface PKResetRewardConfirmation : PKAbstractRewardConfirmation

/** The reward to re-issue.
*/
@property (strong) PKReward *reward;

@end
