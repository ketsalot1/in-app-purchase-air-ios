/*
 *  macMain.cpp
 *  iosextension
 *
 *  Created by Saumitra R. Bhave on 05 Dec 2011.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h> 
#include <Adobe AIR/Adobe AIR.h>


// Symbols tagged with EXPORT are externally visible.
// Must use the -fvisibility=hidden gcc option.
#define EXPORT __attribute__((visibility("default"))) 

extern "C"
{
	
	FREObject getProducts(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
		NSLog(@"getProducts Called.."); 
		return nil;
	}
	
	FREObject startAppPayment(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
		NSLog(@"Start Payment Called");
		return nil;
	}
	
	FREObject finishTransaction(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
		NSLog(@"Finish Transaction Called");
		return nil;
	}
	
	FREObject muted(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
		NSLog(@"Muted Called");
		FREObject retVal;
		if(FRENewObjectFromBool(true, &retVal) == FRE_OK){
			return retVal;
		}else {
			return nil;
		}
	}
	
	FREObject restoreTrans(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
		NSLog(@"Restore Called");
		return NULL;
	}
	
	FREObject getTrans(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
		NSLog(@"Get Transactions Called");
		return NULL; 
	}
	
	void SBHINAPPContextInitializer(void* extData, const uint8_t* ctxType, FREContext ctx, 
									uint32_t* numFunctionsToTest, const FRENamedFunction** functionsToSet) {
		NSLog(@"Context Created");
		*numFunctionsToTest = 6;
		FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction)*6);
		func[0].name = (const uint8_t*)"getProducts";
		func[0].functionData = NULL;
		func[0].function = &getProducts; 
		
		func[1].name = (const uint8_t*)"startPayment";
		func[1].functionData = NULL;
		func[1].function = &startAppPayment; 
		
		func[2].name = (const uint8_t*)"finish"; 
		func[2].functionData = NULL;
		func[2].function = &finishTransaction;
		
		func[3].name = (const uint8_t*)"muted"; 
		func[3].functionData = NULL;
		func[3].function = &muted;
		
		func[4].name = (const uint8_t*)"restore"; 
		func[4].functionData = NULL;
		func[4].function = &restoreTrans;
		
		func[5].name = (const uint8_t*)"trans"; 
		func[5].functionData = NULL;
		func[5].function = &getTrans;
		
		*functionsToSet = func;
		
		//// Set the globals.
	}
	
	void SBHINAPPContextFinalizer(FREContext ctx) { 
		NSLog(@"Context Distroyed");
	}
	
	EXPORT
	void SBHINAPPExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, 
								FREContextFinalizer* ctxFinalizerToSet) {
		NSLog(@"Extension Initialized");
		*extDataToSet = NULL;
		*ctxInitializerToSet = &SBHINAPPContextInitializer;
		*ctxFinalizerToSet = &SBHINAPPContextFinalizer;
	}
	
	EXPORT
	void SBHINAPPExtFinalizer(void* extData) {
		NSLog(@"Extension Destroyed");
	}
}
