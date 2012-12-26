// Generated File - DO NOT EDIT

#import "PKCoupon.h"
#import "PKCouponCampaign.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKCouponCampaign

@synthesize coupons = _coupons;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // coupons
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a7655794-8dcf-3170-9a6b-67cc43cc762b"
                    withDictionary:@{
                      @"name":@"coupons",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"f8e9a98f-6196-3c6c-8fdc-962f492d91c6"]
                    }]];

  // rrule
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"6a1a36cb-0fc0-35cb-8cda-01309dced89d"
                    withDictionary:@{
                      @"name":@"rrule",
                      @"kind":[NSString class]
                    }]];

  // title
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"2581817e-cef9-3633-8dfc-d2e2401618ca"
                    withDictionary:@{
                      @"name":@"title",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"couponCampaign",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKCouponCampaign class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"couponCampaign"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _coupons = [NSMutableArray new];
  }
  return self;
}

// coupons one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)coupons {
  return _coupons;
}
- (void)setCoupons:(NSMutableArray *)coupons {
  _coupons = [coupons mutableCopy];
  [_coupons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"couponCampaign"];
  }];
}
- (void)addItemToCoupons:(PKCoupon *)item {
  [_coupons addObject:item];
  [item setValue:self forKey:@"couponCampaign"];
}

@end