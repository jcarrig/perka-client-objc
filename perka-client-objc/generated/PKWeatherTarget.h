// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKListTarget.h"

@class PKWeatherTarget;

/** A coupon target that enables coupons based upon weather predictions. The data-source 
*   for these targets is based on USGS forecasts. Given the inherent intra-day variance 
*   in weather forecasts, the availability of the coupon is triggered at a specific 
*   time-of-day by evaluating a metric and comparison operation (e.g. the predicted 
*   high temperature is above 100).
*/
@interface PKWeatherTarget : PKListTarget

/** The local minutes-of-day after which the availability of the coupon will not 
*   change for the remainder of the day.
*/
@property (strong) NSString *localDecisionAt;

/** The time of day for which the metric threshold must be met.
*/
@property (strong) NSString *localMetricAt;

/** Possible values: PUNCH_COUNT, TOP_N, TOP_PCT, VISIT_COUNT
*/
@property (strong) NSString *metric;

/** Possible values: AND, NOT, OR
*/
@property (strong) NSString *operation;

@property (strong) NSNumber *threshold;

@end
