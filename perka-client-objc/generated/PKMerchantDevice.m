// Generated File - DO NOT EDIT

#import "PKMerchantDevice.h"
#import "PKMerchantLocation.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKMerchantDevice

@synthesize merchantLocation = _merchantLocation;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // identifier
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"4f6a55a3-fcdf-3826-a2cb-3ff434a553f2"
                    withDictionary:@{
                      @"name":@"identifier",
                      @"kind":[NSString class]
                    }]];

  // make
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"225b2525-e862-310d-93c9-13e2f9786228"
                    withDictionary:@{
                      @"name":@"make",
                      @"kind":[NSString class]
                    }]];

  // merchantLocation
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"36df1408-4ccb-3998-a336-d0f86f9a34bc"
                    withDictionary:@{
                      @"name":@"merchantLocation",
                      @"kind":[PKMerchantLocation class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"cd0f2d77-c98b-3722-970c-41b035be243c"]
                    }]];

  // model
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d6b0e12e-4410-3225-a2e1-d8d609e89845"
                    withDictionary:@{
                      @"name":@"model",
                      @"kind":[NSString class]
                    }]];

  // osVersion
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"cb243303-dfa9-3f79-826b-66f35873b7fe"
                    withDictionary:@{
                      @"name":@"osVersion",
                      @"kind":[NSString class]
                    }]];

  // platform
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"97023358-2ba2-38e8-8b1d-3c0b4b5163fc"
                    withDictionary:@{
                      @"name":@"platform",
                      @"kind":[NSString class]
                    }]];

  // serialNumber
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"7c1e9e85-2145-3794-91b2-8bbc8b03d758"
                    withDictionary:@{
                      @"name":@"serialNumber",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"merchantDevice",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKMerchantDevice class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"merchantDevice"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}


// merchantLocation many-to-one accessors to maintain bi-directional relationships
- (PKMerchantLocation *)merchantLocation{
  return _merchantLocation;
}
- (void)setMerchantLocation:(PKMerchantLocation *)merchantLocation {
  _merchantLocation = merchantLocation;
  if(![[_merchantLocation merchantDevices] containsObject:self]) {
    [[_merchantLocation merchantDevices] addObject:self];
  }
}

@end