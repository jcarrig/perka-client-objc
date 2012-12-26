// Generated File - DO NOT EDIT

#import "PKCustomer.h"
#import "PKSocialServiceSubscription.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKSocialServiceSubscription

@synthesize customer = _customer;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // customer
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"3972e346-4db4-30a3-8080-443897be984d"
                    withDictionary:@{
                      @"name":@"customer",
                      @"kind":[PKCustomer class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"a0d269f1-33f8-3a6d-821f-8ee78eb47e26"]
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