// Generated File - DO NOT EDIT

#import "PKEverybodyTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKEverybodyTarget


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"everybodyTarget",
    @"superType":[PKCouponTarget entityDescription],
    @"kind":[PKEverybodyTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"everybodyTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end