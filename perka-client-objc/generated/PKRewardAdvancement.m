// Generated File - DO NOT EDIT

#import "PKReward.h"
#import "PKRewardAdvancement.h"
#import "PKVisit.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKRewardAdvancement

@synthesize reward = _reward;
@synthesize visit = _visit;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // punchesEarned
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"bc233360-f2e1-3d2e-a033-4da5722d9096"
                    withDictionary:@{
                      @"name":@"punchesEarned",
                      @"kind":[NSNumber class]
                    }]];

  // reward
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"4aa06b21-bcd2-3b6a-8745-8f9dc3c1e9b9"
                    withDictionary:@{
                      @"name":@"reward",
                      @"kind":[PKReward class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"60054586-be74-3e00-b3ce-b39fdccfc32f"]
                    }]];

  // transfer
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"ce6b91f3-4640-356b-a7b2-26384565e911"
                    withDictionary:@{
                      @"name":@"transfer",
                      @"kind":[NSNumber class]
                    }]];

  // visit
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"fb0ec0f9-6a14-3200-a76a-fcd7f1a4b7a6"
                    withDictionary:@{
                      @"name":@"visit",
                      @"kind":[PKVisit class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"d127359b-eb52-30d4-ab80-570b0c3e3dbb"]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"rewardAdvancement",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKRewardAdvancement class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"rewardAdvancement"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}


// reward many-to-one accessors to maintain bi-directional relationships
- (PKReward *)reward{
  return _reward;
}
- (void)setReward:(PKReward *)reward {
  _reward = reward;
  if(![[_reward rewardAdvancements] containsObject:self]) {
    [[_reward rewardAdvancements] addObject:self];
  }
}

// visit many-to-one accessors to maintain bi-directional relationships
- (PKVisit *)visit{
  return _visit;
}
- (void)setVisit:(PKVisit *)visit {
  _visit = visit;
  if(![[_visit rewardAdvancements] containsObject:self]) {
    [[_visit rewardAdvancements] addObject:self];
  }
}

@end