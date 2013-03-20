// Generated File - DO NOT EDIT

#import "PKClerk.h"
#import "PKMerchant.h"
#import "PKMerchantLocation.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKClerk

@synthesize merchant = _merchant;
@synthesize merchantLocations = _merchantLocations;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // anonymous
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"46a3b752-7c9c-37fd-a84b-47b2055a053c"
                    withDictionary:@{
                      @"name":@"anonymous",
                      @"kind":[NSNumber class]
                    }]];

  // email
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"641f23c3-64c8-3305-86a5-beb0f0ac1f52"
                    withDictionary:@{
                      @"name":@"email",
                      @"kind":[NSString class]
                    }]];

  // merchant
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"3dc5f620-58c7-3483-b3a8-d44c2e538ab2"
                    withDictionary:@{
                      @"name":@"merchant",
                      @"kind":[PKMerchant class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"aa70957a-8417-3c84-80eb-ace9b3b6a013"]
                    }]];

  // merchantLocations
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"45c9f21e-ad7c-35fc-ad9d-3bdbbfbfa826"
                    withDictionary:@{
                      @"name":@"merchantLocations",
                      @"kind":[NSMutableArray class]
                    }]];

  // unconfirmedEmail
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"9d277711-fa04-38f6-aeff-8491680cc665"
                    withDictionary:@{
                      @"name":@"unconfirmedEmail",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"clerk",
    @"superType":[PKAbstractUser entityDescription],
    @"kind":[PKClerk class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"clerk"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _merchantLocations = [NSMutableArray new];
  }
  return self;
}

// merchant many-to-one accessors to maintain bi-directional relationships
- (PKMerchant *)merchant{
  return _merchant;
}
- (void)setMerchant:(PKMerchant *)merchant {
  _merchant = merchant;
  if(![[_merchant clerks] containsObject:self]) {
    [[_merchant clerks] addObject:self];
  }
}

// merchantLocations one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)merchantLocations {
  return _merchantLocations;
}
- (void)setMerchantLocations:(NSMutableArray *)merchantLocations {
  _merchantLocations = [merchantLocations mutableCopy];
}
- (void)addItemToMerchantLocations:(PKMerchantLocation *)item {
  [_merchantLocations addObject:item];
}

@end