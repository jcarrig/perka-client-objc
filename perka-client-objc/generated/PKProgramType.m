// Generated File - DO NOT EDIT

#import "PKProgram.h"
#import "PKProgramType.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKProgramType

@synthesize programs = _programs;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // expiresAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"5715bb95-1c64-3ce2-98e8-91f6731ec963"
                    withDictionary:@{
                      @"name":@"expiresAt",
                      @"kind":[NSString class]
                    }]];

  // expiresIn
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"edaf12a2-7fe9-3d31-a0a3-326dc7371b1c"
                    withDictionary:@{
                      @"name":@"expiresIn",
                      @"kind":[NSNumber class]
                    }]];

  // name
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a012ec16-e63e-3b76-a172-24df190f8347"
                    withDictionary:@{
                      @"name":@"name",
                      @"kind":[NSString class]
                    }]];

  // position
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"fe243a08-eee1-3c08-b2f2-433403b5b2b9"
                    withDictionary:@{
                      @"name":@"position",
                      @"kind":[NSNumber class]
                    }]];

  // programs
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a2ca494a-56fd-35e5-b4d7-d382208b2731"
                    withDictionary:@{
                      @"name":@"programs",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"acc11868-2193-3611-8a20-cdecce735aee"]
                    }]];

  // shared
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"5a41c277-84ca-3d76-8446-8fd442d5bf88"
                    withDictionary:@{
                      @"name":@"shared",
                      @"kind":[NSNumber class]
                    }]];

  // stampId
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"8e7b220f-76e5-3221-94c7-470d01b0e624"
                    withDictionary:@{
                      @"name":@"stampId",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"programType",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKProgramType class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"programType"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _programs = [NSMutableArray new];
  }
  return self;
}

// programs one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)programs {
  return _programs;
}
- (void)setPrograms:(NSMutableArray *)programs {
  _programs = [programs mutableCopy];
  [_programs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"programType"];
  }];
}
- (void)addItemToPrograms:(PKProgram *)item {
  [_programs addObject:item];
  [item setValue:self forKey:@"programType"];
}

@end