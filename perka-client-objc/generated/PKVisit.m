// Generated File - DO NOT EDIT

#import "PKCouponRedemption.h"
#import "PKCustomer.h"
#import "PKFeedbackItem.h"
#import "PKMerchantLocation.h"
#import "PKPointsActivity.h"
#import "PKRewardAdvancement.h"
#import "PKVisit.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKVisit

@synthesize currentPointsActivity = _currentPointsActivity;
@synthesize customer = _customer;
@synthesize feedbackItem = _feedbackItem;
@synthesize merchantLocation = _merchantLocation;
@synthesize couponRedemptions = _couponRedemptions;
@synthesize pointsActivities = _pointsActivities;
@synthesize rewardAdvancements = _rewardAdvancements;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // couponRedemptions
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"6d5ab9e2-a3cc-3a96-93d1-b0a5ffcbd48e"
                    withDictionary:@{
                      @"name":@"couponRedemptions",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"43270d2a-8642-38b9-a138-9fc23ff9691e"]
                    }]];

  // currentPointsActivity
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"004c961b-6c40-3603-ad27-7568d4f6622d"
                    withDictionary:@{
                      @"name":@"currentPointsActivity",
                      @"kind":[PKPointsActivity class]
                    }]];

  // customer
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"58c09c90-ec2a-31c8-b019-555a523a37e9"
                    withDictionary:@{
                      @"name":@"customer",
                      @"kind":[PKCustomer class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"5fbef852-421f-3951-9337-2dac4d623338"]
                    }]];

  // feedbackItem
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"1ab83244-8f99-3688-80c8-2ea584ead5ab"
                    withDictionary:@{
                      @"name":@"feedbackItem",
                      @"kind":[PKFeedbackItem class]
                    }]];

  // merchantLocation
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"38aaa378-ba8f-3aff-9332-b073f5726135"
                    withDictionary:@{
                      @"name":@"merchantLocation",
                      @"kind":[PKMerchantLocation class]
                    }]];

  // pointsActivities
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"1535a8db-34ec-363d-917e-2f015ce4e472"
                    withDictionary:@{
                      @"name":@"pointsActivities",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"5c5408ab-e944-3b09-9cc6-95d7e32f24ca"]
                    }]];

  // rewardAdvancements
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d127359b-eb52-30d4-ab80-570b0c3e3dbb"
                    withDictionary:@{
                      @"name":@"rewardAdvancements",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"fb0ec0f9-6a14-3200-a76a-fcd7f1a4b7a6"]
                    }]];

  // sms
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"ff887959-9d51-3667-9ad7-c541e23885df"
                    withDictionary:@{
                      @"name":@"sms",
                      @"kind":[NSNumber class]
                    }]];

  // validatedAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"c20c857f-fc3e-3769-8242-f2fab9aa3a48"
                    withDictionary:@{
                      @"name":@"validatedAt",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"visit",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKVisit class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"visit"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _couponRedemptions = [NSMutableArray new];
    _pointsActivities = [NSMutableArray new];
    _rewardAdvancements = [NSMutableArray new];
  }
  return self;
}

// couponRedemptions one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)couponRedemptions {
  return _couponRedemptions;
}
- (void)setCouponRedemptions:(NSMutableArray *)couponRedemptions {
  _couponRedemptions = [couponRedemptions mutableCopy];
  [_couponRedemptions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"visit"];
  }];
}
- (void)addItemToCouponRedemptions:(PKCouponRedemption *)item {
  [_couponRedemptions addObject:item];
  [item setValue:self forKey:@"visit"];
}

// customer many-to-one accessors to maintain bi-directional relationships
- (PKCustomer *)customer{
  return _customer;
}
- (void)setCustomer:(PKCustomer *)customer {
  _customer = customer;
  if(![[_customer visits] containsObject:self]) {
    [[_customer visits] addObject:self];
  }
}

// pointsActivities one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)pointsActivities {
  return _pointsActivities;
}
- (void)setPointsActivities:(NSMutableArray *)pointsActivities {
  _pointsActivities = [pointsActivities mutableCopy];
  [_pointsActivities enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"visit"];
  }];
}
- (void)addItemToPointsActivities:(PKPointsActivity *)item {
  [_pointsActivities addObject:item];
  [item setValue:self forKey:@"visit"];
}

// rewardAdvancements one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)rewardAdvancements {
  return _rewardAdvancements;
}
- (void)setRewardAdvancements:(NSMutableArray *)rewardAdvancements {
  _rewardAdvancements = [rewardAdvancements mutableCopy];
  [_rewardAdvancements enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"visit"];
  }];
}
- (void)addItemToRewardAdvancements:(PKRewardAdvancement *)item {
  [_rewardAdvancements addObject:item];
  [item setValue:self forKey:@"visit"];
}

@end