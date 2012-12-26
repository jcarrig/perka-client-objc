// Generated File - DO NOT EDIT

#import "PKYieldManagementTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKYieldManagementTarget


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // localRedemptionEndAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"e2d065e8-3122-3675-97b4-daeceeeb052a"
                    withDictionary:@{
                      @"name":@"localRedemptionEndAt",
                      @"kind":[NSString class]
                    }]];

  // localRedemptionStartAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"c2fcc986-ba62-3cf4-a29d-a0ba262e1b40"
                    withDictionary:@{
                      @"name":@"localRedemptionStartAt",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"yieldManagementTarget",
    @"superType":[PKCouponTarget entityDescription],
    @"kind":[PKYieldManagementTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"yieldManagementTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end