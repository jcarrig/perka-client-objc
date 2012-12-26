// Generated File - DO NOT EDIT

#import "PKProgramTier.h"
#import "PKTierTraversalConfirmation.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKTierTraversalConfirmation

@synthesize programTier = _programTier;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // programTier
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d78c7093-b2f4-309c-8a64-bba6a2c997de"
                    withDictionary:@{
                      @"name":@"programTier",
                      @"kind":[PKProgramTier class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"tierTraversalConfirmation",
    @"superType":[PKAbstractRewardConfirmation entityDescription],
    @"kind":[PKTierTraversalConfirmation class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"tierTraversalConfirmation"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end