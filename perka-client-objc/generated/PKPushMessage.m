// Generated File - DO NOT EDIT

#import "PKPushMessage.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKPushMessage


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"pushMessage",
    @"superType":[PKOutboundMessage entityDescription],
    @"kind":[PKPushMessage class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"pushMessage"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end