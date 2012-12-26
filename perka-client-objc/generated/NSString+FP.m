//
//  NSString+NSString_Perka.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/11/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "NSString+FP.h"

@implementation NSString (FP)

- (NSString *)urlEncode {
  return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
    NULL, (CFStringRef)self, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
}

@end
