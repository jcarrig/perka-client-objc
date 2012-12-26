//
//  BaseApi.h
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/11/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FPFlatpack, FPBaseHasUuid;

@interface FPBaseApi : NSObject

@property (strong) NSString *serverBase;
@property (strong) FPFlatpack *flatpack;
@property (strong, getter=isVerbose) NSNumber *verbose;

// Returns true if authentication is in use, and the session is currently active
- (BOOL)sessionActive;

// Refreshes the current session if authentication is in use
- (void)refreshSession;

// returns the custom authorization headers in use
- (NSDictionary *)authHeaders;

@end
