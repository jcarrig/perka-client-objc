// Generated File - DO NOT EDIT

#import "PKBaseEntityGlobal.h"
#import "PKEntityAnnotation.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKEntityAnnotation

@synthesize entity = _entity;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // annotation
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"03a54040-f781-37bf-a407-12bb81f41d6a"
                    withDictionary:@{
                      @"name":@"annotation",
                      @"kind":[NSObject class]
                    }]];

  // entity
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"63729edf-581c-384f-867e-839e047e958e"
                    withDictionary:@{
                      @"name":@"entity",
                      @"kind":[PKBaseEntityGlobal class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"entityAnnotation",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKEntityAnnotation class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"entityAnnotation"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end