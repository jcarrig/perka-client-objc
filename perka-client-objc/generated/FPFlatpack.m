//
//  Flatpack.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/3/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPFlatpack.h"
#import "FPPacker.h"
#import "FPUnpacker.h"

@implementation FPFlatpack

+ (id)newWithDictionary:(NSDictionary *)properties {
  id result = [super newWithDictionary:properties];
  if(result != nil) {
    [result setPacker:[FPPacker newWithDictionary:properties]];
    [result setUnpacker:[FPUnpacker newWithDictionary:properties]];
  }
  return result;
}

@end
