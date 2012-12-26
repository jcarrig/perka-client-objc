// Generated File - DO NOT EDIT

#import "PKNobodyTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKNobodyTarget


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"nobodyTarget",
    @"superType":[PKCouponTarget entityDescription],
    @"kind":[PKNobodyTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"nobodyTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end