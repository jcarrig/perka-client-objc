// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKReward;
@class PKRewardAdvancement;
@class PKVisit;

/** Represents partial progress towards completing a Reward (i.e. some number of 
*   punches). These objects represent the aggregated effects of applying a \link 
*   PKPunchRewardConfirmation PunchRewardConfirmation \endlink.
*/
@interface PKRewardAdvancement : PKBaseEntityGlobal

@property (strong) NSNumber *punchesEarned;

@property (strong) PKReward *reward;

@property (strong, getter=isTransfer) NSNumber *transfer;

@property (strong) PKVisit *visit;

@end
