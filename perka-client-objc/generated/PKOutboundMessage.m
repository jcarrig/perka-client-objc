// Generated File - DO NOT EDIT

#import "PKOutboundMessage.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKOutboundMessage


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // body
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a51ecc16-88a1-36d1-a6c7-f7c2fc15287d"
                    withDictionary:@{
                      @"name":@"body",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"outboundMessage",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKOutboundMessage class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"outboundMessage"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end