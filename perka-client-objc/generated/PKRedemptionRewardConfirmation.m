// Generated File - DO NOT EDIT

#import "PKRedemptionRewardConfirmation.h"
#import "PKReward.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKRedemptionRewardConfirmation

@synthesize reward = _reward;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // reward
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"855c9f45-d3b1-3bba-972b-02952ddce05c"
                    withDictionary:@{
                      @"name":@"reward",
                      @"kind":[PKReward class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"redemptionRewardConfirmation",
    @"superType":[PKAbstractRewardConfirmation entityDescription],
    @"kind":[PKRedemptionRewardConfirmation class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"redemptionRewardConfirmation"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end