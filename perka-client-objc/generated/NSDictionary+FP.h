//
//  NSString+NSString_Flatpack.h
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/6/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FP)

+ (NSDictionary *)dictionaryFromJSON:(NSString *)jsonString;

- (NSString *)asJSONPrettyPrint:(BOOL)pretty;

@end
