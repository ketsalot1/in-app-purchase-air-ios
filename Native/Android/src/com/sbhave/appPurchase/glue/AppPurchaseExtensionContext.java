package com.sbhave.appPurchase.glue;

import java.util.HashMap;
import java.util.Map;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.sbhave.appPurchase.BillingService;
import com.sbhave.appPurchase.glue.functions.FinishCall;
import com.sbhave.appPurchase.glue.functions.GetProductsCall;
import com.sbhave.appPurchase.glue.functions.GetTransCall;
import com.sbhave.appPurchase.glue.functions.InitFunction;
import com.sbhave.appPurchase.glue.functions.MutedCall;
import com.sbhave.appPurchase.glue.functions.RestoreCall;
import com.sbhave.appPurchase.glue.functions.StartPaymentCall;


public class AppPurchaseExtensionContext extends FREContext {

	private BillingService mBillingService;
	
	@Override
	public void dispose() {
		Log.i("GyroscopeExtensionContext", "dispose()");
	}

	@Override
	public Map<String, FREFunction> getFunctions() {

		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();

		functionMap.put("getProducts", new GetProductsCall() );
		functionMap.put("startPayment", new StartPaymentCall() );
		functionMap.put("finish", new FinishCall() );
		functionMap.put("muted", new MutedCall() );
		functionMap.put("restore", new RestoreCall() );
		functionMap.put("trans", new GetTransCall() );
		functionMap.put("init", new InitFunction() );

		return functionMap;
	}

	public void setBillingService(BillingService mBillingService) {
		this.mBillingService = mBillingService;
	}

	public BillingService getBillingService() {
		return mBillingService;
	}
}
