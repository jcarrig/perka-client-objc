// Generated File - DO NOT EDIT

#import "PKIdleCustomerTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKIdleCustomerTarget


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // idleDays
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"50f2a424-edb8-3cea-bca8-8b9b052db705"
                    withDictionary:@{
                      @"name":@"idleDays",
                      @"kind":[NSNumber class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"idleCustomerTarget",
    @"superType":[PKListTarget entityDescription],
    @"kind":[PKIdleCustomerTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"idleCustomerTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end