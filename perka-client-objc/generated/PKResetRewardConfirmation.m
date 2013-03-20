// Generated File - DO NOT EDIT

#import "PKResetRewardConfirmation.h"
#import "PKReward.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKResetRewardConfirmation

@synthesize reward = _reward;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // reward
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"de4374c2-35b6-3afd-8c46-a83a94820023"
                    withDictionary:@{
                      @"name":@"reward",
                      @"kind":[PKReward class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"resetRewardConfirmation",
    @"superType":[PKAbstractRewardConfirmation entityDescription],
    @"kind":[PKResetRewardConfirmation class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"resetRewardConfirmation"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end