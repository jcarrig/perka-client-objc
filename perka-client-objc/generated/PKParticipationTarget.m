// Generated File - DO NOT EDIT

#import "PKParticipationTarget.h"
#import "PKProgramType.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKParticipationTarget

@synthesize programType = _programType;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // programType
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"1b6275fb-34bf-3dd3-9ac1-5a31b77231b1"
                    withDictionary:@{
                      @"name":@"programType",
                      @"kind":[PKProgramType class]
                    }]];

  // threshold
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"8206253e-0408-3ad1-8365-834f1fb16832"
                    withDictionary:@{
                      @"name":@"threshold",
                      @"kind":[NSNumber class]
                    }]];

  // windowDays
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"9bbc753f-3d01-3e26-b1d1-8534d409d0be"
                    withDictionary:@{
                      @"name":@"windowDays",
                      @"kind":[NSNumber class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"participationTarget",
    @"superType":[PKListTarget entityDescription],
    @"kind":[PKParticipationTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"participationTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end