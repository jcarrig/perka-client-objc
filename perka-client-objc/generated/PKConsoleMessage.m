// Generated File - DO NOT EDIT

#import "PKConsoleMessage.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKConsoleMessage


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"consoleMessage",
    @"superType":[PKOutboundMessage entityDescription],
    @"kind":[PKConsoleMessage class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"consoleMessage"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end