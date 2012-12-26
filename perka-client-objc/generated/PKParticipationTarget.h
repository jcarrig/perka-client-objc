// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKListTarget.h"

@class PKParticipationTarget;
@class PKProgramType;

/** Classifies customers based on their performance within the \link PKProgram Program 
*   \endlink associated with a \link PKProgramType ProgramType \endlink.
*/
@interface PKParticipationTarget : PKListTarget

/** The program type for which punches should be found.
*/
@property (strong) PKProgramType *programType;

/** The comparison value.
*/
@property (strong) NSNumber *threshold;

/** A moving window used to filter the statistics.
*/
@property (strong) NSNumber *windowDays;

@end
