//
//  FPFlatpackRequest.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/12/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPFlatpackRequest.h"
#import "FPBaseApi.h"
#import "FPFlatpack.h"
#import "FPUnpacker.h"
#import "FPPacker.h"
#import "NSHTTPURLResponse+FP.h"

@implementation FPFlatpackRequest

// returns the entity representing the response's value
-(id)processResponse:(NSHTTPURLResponse *)response
             withData:(NSData *)responseData {
    
  // decode our response data into a string
  NSString *responseString = [[NSString alloc] initWithData:responseData
                                                   encoding:[response encoding]];
  
  // and unpack it
  return [[[[self api] flatpack] unpacker] unpack:responseString];
}

-(NSData *)payload {
  NSString *json = [self entity] != nil ? [[[[self api] flatpack] packer] pack:[self entity]] : nil;
  return [json dataUsingEncoding:NSUTF8StringEncoding];
}

@end
