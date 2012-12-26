// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKMerchant;
@class PKProgram;
@class PKProgramTier;
@class PKTierTraversal;

/** A program tier defines additional benefits for customers with a certain minimum 
*   visit count.
*/
@interface PKProgramTier : PKBaseEntityGlobal

@property (strong) NSString *additionalPerks;

@property (strong) PKMerchant *merchant;

@property (strong) NSString *name;

@property (strong) NSObject *pointsMultiplier;

@property (strong) NSMutableArray *programs;

@property (strong) NSMutableArray *tierTraversals;

@property (strong) NSNumber *visitsNeeded;

/** Adds an item to the programs collection while maintaining a proper bi-directional association
*/
- (void)addItemToPrograms:(PKProgram *)item;


/** Adds an item to the tierTraversals collection while maintaining a proper bi-directional association
*/
- (void)addItemToTierTraversals:(PKTierTraversal *)item;

@end
