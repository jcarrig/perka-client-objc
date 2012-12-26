// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKBaseEntityGlobal;
@class PKEntityAnnotation;

/** Allows integrators to associate an arbitrary JSON object with a persistent entity. 
*   Any instance of an EntityAnnotation is specific to a particular IntegratorUser 
*   and multiple integrators may annotate the same entity. <p> When a request is 
*   made to the API server by an integrator or by any other user that is managed 
*   by an integrator, any EntityAnnotations associated with objects in the returned 
*   payload will be included as extra data.
*/
@interface PKEntityAnnotation : PKBaseEntityGlobal

/** The custom data which may be any JSON value.
*/
@property (strong) NSObject *annotation;

/** The target entity for the annotation.
*/
@property (strong) PKBaseEntityGlobal *entity;

@end
