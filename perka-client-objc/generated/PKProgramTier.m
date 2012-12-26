// Generated File - DO NOT EDIT

#import "PKMerchant.h"
#import "PKProgram.h"
#import "PKProgramTier.h"
#import "PKTierTraversal.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKProgramTier

@synthesize merchant = _merchant;
@synthesize programs = _programs;
@synthesize tierTraversals = _tierTraversals;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // additionalPerks
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"67959e44-3b75-39a0-8a82-223795d66047"
                    withDictionary:@{
                      @"name":@"additionalPerks",
                      @"kind":[NSString class]
                    }]];

  // merchant
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"836b3e6e-aa54-375a-9712-0c2f3d56220f"
                    withDictionary:@{
                      @"name":@"merchant",
                      @"kind":[PKMerchant class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"4fc11912-8fdf-3551-be83-e17ecf55704a"]
                    }]];

  // name
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"3a3cca9d-e940-3f8b-98dd-df93b4b4ca6e"
                    withDictionary:@{
                      @"name":@"name",
                      @"kind":[NSString class]
                    }]];

  // pointsMultiplier
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"cea90260-4ff5-3146-a63b-8f917c79aee4"
                    withDictionary:@{
                      @"name":@"pointsMultiplier",
                      @"kind":[NSObject class]
                    }]];

  // programs
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"6b1950d1-2b5e-35c6-bdc5-36bc15457f64"
                    withDictionary:@{
                      @"name":@"programs",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"d6a43205-9e62-3874-9065-b99036913614"]
                    }]];

  // tierTraversals
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"9a535527-d615-3862-babf-2e5006f5de43"
                    withDictionary:@{
                      @"name":@"tierTraversals",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"4a93ae53-1e28-3969-ad1d-23c18f7476b4"]
                    }]];

  // visitsNeeded
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"9dc21477-8ffe-34c2-9f08-5e09c8fe4b6d"
                    withDictionary:@{
                      @"name":@"visitsNeeded",
                      @"kind":[NSNumber class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"programTier",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKProgramTier class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"programTier"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _programs = [NSMutableArray new];
    _tierTraversals = [NSMutableArray new];
  }
  return self;
}

// merchant many-to-one accessors to maintain bi-directional relationships
- (PKMerchant *)merchant{
  return _merchant;
}
- (void)setMerchant:(PKMerchant *)merchant {
  _merchant = merchant;
  if(![[_merchant programTiers] containsObject:self]) {
    [[_merchant programTiers] addObject:self];
  }
}

// programs one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)programs {
  return _programs;
}
- (void)setPrograms:(NSMutableArray *)programs {
  _programs = [programs mutableCopy];
  [_programs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"programTier"];
  }];
}
- (void)addItemToPrograms:(PKProgram *)item {
  [_programs addObject:item];
  [item setValue:self forKey:@"programTier"];
}

// tierTraversals one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)tierTraversals {
  return _tierTraversals;
}
- (void)setTierTraversals:(NSMutableArray *)tierTraversals {
  _tierTraversals = [tierTraversals mutableCopy];
  [_tierTraversals enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"programTier"];
  }];
}
- (void)addItemToTierTraversals:(PKTierTraversal *)item {
  [_tierTraversals addObject:item];
  [item setValue:self forKey:@"programTier"];
}

@end