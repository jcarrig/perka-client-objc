// Generated File - DO NOT EDIT

#import "PKCoupon.h"
#import "PKCouponTarget.h"
#import "PKCouponVisibility.h"
#import "PKMerchantLocation.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKCouponVisibility

@synthesize coupon = _coupon;
@synthesize couponTarget = _couponTarget;
@synthesize merchantLocation = _merchantLocation;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // coupon
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"dc7244ab-26dc-30cd-a474-4a24879bc081"
                    withDictionary:@{
                      @"name":@"coupon",
                      @"kind":[PKCoupon class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"ac52d49f-9f68-3d72-8bf8-fa52e62eb481"]
                    }]];

  // couponTarget
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"f08610b6-a925-35ce-967c-8e983a809bff"
                    withDictionary:@{
                      @"name":@"couponTarget",
                      @"kind":[PKCouponTarget class]
                    }]];

  // couponTargetType
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"e298b9d3-c72f-3081-8b57-98dee580ca6d"
                    withDictionary:@{
                      @"name":@"couponTargetType",
                      @"kind":[NSString class]
                    }]];

  // merchantLocation
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"de9bcf98-0f5d-35a2-835c-0bb3f07d4e9b"
                    withDictionary:@{
                      @"name":@"merchantLocation",
                      @"kind":[PKMerchantLocation class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"889595bd-97c7-3ad1-a89f-a3678ab0a601"]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"couponVisibility",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKCouponVisibility class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"couponVisibility"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}


// coupon many-to-one accessors to maintain bi-directional relationships
- (PKCoupon *)coupon{
  return _coupon;
}
- (void)setCoupon:(PKCoupon *)coupon {
  _coupon = coupon;
  if(![[_coupon couponVisibilities] containsObject:self]) {
    [[_coupon couponVisibilities] addObject:self];
  }
}

// merchantLocation many-to-one accessors to maintain bi-directional relationships
- (PKMerchantLocation *)merchantLocation{
  return _merchantLocation;
}
- (void)setMerchantLocation:(PKMerchantLocation *)merchantLocation {
  _merchantLocation = merchantLocation;
  if(![[_merchantLocation couponVisibilities] containsObject:self]) {
    [[_merchantLocation couponVisibilities] addObject:self];
  }
}

@end