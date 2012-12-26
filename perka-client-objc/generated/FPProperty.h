//
//  Property.h
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/4/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPBaseHasUuid.h"

@interface FPProperty : FPBaseHasUuid

@property (strong) NSString *name;
@property (strong) Class kind;
@property (strong, getter=isEmbedded) NSNumber *embedded;
@property (strong) FPProperty *impliedProperty;

+ (FPProperty *)propertyForUuid:(NSString *)uuid;

+ (FPProperty *)setPropertyForUuid:(NSString *)uuid
                  withDictionary:(NSDictionary *)dictionary;

@end
