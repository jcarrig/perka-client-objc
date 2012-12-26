//
//  NSObject+NSObject_Flatpack.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/4/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "NSObject+FP.h"

@implementation NSObject (FP)

+ (id)newWithDictionary:(NSDictionary *)dictionary {
  id result = [self new];
  
  [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    
    NSString *setterStr = [NSString stringWithFormat:@"set%@%@:",
                           [[key substringToIndex:1] capitalizedString],
                           [key substringFromIndex:1]];
    
    if([result respondsToSelector:NSSelectorFromString(setterStr)]) {
      [result setValue:obj forKey:key];
    }
  }];

  return result;
}

@end
