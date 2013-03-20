//
//  PerkaClientApi.h
//  perka-client-objc
//
//  Created by Joe Stelmach on 12/18/12.
//  Copyright (c) 2012 Perka Inc. All rights reserved.
//

#import "PKBaseApi.h"

@class FPFlatpack, FPBaseHasUuid;

@interface PKClientApi : PKBaseApi

@property (strong) NSString *accessToken;
@property (strong) NSDate *accessExpiration;
@property (strong) NSString *refreshToken;
@property (strong) NSString *userUuid;

// our session is considered active if we've never received an access
// token, or our token expiration as after now
- (BOOL)isSessionActive;

- (void)refreshSessionUsingBlock:(FPRequestFinishedBlock)block;

// Concrete implementations that require authentication should implement
// this method if authenticated requests require custom request headers
- (NSDictionary *)authHeaders;

// Grants an integrator access token
- (id)oauthIntegratorLoginWithId:(NSString *)integratorId
                          secret:(NSString *)integratorSecret;

- (void)oauthIntegratorLoginWithId:(NSString *)integratorId
                            secret:(NSString *)integratorSecret
                        usingBlock:(FPRequestFinishedBlock)block;

// returns a new PerkaApi authorized as the given role and user
- (id)oauthIntegratorBecomeRole:(NSString *)role
                           uuid:(NSString *)uuid;

- (void)oauthIntegratorBecomeRole:(NSString *)role
                                       uuid:(NSString *)uuid
                       usingBlock:(FPRequestFinishedBlock)block;

// Obtain a new access token using integrator credentials and a refresh token.
- (id)oauthRefreshToken;

- (void)oauthRefreshTokenUsingBlock:(FPRequestFinishedBlock)block;

@end
