//
//  BaseRequest.m
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/11/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPBaseRequest.h"
#import "FPBaseApi.h"
#import "NSString+FP.h"

@implementation FPBaseRequest

- (id)initWithApi:(FPBaseApi *)api
           method:(NSString *)method
             path:(NSString *)path {
  return [self initWithApi:api method:method path:path pathArgs:@[]];
}

- (id)initWithApi:(FPBaseApi *)api
           method:(NSString *)method
             path:(NSString *)path
         pathArgs:(NSArray *)args {
  
  self = [super init];
  if(self != nil) {
    _api = api;
    _method = [method lowercaseString];
        
    // replace path {} parameters
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:@"[{][^}]*[}]"
                                  options:NSRegularExpressionCaseInsensitive
                                  error:&error];
    
    _path = path;
    __block NSUInteger idx = 0;
    __block NSMutableArray *replacements = [NSMutableArray array];
    [regex enumerateMatchesInString:path
                            options:0
                              range:NSMakeRange(0, [path length])
                         usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                           NSString *match = [_path substringWithRange:[result range]];
                           [replacements addObject:match];
                           idx++;
                         }];
    
    [replacements enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      _path = [_path stringByReplacingOccurrencesOfString:obj withString:args[idx]];
    }];
    
    // define default headers
    _headers = [NSMutableDictionary dictionaryWithDictionary:@{
                @"Content-Type":@"application/json"}];
    [_headers setValuesForKeysWithDictionary:[_api authHeaders]];
    
    // and query params
    _queryParams = [NSMutableArray array];
  }
  
  return self;
}

- (id)baseExecute {
  return [self executeWithBlock:nil wait:YES];
}

- (void)baseExecuteUsingBlock:(FPRequestFinishedBlock)block {
  [self executeWithBlock:block wait:NO];
}

- (FPBaseRequest *)setHeaderWithName:(NSString *)name
                               value:(NSString *)value {
  [_headers setValue:value forKey:name];
  return self;
}

- (FPBaseRequest *)setQueryParameterWithName:(NSString *)name
                                       value:(NSString *)value {
  _queryParams[name] = value;
  return self;
}

#pragma mark private

- (id)executeWithBlock:(FPRequestFinishedBlock)block wait:(BOOL)wait {
  
  // ensure our api session is still active
  if(![_api sessionActive]) {
    [_api refreshSession];
  }
  
  // build our URI
  NSString *urlString = [NSString stringWithFormat:@"%@%@", [_api serverBase], _path];
  
  // add in query parameters
  if([_queryParams count] > 0) {
    __block NSUInteger idx = 0;
    __block NSString *queryString = @"";
    [_queryParams enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
      queryString = [NSString stringWithFormat:@"%@%@%@=%@", queryString,
                     idx == 0 ? @"?" : @"&", [key urlEncode], [obj urlEncode]];
      idx++;
    }];
    urlString = [urlString stringByAppendingString:queryString];
  }
  
  // build our request
  NSMutableURLRequest *request = [NSMutableURLRequest new];
  
  [request setURL:[NSURL URLWithString:urlString]];
  [request setHTTPMethod:_method];
  [request setHTTPBody:[self payload]];
  
  // add our headers
  [[self headers] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    [request setValue:obj forHTTPHeaderField:key];
  }];
  
  // log it
  if([_api isVerbose]) {
    NSString *payload = [[NSString alloc] initWithData:[self payload] encoding:NSUTF8StringEncoding];
    NSLog(@"\n***** FlatPack Request *****\nrequesting %@ to %@ \nwith headers: %@, \npayload: %@\n\n",
          _method, urlString, [[self headers] description], payload);
  }
  
  // send a synchronous request if we've been asked to wait for completion
  if(wait) {
    
    if([[NSThread currentThread] isMainThread]) {
      NSLog(@"***** WARNING: Synchronous request being made on the Main Thread *****");
    }
    
    NSError *error = nil;
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    
    return [self processResponse:response withData:data error:error];
  }
  
  // or an asynchronous request otherwise
  else {
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                             id result = [self processResponse:response withData:data error:error];
                             if(block != nil) block(result);
                           }];
    return nil;
  }
}

- (id)processResponse:(NSURLResponse *)response
               withData:(NSData *)data
                  error:(NSError *)error {
  _response = (NSHTTPURLResponse *)response;
  
  id result = nil;
  
  if(error != nil) {
    NSLog(@"Could not complete request %@", error);
  }
  else {
    result = [self processResponse:_response withData:data];
  }
  
  return result;
}

// default implementation simply returns the response data
- (id)processResponse:(NSHTTPURLResponse *)response
             withData:(NSData *)responseData {
  return responseData;
}

@end
