//
//  Packer.h
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/3/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FPBaseHasUuid;

@interface FPPacker : NSObject

@property (strong, getter=isPretty) NSNumber * pretty;
@property (strong, getter=isVerbose) NSNumber * verbose;

// Generates a FlatPack JSON string for the given entity
- (NSString *)pack:(FPBaseHasUuid *)entity;

@end
