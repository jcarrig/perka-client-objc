//
//  perka_client_objcTests.m
//  perka-client-objcTests
//
//  Created by Joe Stelmach on 12/12/12.
//  Copyright (c) 2012 Perka Inc. All rights reserved.
//

#import "perka_client_objcTests.h"
#import "PKClientApi.h"
#import "PKCustomer.h"
#import "PKVisit.h"
#import "PKUserCredentials.h"
#import "NSObject+FP.h"
#import "NSDictionary+FP.h"
#import "NSDate+FP.h"
#import "FPFlatpack.h"
#import "FPUnpacker.h"
#import "FPPacker.h"

static NSString *INTEGRATOR_ID = @"e475e342-a542-11e1-9f8d-cde92706a93d";
static NSString *INTEGRATOR_SECRET = @"integrator";
static NSString *API_BASE = @"http://localhost";

//static NSString *INTEGRATOR_ID = @"44ff7a20-cb63-11e1-9b23-0800200c9a66'";
//static NSString *INTEGRATOR_SECRET = @"foobar";
//static NSString *API_BASE = @"https://sandbox.getperka.com";

@interface perka_client_objcTests ()
@property (strong) PKClientApi *api;
@end

@implementation perka_client_objcTests

- (void)setUp {
  [super setUp];

  _api = [PKClientApi newWithDictionary:@{
          @"flatpack":[FPFlatpack newWithDictionary:@{
                       @"pretty":@YES,
                       @"verbose":@YES}],
          @"serverBase":API_BASE,
          @"verbose":@YES}];
}

- (void)tearDown {
  // Tear-down code here.
  [super tearDown];
}

// Simple smoke test to ensure that our generated models can be packed and unpacked correctly
- (void)testSerialization {
  PKCustomer *customer = [PKCustomer newWithDictionary:@{
                          @"uuid":@"4fece2d0-4942-11e2-bcfd-0800200c9a66",
                          @"avatarUrl":@"avatar",
                          @"firstName":@"Joe",
                          @"lastName":@"Stelmach"}];
  
  NSDate *now = [NSDate new];
  PKVisit *visit = [PKVisit newWithDictionary:@{
                    @"uuid":@"5f79e770-4942-11e2-bcfd-0800200c9a66",
                    @"validatedAt":now}];
  
  [[customer visits] addObject:visit];
  
  
  // pack some objects into some JSON
  FPFlatpack *flatpack = [FPFlatpack newWithDictionary:@{
                          @"pretty":@YES,
                          @"verbose":@NO}];
  
  NSString *json = [[flatpack packer] pack:customer];
  
  // ensure they were packed correctly
  NSDictionary *dictionary = [NSDictionary dictionaryFromJSON:json];
  NSDictionary *data = dictionary[@"data"][@"customer"][0];
  STAssertTrue([data[@"avatarUrl"] isEqualToString:@"avatar"], @"packed avatar");
  STAssertTrue([data[@"firstName"] isEqualToString:@"Joe"], @"packed first name");
  STAssertTrue([data[@"lastName"] isEqualToString:@"Stelmach"], @"packed last name");
  
  NSArray *visits = dictionary[@"data"][@"visit"];
  STAssertTrue([visits count] == 1, @"visits exist");
  data = visits[0];
  STAssertTrue([data[@"validatedAt"] isEqualToString:[now iso8601String]], @"visit validated at");
  
  // now unpack that JSON back into a flatpack entity, and ensure the data's integrity
  customer = (PKCustomer *)[[flatpack unpacker] unpack:json];
  STAssertTrue([[customer avatarUrl] isEqualToString:@"avatar"], @"unpacked avatar");
  STAssertTrue([[customer firstName] isEqualToString:@"Joe"], @"unpacked first name");
  STAssertTrue([[customer lastName] isEqualToString:@"Stelmach"], @"unpacked first name");
}

- (void)testManagedCustomerCreation {
  __block BOOL stop = NO;
  [_api oauthIntegratorLoginWithId:INTEGRATOR_ID secret:INTEGRATOR_SECRET usingBlock:^(id result) {
    PKUserCredentials *creds = [PKUserCredentials newWithDictionary:@{
                                @"email":@"joe@getperka.com",
                                @"phone":@"+17777777777"}];
    
    [[_api postIntegratorCustomer:creds] executeUsingBlock:^(PKCustomer *customer) {
      NSLog(@"%@", customer);
      
      stop = YES;
    }];
  }];
  
  while(!stop) {
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.5]];
  }
}

@end
