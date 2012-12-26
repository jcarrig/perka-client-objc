//
//  FPJsonRequest.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/12/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPJsonRequest.h"

@implementation FPJsonRequest

// returns a dictionary representing the JSON response
-(id)processResponse:(NSHTTPURLResponse *)response
            withData:(NSData *)responseData {
  
  NSString *responseString = [[NSString alloc] initWithData:responseData
                                                   encoding:[response encoding]];
  
  return [NSDictionary dictionaryFromJSON:responseString];
}

@end
