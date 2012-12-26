//
//  Unpacker.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/3/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPUnpacker.h"
#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSDictionary+FP.h"
#import "NSObject+FP.h"

@interface FPUnpacker ()
@property (strong) NSMutableDictionary *allEntities;
@end

@implementation FPUnpacker

// Builds a reified FlatPack entity from the given JSON string
- (FPBaseHasUuid *)unpack:(NSString *)json {

  _allEntities = [NSMutableDictionary dictionary];

  if(_verbose) {
    NSLog(@"** Deserializing entity from FlatPack **");
    NSLog(@"%@", json);
  }
  
  // make a first pass through the data to ensure all stub entries exist
  NSDictionary *dictionary = [NSDictionary dictionaryFromJSON:json];
  NSMutableDictionary *uuidToData = [NSMutableDictionary dictionary];
  [dictionary[@"data"] enumerateKeysAndObjectsUsingBlock:^(id entityName, id entities, BOOL *stop) {
    if([entities isKindOfClass:[NSArray class]]) {
      [entities enumerateObjectsUsingBlock:^(id entityData, NSUInteger idx, BOOL *stop) {
        NSString *uuid = entityData[@"uuid"];
        if([self allocateOrGetEntityWithName:entityName uuid:uuid] != nil) {
          uuidToData[uuid] = entityData;
        }
      }];
    }
  }];
  
  // then ingest
  [uuidToData enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    [self ingestEntityDictionary:obj forUuid:key];
  }];
  
  // if our value is a list, we'll collect all of the referenced
  // entities and return them in an array
  id value = dictionary[@"value"];
  if([value isKindOfClass:[NSArray class]]) {
    NSMutableArray *values = [NSMutableArray array];
    [value enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      [values addObject:_allEntities[obj]];
    }];
    return [NSArray arrayWithArray:values];
  }
  
  // otherwise, we'll return the referenced entity
  else {
    return _allEntities[value];
  }
}

#pragma mark private

- (void)ingestEntityDictionary:(NSDictionary *)dictionary forUuid:(NSString *)uuid {
  FPBaseHasUuid *entity = _allEntities[uuid];
  FPEntityDescription *entityDescription = [[entity class] entityDescription];
  
  // walk through the entitie's properties and copy over any
  // associated data from the dictionary
  NSArray *properties = [entityDescription allProperties];
  [properties enumerateObjectsUsingBlock:^(id property, NSUInteger idx, BOOL *stop) {
    Class propertyClass = [property kind];
    NSString *propertyKey = [property name];
    
    // a many to one association
    if([propertyClass isSubclassOfClass:[FPBaseHasUuid class]]) {
      
      // if the property is embedded
      if([[property isEmbedded] boolValue]) {
        FPBaseHasUuid *embeddedEntity = [[property kind] newWithDictionary:dictionary];
        [entity setValue:embeddedEntity forKey:propertyKey];
      }
      
      else {
        id propertyValue = dictionary[[propertyKey stringByAppendingString:@"Uuid"]];
        
        // If the referent doesn't exist, it's because the server has sent us a sparse
        // payload with a dangling fooUuid reference.  We'll attempt to unpack this
        // reference using the type informtion encoded within each entity description
        FPBaseHasUuid *referent = _allEntities[propertyValue];
        if(referent == nil) {
          referent = [self allocateOrGetEntityWithName:propertyKey uuid:propertyValue];
        }
        
        if(referent != nil) {
          [entity setValue:referent forKey:propertyKey];

          // If the inverse of this relationship is a collection, we add our entity to that collection
          if([[[property impliedProperty] kind] isSubclassOfClass:[NSArray class]]) {
            NSMutableArray *collection = [self allocateOrGetCollectionIn:referent
                                                                  forKey:[[property impliedProperty] name]];
            if(![collection containsObject:entity]) {
              [collection addObject:entity];
            }
          }
        }
      }
    }
    
    // a one to many relationship
    else if([propertyClass isSubclassOfClass:[NSArray class]]) {
      NSMutableArray *toManyEntities = [self allocateOrGetCollectionIn:entity forKey:[property name]];
      id propertyValue = dictionary[[propertyKey stringByAppendingString:@"Uuid"]];
      [propertyValue enumerateObjectsUsingBlock:^(id referencedUuid, NSUInteger idx, BOOL *stop) {
        FPBaseHasUuid *toAdd = _allEntities[referencedUuid];
        if(![toManyEntities containsObject:toAdd]) {
          [toManyEntities addObject:toAdd];
        }
        // set our inverse
        [toAdd setValue:entity forKey:[[property impliedProperty] name]];
      }];
    }
    
    // a standard property
    else {
      [entity setValue:dictionary[propertyKey] forKey:propertyKey];
    }
  }];
}

- (FPBaseHasUuid *)allocateOrGetEntityWithName:(NSString *)name
                                          uuid:(NSString *)uuid {
  if(uuid == nil) return nil;
  
  FPBaseHasUuid *entity = _allEntities[uuid];
  if(entity == nil) {
    Class klass = [[FPEntityDescription entityDescriptionForName:name] kind];
    
    if(klass != nil) {
      entity = [klass newWithDictionary:@{@"uuid":uuid}];
    }

    if(entity != nil) {
      _allEntities[uuid] = entity;
    }
  }
  return entity;
}

- (NSMutableArray *)allocateOrGetCollectionIn:(FPBaseHasUuid *)entity
                                       forKey:(NSString *)key {
  
  NSMutableArray *collection = [entity valueForKey:key];
  if(collection == nil) {
    collection = [NSMutableArray array];
    [entity setValue:collection forKey:key];
  }
  return collection;
}

@end
