package com.sbhave.appPurchase.glue.functions;

import android.R.string;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREInvalidObjectException;
import com.adobe.fre.FREObject;
import com.adobe.fre.FRETypeMismatchException;
import com.adobe.fre.FREWrongThreadException;
import com.sbhave.appPurchase.glue.AppPurchaseExtensionContext;

public class FinishCall implements FREFunction {

	@Override
	public FREObject call(FREContext ctx, FREObject[] args) {
		AppPurchaseExtensionContext appCtx = (AppPurchaseExtensionContext)ctx;
		
		try {
		
			String notify_ids = args[0].getAsString();
			String[] ids = notify_ids.split(",");
			
			for(int i = 0; i < ids.length ; i++){
				ids[i] = ids[i].trim();
			}
			
			appCtx.getBillingService().confirmNotifications(-1, ids);
		
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
