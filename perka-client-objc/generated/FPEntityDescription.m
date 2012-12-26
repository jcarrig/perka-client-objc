//
//  EntityDescription.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/4/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPEntityDescription.h"

static NSMutableDictionary *_allEntities;

@implementation FPEntityDescription

+ (void)initialize {
  [super initialize];
  _allEntities = [NSMutableDictionary dictionary];
}

+ (FPEntityDescription *)entityDescriptionForName:(NSString *) name{
  return _allEntities[name];
}

+ (void)setEntityDescription:(FPEntityDescription *)entityDescription
                     forName:(NSString *)name {
  _allEntities[name] = entityDescription;
}

-(NSArray *)allProperties {
  NSMutableArray *allProperties = [NSMutableArray arrayWithArray:[self properties]];
  FPEntityDescription *superDescription = [self superType];
  if(superDescription != nil) {
    [allProperties addObjectsFromArray:[superDescription allProperties]];
  }
  return [NSArray arrayWithArray:allProperties];
}

@end
