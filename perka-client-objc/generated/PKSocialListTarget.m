// Generated File - DO NOT EDIT

#import "PKSocialListTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKSocialListTarget


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"socialListTarget",
    @"superType":[PKListTarget entityDescription],
    @"kind":[PKSocialListTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"socialListTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end