// Generated File - DO NOT EDIT

#import "PKListTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKListTarget


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"listTarget",
    @"superType":[PKCouponTarget entityDescription],
    @"kind":[PKListTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"listTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end