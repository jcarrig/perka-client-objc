//
//  NSDate+FP.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/18/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "NSDate+FP.h"

static NSDateFormatter *formatter;

@implementation NSDate (FP)

+ (void)initialize {
  formatter = [[NSDateFormatter alloc] init];
  [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
  [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mmZ"];
}

- (NSString *)iso8601String {
  return [formatter stringFromDate:self];
}

@end
