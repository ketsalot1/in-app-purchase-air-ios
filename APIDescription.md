The API that will let AIR developer use In-App Purchases functionality on iOS. It is recommended to read the http://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/StoreKitGuide/Introduction/Introduction.html(StoreKit Programming Guide) before using this API. As there are things that are needed to be done in iTunes Connect portal in order to test and use this functionality.

# AS API #
```Actionscript

package com.adobe.nativeExtensions
{
```
The Singleton that provides all the functionality. See AppPurchaseEvent for the events thrown by this object. All the functionality of this API is exposed through **AppPurchase.manager**
```Actionscript

public class AppPurchase extends EventDispatcher
{
// Not to be called directly, As its a singleton all the functions are provided through manager property.
public function AppPurchase(){ }

// Singleton instance of AppPurchase. Use this call the functionality.
public static function get manager():AppPurchase{ }

//param:- An array of Strings containing Product Identifiers(Which are created in iTunes connect portal). Dispatches PRODUCTS_RECEIVED
// Event with an Array of Product object.
public function getProducts(ids:Array):void{ }

//Call this to initiate a payment of product.
// param:- Product Identifier of the product to be bought. Number representing quantity to be purchased.
public function startPayment(pid:String,quantity:int = 1):void{ }

// Call this to Finish the payment process. So that its removed from the payment queue. Make sure that purchased functionality is
// provided to user before calling this.
// param:Transaction Id representing the Transaction to be finished. See AppPurchaseEvent.UPDATED_TRANSACTIONS Event for more details
// on how to get the transaction id.
public function finishTransaction(tid:String):Boolean{ }

// Restores the past successful transactions. It Calls the AppPurchaseEvent.UPDATED_TRANSACTIONS again with new transactions.
// The originalTransaction property of the transaction object gives the Actual successful transaction.
public function restoreTransactions():void{ }

// Returns true if Store Purchases are disabled in Settings. It must be called before calling startPayment to be assured of permission.
public function get muted():Boolean{}

// List of unfinished transactions(Transactions on which finishTransaction is not called) are return by calling this property
public function get transactions():Array{}
}
```

The Main Event object received with all of the AppPurchase Events
```Actionscript

public class AppPurchaseEvent extends Event
{
// Event dispatched when call to getProducts is completed.
public static const PRODUCTS_RECEIVED:String = "productsReceived";

// This is the Event that is generally fired after startPayments, but not at all necessary, It can be dispatched any time. The first thing to do
// in your app is to add event listener on this event
public static const UPDATED_TRANSACTIONS:String = "updatedTransactions";

// Dispatched whenever a transaction is removed from the payment queue. Generally this happens after finishPayment.
public static const REMOVED_TRANSACTIONS:String = "removedTransactions";


// Dispatched when call to RestoreTransactions is failed.
public static const RESTORE_FAILED:String = "restoreFailed";


// Dispatched to notify that call to restore Transactions is completed successfully.
public static const RESTORE_COMPLETE:String = "restoreComplete";

// This contains an array of Product objects(See below). Only in case of PRODUCTS_RECEIVED event. Empty otherwise
public function get products():Array{}

// Contains array of product ids for which information could not be retrieved from iTunes Store. Only in case of PRODUCTS_RECEIVED event.
// Empty otherwise
public function get invalidIdentifiers():Array{ }

// An array of Transaction Objects (See below). Defined only when EVENT is UPDATED_TRANSACTIONS or REMOVED_TRANSACTIONS
public function get transactions():Array{ }

// Error in case of RESTORE_FAILED EVENT in Format "error:code". The codes are as per Apple StoreKit documentation
public function get error():String{ }
}
```
Class that represents a Sellable Product on iTunes Store
```Actionscript

public class Product
{
// Title of the product
public function get title():String{}

//Localized description of the products as available on the iTunes Store
public function get description():String{}

//Product identifier for this product.
public function get identifier():String{}

// Price locale. Can be used to determined what is the currency in which the price is populated
public function get priceLocale():String{}

// Number that represents price in above locale
public function get price():Number{}
}

```
Class that represents a particular payment transaction.
```Actionscript

public class Transaction
{
// These are the four possible states of a transaction. Match it with the state property of the object.
public static const TRANSACTION_STATE_PUCHASING:int = 0;
public static const TRANSACTION_STATE_PUCHASED:int = 1;
public static const TRANSACTION_STATE_FAILED:int = 2;
public static const TRANSACTION_STATE_RESTORED:int = 3;

// Defined only when the state is FAILED. in Format "description:code". Codes are as per iOS documentation for store Kit.
public function get error():String{ }

// Product Identifier representing the product that was bought in this transaction.
public function get productIdentifier():String{ }

// Quantity of the product that was/being bought
public function get productQuantity():int{ }

// Date when transaction initiated.
public function get date():Date{ }

// Unique identifier of the transaction. Use this id to finish the transaction.
public function get transactionIdentifier():String{ }

// A Base64 Encoded Apple Signed data. That can be used to verify the Authenticity of the receipt. See
// http://developer.apple.com/library/ios/#documentation/NetworkingInternet/Conceptual/StoreKitGuide/VerifyingStoreReceipts/VerifyingStoreReceipts.html%23//apple_ref/doc/uid/TP40008267-CH104-SW1


public function get receipt():String{ }


// Integer that represents state of this transaction.As per one of the const defined above.
public function get state():int{ }

// Defined only if the Stated is RESTORED. In that case this property contains the actual successful transaction
public function get originalTransaction():Transaction{}
}

}  // End of Package
```