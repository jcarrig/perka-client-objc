//
//  BaseHasUuid.h
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/3/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FPEntityDescription, FPProperty;

@interface FPBaseHasUuid : NSObject

+ (FPEntityDescription *)entityDescription;

@property (strong) NSString *uuid;

@end
