// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "FPBaseHasUuid.h"

@class PKStreetAddress;

/** A simple representation of a mailing address. It is intended to be used as a 
*   payload carrier object or as an embeddable JPA object. <p> All of the properties 
*   in this object are marked as PermitAll because access to the StreetAddress itself 
*   is controlled by the enclosing object.
*/
@interface PKStreetAddress : FPBaseHasUuid

@property (strong) NSString *address;

@property (strong) NSString *address2;

@property (strong) NSString *city;

@property (strong) NSString *state;

@property (strong) NSString *zip;

@end
