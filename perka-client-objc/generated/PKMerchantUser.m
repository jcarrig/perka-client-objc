// Generated File - DO NOT EDIT

#import "PKMerchant.h"
#import "PKMerchantUser.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKMerchantUser

@synthesize merchant = _merchant;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // email
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d71e0a38-8383-3261-b31c-cbb10032663c"
                    withDictionary:@{
                      @"name":@"email",
                      @"kind":[NSString class]
                    }]];

  // merchant
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"e54f6d53-ba05-3999-b4f9-98ec15fa172c"
                    withDictionary:@{
                      @"name":@"merchant",
                      @"kind":[PKMerchant class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"cb3bc90e-389e-376b-a3a9-c9c1f71a5214"]
                    }]];

  // unconfirmedEmail
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"84724c1a-44c3-3a0f-a9b9-b9bb34861cd1"
                    withDictionary:@{
                      @"name":@"unconfirmedEmail",
                      @"kind":[NSString class]
                    }]];

  // weeklyEmailEnabled
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"3c0366e4-ec23-3ac6-857d-49e3cf09f4ce"
                    withDictionary:@{
                      @"name":@"weeklyEmailEnabled",
                      @"kind":[NSNumber class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"merchantUser",
    @"superType":[PKAbstractUser entityDescription],
    @"kind":[PKMerchantUser class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"merchantUser"];
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
  if(![[_merchant merchantUsers] containsObject:self]) {
    [[_merchant merchantUsers] addObject:self];
  }
}

@end