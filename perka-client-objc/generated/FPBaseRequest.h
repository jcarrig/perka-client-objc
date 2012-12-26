//
//  BaseRequest.h
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/11/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FPBaseApi;

typedef void(^FPRequestFinishedBlock)(id result);

@interface FPBaseRequest : NSObject

@property (strong) FPBaseApi *api;
@property (strong) NSString *method;
@property (strong) NSString *path;
@property (strong) NSMutableDictionary *headers;
@property (strong) NSMutableDictionary *queryParams;
@property (strong) NSData *payload;
@property (strong, readonly) NSHTTPURLResponse *response;

- (id)initWithApi:(FPBaseApi *)api
           method:(NSString *)method
             path:(NSString *)path;

- (id)initWithApi:(FPBaseApi *)api
           method:(NSString *)method
             path:(NSString *)path
         pathArgs:(NSArray *)args;

- (FPBaseRequest *)setHeaderWithName:(NSString *)name
                               value:(NSString *)value;

- (FPBaseRequest *)setQueryParameterWithName:(NSString *)name
                                       value:(NSString *)value;

- (id)baseExecute;

- (void)baseExecuteUsingBlock:(FPRequestFinishedBlock)block;

@end
