package com.sbhave.appPurchase.glue.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;
import com.sbhave.appPurchase.glue.AppPurchaseExtensionContext;

public class RestoreCall implements FREFunction {

	@Override
	public FREObject call(FREContext ctx, FREObject[] args) {
		
		AppPurchaseExtensionContext appCtx = (AppPurchaseExtensionContext) ctx;
		FREObject retVal = null;
		boolean val = appCtx.getBillingService().restoreTransactions();
		
		try {
			retVal = FREObject.newObject(val);
		} catch (FREWrongThreadException e) {
			return null;
		}
		return retVal;
		
	}

}
