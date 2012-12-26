// Generated File - DO NOT EDIT

#import "PKPointsActivityConfirmation.h"
#import "PKPointsCatalogItem.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKPointsActivityConfirmation

@synthesize pointsCatalogItems = _pointsCatalogItems;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // moneySpent
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"5bf1455c-8d7c-3067-adf8-2fea55738c53"
                    withDictionary:@{
                      @"name":@"moneySpent",
                      @"kind":[NSObject class]
                    }]];

  // pointsCatalogItems
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"5b93e915-4993-3fe5-9cec-93416d9b51f5"
                    withDictionary:@{
                      @"name":@"pointsCatalogItems",
                      @"kind":[NSMutableArray class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"pointsActivityConfirmation",
    @"superType":[PKAbstractRewardConfirmation entityDescription],
    @"kind":[PKPointsActivityConfirmation class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"pointsActivityConfirmation"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _pointsCatalogItems = [NSMutableArray new];
  }
  return self;
}

// pointsCatalogItems one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)pointsCatalogItems {
  return _pointsCatalogItems;
}
- (void)setPointsCatalogItems:(NSMutableArray *)pointsCatalogItems {
  _pointsCatalogItems = [pointsCatalogItems mutableCopy];
}
- (void)addItemToPointsCatalogItems:(PKPointsCatalogItem *)item {
  [_pointsCatalogItems addObject:item];
}

@end