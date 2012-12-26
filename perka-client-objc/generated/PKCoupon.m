// Generated File - DO NOT EDIT

#import "PKCoupon.h"
#import "PKCouponCampaign.h"
#import "PKCouponVisibility.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKCoupon

@synthesize couponCampaign = _couponCampaign;
@synthesize couponVisibilities = _couponVisibilities;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // couponCampaign
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"f8e9a98f-6196-3c6c-8fdc-962f492d91c6"
                    withDictionary:@{
                      @"name":@"couponCampaign",
                      @"kind":[PKCouponCampaign class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"a7655794-8dcf-3170-9a6b-67cc43cc762b"]
                    }]];

  // couponVisibilities
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"ac52d49f-9f68-3d72-8bf8-fa52e62eb481"
                    withDictionary:@{
                      @"name":@"couponVisibilities",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"dc7244ab-26dc-30cd-a474-4a24879bc081"]
                    }]];

  // imageName
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"8b83906b-7138-3951-8c11-5e4a8401e620"
                    withDictionary:@{
                      @"name":@"imageName",
                      @"kind":[NSString class]
                    }]];

  // localBeginsAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"735d044c-8b49-3144-a793-470c7959c644"
                    withDictionary:@{
                      @"name":@"localBeginsAt",
                      @"kind":[NSString class]
                    }]];

  // localEndsAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"946ab97b-783d-3010-97a9-b625cbe7a45c"
                    withDictionary:@{
                      @"name":@"localEndsAt",
                      @"kind":[NSString class]
                    }]];

  // notifyMinutesBefore
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a1e1390d-6d31-345f-95f1-ce689a866e6b"
                    withDictionary:@{
                      @"name":@"notifyMinutesBefore",
                      @"kind":[NSNumber class]
                    }]];

  // perkId
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"0c29c488-eee8-37e4-9f88-117061985f19"
                    withDictionary:@{
                      @"name":@"perkId",
                      @"kind":[NSString class]
                    }]];

  // pushEnabled
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"8e23c911-3f9e-3a94-9bec-820c21a67b68"
                    withDictionary:@{
                      @"name":@"pushEnabled",
                      @"kind":[NSNumber class]
                    }]];

  // redemptionLimit
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"65f23edb-7df6-3346-a4a8-05476b83b9f3"
                    withDictionary:@{
                      @"name":@"redemptionLimit",
                      @"kind":[NSNumber class]
                    }]];

  // summary
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"4e9a5635-d4d3-37ed-9a6f-542c9bb652fa"
                    withDictionary:@{
                      @"name":@"summary",
                      @"kind":[NSString class]
                    }]];

  // title
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"b5e486c1-432f-34d1-90f0-33d15f4b7569"
                    withDictionary:@{
                      @"name":@"title",
                      @"kind":[NSString class]
                    }]];

  // url
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"e0d256a6-42ef-3264-b194-d658aa2f22e7"
                    withDictionary:@{
                      @"name":@"url",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"coupon",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKCoupon class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"coupon"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _couponVisibilities = [NSMutableArray new];
  }
  return self;
}

// couponCampaign many-to-one accessors to maintain bi-directional relationships
- (PKCouponCampaign *)couponCampaign{
  return _couponCampaign;
}
- (void)setCouponCampaign:(PKCouponCampaign *)couponCampaign {
  _couponCampaign = couponCampaign;
  if(![[_couponCampaign coupons] containsObject:self]) {
    [[_couponCampaign coupons] addObject:self];
  }
}

// couponVisibilities one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)couponVisibilities {
  return _couponVisibilities;
}
- (void)setCouponVisibilities:(NSMutableArray *)couponVisibilities {
  _couponVisibilities = [couponVisibilities mutableCopy];
  [_couponVisibilities enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"coupon"];
  }];
}
- (void)addItemToCouponVisibilities:(PKCouponVisibility *)item {
  [_couponVisibilities addObject:item];
  [item setValue:self forKey:@"coupon"];
}

@end