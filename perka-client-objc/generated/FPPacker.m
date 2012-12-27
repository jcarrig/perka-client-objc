//
//  Packer.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/3/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPPacker.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "FPBaseHasUuid.h"
#import "NSDate+FP.h"

@interface FPPacker ()
@property (strong) NSMutableDictionary *allEntities;
@property (strong) NSMutableDictionary *dataDictionary;
@end

@implementation FPPacker

// Generates a FlatPack JSON string for the given entity
- (NSString *)pack:(FPBaseHasUuid *)entity {
  
  [self setAllEntities:[NSMutableDictionary dictionary]];
  [self setDataDictionary:[NSMutableDictionary dictionary]];
  
  [self recursivePack:entity inCurrentDictionary:nil];
  
  [self setDataDictionary:[NSMutableDictionary dictionaryWithDictionary:@{
    @"data"  : [self dataDictionary],
    @"value" : [entity uuid]}]];
  
  // TODO: we'll need to pull in a 3rd party library if we want to support iOS < 5.0
  NSError *error;
  int options = NSJSONWritingPrettyPrinted | NSJSONReadingMutableContainers;
  NSData* jsonData = [NSJSONSerialization dataWithJSONObject:[self dataDictionary]
                                                     options:options
                                                       error:&error];
  if(error != nil) {
    NSLog(@"Could not serialize JSON for entity %@\n.Error:%@", [entity description], error);
    return nil;
  }
  
  return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

#pragma mark private

- (void)recursivePack:(FPBaseHasUuid *)entity inCurrentDictionary:(NSMutableDictionary *)currentDictionary {
  
  // proceed only if the entity has a uuid property, and we haven't seen it before
  // (unless we're not creating a new context, in which case we always want to proceed
  // to allow the embedded properties to be included.
  BOOL newContext = currentDictionary == nil;
  NSString *uuid = [entity respondsToSelector:@selector(uuid)] ? [entity uuid] : nil;
  if(newContext && (uuid == nil || [_allEntities objectForKey:[entity uuid]] != nil)) {
    return;
  }

  // If this invocation represents a new context, we'll make note of the entity,
  // push it's uuid onto our traversal stack, and set up a new dictionary
  if(newContext) {
    currentDictionary = [NSMutableDictionary dictionary];
    [_allEntities setObject:entity forKey:uuid];
  }
  
  // now we'll drill down into the entities' properties
  FPEntityDescription *ed = [[entity class] entityDescription];
  [[ed allProperties] enumerateObjectsUsingBlock:^(id property, NSUInteger idx, BOOL *stop) {
    NSString *key = [property name];
    id value = [entity valueForKey:key];
    if(value != nil) {
      BOOL embedded = [[property isEmbedded] boolValue];
      
      // property is another entity
      if([value isKindOfClass:[FPBaseHasUuid class]]) {
        
        [self recursivePack:value inCurrentDictionary:embedded ? currentDictionary : nil];
        if(!embedded) {
          currentDictionary[[key stringByAppendingString:@"Uuid"]] = [value uuid];
        }
      }
      
      // property is a collection of (potential) other entities
      else if([value isKindOfClass:[NSArray class]]) {
        
        // recurse down and pack each item in the list
        NSMutableArray *uuids = [NSMutableArray array];
        [value enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
          [self recursivePack:obj inCurrentDictionary:embedded ? currentDictionary : nil];
          [uuids addObject:[obj uuid]];
        }];
        
        // set the uuid list as the to-many association
        if([uuids count] > 0) {
          currentDictionary[[key stringByAppendingString:@"Uuid"]] = uuids;
        }
      }
      
      // property is a plain old property
      else {
        currentDictionary[key] = [value isKindOfClass:[NSDate class]] ?
          [value iso8601String] : value;
      }
    }
  }];
  
  // finalize this context before bubbling up
  if(newContext) {
    // store the current dictionary in our data dictionary
    NSMutableArray *bucket = _dataDictionary[[ed typeName]];
    if(bucket == nil) {
      bucket = [NSMutableArray array];
      _dataDictionary[[ed typeName]] = bucket;
    }
    [bucket addObject:currentDictionary];
  }
}

@end
