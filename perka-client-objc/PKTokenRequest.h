//
//  PerkaTokenRequest.h
//  perka-client-objc
//
//  Created by Joe Stelmach on 12/18/12.
//  Copyright (c) 2012 Perka Inc. All rights reserved.
//

#import "FPJsonRequest.h"

@interface PKTokenRequest : FPJsonRequest

-(id)initWithApi:(FPBaseApi *)api payload:(NSString *)payload;

@end
