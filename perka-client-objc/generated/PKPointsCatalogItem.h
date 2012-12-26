// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKMerchant;
@class PKPointsCatalogItem;

/** Defines a good or service offered by a merchant using a points-based loyalty 
*   program.
*/
@interface PKPointsCatalogItem : PKBaseEntityGlobal

/** The time at which the catalog item will no longer be available for redemption.
*/
@property (strong) NSString *expiresAt;

/** An optional icon name used when rendering the catalog item.
*/
@property (strong) NSString *icon;

/** A short label for describing the item.
*/
@property (strong) NSString *label;

/** The merchant that owns the item.
*/
@property (strong) PKMerchant *merchant;

/** The number of points required to redeem the item.
*/
@property (strong) NSObject *pointsRequired;

@property (strong) NSNumber *position;

/** A longer text description of the item, including any terms and conditions.
*/
@property (strong) NSString *terms;

@end
