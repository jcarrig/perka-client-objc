// Generated File - DO NOT EDIT

#import "PKSmsOutboundMessage.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKSmsOutboundMessage


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"smsOutboundMessage",
    @"superType":[PKOutboundMessage entityDescription],
    @"kind":[PKSmsOutboundMessage class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"smsOutboundMessage"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end