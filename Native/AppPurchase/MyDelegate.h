//
//  MyDelegate.h
//  AppPurchase
//
//  Created by Saumitra R. Bhave on 30 Sep 2011.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

extern FREContext g_ctx;
NSMutableString* generateXml(SKPaymentTransaction*);


@interface MyDelegate : NSObject <SKPaymentTransactionObserver,SKProductsRequestDelegate> {

}
//// SKPaymentTransactionObserver
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions;
- (void)paymentQueue:(SKPaymentQueue *)queue removedTransactions:(NSArray *)transactions;
- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error;
- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue;

//// SKProductsRequestDelegate
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response;
@end
