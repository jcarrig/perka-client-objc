// Generated File - DO NOT EDIT

#import "PKAbstractRewardConfirmation.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKAbstractRewardConfirmation


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"abstractRewardConfirmation",
    @"superType":[FPBaseHasUuid entityDescription],
    @"kind":[PKAbstractRewardConfirmation class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"abstractRewardConfirmation"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end