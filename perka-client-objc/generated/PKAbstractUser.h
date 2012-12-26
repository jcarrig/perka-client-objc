// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKAbstractUser;

/** A supertype for all objects representing an identity. Each subtype of AbstractUser 
*   has an associated role which is used to controll access to API endpoints and 
*   model properties.
*/
@interface PKAbstractUser : PKBaseEntityGlobal

@property (strong) NSString *email;

@property (strong) NSString *firstName;

@property (strong) NSString *lastName;

@property (strong, getter=aNewPassword) NSString *newPassword;

@property (strong, getter=aNewPasswordConfirmation) NSString *newPasswordConfirmation;

@property (strong, getter=isPasswordSet) NSNumber *passwordSet;

@property (strong) NSString *phone;

/** A user's role is used to control access to API endpoints and model properties.
*/
@property (strong) NSString *role;

/** Users whose email addresses have not been confirmed via a click-to-confirm 
*   email will have this field populated. Multiple user entities may share the same 
*   unconfirmed email address. When the address is confirmed, these entities will 
*   be merged.
*/
@property (strong) NSString *unconfirmedEmail;

@property (strong) NSString *unconfirmedPhone;

@end
