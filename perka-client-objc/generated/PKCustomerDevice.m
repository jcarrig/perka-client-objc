// Generated File - DO NOT EDIT

#import "PKCustomer.h"
#import "PKCustomerDevice.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKCustomerDevice

@synthesize customer = _customer;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // customer
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"b268ca77-a404-3bbc-a1fd-2e2d656081bd"
                    withDictionary:@{
                      @"name":@"customer",
                      @"kind":[PKCustomer class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"f2e46fe5-9a3a-33d4-b596-9c2e786866fd"]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"customerDevice",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKCustomerDevice class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"customerDevice"];
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
  if(![[_customer customerDevices] containsObject:self]) {
    [[_customer customerDevices] addObject:self];
  }
}

@end