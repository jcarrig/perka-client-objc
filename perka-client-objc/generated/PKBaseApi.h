// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "FPBaseApi.h"
#import "FPBaseHasUuid.h"
#import "FPFlatpackRequest.h"

@class PKBaseEntityGlobal;
@class PKCustomer;
@class PKEntityAnnotation;
@class PKMerchant;
@class PKMerchantLocation;
@class PKRewardGrant;
@class PKUserCredentials;
@class PKVisit;
@class PKVisitConfirmation;

typedef void(^PKPutAnnotationRequestBlock)(PKEntityAnnotation *entityAnnotation);
typedef void(^PKGetAnnotationTypeUuidRequestBlock)(PKEntityAnnotation *entityAnnotation);
typedef void(^PKGetAssetManifestPerksRequestBlock)(NSArray *results);
typedef void(^PKGetCustomerPointsRequestBlock)(NSArray *pointsActivities);
typedef void(^PKPutCustomerRewardRequestBlock)(PKVisit *visit);
typedef void(^PKPostCustomerVisitRequestBlock)(PKVisit *visit);
typedef void(^PKGetCustomerVisitRequestBlock)(NSArray *visits);
typedef void(^PKPutCustomerVisitRequestBlock)(PKVisit *visit);
typedef void(^PKPutCustomerVisitAmendRequestBlock)(PKVisit *visit);
typedef void(^PKGetCustomerVisitValidateRequestBlock)(NSArray *visits);
typedef void(^PKGetCustomerUuidRequestBlock)(PKCustomer *customer);
typedef void(^PKGetDescribeTokenRequestBlock)(NSDictionary *result);
typedef void(^PKGetDescribeTypeUuidRequestBlock)(PKBaseEntityGlobal *baseEntityGlobal);
typedef void(^PKPostIntegratorCustomerRequestBlock)(PKCustomer *customer);
typedef void(^PKPutIntegratorCustomerRequestBlock)(PKCustomer *customer);
typedef void(^PKDeleteIntegratorDestroyRequestBlock)();
typedef void(^PKGetIntegratorManagedMerchantsRequestBlock)(NSArray *merchants);
typedef void(^PKGetIntegratorManagedUsersRequestBlock)(NSArray *abstractUsers);
typedef void(^PKPostIntegratorMerchantRequestBlock)(PKMerchant *merchant);
typedef void(^PKGetMerchantLocationsRequestBlock)(NSArray *merchantLocations);

@interface PKPutAnnotationRequest : FPFlatpackRequest
  -(PKEntityAnnotation *)execute;
  -(void)executeUsingBlock:(PKPutAnnotationRequestBlock)block;
@end

@interface PKGetAnnotationTypeUuidRequest : FPFlatpackRequest
  -(PKEntityAnnotation *)execute;
  -(void)executeUsingBlock:(PKGetAnnotationTypeUuidRequestBlock)block;
@end

@interface PKGetAssetManifestPerksRequest : FPFlatpackRequest
  -(NSArray *)execute;
  -(void)executeUsingBlock:(PKGetAssetManifestPerksRequestBlock)block;
@end

@interface PKGetCustomerPointsRequest : FPFlatpackRequest
  -(NSArray *)execute;
  -(void)executeUsingBlock:(PKGetCustomerPointsRequestBlock)block;
@end

@interface PKPutCustomerRewardRequest : FPFlatpackRequest
  -(PKVisit *)execute;
  -(void)executeUsingBlock:(PKPutCustomerRewardRequestBlock)block;
@end

@interface PKPostCustomerVisitRequest : FPFlatpackRequest
  -(PKVisit *)execute;
  -(void)executeUsingBlock:(PKPostCustomerVisitRequestBlock)block;
@end

@interface PKGetCustomerVisitRequest : FPFlatpackRequest
  -(PKGetCustomerVisitRequest *)withFastPoll:(NSString *)fastPoll;
  -(NSArray *)execute;
  -(void)executeUsingBlock:(PKGetCustomerVisitRequestBlock)block;
@end

@interface PKPutCustomerVisitRequest : FPFlatpackRequest
  -(PKVisit *)execute;
  -(void)executeUsingBlock:(PKPutCustomerVisitRequestBlock)block;
@end

@interface PKPutCustomerVisitAmendRequest : FPFlatpackRequest
  -(PKVisit *)execute;
  -(void)executeUsingBlock:(PKPutCustomerVisitAmendRequestBlock)block;
@end

@interface PKGetCustomerVisitValidateRequest : FPFlatpackRequest
  -(PKGetCustomerVisitValidateRequest *)withMostRecentValidatedUuid:(NSString *)mostRecentValidatedUuid;
  -(PKGetCustomerVisitValidateRequest *)withFastPoll:(NSString *)fastPoll;
  -(NSArray *)execute;
  -(void)executeUsingBlock:(PKGetCustomerVisitValidateRequestBlock)block;
@end

@interface PKGetCustomerUuidRequest : FPFlatpackRequest
  -(PKCustomer *)execute;
  -(void)executeUsingBlock:(PKGetCustomerUuidRequestBlock)block;
@end

@interface PKGetDescribeTokenRequest : FPFlatpackRequest
  -(PKGetDescribeTokenRequest *)withToken:(NSString *)token;
  -(NSDictionary *)execute;
  -(void)executeUsingBlock:(PKGetDescribeTokenRequestBlock)block;
@end

@interface PKGetDescribeTypeUuidRequest : FPFlatpackRequest
  -(PKGetDescribeTypeUuidRequest *)withLastModified:(NSString *)lastModified;
  -(PKBaseEntityGlobal *)execute;
  -(void)executeUsingBlock:(PKGetDescribeTypeUuidRequestBlock)block;
@end

@interface PKPostIntegratorCustomerRequest : FPFlatpackRequest
  -(PKCustomer *)execute;
  -(void)executeUsingBlock:(PKPostIntegratorCustomerRequestBlock)block;
@end

@interface PKPutIntegratorCustomerRequest : FPFlatpackRequest
  -(PKCustomer *)execute;
  -(void)executeUsingBlock:(PKPutIntegratorCustomerRequestBlock)block;
@end

@interface PKDeleteIntegratorDestroyRequest : FPFlatpackRequest
  -()execute;
  -(void)executeUsingBlock:(PKDeleteIntegratorDestroyRequestBlock)block;
@end

@interface PKGetIntegratorManagedMerchantsRequest : FPFlatpackRequest
  -(NSArray *)execute;
  -(void)executeUsingBlock:(PKGetIntegratorManagedMerchantsRequestBlock)block;
@end

@interface PKGetIntegratorManagedUsersRequest : FPFlatpackRequest
  -(NSArray *)execute;
  -(void)executeUsingBlock:(PKGetIntegratorManagedUsersRequestBlock)block;
@end

@interface PKPostIntegratorMerchantRequest : FPFlatpackRequest
  -(PKMerchant *)execute;
  -(void)executeUsingBlock:(PKPostIntegratorMerchantRequestBlock)block;
@end

@interface PKGetMerchantLocationsRequest : FPFlatpackRequest
  -(NSArray *)execute;
  -(void)executeUsingBlock:(PKGetMerchantLocationsRequestBlock)block;
@end

@interface PKBaseApi : FPBaseApi

  /** Add or replace an annotation applied to a persistent entity. If the value 
  *   of \link PKEntityAnnotation EntityAnnotation \endlink is missing or <code>null</code>, 
  *   the annotation will be removed.
  */
  - (PKPutAnnotationRequest *)putAnnotation:(PKEntityAnnotation *)entityAnnotation;

  /** Find an annotation applied to a persistent entity.
  */
  - (PKGetAnnotationTypeUuidRequest *)getAnnotationType:(NSString *)type uuid:(NSString *)uuid;

  /** Returns the manifest of perk icon names.
  */
  - (PKGetAssetManifestPerksRequest *)getAssetManifestPerks;

  /** Returns the current customer's PointsActivity status across all merchants 
  *   with a points-based loyalty system.
  */
  - (PKGetCustomerPointsRequest *)getCustomerPoints;

  /** Rewards a Customer. This method will implicitly create a \link PKVisit Visit 
  *   \endlink which will be returned.
  */
  - (PKPutCustomerRewardRequest *)putCustomerReward:(PKRewardGrant *)rewardGrant;

  /** Creates a new outstanding visit for the current customer at the given location. 
  *   If the Customer attempts to check into the same location more than once, the 
  *   same \link PKVisit Visit \endlink will be returned. <p> If the customer has 
  *   no active Rewards at the associated merchant, a new Reward will be created 
  *   for each of the merchant's programs. Information about the visit, and all 
  *   active rewards for the associated merchant will be returned.
  */
  - (PKPostCustomerVisitRequest *)postCustomerVisit:(PKMerchantLocation *)merchantLocation;

  /** Returns a sparse list of visits at the current merchant location that are 
  *   un-validated, or that occurred after the time of the most recent validated 
  *   visit given. This request must be made with a anonymous clerk role that corresponds 
  *   to exactly one MerchantLocation.
  */
  - (PKGetCustomerVisitRequest *)getCustomerVisit;

  /** Validates a \link PKVisit Visit \endlink. This endpoint is the second half 
  *   of the "two-phase" checkin flow.
  */
  - (PKPutCustomerVisitRequest *)putCustomerVisit:(PKVisitConfirmation *)visitConfirmation;

  /** Rewrites the history of a customer's latest validated visit to a merchant. 
  *   The \link PKAbstractRewardConfirmation AbstractRewardConfirmation \endlink 
  *   instances associated with the \link PKVisitConfirmation VisitConfirmation 
  *   \endlink should reflect the desired state of the Visit.
  */
  - (PKPutCustomerVisitAmendRequest *)putCustomerVisitAmend:(PKVisitConfirmation *)visitConfirmation;

  /** Checks for the validation of an outstanding visit and returns a sparse payload 
  *   of \link PKVisit Visit \endlink and related items. Calls to this API method 
  *   will hang for a period of time until a Visit associated with the requesting 
  *   Customer has been updated.
  */
  - (PKGetCustomerVisitValidateRequest *)getCustomerVisitValidate;

  /** Retrieves the \link PKCustomer Customer \endlink associated with the given 
  *   uuid. The response will include \link PKReward Reward \endlink and \link PKTierTraversal 
  *   TierTraversal \endlink information for the \link PKMerchant Merchant \endlink 
  *   associated with the logged in \link PKClerk Clerk \endlink or \link PKMerchantUser 
  *   MerchantUser \endlink.
  */
  - (PKGetCustomerUuidRequest *)getCustomerUuid:(NSString *)uuid;

  /** A diagnostic endpoint to extract the information from an OAuth2 authorization 
  *   code, login token, session token, or refresh token.
  */
  - (PKGetDescribeTokenRequest *)getDescribeToken;

  /** Performs a deep serialization of an entity. This endpoint is intended to provide 
  *   supplementary one-to-many relationship data that is not normally serialized 
  *   to keep payload sizes manageable.
  */
  - (PKGetDescribeTypeUuidRequest *)getDescribeType:(NSString *)type uuid:(NSString *)uuid;

  /** Creates a new customer associated with the current \link PKIntegratorUser 
  *   IntegratorUser \endlink, or returns an existing customer if a matching customer 
  *   already exists. The given \link PKUserCredentials UserCredentials \endlink 
  *   must include an email, phone, or both. The following rules will be used to 
  *   determine if a new customer should be created <ul> <li>If a customer exists 
  *   with a matching <b>confirmed</b> email address or <b>confirmed</b> phone number, 
  *   that customer will be returned.</li> <li>If a customer exists that is associated 
  *   with the current \link PKIntegratorUser IntegratorUser \endlink, and has a 
  *   matching <b>unconfirmed</b> email address or <b>unconfirmed</b> phone number, 
  *   that customer will be returned. The email check will happen first, and will 
  *   short-circuit the phone check if a match is found.</li> <li>Otherwise, a new 
  *   customer will be created and associated with your \link PKIntegratorUser IntegratorUser 
  *   \endlink. The given phone number and email address will be stored as unconfirmed 
  *   values. </ul>
  */
  - (PKPostIntegratorCustomerRequest *)postIntegratorCustomer:(PKUserCredentials *)userCredentials;

  /** Updates an existing \link PKCustomer Customer \endlink manageed by the current 
  *   \link PKIntegratorUser IntegratorUser \endlink.
  */
  - (PKPutIntegratorCustomerRequest *)putIntegratorCustomer:(PKCustomer *)customer;

  /** Completely destroys all customer data associated with the current integrator 
  *   user. This endpoint is only available in the sandbox environment.
  */
  - (PKDeleteIntegratorDestroyRequest *)deleteIntegratorDestroy;

  /** Returns a list of all merchants managed by the current integrator user
  */
  - (PKGetIntegratorManagedMerchantsRequest *)getIntegratorManagedMerchants;

  /** Returns a list of all users the integrator may act as.
  */
  - (PKGetIntegratorManagedUsersRequest *)getIntegratorManagedUsers;

  /** Creates a new \link PKMerchant Merchant \endlink to be managed by the current 
  *   \link PKIntegratorUser IntegratorUser \endlink.
  */
  - (PKPostIntegratorMerchantRequest *)postIntegratorMerchant:(PKMerchant *)merchant;

  /** Returns a sparse payload of all live \link PKMerchantLocation locations \endlink 
  *   and their associated \link PKMerchant merchants \endlink.
  */
  - (PKGetMerchantLocationsRequest *)getMerchantLocations;


@end
