// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKAbstractRewardConfirmation.h"

@class PKProgram;
@class PKProgramType;
@class PKPunchRewardConfirmation;
@class PKVisit;

/** Represents an award of some number of punches on a punchcard.
*/
@interface PKPunchRewardConfirmation : PKAbstractRewardConfirmation

/** An instance of a \link PKProgram Program \endlink that the punches should be 
*   applied to.
*/
@property (strong) PKProgram *program;

@property (strong) PKProgramType *programType;

/** The number of punches to be applied to the punchcard.
*/
@property (strong) NSNumber *punchesEarned;

/** This property is only present when a \link PKPunchRewardConfirmation PunchRewardConfirmation 
*   \endlink is returned by the server to represent past customer interactions. 
*   Normally, a \link PKPunchRewardConfirmation PunchRewardConfirmation \endlink 
*   is a member of a \link PKRewardGrant RewardGrant \endlink or \link PKVisitConfirmation 
*   VisitConfirmation \endlink which will provide a contextual \link PKVisit Visit 
*   \endlink.
*/
@property (strong) PKVisit *visit;

@end
