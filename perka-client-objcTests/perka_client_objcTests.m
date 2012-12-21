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
#import "PKMerchant.h"
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

static PKClientApi *api;

@implementation perka_client_objcTests

+ (void)setUp {
  api = [PKClientApi newWithDictionary:@{
          @"flatpack":[FPFlatpack newWithDictionary:@{
                       @"pretty":@YES,
                       @"verbose":@YES}],
          @"serverBase":API_BASE,
          @"verbose":@YES}];
  [api oauthIntegratorLoginWithId:INTEGRATOR_ID secret:INTEGRATOR_SECRET];
}

- (void)setUp {
  [super setUp];
  
  // clear out all customer data before each test
  [[api deleteIntegratorDestroy] execute];
}

- (void)tearDown {
  // Tear-down code here.
  [super tearDown];
}

// Simple serialization smoke test to ensure that our generated models
// can be packed and unpacked correctly
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

/**
 * Tests the creation of managed customers
 */
- (void)testManagedCustomerCreation {
  [api oauthIntegratorLoginWithId:INTEGRATOR_ID secret:INTEGRATOR_SECRET];
  
  PKUserCredentials *creds = [PKUserCredentials newWithDictionary:@{
                              @"email":@"joe@getperka.com",
                              @"phone":@"+15555555555"}];
    
  PKCustomer *customer = [[api postIntegratorCustomer:creds] execute];
  
  STAssertTrue([[customer unconfirmedEmail] isEqualToString:@"joe@getperka.com"], @"correct email");
  STAssertTrue([[customer unconfirmedPhone] isEqualToString:@"+15555555555"], @"correct phone");
  
  // another request with the same credentials should yield the same customer
  PKCustomer *newCustomer = [[api postIntegratorCustomer:creds] execute];
  STAssertTrue([[customer uuid] isEqualToString:[newCustomer uuid]], @"customer should be the same");

  // another request with the same email and different phone should
  // also yield the same customer
  creds = [PKUserCredentials newWithDictionary:@{
           @"email":@"joe@getperka.com",
           @"phone":@"+17777777777"}];
  newCustomer = [[api postIntegratorCustomer:creds] execute];
  STAssertTrue([[customer uuid] isEqualToString:[newCustomer uuid]], @"customer should be the same");

  // similarly, same phone and different email
  creds = [PKUserCredentials newWithDictionary:@{
           @"email":@"joe+another@getperka.com",
           @"phone":@"+15555555555"}];
  newCustomer = [[api postIntegratorCustomer:creds] execute];
  STAssertTrue([[customer uuid] isEqualToString:[newCustomer uuid]], @"customer should be the same");
  
  // another request with unique values should yield a new customer
  creds = [PKUserCredentials newWithDictionary:@{
           @"email":@"joe+yet_another@getperka.com"}];
  newCustomer = [[api postIntegratorCustomer:creds] execute];
  STAssertFalse([[customer uuid] isEqualToString:[newCustomer uuid]], @"customer should be new");
}

/**
 * Rewards punches to a new customer
 */
- (void)testManagedRewardPunches {
  [api oauthIntegratorLoginWithId:INTEGRATOR_ID secret:INTEGRATOR_SECRET];
  
  //we'll first create a new customer
  PKUserCredentials *creds = [PKUserCredentials newWithDictionary:@{
                              @"email":@"joe@getperka.com"}];
  
  PKCustomer *customer = [[api postIntegratorCustomer:creds] execute];

  // determine the merchants associated with this integrator account
  NSArray *merchants = [[api getIntegratorManagedMerchants] execute];
  
  // lets assume this integrator has only one managed merchant
  PKMerchant *merchant = merchants[0];
  
  // By default, API endpoints DO NOT return a full object graph of data.
  // For example, the above integrator_managed_merchants_get endpoint returns
  // only the merchant with no associated location or program data.  The
  // describe_type_uuid_get endpoint is an exception to this rule, and will
  // always peform a deep serialization of the entity being described.  We'll
  // now describe our merchant to gain access to our location and program data.
  merchant = [[api getDescribeType:@"merchant" uuid:[merchant uuid]] execute];
}

@end
