// Generated File - DO NOT EDIT

#import "PKClerk.h"
#import "PKMerchant.h"
#import "PKMerchantCapability.h"
#import "PKMerchantLocation.h"
#import "PKMerchantUser.h"
#import "PKPointsCatalogItem.h"
#import "PKProgramTier.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKMerchant

@synthesize loyaltyType = _loyaltyType;
@synthesize merchantState = _merchantState;
@synthesize parentMerchant = _parentMerchant;
@synthesize clerks = _clerks;
@synthesize merchantCapabilities = _merchantCapabilities;
@synthesize merchantLocations = _merchantLocations;
@synthesize merchantUsers = _merchantUsers;
@synthesize pointsCatalogItems = _pointsCatalogItems;
@synthesize possibleMerchantStates = _possibleMerchantStates;
@synthesize programTiers = _programTiers;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // clerks
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"aa70957a-8417-3c84-80eb-ace9b3b6a013"
                    withDictionary:@{
                      @"name":@"clerks",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"3dc5f620-58c7-3483-b3a8-d44c2e538ab2"]
                    }]];

  // headline
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"ee223534-1529-386e-af29-67a79a507a4f"
                    withDictionary:@{
                      @"name":@"headline",
                      @"kind":[NSString class]
                    }]];

  // loyaltyType
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"705dac16-44d0-3f79-b133-80f4e907ae95"
                    withDictionary:@{
                      @"name":@"loyaltyType",
                      @"kind":[NSString class]
                    }]];

  // managed
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"fca40eed-0e24-3506-857d-f5f520cf9a88"
                    withDictionary:@{
                      @"name":@"managed",
                      @"kind":[NSNumber class]
                    }]];

  // merchantCapabilities
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"5e16feef-b9d3-3eaa-91e9-f8288233d981"
                    withDictionary:@{
                      @"name":@"merchantCapabilities",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"477c75a8-b319-3665-abb2-6e914f7b7188"]
                    }]];

  // merchantLocations
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"21524947-6d66-3372-be1f-5bf4155c2acd"
                    withDictionary:@{
                      @"name":@"merchantLocations",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"789fa31e-209d-3b34-842b-8ba8f92a11f5"]
                    }]];

  // merchantState
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"99a63fa0-c4f1-3326-ae14-f6a227e81d4e"
                    withDictionary:@{
                      @"name":@"merchantState",
                      @"kind":[NSString class]
                    }]];

  // merchantUsers
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"cb3bc90e-389e-376b-a3a9-c9c1f71a5214"
                    withDictionary:@{
                      @"name":@"merchantUsers",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"e54f6d53-ba05-3999-b4f9-98ec15fa172c"]
                    }]];

  // name
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"27cf2446-966a-394f-a703-385e5bd2c88e"
                    withDictionary:@{
                      @"name":@"name",
                      @"kind":[NSString class]
                    }]];

  // parentMerchant
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d8f176b6-d483-3eae-9c8a-933f85982de1"
                    withDictionary:@{
                      @"name":@"parentMerchant",
                      @"kind":[PKMerchant class]
                    }]];

  // pointsCatalogItems
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"aeec11d2-c29c-308b-aa83-aaaa3997fee4"
                    withDictionary:@{
                      @"name":@"pointsCatalogItems",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"96b33fa5-c097-3137-a384-2d6b8965a14f"]
                    }]];

  // pointsSignupBonus
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"831bac80-43b1-3e85-8ed4-0576dcef3019"
                    withDictionary:@{
                      @"name":@"pointsSignupBonus",
                      @"kind":[NSObject class]
                    }]];

  // possibleMerchantStates
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"f74b1a37-52f9-381b-ac58-1aee9578f277"
                    withDictionary:@{
                      @"name":@"possibleMerchantStates",
                      @"kind":[NSMutableArray class]
                    }]];

  // programTiers
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"4fc11912-8fdf-3551-be83-e17ecf55704a"
                    withDictionary:@{
                      @"name":@"programTiers",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"836b3e6e-aa54-375a-9712-0c2f3d56220f"]
                    }]];

  // salesDemo
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"8aa51492-5b0b-3291-964e-bc20187996e3"
                    withDictionary:@{
                      @"name":@"salesDemo",
                      @"kind":[NSNumber class]
                    }]];

  // terms
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"fd70aa05-4f4d-3fa6-abbe-284bcd755b44"
                    withDictionary:@{
                      @"name":@"terms",
                      @"kind":[NSString class]
                    }]];

  // visitExpirationMinutes
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"311e4d48-1ba6-33d1-96b5-9f52824c3638"
                    withDictionary:@{
                      @"name":@"visitExpirationMinutes",
                      @"kind":[NSNumber class]
                    }]];

  // websiteUrl
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"d3f6b46b-54df-3029-8dc5-62549fb27b73"
                    withDictionary:@{
                      @"name":@"websiteUrl",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"merchant",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKMerchant class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"merchant"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _clerks = [NSMutableArray new];
    _merchantCapabilities = [NSMutableArray new];
    _merchantLocations = [NSMutableArray new];
    _merchantUsers = [NSMutableArray new];
    _pointsCatalogItems = [NSMutableArray new];
    _possibleMerchantStates = [NSMutableArray new];
    _programTiers = [NSMutableArray new];
  }
  return self;
}

// clerks one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)clerks {
  return _clerks;
}
- (void)setClerks:(NSMutableArray *)clerks {
  _clerks = [clerks mutableCopy];
  [_clerks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"merchant"];
  }];
}
- (void)addItemToClerks:(PKClerk *)item {
  [_clerks addObject:item];
  [item setValue:self forKey:@"merchant"];
}

// merchantCapabilities one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)merchantCapabilities {
  return _merchantCapabilities;
}
- (void)setMerchantCapabilities:(NSMutableArray *)merchantCapabilities {
  _merchantCapabilities = [merchantCapabilities mutableCopy];
  [_merchantCapabilities enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"merchant"];
  }];
}
- (void)addItemToMerchantCapabilities:(PKMerchantCapability *)item {
  [_merchantCapabilities addObject:item];
  [item setValue:self forKey:@"merchant"];
}

// merchantLocations one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)merchantLocations {
  return _merchantLocations;
}
- (void)setMerchantLocations:(NSMutableArray *)merchantLocations {
  _merchantLocations = [merchantLocations mutableCopy];
  [_merchantLocations enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"merchant"];
  }];
}
- (void)addItemToMerchantLocations:(PKMerchantLocation *)item {
  [_merchantLocations addObject:item];
  [item setValue:self forKey:@"merchant"];
}

// merchantUsers one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)merchantUsers {
  return _merchantUsers;
}
- (void)setMerchantUsers:(NSMutableArray *)merchantUsers {
  _merchantUsers = [merchantUsers mutableCopy];
  [_merchantUsers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"merchant"];
  }];
}
- (void)addItemToMerchantUsers:(PKMerchantUser *)item {
  [_merchantUsers addObject:item];
  [item setValue:self forKey:@"merchant"];
}

// pointsCatalogItems one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)pointsCatalogItems {
  return _pointsCatalogItems;
}
- (void)setPointsCatalogItems:(NSMutableArray *)pointsCatalogItems {
  _pointsCatalogItems = [pointsCatalogItems mutableCopy];
  [_pointsCatalogItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"merchant"];
  }];
}
- (void)addItemToPointsCatalogItems:(PKPointsCatalogItem *)item {
  [_pointsCatalogItems addObject:item];
  [item setValue:self forKey:@"merchant"];
}

// possibleMerchantStates one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)possibleMerchantStates {
  return _possibleMerchantStates;
}
- (void)setPossibleMerchantStates:(NSMutableArray *)possibleMerchantStates {
  _possibleMerchantStates = [possibleMerchantStates mutableCopy];
}
- (void)addItemToPossibleMerchantStates:(NSString *)item {
  [_possibleMerchantStates addObject:item];
}

// programTiers one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)programTiers {
  return _programTiers;
}
- (void)setProgramTiers:(NSMutableArray *)programTiers {
  _programTiers = [programTiers mutableCopy];
  [_programTiers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"merchant"];
  }];
}
- (void)addItemToProgramTiers:(PKProgramTier *)item {
  [_programTiers addObject:item];
  [item setValue:self forKey:@"merchant"];
}

@end