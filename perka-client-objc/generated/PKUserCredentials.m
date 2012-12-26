// Generated File - DO NOT EDIT

#import "PKUserCredentials.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKUserCredentials


static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // currentPassword
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"c21a9ee8-3341-388c-bcee-11f668e650b8"
                    withDictionary:@{
                      @"name":@"currentPassword",
                      @"kind":[NSString class]
                    }]];

  // email
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"1e248412-dd89-325e-9e9d-b6fa516cd7e9"
                    withDictionary:@{
                      @"name":@"email",
                      @"kind":[NSString class]
                    }]];

  // firstName
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"8ebf2628-fd97-3521-b103-cef3d8abc94d"
                    withDictionary:@{
                      @"name":@"firstName",
                      @"kind":[NSString class]
                    }]];

  // hmac
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"de58cc97-e225-3599-acc2-f3f49e5e013b"
                    withDictionary:@{
                      @"name":@"hmac",
                      @"kind":[NSString class]
                    }]];

  // lastName
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a350632c-2474-30c1-bc6a-a47760edfed0"
                    withDictionary:@{
                      @"name":@"lastName",
                      @"kind":[NSString class]
                    }]];

  // newPassword
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"041e9b55-4460-33c0-a5f7-2b021d366009"
                    withDictionary:@{
                      @"name":@"newPassword",
                      @"kind":[NSString class]
                    }]];

  // newPasswordConfirmation
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"73500792-c2c8-314a-b4f4-594627ca12ba"
                    withDictionary:@{
                      @"name":@"newPasswordConfirmation",
                      @"kind":[NSString class]
                    }]];

  // phone
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d6391260-78c7-399f-9732-a683e966aa40"
                    withDictionary:@{
                      @"name":@"phone",
                      @"kind":[NSString class]
                    }]];

  // phoneConfirmationCode
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"9ad0f4f4-dc55-3fd8-8d7c-46ef25688377"
                    withDictionary:@{
                      @"name":@"phoneConfirmationCode",
                      @"kind":[NSString class]
                    }]];

  // userUuid
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"9740a9d0-2bec-311e-8ed1-8d6a9976ffb1"
                    withDictionary:@{
                      @"name":@"userUuid",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"userCredentials",
    @"superType":[FPBaseHasUuid entityDescription],
    @"kind":[PKUserCredentials class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"userCredentials"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end