// Generated File - DO NOT EDIT

#import "PKProgramTier.h"
#import "PKTierTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKTierTarget

@synthesize programTier = _programTier;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // programTier
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"fea20a01-c1dc-3896-9dcb-74e3e42d7ad1"
                    withDictionary:@{
                      @"name":@"programTier",
                      @"kind":[PKProgramTier class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"tierTarget",
    @"superType":[PKCouponTarget entityDescription],
    @"kind":[PKTierTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"tierTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end