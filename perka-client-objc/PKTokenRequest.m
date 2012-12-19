//
//  PerkaTokenRequest.m
//  perka-client-objc
//
//  Created by Joe Stelmach on 12/18/12.
//  Copyright (c) 2012 Perka Inc. All rights reserved.
//

#import "PKTokenRequest.h"

@implementation PKTokenRequest

-(id)initWithApi:(FPBaseApi *)api payload:(NSString *)payload {
  
  self = [super initWithApi:api method:@"POST" path:@"/api/2/auth/token"];
  if(self != nil) {
    [self setPayload:payload];
    [self setHeaderWithName:@"Content-Type" value:@"application/x-www-form-urlencoded"];
  }
  return self;
}

@end
