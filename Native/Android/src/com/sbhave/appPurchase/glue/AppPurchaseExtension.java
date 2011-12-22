package com.sbhave.appPurchase.glue;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class AppPurchaseExtension implements FREExtension {

	private static final String TAG = "AppPurchaseExtension";
	
	@Override
	public FREContext createContext(String ctxType) {

		Log.i(TAG, "createContext()");

		AppPurchaseExtensionContext extCtx = new AppPurchaseExtensionContext();
		return extCtx;
	}

	@Override
	public void dispose() {

		Log.i(TAG, "dispose()");
	}

	@Override
	public void initialize() {
		Log.i(TAG,"initialize()");
	}

}
