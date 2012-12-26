// Generated File - DO NOT EDIT

#import "PKCoupon.h"
#import "PKRedemptionCouponConfirmation.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKRedemptionCouponConfirmation

@synthesize coupon = _coupon;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // coupon
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"2e0f1d11-14cc-3706-840e-2f41004aa778"
                    withDictionary:@{
                      @"name":@"coupon",
                      @"kind":[PKCoupon class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"redemptionCouponConfirmation",
    @"superType":[PKAbstractRewardConfirmation entityDescription],
    @"kind":[PKRedemptionCouponConfirmation class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"redemptionCouponConfirmation"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end