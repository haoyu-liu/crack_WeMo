package com.belkin.wemo.cache.cloud;

import android.content.Context;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.rules.util.RuleUtility;
import com.belkin.wemo.rules.util.UploadFileUtil;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import org.apache.http.util.ByteArrayBuffer;

public class CloudRequestUploadDB
  implements CloudRequestInterface
{
  private final String TAG = "SDK_CloudRequestUploadDB";
  private int TIMEOUT = 30000;
  private final int TIMEOUT_LIMIT = 45000;
  private final String URL = CloudConstants.CLOUD_URL + "/apis/http/plugin/sendfile/";
  private String cloudURL = this.URL + paramString;
  Context mContext;
  
  public CloudRequestUploadDB(Context paramContext, String paramString)
  {
    this.mContext = paramContext;
  }
  
  private byte[] getRulesDB()
  {
    String[] arrayOfString = new String[1];
    RuleUtility localRuleUtility = new RuleUtility(this.mContext);
    localRuleUtility.copyDataBase(localRuleUtility.getLocalDBPath() + "pluginrules2.db", localRuleUtility.getTempDBPath() + "temppluginRules.db", "false");
    arrayOfString[0] = (localRuleUtility.getTempDBPath() + "temppluginRules.db");
    SDKLogUtils.infoLog("SDK_CloudRequestUploadDB", "DB Path : " + localRuleUtility.getTempDBPath());
    localRuleUtility.zip(arrayOfString, localRuleUtility.getTempDBPath() + "rules.db");
    return UploadFileUtil.readFile(localRuleUtility.getTempDBPath() + "rules.db");
  }
  
  public Map<String, String> getAdditionalHeaders()
  {
    return null;
  }
  
  public String getBody()
  {
    return "";
  }
  
  public byte[] getFileByteArray()
  {
    byte[] arrayOfByte = getRulesDB();
    ByteArrayBuffer localByteArrayBuffer = new ByteArrayBuffer(arrayOfByte.length);
    localByteArrayBuffer.append("--MULTIPART-FORM-DATA-BOUNDARY\r\n".getBytes(), 0, "--MULTIPART-FORM-DATA-BOUNDARY\r\n".getBytes().length);
    localByteArrayBuffer.append("Content-Disposition:form-data;name=filedata;filename=rules.db\r\n".getBytes(), 0, "Content-Disposition:form-data;name=filedata;filename=rules.db\r\n".getBytes().length);
    localByteArrayBuffer.append("Content-Type:application/octet-stream\r\n\r\n".getBytes(), 0, "Content-Type:application/octet-stream\r\n\r\n".getBytes().length);
    localByteArrayBuffer.append(arrayOfByte, 0, arrayOfByte.length);
    localByteArrayBuffer.append("\r\n--MULTIPART-FORM-DATA-BOUNDARY--\r\n".getBytes(), 0, "\r\n--MULTIPART-FORM-DATA-BOUNDARY--\r\n".getBytes().length);
    return (byte[])localByteArrayBuffer.toByteArray();
  }
  
  public int getRequestMethod()
  {
    return 1;
  }
  
  public int getTimeout()
  {
    return this.TIMEOUT;
  }
  
  public int getTimeoutLimit()
  {
    return 45000;
  }
  
  public String getURL()
  {
    return this.cloudURL;
  }
  
  public String getUploadFileName()
  {
    return "rules.db";
  }
  
  public boolean isAuthHeaderRequired()
  {
    return true;
  }
  
  public void requestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    SDKLogUtils.infoLog("SDK_CloudRequestUploadDB", "cloud request====" + paramBoolean + "response ===" + paramArrayOfByte.toString());
    if (paramBoolean) {}
    try
    {
      String str = new String(paramArrayOfByte, "UTF-8");
      SDKLogUtils.infoLog("SDK_CloudRequestUploadDB", "response:::" + str);
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      localUnsupportedEncodingException.printStackTrace();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/cloud/CloudRequestUploadDB.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */