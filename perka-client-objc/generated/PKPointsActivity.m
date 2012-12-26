// Generated File - DO NOT EDIT

#import "PKPointsActivity.h"
#import "PKPointsCatalogItem.h"
#import "PKVisit.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKPointsActivity

@synthesize nextActivity = _nextActivity;
@synthesize redeemed = _redeemed;
@synthesize visit = _visit;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)initialize {
  [super initialize];

  _allProperties = [NSMutableArray array];
  // charge
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"1ff721f4-465e-3572-883a-d061bcfb32e4"
                    withDictionary:@{
                      @"name":@"charge",
                      @"kind":[NSObject class]
                    }]];

  // credit
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"6d95332e-fa95-331b-8b3b-a3289c975504"
                    withDictionary:@{
                      @"name":@"credit",
                      @"kind":[NSObject class]
                    }]];

  // currentTotal
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"97b97266-9019-3e7a-9f8f-a8b322abd4ef"
                    withDictionary:@{
                      @"name":@"currentTotal",
                      @"kind":[NSObject class]
                    }]];

  // nextActivity
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"31982925-fa2f-338f-a75e-539d44981f80"
                    withDictionary:@{
                      @"name":@"nextActivity",
                      @"kind":[PKPointsActivity class]
                    }]];

  // redeemed
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"fa82dc8b-185e-320e-bdc0-5822d1e82457"
                    withDictionary:@{
                      @"name":@"redeemed",
                      @"kind":[PKPointsCatalogItem class]
                    }]];

  // visit
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"5c5408ab-e944-3b09-9cc6-95d7e32f24ca"
                    withDictionary:@{
                      @"name":@"visit",
                      @"kind":[PKVisit class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"1535a8db-34ec-363d-917e-2f015ce4e472"]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"pointsActivity",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKPointsActivity class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"pointsActivity"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}


// visit many-to-one accessors to maintain bi-directional relationships
- (PKVisit *)visit{
  return _visit;
}
- (void)setVisit:(PKVisit *)visit {
  _visit = visit;
  if(![[_visit pointsActivities] containsObject:self]) {
    [[_visit pointsActivities] addObject:self];
  }
}

@end