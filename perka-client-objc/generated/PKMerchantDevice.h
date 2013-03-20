// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKMerchantDevice;
@class PKMerchantLocation;

/** Represents a device running the Merchant Validator app.
*/
@interface PKMerchantDevice : PKBaseEntityGlobal

@property (strong) NSString *identifier;

@property (strong) NSString *make;

@property (weak) PKMerchantLocation *merchantLocation;

@property (strong) NSString *model;

@property (strong) NSString *osVersion;

@property (strong) NSString *platform;

@property (strong) NSString *serialNumber;

@end
