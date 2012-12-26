// Generated File - DO NOT EDIT

#import "PKStreetAddress.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKStreetAddress


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // address
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"dc312cae-cc41-3bf9-9169-9f3f5b269a56"
                    withDictionary:@{
                      @"name":@"address",
                      @"kind":[NSString class]
                    }]];

  // address2
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"49b94528-e496-30ad-9c34-d6958da365df"
                    withDictionary:@{
                      @"name":@"address2",
                      @"kind":[NSString class]
                    }]];

  // city
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"ef486fc5-cb3d-310d-a7cf-0c6ce659d14d"
                    withDictionary:@{
                      @"name":@"city",
                      @"kind":[NSString class]
                    }]];

  // state
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"29e06709-537a-38b6-a230-bc5ddaa8f482"
                    withDictionary:@{
                      @"name":@"state",
                      @"kind":[NSString class]
                    }]];

  // zip
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"9c512d1b-d974-348d-a157-d3cbc6d64eb9"
                    withDictionary:@{
                      @"name":@"zip",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"streetAddress",
    @"superType":[FPBaseHasUuid entityDescription],
    @"kind":[PKStreetAddress class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"streetAddress"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end