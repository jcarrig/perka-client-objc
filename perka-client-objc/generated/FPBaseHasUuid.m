//
//  BaseHasUuid.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/3/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPBaseHasUuid.h"
#import "FPEntityDescription.h"
#import "FPProperty.h"
#import "NSObject+FP.h"

@implementation FPBaseHasUuid

@synthesize uuid = _uuid;

+ (FPEntityDescription *)entityDescription {
  return [FPEntityDescription newWithDictionary:@{@"properties":@[
    [FPProperty newWithDictionary:@{
      @"name":@"uuid",
      @"kind":[NSString class],
      @"embedded":@NO}]
    ]
  }];
}

- (NSString *)uuid {
  if(_uuid == nil) {
    @synchronized(self) {
      CFUUIDRef cfuuid = CFUUIDCreate(NULL);
      _uuid = (__bridge_transfer NSString *)CFUUIDCreateString(NULL, cfuuid);
      CFRelease(cfuuid);
    }
  }
  
  return _uuid;
}

- (void)setUuid:(NSString *)uuid {
  _uuid = uuid;
}

- (BOOL)isEqual:(id)object {
  return [[[object uuid] lowercaseString] isEqualToString:[[self uuid] lowercaseString]];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
  NSLog(@"WARN: attempting to set a value of '%@' for an undefined key of '%@'", value, key);
}

@end
