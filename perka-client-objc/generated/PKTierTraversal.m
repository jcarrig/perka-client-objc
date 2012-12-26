// Generated File - DO NOT EDIT

#import "PKCustomer.h"
#import "PKProgramTier.h"
#import "PKTierTraversal.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKTierTraversal

@synthesize customer = _customer;
@synthesize programTier = _programTier;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // customer
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d3e32350-d8b2-3c5b-ac22-737eeee84b00"
                    withDictionary:@{
                      @"name":@"customer",
                      @"kind":[PKCustomer class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"a2ed790f-d9dd-326f-bf07-4d175886cb2d"]
                    }]];

  // programTier
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"4a93ae53-1e28-3969-ad1d-23c18f7476b4"
                    withDictionary:@{
                      @"name":@"programTier",
                      @"kind":[PKProgramTier class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"9a535527-d615-3862-babf-2e5006f5de43"]
                    }]];

  // visitCount
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"1b58a1eb-8e1c-3997-b666-4f68bf52b79c"
                    withDictionary:@{
                      @"name":@"visitCount",
                      @"kind":[NSNumber class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"tierTraversal",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKTierTraversal class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"tierTraversal"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}


// customer many-to-one accessors to maintain bi-directional relationships
- (PKCustomer *)customer{
  return _customer;
}
- (void)setCustomer:(PKCustomer *)customer {
  _customer = customer;
  if(![[_customer tierTraversals] containsObject:self]) {
    [[_customer tierTraversals] addObject:self];
  }
}

// programTier many-to-one accessors to maintain bi-directional relationships
- (PKProgramTier *)programTier{
  return _programTier;
}
- (void)setProgramTier:(PKProgramTier *)programTier {
  _programTier = programTier;
  if(![[_programTier tierTraversals] containsObject:self]) {
    [[_programTier tierTraversals] addObject:self];
  }
}

@end