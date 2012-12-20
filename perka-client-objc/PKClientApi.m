//
//  PerkaClientApi.m
//  perka-client-objc
//
//  Created by Joe Stelmach on 12/18/12.
//  Copyright (c) 2012 Perka Inc. All rights reserved.
//

#import "PKClientApi.h"
#import "PKTokenRequest.h"
#import "NSString+FP.h"
#import "NSObject+FP.h"

@interface PKClientApi ()
@property (strong, readonly) NSString *integratorId;
@property (strong, readonly) NSString *integratorSecret;
@property (strong, readonly) NSString *role;
@end

@implementation PKClientApi

- (BOOL)isSessionActive {
  return _accessToken == nil || [_accessExpiration timeIntervalSinceNow] > 0;
}

- (void)refreshSessionUsingBlock:(FPRequestFinishedBlock)block {
  [self oauthRefreshTokenUsingBlock:block];
}

- (NSDictionary *)authHeaders {
  if(_accessToken != nil) {
    NSString *bearer = [NSString stringWithFormat:@"Bearer %@", _accessToken];
    return @{@"Authorization":bearer};
  }
  
  return @{};
}

- (void)oauthIntegratorLoginWithId:(NSString *)integratorId
                            secret:(NSString *)integratorSecret
                        usingBlock:(FPRequestFinishedBlock)block {
  
  _integratorId = integratorId;
  _integratorSecret = integratorSecret;
  
  NSString *payload = [NSString stringWithFormat:
                       @"grant_type=password&username=%@&client_id=%@&password=%@&scope=INTEGRATOR",
                       [self integratorId],
                       [self integratorId],
                       [[self integratorSecret] urlEncode]];
  
  [self executeTokenRequestWithApi:self payload:payload usingBlock:block];
}

- (void)oauthIntegratorBecomeRole:(NSString *)role
                             uuid:(NSString *)uuid
                       usingBlock:(FPRequestFinishedBlock)block {
  _role = role;
  NSString *payload = [NSString stringWithFormat:
                       @"grant_type=client_credentials&scope=%@:%@",
                       [role urlEncode], uuid];
  
  PKClientApi *newApi = [PKClientApi newWithDictionary:@{
                            @"serverBase":[self serverBase],
                            @"flatpack":[self flatpack],
                            @"accessToken":[self accessToken],
                            @"accessExpiration":[self accessExpiration],
                            @"verbose":[self isVerbose]}];
  
  [self executeTokenRequestWithApi:newApi payload:payload usingBlock:block];
}

- (void)oauthRefreshTokenUsingBlock:(FPRequestFinishedBlock)block {
  NSString *payload = [NSString stringWithFormat:
                       @"grant_type=refresh_token&client_id=%@&client_secret=%@&refresh_token=%@",
                       _integratorId,
                       [[self integratorSecret] urlEncode],
                       [self refreshToken]];
  [self executeTokenRequestWithApi:self payload:payload usingBlock:^(id result) {
    if(block != nil) block(result);
  }];
}

#pragma mark private

- (void)executeTokenRequestWithApi:(PKClientApi *)api
                           payload:(NSString *)payload
                        usingBlock:(FPRequestFinishedBlock)block {
  
  PKTokenRequest *request = [[PKTokenRequest alloc] initWithApi:api payload:payload];
  [request executeUsingBlock:^(id result) {
    [api setAccessExpiration:[NSDate dateWithTimeIntervalSinceNow:[result[@"expires_in"] intValue]]];
    [api setAccessToken:result[@"access_token"]];
    [api setRefreshToken:result[@"refresh_token"]];
    if(result[@"uuid"] != nil) {
      [api setUserUuid:result[@"uuid"]];
    }
    if(block != nil) block(result);
  }];
}

@end
