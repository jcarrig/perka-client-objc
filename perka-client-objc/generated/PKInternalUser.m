// Generated File - DO NOT EDIT

#import "PKInternalUser.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKInternalUser


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"internalUser",
    @"superType":[PKAbstractUser entityDescription],
    @"kind":[PKInternalUser class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"internalUser"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end