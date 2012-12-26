// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "FPBaseHasUuid.h"

@class PKBaseEntityGlobal;

/** Provides random uuid generation
*/
@interface PKBaseEntityGlobal : FPBaseHasUuid

/** Returns the time at which the entity was first persisted to the Perka database.
*/
@property (strong) NSString *createdAt;

/** Returns the last time at which an update to the entity was persisted to the 
*   database. This property will be null for entities that have never been mutated 
*   since originally being persisted.
*/
@property (strong) NSString *updatedAt;

@end
