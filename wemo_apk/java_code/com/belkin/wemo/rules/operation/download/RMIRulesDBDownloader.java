package com.belkin.wemo.rules.operation.download;

import com.belkin.wemo.exception.InvalidArgumentsException;
import com.belkin.wemo.rules.operation.download.callback.RMRulesDBDownloadErrorCallback;
import com.belkin.wemo.rules.operation.download.callback.RMRulesDBDownloadSuccessCallback;
import java.util.HashMap;

public abstract interface RMIRulesDBDownloader
{
  public static final String KEY_DOWNLOAD_URL = "download_url";
  public static final String KEY_FILENAME = "download_location";
  public static final String KEY_MAC_ADDRESS = "mac_address";
  
  public abstract void downloadRulesDB(HashMap<String, String> paramHashMap, RMRulesDBDownloadSuccessCallback paramRMRulesDBDownloadSuccessCallback, RMRulesDBDownloadErrorCallback paramRMRulesDBDownloadErrorCallback)
    throws InvalidArgumentsException;
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/rules/operation/download/RMIRulesDBDownloader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */