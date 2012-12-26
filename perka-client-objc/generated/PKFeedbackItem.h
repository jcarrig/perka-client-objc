// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKFeedbackItem;
@class PKVisit;

/** Feedback left by a Customer after a Visit has been completed.
*/
@interface PKFeedbackItem : PKBaseEntityGlobal

@property (strong) NSString *customerName;

@property (strong) NSString *feedback;

@property (strong, getter=isSignedProperty) NSNumber *signedProperty;

@property (strong) PKVisit *visit;

@property (strong) NSString *visitUuid;

@end
