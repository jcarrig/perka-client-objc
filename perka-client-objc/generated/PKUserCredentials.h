// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "FPBaseHasUuid.h"

@class PKUserCredentials;

/** A transfer object used to hold data related to account creation and maintenance.
*/
@interface PKUserCredentials : FPBaseHasUuid

@property (strong) NSString *currentPassword;

@property (strong) NSString *email;

@property (strong) NSString *firstName;

@property (strong) NSString *hmac;

@property (strong) NSString *lastName;

@property (strong, getter=aNewPassword) NSString *newPassword;

@property (strong, getter=aNewPasswordConfirmation) NSString *newPasswordConfirmation;

@property (strong) NSString *phone;

@property (strong) NSString *phoneConfirmationCode;

@property (strong) NSString *userUuid;

@end
