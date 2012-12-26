//
//  NSString+NSString_Flatpack.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/6/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "NSDictionary+FP.h"

@implementation NSDictionary (FP)

+ (NSDictionary *)dictionaryFromJSON:(NSString *)jsonString {
  if(jsonString == nil) return @{};
  
  NSError *jsonError;
  NSData *responseData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseData
                                                       options:-1
                                                         error:&jsonError];
  if(jsonError != nil) {
    NSLog(@"Error parsing JSON : %@", jsonError);
  }
  
  return data;
}

- (NSString *)asJSONPrettyPrint:(BOOL)pretty {
  NSError *jsonError;
  NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                 options:pretty ? NSJSONWritingPrettyPrinted : -1
                                                   error:&jsonError];
  if(jsonError != nil) {
    NSLog(@"Error parsing JSON : %@", jsonError);
  }
  
  return data != nil ? [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] : nil;
}

@end
