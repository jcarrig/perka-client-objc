// Generated File - DO NOT EDIT

#import "PKCustomer.h"
#import "PKSmsMessage.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKSmsMessage

@synthesize customer = _customer;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // customer
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"2275a1ad-791a-3ea5-bd53-31690e910755"
                    withDictionary:@{
                      @"name":@"customer",
                      @"kind":[PKCustomer class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"36dcc4c1-5b14-3a0d-a20b-4db9f2806f01"]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"smsMessage",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKSmsMessage class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"smsMessage"];
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
  if(![[_customer smsMessages] containsObject:self]) {
    [[_customer smsMessages] addObject:self];
  }
}

@end