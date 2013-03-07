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

- (void)refreshSession {
  [self refreshSessionUsingBlock:nil];
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

- (id)oauthIntegratorLoginWithId:(NSString *)integratorId
                            secret:(NSString *)integratorSecret {
  _integratorId = integratorId;
  _integratorSecret = integratorSecret;
  NSString *payload = [self buildLoginPayload];
  return [self executeTokenRequestWithApi:self payload:payload];
}

- (void)oauthIntegratorLoginWithId:(NSString *)integratorId
                            secret:(NSString *)integratorSecret
                        usingBlock:(FPRequestFinishedBlock)block {
  
  _integratorId = integratorId;
  _integratorSecret = integratorSecret;
  NSString *payload = [self buildLoginPayload];
  [self executeTokenRequestWithApi:self payload:payload usingBlock:block];
}

- (id)oauthIntegratorBecomeRole:(NSString *)role
                             uuid:(NSString *)uuid {
  _role = role;
  NSString *payload = [self buildBecomePayloadWithUuid:uuid];
  PKClientApi *newApi = [self clone];
  [self executeTokenRequestWithApi:newApi payload:payload];
  return newApi;
}

- (void)oauthIntegratorBecomeRole:(NSString *)role
                             uuid:(NSString *)uuid
                       usingBlock:(FPRequestFinishedBlock)block {
  _role = role;
  NSString *payload = [self buildBecomePayloadWithUuid:uuid];
  PKClientApi *newApi = [self clone];
  [self executeTokenRequestWithApi:newApi payload:payload usingBlock:block];
}

- (id)oauthRefreshToken {
  NSString *payload = [self buildRefreshTokenPayload];
  return [self executeTokenRequestWithApi:self payload:payload];
}

- (void)oauthRefreshTokenUsingBlock:(FPRequestFinishedBlock)block {
  NSString *payload = [self buildRefreshTokenPayload];
  [self executeTokenRequestWithApi:self payload:payload usingBlock:block];
}

#pragma mark private

- (PKClientApi *)clone {
  return [PKClientApi newWithDictionary:@{
          @"serverBase":[self serverBase],
          @"flatpack":[self flatpack],
          @"accessToken":[self accessToken],
          @"accessExpiration":[self accessExpiration],
          @"verbose":[self isVerbose]}];
}

- (NSString *)buildBecomePayloadWithUuid:(NSString *)uuid {
  return [NSString stringWithFormat:
          @"grant_type=client_credentials&scope=%@:%@",
          [[self role] urlEncode], uuid];
}

- (NSString *)buildRefreshTokenPayload {
  return [NSString stringWithFormat:
          @"grant_type=refresh_token&client_id=%@&client_secret=%@&refresh_token=%@",
          [self integratorId],
          [[self integratorSecret] urlEncode],
          [self refreshToken]];
}

- (NSString *)buildLoginPayload {
  
  NSString *payload = [NSString stringWithFormat:
                       @"grant_type=password&username=%@&client_id=%@&password=%@&scope=INTEGRATOR",
                       [self integratorId],
                       [self integratorId],
                       [[self integratorSecret] urlEncode]];
  return payload;
}

- (id)executeTokenRequestWithApi:(PKClientApi *)api
                         payload:(NSString *)payload {
  PKTokenRequest *request = [[PKTokenRequest alloc] initWithApi:api payload:payload];

  id result = [request baseExecute];
  [self processTokenResultForApi:api result:result];
  return result;
}

- (void)executeTokenRequestWithApi:(PKClientApi *)api
                           payload:(NSString *)payload
                        usingBlock:(FPRequestFinishedBlock)block {
  
  PKTokenRequest *request = [[PKTokenRequest alloc] initWithApi:api payload:payload];
  [request baseExecuteUsingBlock:^(id result) {
    [self processTokenResultForApi:api result:result];
    if(block != nil) block(result);
  }];
}

- (void)processTokenResultForApi:(PKClientApi *)api result:(id)result {
  [api setAccessExpiration:[NSDate dateWithTimeIntervalSinceNow:[result[@"expires_in"] intValue]]];
  [api setAccessToken:result[@"access_token"]];
  [api setRefreshToken:result[@"refresh_token"]];
  if(result[@"uuid"] != nil) {
    [api setUserUuid:result[@"uuid"]];
  }
}

@end
