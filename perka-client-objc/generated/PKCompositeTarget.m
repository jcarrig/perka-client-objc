// Generated File - DO NOT EDIT

#import "PKCompositeTarget.h"
#import "PKCouponTarget.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation PKCompositeTarget

@synthesize operation = _operation;
@synthesize children = _children;

static FPEntityDescription *_entityDescription;
static NSMutableArray *_allProperties;

+ (void)load {
  [super load];

  _allProperties = [NSMutableArray array];
  // children
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"eea61148-4853-3253-af7f-b0c64e1ab02c"
                    withDictionary:@{
                      @"name":@"children",
                      @"kind":[NSMutableArray class],
                      @"impliedProperty":[FPProperty propertyForUuid:@"8ae3806b-dca7-35ad-ade3-97ec2b3cdc3e"]
                    }]];

  // operation
  [_allProperties addObject:
    [FPProperty setPropertyForUuid:@"6a48e5f2-1212-3bfd-8379-6f7cb1645f69"
                    withDictionary:@{
                      @"name":@"operation",
                      @"kind":[NSString class]
                    }]];

  _entityDescription = [FPEntityDescription newWithDictionary:@{
    @"typeName":@"compositeTarget",
    @"superType":[PKCouponTarget entityDescription],
    @"kind":[PKCompositeTarget class],
    @"properties":_allProperties 
  }];

  [FPEntityDescription setEntityDescription:_entityDescription forName:@"compositeTarget"];
}

+ (FPEntityDescription *)entityDescription {
  return _entityDescription;
}

// initialize collection properties
- (id)init {
  self = [super init];
  if(self != nil) {
    _children = [NSMutableArray new];
  }
  return self;
}

// children one-to-many accessors to maintain bi-directional relationships
- (NSMutableArray *)children {
  return _children;
}
- (void)setChildren:(NSMutableArray *)children {
  _children = [children mutableCopy];
  [_children enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [obj setValue:self forKey:@"parent"];
  }];
}
- (void)addItemToChildren:(PKCouponTarget *)item {
  [_children addObject:item];
  [item setValue:self forKey:@"parent"];
}

@end