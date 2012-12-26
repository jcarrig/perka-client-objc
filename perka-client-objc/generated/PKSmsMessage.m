// Generated File - DO NOT EDIT

#import "PKSmsMessage.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKSmsMessage


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"smsMessage",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKSmsMessage class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"smsMessage"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end