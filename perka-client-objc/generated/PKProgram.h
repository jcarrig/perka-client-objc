// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKProgram;
@class PKProgramTier;
@class PKProgramType;

/** Program is a basic buy n(punchesNeeded) of x(purchasedItem), and get a free 
*   y(freeItem) when a customer has reached a certain ProgramTier.
*/
@interface PKProgram : PKBaseEntityGlobal

@property (strong) NSString *freeItem;

@property (strong) NSString *imageName;

@property (strong) NSString *perkId;

@property (weak) PKProgramTier *programTier;

@property (weak) PKProgramType *programType;

@property (strong) NSNumber *punchesNeeded;

@property (strong) NSString *punchesNeededPrefix;

@property (strong) NSString *punchesNeededSuffix;

@property (strong) NSString *purchasedItem;

@property (strong) NSString *terms;

@end
