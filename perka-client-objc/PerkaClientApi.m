//
//  PerkaClientApi.m
//  perka-client-objc
//
//  Created by Joe Stelmach on 12/18/12.
//  Copyright (c) 2012 Perka Inc. All rights reserved.
//

#import "PerkaClientApi.h"
#import "PerkaTokenRequest.h"
#import "NSString+FP.h"
#import "NSObject+FP.h"

@interface PerkaClientApi ()
@property (strong, readonly) NSString *integratorId;
@property (strong, readonly) NSString *integratorSecret;
@property (strong, readonly) NSString *role;
@end

@implementation PerkaClientApi

- (BOOL)sessionActive {
  return _accessToken == nil || [_accessExpiration timeIntervalSinceNow] > 0;
}

- (void)refreshSession {
  [self oauthRefreshToken];
}

- (NSDictionary *)authHeaders {
  if(_accessToken != nil) {
    NSString *bearer = [NSString stringWithFormat:@"Bearer %@", _accessToken];
    return @{@"Authorization":bearer};
  }
  
  return @{};
}

- (void)oauthIntegratorLoginWithId:(NSString *)integratorId
                            secret:(NSString *)integratorSecret {
  
  _integratorId = integratorId;
  _integratorSecret = integratorSecret;
  
  NSString *payload = [NSString stringWithFormat:
                       @"grant_type=password&username=%@&client_id=%@&password=%@&scope=INTEGRATOR",
                       [self integratorId],
                       [self integratorId],
                       [[self integratorSecret] urlEncode]];
  
  [self executeTokenRequestWithApi:self payload:payload];
}

- (void)oauthIntegratorBecomeRole:(NSString *)role
                                       uuid:(NSString *)uuid {
  _role = role;
  NSString *payload = [NSString stringWithFormat:
                       @"grant_type=client_credentials&scope=%@:%@",
                       [role urlEncode], uuid];
  
  PerkaClientApi *newApi = [PerkaClientApi newWithDictionary:@{
                            @"serverBase":[self serverBase],
                            @"flatpack":[self flatpack],
                            @"accessToken":[self accessToken],
                            @"accessExpiration":[self accessExpiration],
                            @"verbose":[self isVerbose]}];
  
  [self executeTokenRequestWithApi:newApi payload:payload];
}

- (void)oauthRefreshToken {
  NSString *payload = [NSString stringWithFormat:
                       @"grant_type=refresh_token&client_id=%@&client_secret=%@&refresh_token=%@",
                       _integratorId,
                       [[self integratorSecret] urlEncode],
                       [self refreshToken]];
  [self executeTokenRequestWithApi:self payload:payload];
}

#pragma mark private

- (void)executeTokenRequestWithApi:(PerkaClientApi *)api payload:(NSString *)payload {
  PerkaTokenRequest *request = [[PerkaTokenRequest alloc] initWithApi:api payload:payload];
  [request executeUsingBlock:^(id result) {
    [api setAccessExpiration:[NSDate dateWithTimeIntervalSinceNow:[result[@"expires_in"] intValue]]];
    [api setAccessToken:result[@"access_token"]];
    [api setRefreshToken:result[@"refresh_token"]];
    if(result[@"uuid"] != nil) {
      [api setUserUuid:result[@"uuid"]];
    }
  }];
}

@end
