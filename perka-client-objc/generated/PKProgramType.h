// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKProgram;
@class PKProgramType;

/** A ProgramType defines a single kind of offer made by the Merchant. For example, 
*   a Merchant may have two ProgramTypes, one for coffee sales and another for sandwich 
*   sales. Because Customers are offered increasingly better perks as they return 
*   over time, a single ProgramType is used to aggregate multiple \link PKProgram 
*   Program \endlink objects that have a fan-out based on \link PKProgramTier ProgramTier 
*   \endlink.
*/
@interface PKProgramType : PKBaseEntityGlobal

@property (strong) NSString *expiresAt;

@property (strong) NSNumber *expiresIn;

@property (strong) NSString *name;

@property (strong) NSNumber *position;

@property (strong) NSMutableArray *programs;

@property (strong, getter=isShared) NSNumber *shared;

@property (strong) NSString *stampId;

/** Adds an item to the programs collection while maintaining a proper bi-directional association
*/
- (void)addItemToPrograms:(PKProgram *)item;

@end
