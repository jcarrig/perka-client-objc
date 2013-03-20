// Generated File - DO NOT EDIT

#import "PKCustomer.h"
#import "PKSocialServiceSubscription.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKSocialServiceSubscription

@synthesize customer = _customer;
@synthesize socialAction = _socialAction;
@synthesize socialService = _socialService;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // customer
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"3972e346-4db4-30a3-8080-443897be984d"
                    withDictionary:@{
                      @"name":@"customer",
                      @"kind":[PKCustomer class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"a0d269f1-33f8-3a6d-821f-8ee78eb47e26"]
                    }]];

  // socialAction
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"bb3899c9-7d5b-397b-91b9-86ce46e92a0a"
                    withDictionary:@{
                      @"name":@"socialAction",
                      @"kind":[NSString class]
                    }]];

  // socialService
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"eee73745-6f3a-39a1-8638-137b843bd990"
                    withDictionary:@{
                      @"name":@"socialService",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"socialServiceSubscription",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKSocialServiceSubscription class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"socialServiceSubscription"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}


// customer many-to-one accessors to maintain bi-directional relationships
- (PKCustomer *)customer{
  return _customer;
}
- (void)setCustomer:(PKCustomer *)customer {
  _customer = customer;
  if(![[_customer socialServiceSubscriptions] containsObject:self]) {
    [[_customer socialServiceSubscriptions] addObject:self];
  }
}

@end