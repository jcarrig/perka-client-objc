// Generated File - DO NOT EDIT

#import "PKMerchant.h"
#import "PKPointsCatalogItem.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKPointsCatalogItem

@synthesize merchant = _merchant;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // expiresAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"fc4b0f57-c901-3fb1-a298-e8547b5a943a"
                    withDictionary:@{
                      @"name":@"expiresAt",
                      @"kind":[NSString class]
                    }]];

  // icon
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"167d932c-265a-39f7-bb79-b34cf7908b13"
                    withDictionary:@{
                      @"name":@"icon",
                      @"kind":[NSString class]
                    }]];

  // label
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"316f2ddb-069e-34e3-becb-49b83aeabac7"
                    withDictionary:@{
                      @"name":@"label",
                      @"kind":[NSString class]
                    }]];

  // merchant
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"96b33fa5-c097-3137-a384-2d6b8965a14f"
                    withDictionary:@{
                      @"name":@"merchant",
                      @"kind":[PKMerchant class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"aeec11d2-c29c-308b-aa83-aaaa3997fee4"]
                    }]];

  // pointsRequired
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"3ea8683f-cbd5-3e58-b91a-ad714524b056"
                    withDictionary:@{
                      @"name":@"pointsRequired",
                      @"kind":[NSObject class]
                    }]];

  // position
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"5ff46ec5-93c5-3d86-b6a0-75860c3f4f4f"
                    withDictionary:@{
                      @"name":@"position",
                      @"kind":[NSNumber class]
                    }]];

  // terms
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"902fb07e-f026-3514-97f3-cccd274dd0ac"
                    withDictionary:@{
                      @"name":@"terms",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"pointsCatalogItem",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKPointsCatalogItem class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"pointsCatalogItem"];
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
  if(![[_merchant pointsCatalogItems] containsObject:self]) {
    [[_merchant pointsCatalogItems] addObject:self];
  }
}

@end