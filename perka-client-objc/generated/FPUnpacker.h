//
//  Unpacker.h
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/3/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FPBaseHasUuid;

@interface FPUnpacker : NSObject

@property (strong, getter=isVerbose) NSNumber *verbose;

- (FPBaseHasUuid *)unpack:(NSString *)json;

@end
