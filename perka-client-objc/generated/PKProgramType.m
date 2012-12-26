// Generated File - DO NOT EDIT

#import "PKProgramType.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKProgramType


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

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

@end