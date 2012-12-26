//
//  EntityDescription.h
//  flatpack-objc
//
//  Created by Joe Stelmach on 12/4/12.
//  Copyright (c) 2012 Joe Stelmach. All rights reserved.
//

#import "FPBaseHasUuid.h"

@interface FPEntityDescription : FPBaseHasUuid

@property (strong) NSArray *properties;
@property (strong) NSString *typeName;
@property (strong) Class kind;
@property (strong) FPEntityDescription *superType;

+ (FPEntityDescription *)entityDescriptionForName:(NSString *)name;

+ (void)setEntityDescription:(FPEntityDescription *)entityDescription
                     forName:(NSString *)name;

- (NSArray *)allProperties;

@end
