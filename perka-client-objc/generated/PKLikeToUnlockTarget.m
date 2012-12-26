// Generated File - DO NOT EDIT

#import "PKLikeToUnlockTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKLikeToUnlockTarget


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"likeToUnlockTarget",
    @"superType":[PKEverybodyTarget entityDescription],
    @"kind":[PKLikeToUnlockTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"likeToUnlockTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end