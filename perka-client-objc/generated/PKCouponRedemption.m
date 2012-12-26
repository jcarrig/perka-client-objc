// Generated File - DO NOT EDIT

#import "PKCoupon.h"
#import "PKCouponRedemption.h"
#import "PKVisit.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKCouponRedemption

@synthesize coupon = _coupon;
@synthesize visit = _visit;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // coupon
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"23e31d34-fe0f-3c4e-a30c-ead2dc57d738"
                    withDictionary:@{
                      @"name":@"coupon",
                      @"kind":[PKCoupon class]
                    }]];

  // redeemedAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"09adcdc8-c99a-32e3-936c-52cca5083dfc"
                    withDictionary:@{
                      @"name":@"redeemedAt",
                      @"kind":[NSString class]
                    }]];

  // visit
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"43270d2a-8642-38b9-a138-9fc23ff9691e"
                    withDictionary:@{
                      @"name":@"visit",
                      @"kind":[PKVisit class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"6d5ab9e2-a3cc-3a96-93d1-b0a5ffcbd48e"]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"couponRedemption",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKCouponRedemption class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"couponRedemption"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}


// visit many-to-one accessors to maintain bi-directional relationships
- (PKVisit *)visit{
  return _visit;
}
- (void)setVisit:(PKVisit *)visit {
  _visit = visit;
  if(![[_visit couponRedemptions] containsObject:self]) {
    [[_visit couponRedemptions] addObject:self];
  }
}

@end