// Generated File - DO NOT EDIT

#import "PKCannedEmailOutboundMessage.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKCannedEmailOutboundMessage


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"cannedEmailOutboundMessage",
    @"superType":[PKOutboundMessage entityDescription],
    @"kind":[PKCannedEmailOutboundMessage class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"cannedEmailOutboundMessage"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end