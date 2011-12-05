package com.sbhave.appPurchase.glue.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.sbhave.appPurchase.BillingService;
import com.sbhave.appPurchase.glue.AppPurchaseExtensionContext;

public class InitFunction implements FREFunction {

	@Override
	public FREObject call(FREContext ctx, FREObject[] args) {
		AppPurchaseExtensionContext appCtx = (AppPurchaseExtensionContext) ctx;
		
		BillingService billSvc = new BillingService(ctx.getActivity());
		billSvc.setContext(appCtx.getActivity().getApplicationContext());
		//BillingReceiver recvr = new BillingReceiver();
		
		appCtx.setBillingService(billSvc);
		
		return null;
	}

}
