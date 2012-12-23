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
#import "PKMerchantLocation.h"
#import "PKProgramType.h"
#import "PKProgramTier.h"
#import "PKProgram.h"
#import "PKPunchRewardConfirmation.h"
#import "PKRedemptionRewardConfirmation.h"
#import "PKRewardGrant.h"
#import "PKUserCredentials.h"
#import "PKRewardAdvancement.h"
#import "PKReward.h"
#import "NSObject+FP.h"
#import "NSDictionary+FP.h"
#import "NSDate+FP.h"
#import "FPFlatpack.h"
#import "FPUnpacker.h"
#import "FPEntityDescription.h"
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
  merchant = (PKMerchant *)[[api getDescribeType:@"merchant" uuid:[merchant uuid]] execute];
  
  // The merchant's locations should now be populated
  PKMerchantLocation *location = [merchant merchantLocations][0];
  
  //The program data should also be populated, so we can dig down and grab
  // a program type that we'd like to award points for
  PKProgramType *programType = [[[merchant programTiers][0] programs][0] programType];

  // now we'll switch our session over to a clerk at the merchant location.
  // This will authorize our API to execute clerk enabled endpoints.
  api = [api oauthIntegratorBecomeRole:@"CLERK" uuid:[location uuid]];
  
  PKVisit *visit = [[api putCustomerReward:
                     [PKRewardGrant newWithDictionary:@{
                       @"customer":customer,
                       @"rewardConfirmations":@[
                         [PKPunchRewardConfirmation newWithDictionary:@{
                            @"programType":programType,
                            @"punchesEarned":@2
                         }]
                       ]
                     }]
                   ] execute];
  
  // A new visit should have been returned describing the transaction.
  // The customer and merchant location should be what we specified
  STAssertTrue([[[visit customer] uuid] isEqualToString:[customer uuid]],
               @"visit has the proper customer association");
  STAssertTrue([[[visit merchantLocation] uuid] isEqualToString:[location uuid]],
               @"visit has the proper merchant location");
  
  // A new reward should have been created
  STAssertTrue([[visit rewardAdvancements] count] == 1,
               @"a single reward advancement should have been created");
  
  // with an advancement of 2 punches
  PKRewardAdvancement *advancement = [visit rewardAdvancements][0];
  STAssertTrue([[advancement punchesEarned] intValue] == 2,
               @"the advancement should have 2 punches");
  
  // The reward itself should show a sum of only 2 punches since this is a new customer
  STAssertTrue([[[advancement reward] punchesEarned] intValue] == 2,
               @"Reward sum should show only 2 punches");

  // We'll now pull down the customer's reward status directly as a separate request
  NSArray *rewards = [[[api getCustomerUuid:[customer uuid]] execute] rewards];

  // We should have only one non-activated, non-redeemed reward with 2 punches
  STAssertTrue([rewards count] == 1, @"The customer should have 1 reward");
  STAssertNil([rewards[0] activatedAt], @"The reward should not be activated yet");
  STAssertNil([rewards[0] redeemedAt], @"The reward should not be redeemed yet");
  STAssertTrue([[rewards[0] punchesEarned] intValue] == 2,
               @"The reward should show a sum of 2 punches");
  
  // Now we'll give the customer another 9 punches, which should activate the
  // reward and make it available for redemption, and will create another
  // reward with a single punch.  For this request, we'll use the longer form
  // of building up the request objects without using newWithDictionary.
  
  PKPunchRewardConfirmation *confirmation = [PKPunchRewardConfirmation new];
  [confirmation setProgramType:programType];
  [confirmation setPunchesEarned:@9];
  
  PKRewardGrant *grant = [PKRewardGrant new];
  [grant setCustomer:customer];
  [grant addItemToRewardConfirmations:confirmation];
  
  // send our request
  visit = [[api putCustomerReward:grant] execute];
  
  // now fetch the customer's reward status again
  rewards = [[[api getCustomerUuid:[customer uuid]] execute] rewards];

  // The customer should now one active, non-redeemed reward
  STAssertTrue([rewards count] == 2,
               @"Customer should have 2 rewards in total");
  PKReward *activeReward = [rewards filteredArrayUsingPredicate:
                            [NSPredicate predicateWithFormat:@"activatedAt != NULL"]][0];
  STAssertNotNil([activeReward activatedAt],
                 @"active reward should have been activated");
  STAssertNil([activeReward redeemedAt],
              @"active reward should not have been redeemed yet");
  STAssertTrue([[activeReward punchesEarned] intValue] == 10,
               @"active reward should have 10 punches");
  
  // and one non-activated, partially punched reward
  PKReward *inactiveReward = [rewards filteredArrayUsingPredicate:
                              [NSPredicate predicateWithFormat:@"activatedAt == NULL"]][0];
  STAssertNil([inactiveReward activatedAt],
              @"inactive reward should not have been activated");
  STAssertNil([inactiveReward redeemedAt],
              @"inactive reward should not have been redeemed yet");
  STAssertTrue([[inactiveReward punchesEarned] intValue] == 1,
               @"inactive reward should have 1 punch");

  // We'll now redeem the active reward, while awarding som new punches
  // within the same transaction
  visit = [[api putCustomerReward:[PKRewardGrant newWithDictionary:@{
                                    @"customer":customer,
                                    @"rewardConfirmations":@[
                                      [PKRedemptionRewardConfirmation newWithDictionary:@{
                                        @"reward":activeReward}],
                                      [PKPunchRewardConfirmation newWithDictionary:@{
                                        @"programType":programType,
                                        @"punchesEarned":@1}]]}]] execute];
  
  // The customer status should now show just one non-active
  // reward with 2 punches
  rewards = [[[api getCustomerUuid:[customer uuid]] execute] rewards];
  STAssertTrue([rewards count] == 1, @"We should have only 1 active reward");
  STAssertNil([rewards[0] activatedAt], @"The rewards not not be activated");
  STAssertNil([rewards[0] redeemedAt], @"The rewards not not be redeemed");
  STAssertTrue([[rewards[0] punchesEarned] intValue] == 2, @"The reward should have 2 punches");
}

@end
