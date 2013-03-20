// Generated File - DO NOT EDIT

#import "PKWeatherTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKWeatherTarget

@synthesize metric = _metric;
@synthesize operation = _operation;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // localDecisionAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"8bf76907-684d-34b7-8f17-668b93f77b22"
                    withDictionary:@{
                      @"name":@"localDecisionAt",
                      @"kind":[NSString class]
                    }]];

  // localMetricAt
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"1ff06cb2-7e82-3255-ab55-cf0f558e021a"
                    withDictionary:@{
                      @"name":@"localMetricAt",
                      @"kind":[NSString class]
                    }]];

  // metric
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"7db24165-82bf-36fc-a62d-8e811d9ac8f4"
                    withDictionary:@{
                      @"name":@"metric",
                      @"kind":[NSString class]
                    }]];

  // operation
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"a7625a0b-c25c-3c0d-957e-4f1761ab12aa"
                    withDictionary:@{
                      @"name":@"operation",
                      @"kind":[NSString class]
                    }]];

  // threshold
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"aa4baa23-60e2-3a93-8519-0ac123d11f31"
                    withDictionary:@{
                      @"name":@"threshold",
                      @"kind":[NSNumber class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"weatherTarget",
    @"superType":[PKListTarget entityDescription],
    @"kind":[PKWeatherTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"weatherTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

@end