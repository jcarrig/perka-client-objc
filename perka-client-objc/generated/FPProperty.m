//
//  Property.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/4/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPProperty.h"

static NSMutableDictionary *_allProperties;

@implementation FPProperty

+ (void)initialize {
  _allProperties = [NSMutableDictionary dictionary];
}

+ (FPProperty *)propertyForUuid:(NSString *)uuid {
  return [FPProperty allocateOrGetPropertyForUuid:uuid];
}

+ (FPProperty *)setPropertyForUuid:(NSString *)uuid
                  withDictionary:(NSDictionary *)dictionary {
  
  FPProperty *property = [FPProperty allocateOrGetPropertyForUuid:uuid];
  [property setValuesForKeysWithDictionary:dictionary];
  return property;
}

#pragma mark private
  
+(FPProperty *)allocateOrGetPropertyForUuid:(NSString *)uuid {
  FPProperty *property = _allProperties[uuid];
  if(property == nil) {
    property = [FPProperty new];
    _allProperties[uuid] = property;
  }
  return property;
}

@end
