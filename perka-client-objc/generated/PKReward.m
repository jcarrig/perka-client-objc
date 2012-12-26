// Generated File - DO NOT EDIT

#import "PKCustomer.h"
#import "PKMerchant.h"
#import "PKProgram.h"
#import "PKReward.h"
#import "PKRewardAdvancement.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKReward

@synthesize customer = _customer;
@synthesize merchant = _merchant;
@synthesize program = _program;
@synthesize rewardAdvancements = _rewardAdvancements;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // activatedAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"ee820956-6619-3c2e-a560-0f7af4f47fc7"
                    withDictionary:@{
                      @"name":@"activatedAt",
                      @"kind":[NSString class]
                    }]];

  // customer
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"0dd97dc5-cb7c-3613-99f8-8c55d6bd4f44"
                    withDictionary:@{
                      @"name":@"customer",
                      @"kind":[PKCustomer class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"dead2240-32e4-38f7-81e8-d0e48e3ab324"]
                    }]];

  // merchant
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"279d080c-8985-3298-bb4e-ae364a77d2ab"
                    withDictionary:@{
                      @"name":@"merchant",
                      @"kind":[PKMerchant class]
                    }]];

  // program
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"042c7a58-2444-3d2b-bc92-76ccb4effc0c"
                    withDictionary:@{
                      @"name":@"program",
                      @"kind":[PKProgram class]
                    }]];

  // punchesEarned
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"e4e0377a-0d26-3aac-b0ef-e3f9f5f39967"
                    withDictionary:@{
                      @"name":@"punchesEarned",
                      @"kind":[NSNumber class]
                    }]];

  // redeemedAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"97a534a4-fe32-3e32-9220-1937d1c2d054"
                    withDictionary:@{
                      @"name":@"redeemedAt",
                      @"kind":[NSString class]
                    }]];

  // rewardAdvancements
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"60054586-be74-3e00-b3ce-b39fdccfc32f"
                    withDictionary:@{
                      @"name":@"rewardAdvancements",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"4aa06b21-bcd2-3b6a-8745-8f9dc3c1e9b9"]
                    }]];

  // transferredAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"c0ffedaf-be1a-3442-8042-1857aa4e654c"
                    withDictionary:@{
                      @"name":@"transferredAt",
                      @"kind":[NSString class]
                    }]];

  // type
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"2fa6495a-9af5-36ac-b304-8272db59c877"
                    withDictionary:@{
                      @"name":@"type",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"reward",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKReward class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"reward"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _rewardAdvancements = [NSMutableArray new];
  }
  return self;
}

// customer many-to-one accessors to maintain bi-directional relationships
- (PKCustomer *)customer{
  return _customer;
}
- (void)setCustomer:(PKCustomer *)customer {
  _customer = customer;
  if(![[_customer rewards] containsObject:self]) {
    [[_customer rewards] addObject:self];
  }
}

// rewardAdvancements one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)rewardAdvancements {
  return _rewardAdvancements;
}
- (void)setRewardAdvancements:(NSMutableArray *)rewardAdvancements {
  _rewardAdvancements = [rewardAdvancements mutableCopy];
  [_rewardAdvancements enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"reward"];
  }];
}
- (void)addItemToRewardAdvancements:(PKRewardAdvancement *)item {
  [_rewardAdvancements addObject:item];
  [item setValue:self forKey:@"reward"];
}

@end