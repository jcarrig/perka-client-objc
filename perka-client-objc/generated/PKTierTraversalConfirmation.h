// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKAbstractRewardConfirmation.h"

@class PKProgramTier;
@class PKTierTraversalConfirmation;

/** Allows a customer to be placed in an arbitrary program tier. This confirmation 
*   type may be used to demote a customer to a lower tier if the customer does not 
*   meet the visit count requirement for membership in its current tier.
*/
@interface PKTierTraversalConfirmation : PKAbstractRewardConfirmation

/** The ProgramTier that the customer associated with the visit should be moved 
*   into.
*/
@property (strong) PKProgramTier *programTier;

@end
