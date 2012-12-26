// Generated File - DO NOT EDIT

#import "PKMerchantDashboardMessage.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKMerchantDashboardMessage


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"merchantDashboardMessage",
    @"superType":[PKOutboundMessage entityDescription],
    @"kind":[PKMerchantDashboardMessage class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"merchantDashboardMessage"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end