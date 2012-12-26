// Generated File - DO NOT EDIT

#import "PKFirstVisitTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKFirstVisitTarget


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"firstVisitTarget",
    @"superType":[PKCouponTarget entityDescription],
    @"kind":[PKFirstVisitTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"firstVisitTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end