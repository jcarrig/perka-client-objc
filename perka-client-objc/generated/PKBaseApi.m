// Generated File - DO NOT EDIT

#import "PKBaseApi.h"
#import "PKBaseEntityGlobal.h"
#import "PKCustomer.h"
#import "PKEntityAnnotation.h"
#import "PKMerchant.h"
#import "PKMerchantLocation.h"
#import "PKRewardGrant.h"
#import "PKUserCredentials.h"
#import "PKVisit.h"
#import "PKVisitConfirmation.h"

@implementation PKPutAnnotationRequest
  -(PKEntityAnnotation *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKPutAnnotationRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKGetAnnotationTypeUuidRequest
  -(PKEntityAnnotation *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKGetAnnotationTypeUuidRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKGetAssetManifestPerksRequest
  -(NSArray *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKGetAssetManifestPerksRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKGetCustomerPointsRequest
  -(NSArray *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKGetCustomerPointsRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKPutCustomerRewardRequest
  -(PKVisit *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKPutCustomerRewardRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKPostCustomerVisitRequest
  -(PKVisit *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKPostCustomerVisitRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKGetCustomerVisitRequest
   -(PKGetCustomerVisitRequest *)withFastPoll:(NSString *)fastPoll {
      [self setQueryParameterWithName:@"fastPoll" value:fastPoll];
      return self;
    }

  -(NSArray *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKGetCustomerVisitRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKPutCustomerVisitRequest
  -(PKVisit *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKPutCustomerVisitRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKPutCustomerVisitAmendRequest
  -(PKVisit *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKPutCustomerVisitAmendRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKGetCustomerVisitValidateRequest
   -(PKGetCustomerVisitValidateRequest *)withMostRecentValidatedUuid:(NSString *)mostRecentValidatedUuid {
      [self setQueryParameterWithName:@"mostRecentValidatedUuid" value:mostRecentValidatedUuid];
      return self;
    }

   -(PKGetCustomerVisitValidateRequest *)withFastPoll:(NSString *)fastPoll {
      [self setQueryParameterWithName:@"fastPoll" value:fastPoll];
      return self;
    }

  -(NSArray *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKGetCustomerVisitValidateRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKGetCustomerUuidRequest
  -(PKCustomer *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKGetCustomerUuidRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKGetDescribeTokenRequest
   -(PKGetDescribeTokenRequest *)withToken:(NSString *)token {
      [self setQueryParameterWithName:@"token" value:token];
      return self;
    }

  -(NSDictionary *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKGetDescribeTokenRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKGetDescribeTypeUuidRequest
   -(PKGetDescribeTypeUuidRequest *)withLastModified:(NSString *)lastModified {
      [self setQueryParameterWithName:@"lastModified" value:lastModified];
      return self;
    }

  -(PKBaseEntityGlobal *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKGetDescribeTypeUuidRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKPostIntegratorCustomerRequest
  -(PKCustomer *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKPostIntegratorCustomerRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKPutIntegratorCustomerRequest
  -(PKCustomer *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKPutIntegratorCustomerRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKDeleteIntegratorDestroyRequest
  -()execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKDeleteIntegratorDestroyRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKGetIntegratorManagedMerchantsRequest
  -(NSArray *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKGetIntegratorManagedMerchantsRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKGetIntegratorManagedUsersRequest
  -(NSArray *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKGetIntegratorManagedUsersRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKPostIntegratorMerchantRequest
  -(PKMerchant *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKPostIntegratorMerchantRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKGetMerchantLocationsRequest
  -(NSArray *)execute {
    return [self baseExecute];
  }

  -(void)executeUsingBlock:(PKGetMerchantLocationsRequestBlock)block {
    [self baseExecuteUsingBlock:^(id result) {
      if(block != nil) block(result);
    }];
  }
@end

@implementation PKBaseApi
  - (PKPutAnnotationRequest *)putAnnotation:(PKEntityAnnotation *)entityAnnotation {
    PKPutAnnotationRequest *request = [[PKPutAnnotationRequest alloc] initWithApi:self
      method:@"PUT"
      path:@"/api/2/annotation"];
    [request setEntity:entityAnnotation];
    return request; 
  }

  - (PKGetAnnotationTypeUuidRequest *)getAnnotationType:(NSString *)type uuid:(NSString *)uuid {
    PKGetAnnotationTypeUuidRequest *request = [[PKGetAnnotationTypeUuidRequest alloc] initWithApi:self
      method:@"GET"
      path:@"/api/2/annotation/{type}/{uuid}"
      pathArgs:@[type, uuid]];
    return request; 
  }

  - (PKGetAssetManifestPerksRequest *)getAssetManifestPerks {
    PKGetAssetManifestPerksRequest *request = [[PKGetAssetManifestPerksRequest alloc] initWithApi:self
      method:@"GET"
      path:@"/api/2/asset/manifest/perks"];
    return request; 
  }

  - (PKGetCustomerPointsRequest *)getCustomerPoints {
    PKGetCustomerPointsRequest *request = [[PKGetCustomerPointsRequest alloc] initWithApi:self
      method:@"GET"
      path:@"/api/2/customer/points"];
    return request; 
  }

  - (PKPutCustomerRewardRequest *)putCustomerReward:(PKRewardGrant *)rewardGrant {
    PKPutCustomerRewardRequest *request = [[PKPutCustomerRewardRequest alloc] initWithApi:self
      method:@"PUT"
      path:@"/api/2/customer/reward"];
    [request setEntity:rewardGrant];
    return request; 
  }

  - (PKPostCustomerVisitRequest *)postCustomerVisit:(PKMerchantLocation *)merchantLocation {
    PKPostCustomerVisitRequest *request = [[PKPostCustomerVisitRequest alloc] initWithApi:self
      method:@"POST"
      path:@"/api/2/customer/visit"];
    [request setEntity:merchantLocation];
    return request; 
  }

  - (PKGetCustomerVisitRequest *)getCustomerVisit {
    PKGetCustomerVisitRequest *request = [[PKGetCustomerVisitRequest alloc] initWithApi:self
      method:@"GET"
      path:@"/api/2/customer/visit"];
    return request; 
  }

  - (PKPutCustomerVisitRequest *)putCustomerVisit:(PKVisitConfirmation *)visitConfirmation {
    PKPutCustomerVisitRequest *request = [[PKPutCustomerVisitRequest alloc] initWithApi:self
      method:@"PUT"
      path:@"/api/2/customer/visit"];
    [request setEntity:visitConfirmation];
    return request; 
  }

  - (PKPutCustomerVisitAmendRequest *)putCustomerVisitAmend:(PKVisitConfirmation *)visitConfirmation {
    PKPutCustomerVisitAmendRequest *request = [[PKPutCustomerVisitAmendRequest alloc] initWithApi:self
      method:@"PUT"
      path:@"/api/2/customer/visit/amend"];
    [request setEntity:visitConfirmation];
    return request; 
  }

  - (PKGetCustomerVisitValidateRequest *)getCustomerVisitValidate {
    PKGetCustomerVisitValidateRequest *request = [[PKGetCustomerVisitValidateRequest alloc] initWithApi:self
      method:@"GET"
      path:@"/api/2/customer/visit/validate"];
    return request; 
  }

  - (PKGetCustomerUuidRequest *)getCustomerUuid:(NSString *)uuid {
    PKGetCustomerUuidRequest *request = [[PKGetCustomerUuidRequest alloc] initWithApi:self
      method:@"GET"
      path:@"/api/2/customer/{uuid}"
      pathArgs:@[uuid]];
    return request; 
  }

  - (PKGetDescribeTokenRequest *)getDescribeToken {
    PKGetDescribeTokenRequest *request = [[PKGetDescribeTokenRequest alloc] initWithApi:self
      method:@"GET"
      path:@"/api/2/describe/token"];
    return request; 
  }

  - (PKGetDescribeTypeUuidRequest *)getDescribeType:(NSString *)type uuid:(NSString *)uuid {
    PKGetDescribeTypeUuidRequest *request = [[PKGetDescribeTypeUuidRequest alloc] initWithApi:self
      method:@"GET"
      path:@"/api/2/describe/{type}/{uuid}"
      pathArgs:@[type, uuid]];
    return request; 
  }

  - (PKPostIntegratorCustomerRequest *)postIntegratorCustomer:(PKUserCredentials *)userCredentials {
    PKPostIntegratorCustomerRequest *request = [[PKPostIntegratorCustomerRequest alloc] initWithApi:self
      method:@"POST"
      path:@"/api/2/integrator/customer"];
    [request setEntity:userCredentials];
    return request; 
  }

  - (PKPutIntegratorCustomerRequest *)putIntegratorCustomer:(PKCustomer *)customer {
    PKPutIntegratorCustomerRequest *request = [[PKPutIntegratorCustomerRequest alloc] initWithApi:self
      method:@"PUT"
      path:@"/api/2/integrator/customer"];
    [request setEntity:customer];
    return request; 
  }

  - (PKDeleteIntegratorDestroyRequest *)deleteIntegratorDestroy {
    PKDeleteIntegratorDestroyRequest *request = [[PKDeleteIntegratorDestroyRequest alloc] initWithApi:self
      method:@"DELETE"
      path:@"/api/2/integrator/destroy"];
    return request; 
  }

  - (PKGetIntegratorManagedMerchantsRequest *)getIntegratorManagedMerchants {
    PKGetIntegratorManagedMerchantsRequest *request = [[PKGetIntegratorManagedMerchantsRequest alloc] initWithApi:self
      method:@"GET"
      path:@"/api/2/integrator/managed/merchants"];
    return request; 
  }

  - (PKGetIntegratorManagedUsersRequest *)getIntegratorManagedUsers {
    PKGetIntegratorManagedUsersRequest *request = [[PKGetIntegratorManagedUsersRequest alloc] initWithApi:self
      method:@"GET"
      path:@"/api/2/integrator/managed/users"];
    return request; 
  }

  - (PKPostIntegratorMerchantRequest *)postIntegratorMerchant:(PKMerchant *)merchant {
    PKPostIntegratorMerchantRequest *request = [[PKPostIntegratorMerchantRequest alloc] initWithApi:self
      method:@"POST"
      path:@"/api/2/integrator/merchant"];
    [request setEntity:merchant];
    return request; 
  }

  - (PKGetMerchantLocationsRequest *)getMerchantLocations {
    PKGetMerchantLocationsRequest *request = [[PKGetMerchantLocationsRequest alloc] initWithApi:self
      method:@"GET"
      path:@"/api/2/merchant/locations"];
    return request; 
  }
@end