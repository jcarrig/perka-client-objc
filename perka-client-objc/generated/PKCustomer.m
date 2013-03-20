// Generated File - DO NOT EDIT

#import "PKCustomer.h"
#import "PKMerchantLocation.h"
#import "PKReward.h"
#import "PKSmsMessage.h"
#import "PKSocialServiceSubscription.h"
#import "PKTierTraversal.h"
#import "PKVisit.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKCustomer

@synthesize waitingMerchantLocation = _waitingMerchantLocation;
@synthesize rewards = _rewards;
@synthesize smsMessages = _smsMessages;
@synthesize socialServiceSubscriptions = _socialServiceSubscriptions;
@synthesize tierTraversals = _tierTraversals;
@synthesize visits = _visits;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // avatarUrl
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"48978722-83f0-3362-aad3-1c5bd1768766"
                    withDictionary:@{
                      @"name":@"avatarUrl",
                      @"kind":[NSString class]
                    }]];

  // email
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"df85ea92-7b07-3486-bd03-e6ec4d303e38"
                    withDictionary:@{
                      @"name":@"email",
                      @"kind":[NSString class]
                    }]];

  // rewards
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"dead2240-32e4-38f7-81e8-d0e48e3ab324"
                    withDictionary:@{
                      @"name":@"rewards",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"0dd97dc5-cb7c-3613-99f8-8c55d6bd4f44"]
                    }]];

  // smsMessages
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"36dcc4c1-5b14-3a0d-a20b-4db9f2806f01"
                    withDictionary:@{
                      @"name":@"smsMessages",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"2275a1ad-791a-3ea5-bd53-31690e910755"]
                    }]];

  // socialServiceSubscriptions
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a0d269f1-33f8-3a6d-821f-8ee78eb47e26"
                    withDictionary:@{
                      @"name":@"socialServiceSubscriptions",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"3972e346-4db4-30a3-8080-443897be984d"]
                    }]];

  // specialsMessagingEnabled
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d385421b-2557-3051-859e-274c97b28585"
                    withDictionary:@{
                      @"name":@"specialsMessagingEnabled",
                      @"kind":[NSNumber class]
                    }]];

  // tierTraversals
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a2ed790f-d9dd-326f-bf07-4d175886cb2d"
                    withDictionary:@{
                      @"name":@"tierTraversals",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"d3e32350-d8b2-3c5b-ac22-737eeee84b00"]
                    }]];

  // visits
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"5fbef852-421f-3951-9337-2dac4d623338"
                    withDictionary:@{
                      @"name":@"visits",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"58c09c90-ec2a-31c8-b019-555a523a37e9"]
                    }]];

  // waitingMerchantLocation
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"46956722-6e32-3670-bf51-0bc169585fb4"
                    withDictionary:@{
                      @"name":@"waitingMerchantLocation",
                      @"kind":[PKMerchantLocation class]
                    }]];

  // waitingNameSince
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"328e3b65-7b6c-3a37-bc37-b6af7bf5e323"
                    withDictionary:@{
                      @"name":@"waitingNameSince",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"customer",
    @"superType":[PKAbstractUser entityDescription],
    @"kind":[PKCustomer class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"customer"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _rewards = [NSMutableArray new];
    _smsMessages = [NSMutableArray new];
    _socialServiceSubscriptions = [NSMutableArray new];
    _tierTraversals = [NSMutableArray new];
    _visits = [NSMutableArray new];
  }
  return self;
}

// rewards one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)rewards {
  return _rewards;
}
- (void)setRewards:(NSMutableArray *)rewards {
  _rewards = [rewards mutableCopy];
  [_rewards enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"customer"];
  }];
}
- (void)addItemToRewards:(PKReward *)item {
  [_rewards addObject:item];
  [item setValue:self forKey:@"customer"];
}

// smsMessages one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)smsMessages {
  return _smsMessages;
}
- (void)setSmsMessages:(NSMutableArray *)smsMessages {
  _smsMessages = [smsMessages mutableCopy];
  [_smsMessages enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"customer"];
  }];
}
- (void)addItemToSmsMessages:(PKSmsMessage *)item {
  [_smsMessages addObject:item];
  [item setValue:self forKey:@"customer"];
}

// socialServiceSubscriptions one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)socialServiceSubscriptions {
  return _socialServiceSubscriptions;
}
- (void)setSocialServiceSubscriptions:(NSMutableArray *)socialServiceSubscriptions {
  _socialServiceSubscriptions = [socialServiceSubscriptions mutableCopy];
  [_socialServiceSubscriptions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"customer"];
  }];
}
- (void)addItemToSocialServiceSubscriptions:(PKSocialServiceSubscription *)item {
  [_socialServiceSubscriptions addObject:item];
  [item setValue:self forKey:@"customer"];
}

// tierTraversals one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)tierTraversals {
  return _tierTraversals;
}
- (void)setTierTraversals:(NSMutableArray *)tierTraversals {
  _tierTraversals = [tierTraversals mutableCopy];
  [_tierTraversals enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"customer"];
  }];
}
- (void)addItemToTierTraversals:(PKTierTraversal *)item {
  [_tierTraversals addObject:item];
  [item setValue:self forKey:@"customer"];
}

// visits one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)visits {
  return _visits;
}
- (void)setVisits:(NSMutableArray *)visits {
  _visits = [visits mutableCopy];
  [_visits enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"customer"];
  }];
}
- (void)addItemToVisits:(PKVisit *)item {
  [_visits addObject:item];
  [item setValue:self forKey:@"customer"];
}

@end