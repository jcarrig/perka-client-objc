//
//  Flatpack.h
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/3/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FPPacker, FPUnpacker;

@interface FPFlatpack : NSObject

@property (strong) FPPacker *packer;
@property (strong) FPUnpacker *unpacker;

@end
