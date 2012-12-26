//
//  NSHTTPURLResponse+FP.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/12/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "NSHTTPURLResponse+FP.h"

@implementation NSHTTPURLResponse (FP)

-(NSStringEncoding)encoding {
  // we'll assume UTF-8 as the default encoding
  NSStringEncoding encoding = NSUTF8StringEncoding;
  
  // but we'll check for a charset in the Content-Type header
  NSString *contentType = [self allHeaderFields][@"Content-Type"];
  NSArray *comps = [contentType componentsSeparatedByString:@";"];
  __block NSString *charsetString = nil;
  [comps enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    NSArray *subComps = [obj componentsSeparatedByString:@"="];
    if([subComps[0] isEqualToString:@"charset"]) {
      charsetString = subComps[1];
      *stop = YES;
    }
  }];
  
  // If one exists, we'll attempt to convert it to an NSStringEncoding
  if(charsetString != nil) {
    CFStringEncoding cfEncoding =
    CFStringConvertIANACharSetNameToEncoding ((CFStringRef) charsetString);
    
    if(cfEncoding != kCFStringEncodingInvalidId) {
      encoding = (NSStringEncoding) CFStringConvertEncodingToNSStringEncoding(cfEncoding);
    }
  }
  
  return encoding;
}

@end
