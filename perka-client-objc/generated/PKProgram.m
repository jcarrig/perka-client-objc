// Generated File - DO NOT EDIT

#import "PKProgram.h"
#import "PKProgramTier.h"
#import "PKProgramType.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKProgram

@synthesize programTier = _programTier;
@synthesize programType = _programType;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // freeItem
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a7e2dfb9-279b-33f2-ba59-1f557db449fe"
                    withDictionary:@{
                      @"name":@"freeItem",
                      @"kind":[NSString class]
                    }]];

  // imageName
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"99091c79-9bfb-3c9d-ac4f-3bb2e34b3a9b"
                    withDictionary:@{
                      @"name":@"imageName",
                      @"kind":[NSString class]
                    }]];

  // perkId
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"94b183a6-1b8a-32e4-a076-327043c157dc"
                    withDictionary:@{
                      @"name":@"perkId",
                      @"kind":[NSString class]
                    }]];

  // programTier
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d6a43205-9e62-3874-9065-b99036913614"
                    withDictionary:@{
                      @"name":@"programTier",
                      @"kind":[PKProgramTier class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"6b1950d1-2b5e-35c6-bdc5-36bc15457f64"]
                    }]];

  // programType
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"acc11868-2193-3611-8a20-cdecce735aee"
                    withDictionary:@{
                      @"name":@"programType",
                      @"kind":[PKProgramType class]
                    }]];

  // punchesNeeded
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"256c734a-b777-3d43-9ac8-97b71efc80c6"
                    withDictionary:@{
                      @"name":@"punchesNeeded",
                      @"kind":[NSNumber class]
                    }]];

  // punchesNeededPrefix
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"178bd9a6-1e55-3f2b-868c-54deafbd715e"
                    withDictionary:@{
                      @"name":@"punchesNeededPrefix",
                      @"kind":[NSString class]
                    }]];

  // punchesNeededSuffix
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"7103b368-bb90-3e01-8133-ce03bffcae58"
                    withDictionary:@{
                      @"name":@"punchesNeededSuffix",
                      @"kind":[NSString class]
                    }]];

  // purchasedItem
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"3a696515-afed-3c07-b2be-9658d90d06b4"
                    withDictionary:@{
                      @"name":@"purchasedItem",
                      @"kind":[NSString class]
                    }]];

  // terms
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"7d2b6715-fbbd-33fe-91ed-9a97a63dec94"
                    withDictionary:@{
                      @"name":@"terms",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"program",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKProgram class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"program"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}


// programTier many-to-one accessors to maintain bi-directional relationships
- (PKProgramTier *)programTier{
  return _programTier;
}
- (void)setProgramTier:(PKProgramTier *)programTier {
  _programTier = programTier;
  if(![[_programTier programs] containsObject:self]) {
    [[_programTier programs] addObject:self];
  }
}

@end