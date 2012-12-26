// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKCouponTarget.h"

@class PKCompositeTarget;
@class PKCouponTarget;

/** A \link PKCouponTarget CouponTarget \endlink that acts as a union or intersection 
*   of other \link PKCouponTarget CouponTarget \endlink objects.
*/
@interface PKCompositeTarget : PKCouponTarget

@property (strong) NSMutableArray *children;

/** Adds an item to the children collection while maintaining a proper bi-directional association
*/
- (void)addItemToChildren:(PKCouponTarget *)item;

@end
