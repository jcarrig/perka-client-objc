// Generated File - DO NOT EDIT

#import "PKProgram.h"
#import "PKProgramType.h"
#import "PKPunchRewardConfirmation.h"
#import "PKVisit.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKPunchRewardConfirmation

@synthesize program = _program;
@synthesize programType = _programType;
@synthesize visit = _visit;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // program
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"68727e47-c266-34a9-8792-692dda4a6012"
                    withDictionary:@{
                      @"name":@"program",
                      @"kind":[PKProgram class]
                    }]];

  // programType
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"f6b6a8b0-9c02-332f-8c42-cd4d222b285a"
                    withDictionary:@{
                      @"name":@"programType",
                      @"kind":[PKProgramType class]
                    }]];

  // punchesEarned
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"3f71378c-0b25-3817-a43c-6b3167babe27"
                    withDictionary:@{
                      @"name":@"punchesEarned",
                      @"kind":[NSNumber class]
                    }]];

  // visit
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"c38d2b99-6473-3085-bb7f-4b541615960d"
                    withDictionary:@{
                      @"name":@"visit",
                      @"kind":[PKVisit class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"punchRewardConfirmation",
    @"superType":[PKAbstractRewardConfirmation entityDescription],
    @"kind":[PKPunchRewardConfirmation class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"punchRewardConfirmation"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end