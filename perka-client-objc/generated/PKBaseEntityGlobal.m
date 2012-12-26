// Generated File - DO NOT EDIT

#import "PKBaseEntityGlobal.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKBaseEntityGlobal


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // createdAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"7032541c-9b4b-3576-9ac4-6329b13470c9"
                    withDictionary:@{
                      @"name":@"createdAt",
                      @"kind":[NSString class]
                    }]];

  // updatedAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"62976edf-002a-33ae-9df9-b8a2a344d358"
                    withDictionary:@{
                      @"name":@"updatedAt",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"baseEntityGlobal",
    @"superType":[FPBaseHasUuid entityDescription],
    @"kind":[PKBaseEntityGlobal class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"baseEntityGlobal"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end