// Generated File - DO NOT EDIT

#import "PKAbstractRewardConfirmation.h"
#import "PKCustomer.h"
#import "PKRewardGrant.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKRewardGrant

@synthesize customer = _customer;
@synthesize rewardConfirmations = _rewardConfirmations;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // customer
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"7859ae64-3c25-3c3a-a4eb-a7c0fa5fa026"
                    withDictionary:@{
                      @"name":@"customer",
                      @"kind":[PKCustomer class]
                    }]];

  // rewardConfirmations
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"c05c6ea5-5014-3c3e-aef6-71b10ec3668f"
                    withDictionary:@{
                      @"name":@"rewardConfirmations",
                      @"kind":[NSMutableArray class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"rewardGrant",
    @"superType":[FPBaseHasUuid entityDescription],
    @"kind":[PKRewardGrant class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"rewardGrant"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _rewardConfirmations = [NSMutableArray new];
  }
  return self;
}

// rewardConfirmations one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)rewardConfirmations {
  return _rewardConfirmations;
}
- (void)setRewardConfirmations:(NSMutableArray *)rewardConfirmations {
  _rewardConfirmations = [rewardConfirmations mutableCopy];
}
- (void)addItemToRewardConfirmations:(PKAbstractRewardConfirmation *)item {
  [_rewardConfirmations addObject:item];
}

@end