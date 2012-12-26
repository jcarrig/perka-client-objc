// Generated File - DO NOT EDIT

#import "PKIntegratorUser.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKIntegratorUser


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"integratorUser",
    @"superType":[PKAbstractUser entityDescription],
    @"kind":[PKIntegratorUser class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"integratorUser"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end