// Generated File - DO NOT EDIT

#import "PKClerk.h"
#import "PKCouponVisibility.h"
#import "PKMerchant.h"
#import "PKMerchantDevice.h"
#import "PKMerchantLocation.h"
#import "PKStreetAddress.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKMerchantLocation

@synthesize merchant = _merchant;
@synthesize streetAddress = _streetAddress;
@synthesize clerks = _clerks;
@synthesize couponVisibilities = _couponVisibilities;
@synthesize merchantDevices = _merchantDevices;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // clerks
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"4b748fc7-d827-33ad-87b8-3c975f49984e"
                    withDictionary:@{
                      @"name":@"clerks",
                      @"kind":[NSMutableArray class]
                    }]];

  // combinedAddress
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"95a40a2b-e51c-37d7-8e18-1f956a39c25f"
                    withDictionary:@{
                      @"name":@"combinedAddress",
                      @"kind":[NSString class]
                    }]];

  // couponVisibilities
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"889595bd-97c7-3ad1-a89f-a3678ab0a601"
                    withDictionary:@{
                      @"name":@"couponVisibilities",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"de9bcf98-0f5d-35a2-835c-0bb3f07d4e9b"]
                    }]];

  // distanceInMeters
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a9ccfaa8-01c0-30bd-bb89-4560565318bc"
                    withDictionary:@{
                      @"name":@"distanceInMeters",
                      @"kind":[NSNumber class]
                    }]];

  // geoLocation
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"1b499958-b96f-3ae9-85b5-6a0428d5955a"
                    withDictionary:@{
                      @"name":@"geoLocation",
                      @"kind":[NSObject class]
                    }]];

  // latitude
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"2e5ebe42-283e-302c-bdf6-9a1070fb3f6a"
                    withDictionary:@{
                      @"name":@"latitude",
                      @"kind":[NSNumber class]
                    }]];

  // longitude
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"f2d02951-603a-30e8-ba7c-174afcc86ac5"
                    withDictionary:@{
                      @"name":@"longitude",
                      @"kind":[NSNumber class]
                    }]];

  // merchant
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"789fa31e-209d-3b34-842b-8ba8f92a11f5"
                    withDictionary:@{
                      @"name":@"merchant",
                      @"kind":[PKMerchant class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"21524947-6d66-3372-be1f-5bf4155c2acd"]
                    }]];

  // merchantDevices
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"cd0f2d77-c98b-3722-970c-41b035be243c"
                    withDictionary:@{
                      @"name":@"merchantDevices",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"36df1408-4ccb-3998-a336-d0f86f9a34bc"]
                    }]];

  // neighborhoodName
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"e8ce61f2-122b-3852-b046-493f86384a51"
                    withDictionary:@{
                      @"name":@"neighborhoodName",
                      @"kind":[NSString class]
                    }]];

  // phone
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"34eb2749-c317-3ccc-90ee-4c46685f9417"
                    withDictionary:@{
                      @"name":@"phone",
                      @"kind":[NSString class]
                    }]];

  // resolvedFacebookId
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d957a6f8-ec78-38af-8e4b-f4c5718cfe45"
                    withDictionary:@{
                      @"name":@"resolvedFacebookId",
                      @"kind":[NSString class]
                    }]];

  // smsId
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"fe39b50f-e512-3cf0-abc3-7f8003d57a4c"
                    withDictionary:@{
                      @"name":@"smsId",
                      @"kind":[NSString class]
                    }]];

  // smsPhoneNumber
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"afc8e5b7-719b-30f5-9549-d4866dd4906f"
                    withDictionary:@{
                      @"name":@"smsPhoneNumber",
                      @"kind":[NSString class]
                    }]];

  // streetAddress
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"2216876d-45f0-367c-b421-420c1b24720d"
                    withDictionary:@{
                      @"name":@"streetAddress",
                      @"kind":[PKStreetAddress class]
                    }]];

  // timezone
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d9b8af0f-3485-3488-9c10-3fe5a00d6308"
                    withDictionary:@{
                      @"name":@"timezone",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"merchantLocation",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKMerchantLocation class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"merchantLocation"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _clerks = [NSMutableArray new];
    _couponVisibilities = [NSMutableArray new];
    _merchantDevices = [NSMutableArray new];
  }
  return self;
}

// clerks one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)clerks {
  return _clerks;
}
- (void)setClerks:(NSMutableArray *)clerks {
  _clerks = [clerks mutableCopy];
}
- (void)addItemToClerks:(PKClerk *)item {
  [_clerks addObject:item];
}

// couponVisibilities one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)couponVisibilities {
  return _couponVisibilities;
}
- (void)setCouponVisibilities:(NSMutableArray *)couponVisibilities {
  _couponVisibilities = [couponVisibilities mutableCopy];
  [_couponVisibilities enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"merchantLocation"];
  }];
}
- (void)addItemToCouponVisibilities:(PKCouponVisibility *)item {
  [_couponVisibilities addObject:item];
  [item setValue:self forKey:@"merchantLocation"];
}

// merchant many-to-one accessors to maintain bi-directional relationships
- (PKMerchant *)merchant{
  return _merchant;
}
- (void)setMerchant:(PKMerchant *)merchant {
  _merchant = merchant;
  if(![[_merchant merchantLocations] containsObject:self]) {
    [[_merchant merchantLocations] addObject:self];
  }
}

// merchantDevices one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)merchantDevices {
  return _merchantDevices;
}
- (void)setMerchantDevices:(NSMutableArray *)merchantDevices {
  _merchantDevices = [merchantDevices mutableCopy];
  [_merchantDevices enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"merchantLocation"];
  }];
}
- (void)addItemToMerchantDevices:(PKMerchantDevice *)item {
  [_merchantDevices addObject:item];
  [item setValue:self forKey:@"merchantLocation"];
}

@end