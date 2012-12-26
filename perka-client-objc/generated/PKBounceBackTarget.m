// Generated File - DO NOT EDIT

#import "PKBounceBackTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKBounceBackTarget


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // localOpenEndAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"24579406-21a9-3aa1-9cc5-64d4c068ec7f"
                    withDictionary:@{
                      @"name":@"localOpenEndAt",
                      @"kind":[NSString class]
                    }]];

  // localOpenStartAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"7edbd626-775d-3716-b4f0-7ea8cce0a5d5"
                    withDictionary:@{
                      @"name":@"localOpenStartAt",
                      @"kind":[NSString class]
                    }]];

  // redemptionCountPerWindow
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a1cd1fe7-cce6-35a1-8242-104bd378a8f6"
                    withDictionary:@{
                      @"name":@"redemptionCountPerWindow",
                      @"kind":[NSNumber class]
                    }]];

  // redemptionDays
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"972f145d-a8a7-3d8f-a318-4b47a12d80b6"
                    withDictionary:@{
                      @"name":@"redemptionDays",
                      @"kind":[NSNumber class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"bounceBackTarget",
    @"superType":[PKYieldManagementTarget entityDescription],
    @"kind":[PKBounceBackTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"bounceBackTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end