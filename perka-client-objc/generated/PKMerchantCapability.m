// Generated File - DO NOT EDIT

#import "PKMerchant.h"
#import "PKMerchantCapability.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKMerchantCapability

@synthesize merchant = _merchant;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // merchant
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"477c75a8-b319-3665-abb2-6e914f7b7188"
                    withDictionary:@{
                      @"name":@"merchant",
                      @"kind":[PKMerchant class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"5e16feef-b9d3-3eaa-91e9-f8288233d981"]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"merchantCapability",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKMerchantCapability class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"merchantCapability"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}


// merchant many-to-one accessors to maintain bi-directional relationships
- (PKMerchant *)merchant{
  return _merchant;
}
- (void)setMerchant:(PKMerchant *)merchant {
  _merchant = merchant;
  if(![[_merchant merchantCapabilities] containsObject:self]) {
    [[_merchant merchantCapabilities] addObject:self];
  }
}

@end