package com.sbhave.appPurchase.glue.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;
import com.sbhave.appPurchase.glue.AppPurchaseExtensionContext;

public class StartPaymentCall implements FREFunction {

	@Override
	public FREObject call(FREContext ctx, FREObject[] args) {
		
		try {
			String sku = args[0].getAsString();
			
			AppPurchaseExtensionContext appCtx = (AppPurchaseExtensionContext) ctx;
			
			appCtx.getBillingService().requestPurchase(sku,null);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FRETypeMismatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FREInvalidObjectException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FREWrongThreadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
