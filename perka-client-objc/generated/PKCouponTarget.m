// Generated File - DO NOT EDIT

#import "PKCompositeTarget.h"
#import "PKCouponTarget.h"
#import "PKMerchant.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKCouponTarget

@synthesize merchant = _merchant;
@synthesize parent = _parent;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // merchant
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"17598cf9-756d-38ef-98b4-b62c4aa6e4ef"
                    withDictionary:@{
                      @"name":@"merchant",
                      @"kind":[PKMerchant class]
                    }]];

  // parent
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"8ae3806b-dca7-35ad-ade3-97ec2b3cdc3e"
                    withDictionary:@{
                      @"name":@"parent",
                      @"kind":[PKCompositeTarget class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"eea61148-4853-3253-af7f-b0c64e1ab02c"]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"couponTarget",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKCouponTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"couponTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}


// parent many-to-one accessors to maintain bi-directional relationships
- (PKCompositeTarget *)parent{
  return _parent;
}
- (void)setParent:(PKCompositeTarget *)parent {
  _parent = parent;
  if(![[_parent children] containsObject:self]) {
    [[_parent children] addObject:self];
  }
}

@end