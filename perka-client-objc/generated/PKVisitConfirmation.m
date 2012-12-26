// Generated File - DO NOT EDIT

#import "PKAbstractRewardConfirmation.h"
#import "PKCustomer.h"
#import "PKMerchant.h"
#import "PKVisit.h"
#import "PKVisitConfirmation.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKVisitConfirmation

@synthesize customer = _customer;
@synthesize merchant = _merchant;
@synthesize visit = _visit;
@synthesize rewardConfirmations = _rewardConfirmations;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // customer
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"286862e5-6f83-3f20-baba-238c87f72650"
                    withDictionary:@{
                      @"name":@"customer",
                      @"kind":[PKCustomer class]
                    }]];

  // merchant
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"88a42bbe-e209-3c8b-a2df-14754b675784"
                    withDictionary:@{
                      @"name":@"merchant",
                      @"kind":[PKMerchant class]
                    }]];

  // rewardConfirmations
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"21fc80d2-2cd6-3f03-bfbf-f3adb1853ae9"
                    withDictionary:@{
                      @"name":@"rewardConfirmations",
                      @"kind":[NSMutableArray class]
                    }]];

  // visit
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"cf14ea91-74eb-3e8f-8328-c769f4d2b5a5"
                    withDictionary:@{
                      @"name":@"visit",
                      @"kind":[PKVisit class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"visitConfirmation",
    @"superType":[FPBaseHasUuid entityDescription],
    @"kind":[PKVisitConfirmation class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"visitConfirmation"];
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