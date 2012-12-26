// Generated File - DO NOT EDIT

#import "PKMerchantCapability.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKMerchantCapability


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"merchantCapability",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKMerchantCapability class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"merchantCapability"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end