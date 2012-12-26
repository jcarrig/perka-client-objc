// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKAbstractRewardConfirmation.h"

@class PKPointsActivityConfirmation;
@class PKPointsCatalogItem;

/** Represents activity in a points-based loyalty program.
*/
@interface PKPointsActivityConfirmation : PKAbstractRewardConfirmation

/** The total dollar amount spent during the transaction.
*/
@property (strong) NSObject *moneySpent;

/** Catalog items that are being redeemed.
*/
@property (strong) NSMutableArray *pointsCatalogItems;

/** Adds an item to the pointsCatalogItems collection while maintaining a proper bi-directional association
*/
- (void)addItemToPointsCatalogItems:(PKPointsCatalogItem *)item;

@end
