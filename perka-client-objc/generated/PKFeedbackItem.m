// Generated File - DO NOT EDIT

#import "PKFeedbackItem.h"
#import "PKVisit.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKFeedbackItem

@synthesize visit = _visit;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // customerName
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a499ff9d-c3aa-3ce9-8eb5-0bfe0783dc6f"
                    withDictionary:@{
                      @"name":@"customerName",
                      @"kind":[NSString class]
                    }]];

  // feedback
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"7498c92c-6a94-34c6-bfae-d8d97aff79fb"
                    withDictionary:@{
                      @"name":@"feedback",
                      @"kind":[NSString class]
                    }]];

  // signed
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"836cc383-71e9-33f3-9e05-b14555dd31eb"
                    withDictionary:@{
                      @"name":@"signed",
                      @"kind":[NSNumber class]
                    }]];

  // visit
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"956b0674-151d-3101-a697-baf2df29125e"
                    withDictionary:@{
                      @"name":@"visit",
                      @"kind":[PKVisit class]
                    }]];

  // visitUuid
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"13a99bf0-e54d-3821-8da9-3568c8d7bf27"
                    withDictionary:@{
                      @"name":@"visitUuid",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"feedbackItem",
    @"superType":[PKBaseEntityGlobal entityDescription],
    @"kind":[PKFeedbackItem class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"feedbackItem"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end