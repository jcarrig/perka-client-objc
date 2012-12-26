// Generated File - DO NOT EDIT

#import "PKPhysicalRedemptionTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKPhysicalRedemptionTarget


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"physicalRedemptionTarget",
    @"superType":[PKCouponTarget entityDescription],
    @"kind":[PKPhysicalRedemptionTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"physicalRedemptionTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end