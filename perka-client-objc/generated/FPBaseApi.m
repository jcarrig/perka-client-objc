//
//  BaseApi.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/11/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPBaseApi.h"

@implementation FPBaseApi

// concrete implementations that require authentication should implement
// this method to determine if the current session is still active
- (BOOL)sessionActive {
  // by default, the session is always considered active
  return YES;
}

// Concrete implementations that require authentication should implement
// this method to refresh an expired session
- (void)refreshSession {
  
}

// Concrete implementations that require authentication should implement
// this method if authenticated requests require custom request headers
- (NSDictionary *)authHeaders {
  return @{};
}

@end
