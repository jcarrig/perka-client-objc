//
//  PerkaClientApi.h
//  perka-client-objc
//
//  Created by Joe Stelmach on 12/18/12.
//  Copyright (c) 2012 Perka Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKBaseApi.h"

@class FPFlatpack, FPBaseHasUuid;

@interface PKClientApi : PKBaseApi

@property (strong) NSString *accessToken;
@property (strong) NSDate *accessExpiration;
@property (strong) NSString *refreshToken;
@property (strong) NSString *userUuid;

// our session is considered active if we've never received an access
// token, or our token expiration as after now
- (BOOL)sessionActive;

- (void)refreshSession;

// Concrete implementations that require authentication should implement
// this method if authenticated requests require custom request headers
- (NSDictionary *)authHeaders;

// Grants an integrator access token
- (void)oauthIntegratorLoginWithId:(NSString *)integratorId
                            secret:(NSString *)integratorSecret;

// returns a new PerkaApi authorized as the given role and user
- (void)oauthIntegratorBecomeRole:(NSString *)role
                                       uuid:(NSString *)uuid;

// Obtain a new access token using integrator credentials and a refresh token.
- (void)oauthRefreshToken;

@end
