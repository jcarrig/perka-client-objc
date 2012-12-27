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

static NSOperationQueue *flatpackQueue;

+ (void) initialize {
  [super initialize];
  flatpackQueue = [[NSOperationQueue alloc] init];
}

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
  return [self executeWithBlock:nil];
}

- (void)baseExecuteUsingBlock:(FPRequestFinishedBlock)block {
  [self executeWithBlock:block];
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

- (id)executeWithBlock:(FPRequestFinishedBlock)block{
  
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
  [request setCachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData];
  
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
  
  // if a block has not been given, we assume the requestor would like the current thread to
  // wait until the request has completed.
  BOOL wait = block == nil;
  
  // If we've been asked to wait, we send the request off synchronously
  if(wait) {
    if([[NSThread currentThread] isMainThread]) {
      NSLog(@"***** WARNING: Synchronous request being made on the Main Thread *****");
    }
    
    NSError *error = nil;
    NSURLResponse *localResponse = _response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&localResponse
                                                     error:&error];
    if(error != nil) {
      if([error code])
      [self printError:error];
      return nil;
    }
    else {
      return [self processResponse:_response withData:data];
    }
  }
  
  // otherwise, we send it asynchronously
  else {
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:flatpackQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                             _response = (NSHTTPURLResponse *)response;
                             if(error != nil) [self printError:error];
                             if(block != nil) block([self processResponse:_response withData:data]);
                           }];
    return nil;
  }
}

// default implementation simply returns the response data
- (id)processResponse:(NSHTTPURLResponse *)response
             withData:(NSData *)responseData {
  return responseData;
}

- (void)printError:(NSError *)error {
  NSLog(@"Connection failed! Error - %@ %@",
        [error localizedDescription],
        [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

@end
