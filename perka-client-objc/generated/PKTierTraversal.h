// Generated File - DO NOT EDIT

#import <Foundation/Foundation.h>
#import "PKBaseEntityGlobal.h"

@class PKCustomer;
@class PKProgramTier;
@class PKTierTraversal;

/** Maps a \link PKCustomer Customer \endlink to a \link PKProgramTier ProgramTier 
*   \endlink and provides the total number of validated visits to the associated 
*   \link PKMerchant Merchant \endlink.
*/
@interface PKTierTraversal : PKBaseEntityGlobal

@property (strong) PKCustomer *customer;

@property (strong) PKProgramTier *programTier;

@property (strong) NSNumber *visitCount;

@end
