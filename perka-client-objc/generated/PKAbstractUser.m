// Generated File - DO NOT EDIT

#import "PKAbstractUser.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKAbstractUser


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // email
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"2506cdd0-de0a-3635-8cee-d431e7025fd3"
                    withDictionary:@{
                      @"name":@"email",
                      @"kind":[NSString class]
                    }]];

  // firstName
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"faf7cd47-0fd5-3d3a-a1d7-0585cc5b9a1a"
                    withDictionary:@{
                      @"name":@"firstName",
                      @"kind":[NSString class]
                    }]];

  // lastName
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"c4697fe0-0e79-3830-845d-e3f3eead2a5f"
                    withDictionary:@{
                      @"name":@"lastName",
                      @"kind":[NSString class]
                    }]];

  // newPassword
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"ed2b4d9d-fb8f-3ded-936e-d5a7a07186ff"
                    withDictionary:@{
                      @"name":@"newPassword",
                      @"kind":[NSString class]
                    }]];

  // newPasswordConfirmation
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"af5421a1-fa4d-30d5-829f-2c4be67198d9"
                    withDictionary:@{
                      @"name":@"newPasswordConfirmation",
                      @"kind":[NSString class]
                    }]];

  // passwordSet
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"b76e0c0a-bf40-3554-adcf-048a620515b6"
                    withDictionary:@{
                      @"name":@"passwordSet",
                      @"kind":[NSNumber class]
                    }]];

  // phone
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"5734db7e-18f3-3a5f-910e-edcc53165bab"
                    withDictionary:@{
                      @"name":@"phone",
                      @"kind":[NSString class]
                    }]];

  // role
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"0219b487-da8e-3dc1-aa84-bdbe0cb784bb"
                    withDictionary:@{
                      @"name":@"role",
                      @"kind":[NSString class]
                    }]];

  // unconfirmedEmail
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"34b7be9e-4ff6-3dfc-8032-8eca437427d7"
                    withDictionary:@{
                      @"name":@"unconfirmedEmail",
                      @"kind":[NSString class]
                    }]];

  // unconfirmedPhone
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"2dc91260-0d56-3282-ab6d-39f9c0e9f69d"
                    withDictionary:@{
                      @"name":@"unconfirmedPhone",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"abstractUser",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKAbstractUser class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"abstractUser"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end