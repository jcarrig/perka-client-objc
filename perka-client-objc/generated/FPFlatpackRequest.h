//
//  FPFlatpackRequest.h
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/12/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPBaseRequest.h"
#import "FPBaseHasUuid.h"

@interface FPFlatpackRequest : FPBaseRequest

@property (strong) FPBaseHasUuid *entity;

@end
