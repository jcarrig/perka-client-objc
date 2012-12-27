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
#import "PKMerchantUser.h"
#import "PKMerchantLocation.h"
#import "PKProgramType.h"
#import "PKProgramTier.h"
#import "PKProgram.h"
#import "PKPunchRewardConfirmation.h"
#import "PKRedemptionRewardConfirmation.h"
#import "PKRedemptionCouponConfirmation.h"
#import "PKRewardGrant.h"
#import "PKUserCredentials.h"
#import "PKRewardAdvancement.h"
#import "PKReward.h"
#import "PKVisitConfirmation.h"
#import "PKCoupon.h"
#import "PKCouponVisibility.h"
#import "PKCouponRedemption.h"
#import "NSObject+FP.h"
#import "NSDictionary+FP.h"
#import "NSDate+FP.h"
#import "FPFlatpack.h"
#import "FPUnpacker.h"
#import "FPEntityDescription.h"
#import "FPPacker.h"
#import "PKEntityAnnotation.h"

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
  [api oauthIntegratorLoginWithId:INTEGRATOR_ID secret:INTEGRATOR_SECRET];
}

- (void)tearDown {
  // Tear-down code here.
  [super tearDown];
}

/**
 * Simple serialization smoke test to ensure that our generated models
 * can be packed and unpacked correctly
 */
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

/**
 * Determines the status of an exixting customer
 */
- (void)testExistingCustomerStatus {
  
  // set up our existing customer
  PKUserCredentials *creds = [PKUserCredentials newWithDictionary:@{
                              @"email":@"joe+existingCustomerStatus@getperka.com"}];
  
  PKCustomer *existingCustomer = [[api postIntegratorCustomer:creds] execute];
  
  // switch over to a clerk at the first location
  NSArray *merchants = [[api getIntegratorManagedMerchants] execute];
  PKMerchant *merchant = merchants[0];
  merchant = (PKMerchant *)[[api getDescribeType:@"merchant" uuid:[merchant uuid]] execute];
  PKMerchantLocation *location = [merchant merchantLocations][0];
  api = [api oauthIntegratorBecomeRole:@"CLERK" uuid:[location uuid]];
  
  // fetch our customer. The customer_uuid_get endpoint will
  // populate the resulting customer with reward, tier_traversal, and
  // available coupon information
  PKCustomer *customer = [[api getCustomerUuid:[existingCustomer uuid]] execute];
  
  // since this customer doesn't have any visits yet, there should be
  // no tier_traversal or reward information
  STAssertTrue([[customer tierTraversals] count] == 0,
               @"Customer should have no tier traversals yet");
  STAssertTrue([[customer rewards] count] == 0,
               @"Customer should have no rewards yet");
  
  // let's go ahaead and create a visit
  PKProgramType *programType = [[[merchant programTiers][0] programs][0] programType];
  PKPunchRewardConfirmation *confirmation = [PKPunchRewardConfirmation new];
  [confirmation setPunchesEarned:@1];
  [confirmation setProgramType:programType];
  PKRewardGrant *grant = [PKRewardGrant new];
  [grant setCustomer:customer];
  [grant addItemToRewardConfirmations:confirmation];
  PKVisit *visit = [[api putCustomerReward:grant] execute];

  // Note that since the most recent tierTraversal can be expected in the
  // response, the visit can be used to check the customer's current status
  // at the merchant. In this case, our customer should be in the
  // lowest 'local' tier.  We do a simple name comparison here, but if you
  // need to verify that a customer belongs to a particular tier, the tier
  // should be compared against one of those returned from a
  // getDescribeEntityUuid request.
  STAssertTrue([[[visit customer] tierTraversals] count] == 1,
               @"Customer should have 1 tier traversal");
  PKProgramTier *tier = [[[visit customer] tierTraversals][0] programTier];
  STAssertTrue([[tier name] isEqualToString:@"local"],
                 @"Tier traversal should be for the local tier");

  // We'll make another round trip to the server to ensure we can
  // now access the customer's most recent tier traversal for the
  // merchant associated with the current session
  customer = [[api getCustomerUuid:[existingCustomer uuid]] execute];
  STAssertTrue([[customer tierTraversals] count] == 1,
               @"Customer should have 1 tier traversal");
  tier = [[customer tierTraversals][0] programTier];
  STAssertTrue([[tier name] isEqualToString:@"local"],
               @"Tier traversal should be for the local tier");
  STAssertTrue([[[tier merchant] uuid] isEqualToString:[merchant uuid]],
               @"Tier traversal should be associated with the correct merchant");
}

/**
 * Amends a previous visit
 */
- (void)testAmendingVisits {
  
  // set up our existing customer
  PKUserCredentials *creds = [PKUserCredentials newWithDictionary:@{
                              @"email":@"joe+amend@getperka.com"}];
  
  PKCustomer *customer = [[api postIntegratorCustomer:creds] execute];
  
  // switch over to a clerk at the first location
  NSArray *merchants = [[api getIntegratorManagedMerchants] execute];
  PKMerchant *merchant = merchants[0];
  merchant = (PKMerchant *)[[api getDescribeType:@"merchant" uuid:[merchant uuid]] execute];
  PKMerchantLocation *locationOne = [merchant merchantLocations][0];
  api = [api oauthIntegratorBecomeRole:@"CLERK" uuid:[locationOne uuid]];
  
  // assign some punches
  PKProgramType *programType = [[[merchant programTiers][0] programs][0] programType];
  PKPunchRewardConfirmation *punchConfirmation = [PKPunchRewardConfirmation new];
  [punchConfirmation setPunchesEarned:@1];
  [punchConfirmation setProgramType:programType];
  PKRewardGrant *grant = [PKRewardGrant new];
  [grant setCustomer:customer];
  [grant addItemToRewardConfirmations:punchConfirmation];
  PKVisit *visit = [[api putCustomerReward:grant] execute];
  
  // confirm that we have one reward with a single punch
  // obtained at location_one.
  STAssertTrue([[[visit customer] rewards] count] == 1,
               @"Customer should have one reward");
  STAssertTrue([[[[visit customer] rewards][0] punchesEarned] intValue] == 1,
               @"Reward should have one punch");
  STAssertTrue([[visit rewardAdvancements] count] == 1,
               @"Visit should hae one reward advancement");
  STAssertTrue([[[visit rewardAdvancements][0] punchesEarned] intValue] == 1,
               @"Reward advancement should have one punch");
  STAssertTrue([[[visit merchantLocation] uuid] isEqualToString:[locationOne uuid]],
               @"Visit should have the proper merchant location");

  // We can now edit the visit to change the number of punches given.
  // This operation re-writes the history of the visit, so the payload
  // must represent the new state in its entirety, even if some
  // data remains the same.  Also note that the visit given MUST be
  // the customers most recent visit.
  punchConfirmation = [PKPunchRewardConfirmation new];
  [punchConfirmation setPunchesEarned:@3];
  [punchConfirmation setProgramType:programType];
    
  PKVisitConfirmation *visitConfirmation = [PKVisitConfirmation new];
  [visitConfirmation setVisit:visit];
  [visitConfirmation addItemToRewardConfirmations:punchConfirmation];
  
  PKVisit *amendedVisit = [[api putCustomerVisitAmend:visitConfirmation] execute];
  
  // confirm that we still have only 1 reward, but that the reward
  // now has 3 punches instead of 1
  STAssertTrue([[[amendedVisit customer] rewards] count] == 1,
               @"Customer still has only one reward");
  
  STAssertTrue([[[[amendedVisit customer] rewards][0] punchesEarned] intValue] == 3,
               @"The reward should have a sum of 3 punches");

  STAssertTrue([[amendedVisit rewardAdvancements] count] == 1,
               @"amended visit should have one reward advancement");

  STAssertTrue([[[amendedVisit rewardAdvancements][0] punchesEarned] intValue] == 3,
               @"Reward advancement should have 3 punches");

  STAssertTrue([[[amendedVisit merchantLocation] uuid] isEqualToString:[locationOne uuid]],
               @"Amended visit should have taken place at location one");

  // In certain situations, we may also want to change the location
  // where the visit occurred.  In order to do this, we need to upgrade
  // our role to a merchant user, since the clerk's access is limited
  // to the location they're assigned to
  PKMerchantUser *manager = [merchant merchantUsers][0];
  [api oauthIntegratorLoginWithId:INTEGRATOR_ID secret:INTEGRATOR_SECRET];
  api = [api oauthIntegratorBecomeRole:@"MERCHANT" uuid:[manager uuid]];
  
  // swap the visit's location out for another one
  PKMerchantLocation *locationTwo = [[merchant merchantLocations] lastObject];
  STAssertFalse([[locationTwo uuid] isEqualToString:[locationOne uuid]],
                @"Two locations should be distinct");
  [amendedVisit setMerchantLocation:locationTwo];
  
  // Then request for the vist to be amended again.  Remember, we need to
  // pass up the entire new state of the visit here, so we could change
  // the number of punches given again
  [punchConfirmation setPunchesEarned:@4];
  [punchConfirmation setProgramType:programType];
  
  visitConfirmation = [PKVisitConfirmation new];
  [visitConfirmation setVisit:amendedVisit];
  [visitConfirmation addItemToRewardConfirmations:punchConfirmation];
  
  PKVisit *newAmendedVisit = [[api putCustomerVisitAmend:visitConfirmation] execute];

  // Ensure that the visit was in fact moved to the new location, and that
  // the punch count was updated again
  STAssertTrue([[[newAmendedVisit merchantLocation] uuid] isEqualToString:[locationTwo uuid]],
               @"The new amended visit should now be at location two");

  STAssertTrue([[[newAmendedVisit customer] rewards] count] == 1,
               @"The new amended visit should still have one reward");

  STAssertTrue([[[[newAmendedVisit customer] rewards][0] punchesEarned] intValue] == 4,
               @"The customer's single reward should now have 4 punches");

  STAssertTrue([[newAmendedVisit rewardAdvancements] count] == 1,
               @"The new amended visit should still have just one reward advancement");

  STAssertTrue([[[newAmendedVisit rewardAdvancements][0] punchesEarned] intValue] == 4,
               @"Thre reward advancement should also have 4 punches");
}

/**
 * Annotates entities with arbitrary JSON data
 */
- (void)testEntityAnnotations {
  
  // First we'll grab a reference to one of our managed merchants
  NSArray *merchants = [[api getIntegratorManagedMerchants] execute];
  PKMerchant *merchant = merchants[0];
  
  // then apply an arbitrary annotation to the merchant
  NSString *json = @"{'foo':'bar'}";
  PKEntityAnnotation *annotation = [PKEntityAnnotation new];
  [annotation setAnnotation:json];
  [annotation setEntity:merchant];  
  [[api putAnnotation:annotation] execute];
  
  // which can be retreived at any time
  annotation = [[api getAnnotationType:@"merchant" uuid:[merchant uuid]] execute];
  STAssertTrue([(NSString *) [annotation annotation] isEqualToString:json],
               @"Annotation should have the defined JSON string");
  
  // now we'll update our annotation to a new value
  json = @"{'bar':'baz'}";
  annotation = [PKEntityAnnotation new];
  [annotation setAnnotation:json];
  [annotation setEntity:merchant];
  [[api putAnnotation:annotation] execute];

  // and verify the update
  annotation = [[api getAnnotationType:@"merchant" uuid:[merchant uuid]] execute];
  STAssertTrue([(NSString *) [annotation annotation] isEqualToString:json],
               @"Annotation should have the defined JSON string");
}

/**
 * Redeems coupons
 */
- (void)testCouponRedemption {
  // set up our existing customer
  PKUserCredentials *creds = [PKUserCredentials newWithDictionary:@{
                              @"email":@"joe+coupon@getperka.com"}];
  
  PKCustomer *customer = [[api postIntegratorCustomer:creds] execute];
  NSArray *merchants = [[api getIntegratorManagedMerchants] execute];
  PKMerchant *merchant = merchants[0];
  merchant = (PKMerchant *)[[api getDescribeType:@"merchant" uuid:[merchant uuid]] execute];

  // our merchant may be set up with multiple locations.  Let's find the
  // location that has at least one available coupon.
  __block PKMerchantLocation *location;
  [[merchant merchantLocations] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    if([[obj couponVisibilities] count] > 0) {
      location = obj;
      *stop = YES;
    }
  }];
  
  // switch over to a clerk at the found location
  api = [api oauthIntegratorBecomeRole:@"CLERK" uuid:[location uuid]];

  // determine the actual coupons available
  NSMutableArray *availableCoupons = [NSMutableArray array];
  [[location couponVisibilities] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [availableCoupons addObject:[obj coupon]];
  }];
  STAssertTrue([availableCoupons count] == 1,
               @"The location should have one available coupon");
  
  // we can now specify that a coupon should be redeemed when
  // validating a visit.  We can also pass along some punches
  // earned to be recoreded in the same transaction
  PKCoupon *coupon = availableCoupons[0];
  PKProgramType *programType = [[[merchant programTiers][0] programs][0] programType];

  PKPunchRewardConfirmation *punchConfirmation = [PKPunchRewardConfirmation new];
  [punchConfirmation setPunchesEarned:@1];
  [punchConfirmation setProgramType:programType];
  
  PKRedemptionCouponConfirmation *couponConfirmation = [PKRedemptionCouponConfirmation new];
  [couponConfirmation setCoupon:coupon];
  
  PKRewardGrant *grant = [PKRewardGrant new];
  [grant setCustomer:customer];
  [grant addItemToRewardConfirmations:punchConfirmation];
  [grant addItemToRewardConfirmations:couponConfirmation];
  
  PKVisit *visit = [[api putCustomerReward:grant] execute];
  
  // Confirm that the coupon has been redeemed by
  // looking for an appropriate coupon redemption
  // within the resulting visit
  STAssertTrue([[visit couponRedemptions] count] == 1,
               @"One coupon redemption should be present");

  PKCouponRedemption *redemption = [visit couponRedemptions][0];
  STAssertTrue([[[redemption coupon] uuid] isEqualToString:[coupon uuid]],
               @"Remption should be for the specified coupon");

  // punches should also be present in the visit
  STAssertTrue([[[visit merchantLocation] uuid] isEqualToString:[location uuid]],
               @"visit should be at the specified location");

  STAssertTrue([[[visit customer] rewards] count] == 1,
               @"Visit should have affected one reward");

  STAssertTrue([[[[visit customer] rewards][0] punchesEarned] intValue] == 1,
               @"Reward should have one punch");

  STAssertTrue([[visit rewardAdvancements] count] == 1,
               @"Visit should have a single reward advancement");

  STAssertTrue([[[visit rewardAdvancements][0] punchesEarned] intValue] == 1,
               @"Reward advancement should also have one punch");
}

@end
