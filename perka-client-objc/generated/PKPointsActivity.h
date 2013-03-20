// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKPointsActivity;
@class PKPointsCatalogItem;
@class PKVisit;

/** Represents activity in a points-based loyalty program.
*/
@interface PKPointsActivity : PKBaseEntityGlobal

/** The number of points that were redeemed
*/
@property (strong) NSObject *charge;

@property (strong) NSObject *credit;

@property (strong) NSObject *currentTotal;

@property (strong) PKPointsActivity *nextActivity;

@property (strong) PKPointsCatalogItem *redeemed;

@property (weak) PKVisit *visit;

@end
