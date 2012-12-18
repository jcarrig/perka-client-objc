//
//  perka_client_objcTests.m
//  perka-client-objcTests
//
//  Created by Joe Stelmach on 12/12/12.
//  Copyright (c) 2012 Perka Inc. All rights reserved.
//

#import "perka_client_objcTests.h"
#import "PerkaCustomer.h"
#import "PerkaVisit.h"
#import "NSObject+FP.h"
#import "NSDictionary+FP.h"
#import "NSDate+FP.h"
#import "FPFlatpack.h"
#import "FPUnpacker.h"
#import "FPPacker.h"

@implementation perka_client_objcTests

- (void)setUp {
  [super setUp];
  // Set-up code here.
}

- (void)tearDown {
  // Tear-down code here.
  [super tearDown];
}

- (void)testSmokeTest {
  PerkaCustomer *customer = [PerkaCustomer newWithDictionary:@{
                             @"uuid":@"4fece2d0-4942-11e2-bcfd-0800200c9a66",
                             @"avatarUrl":@"avatar",
                             @"firstName":@"Joe",
                             @"lastName":@"Stelmach"}];
  
  NSDate *now = [NSDate new];
  PerkaVisit *visit = [PerkaVisit newWithDictionary:@{
                       @"uuid":@"5f79e770-4942-11e2-bcfd-0800200c9a66",
                       @"validatedAt":now
                       }];
  [[customer visits] addObject:visit];
  
  
  // pack some objects into some JSON
  FPFlatpack *flatpack = [FPFlatpack newWithDictionary:@{
                          @"pretty":@YES,
                          @"verbose":@NO}];
  
  NSString *json = [[flatpack packer] pack:customer];
  
  // ensure they were packed correctly
  NSDictionary *dictionary = [NSDictionary dictionaryFromJSON:json];
  NSLog(@"%@", [dictionary description]);
  NSDictionary *data = dictionary[@"data"][@"customer"][0];
  STAssertTrue([data[@"avatarUrl"] isEqualToString:@"avatar"], @"packed avatar");
  STAssertTrue([data[@"firstName"] isEqualToString:@"Joe"], @"packed first name");
  STAssertTrue([data[@"lastName"] isEqualToString:@"Stelmach"], @"packed last name");
  
  NSArray *visits = dictionary[@"data"][@"visit"];
  STAssertTrue([visits count] == 1, @"visits exist");
  data = visits[0];
  STAssertTrue([data[@"validatedAt"] isEqualToString:[now iso8601String]], @"visit validated at");
  
  // now unpack that JSON back into a flatpack entity, and ensure the data's integrity
  customer = (PerkaCustomer *)[[flatpack unpacker] unpack:json];
  STAssertTrue([[customer avatarUrl] isEqualToString:@"avatar"], @"unpacked avatar");
  STAssertTrue([[customer firstName] isEqualToString:@"Joe"], @"unpacked first name");
  STAssertTrue([[customer lastName] isEqualToString:@"Stelmach"], @"unpacked first name");
  
  NSLog(@"%@", customer);
}


@end
