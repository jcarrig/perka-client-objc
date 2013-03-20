//
//  PKAppDelegate.m
//  runner
//
//  Created by Joe Stelmach on 3/20/13.
//  Copyright (c) 2013 Perka Inc. All rights reserved.
//

#import "PKAppDelegate.h"
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


@implementation PKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  
  NSString *INTEGRATOR_ID = @"e475e342-a542-11e1-9f8d-cde92706a93d";
  NSString *INTEGRATOR_SECRET = @"integrator";
  NSString *API_BASE = @"http://localhost";
  
  PKClientApi *api = [PKClientApi newWithDictionary:@{
         @"flatpack":[FPFlatpack newWithDictionary:@{
                      @"pretty":@YES,
                      @"verbose":@YES}],
         @"serverBase":API_BASE,
         @"verbose":@YES}];
  [api oauthIntegratorLoginWithId:INTEGRATOR_ID secret:INTEGRATOR_SECRET];

  // create a visit
  PKUserCredentials *creds = [PKUserCredentials newWithDictionary:@{
                              @"email":@"joe@getperka.com"}];
  PKCustomer *customer = [[api postIntegratorCustomer:creds] execute];
  NSArray *merchants = [[api getIntegratorManagedMerchants] execute];
  PKMerchant *merchant = merchants[0];
  merchant = (PKMerchant *)[[api getDescribeType:@"merchant" uuid:[merchant uuid]] execute];
  PKMerchantLocation *location = [merchant merchantLocations][0];
  api = [api oauthIntegratorBecomeRole:@"CLERK" uuid:[location uuid]];
  PKProgramType *programType = [[[merchant programTiers][0] programs][0] programType];
  
  for(int i=0; i<10000; i++) {
    @autoreleasepool {
      
      PKPunchRewardConfirmation *confirmation = [PKPunchRewardConfirmation new];
      [confirmation setPunchesEarned:@1];
      [confirmation setProgramType:programType];
      PKRewardGrant *grant = [PKRewardGrant new];
      [grant setCustomer:customer];
      [grant addItemToRewardConfirmations:confirmation];
      PKVisit *visit = [[api putCustomerReward:grant] execute];
      NSLog(@"visit created: %@", [visit uuid]);
    }
  }  
  
  return YES;
}
@end
