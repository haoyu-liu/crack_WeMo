package com.belkin.wemo.utils;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.TypedValue;
import com.belkin.utils.LogUtils;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.DeviceListManager;
import com.belkin.wemo.cache.utils.Constants;
import com.belkin.wemo.localsdk.WeMoSDKContext;
import java.io.BufferedInputStream;
import java.io.InputStream;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.apache.http.util.ByteArrayBuffer;
import org.cybergarage.upnp.Action;
import org.cybergarage.upnp.ControlPoint;
import org.cybergarage.upnp.Device;
import org.cybergarage.upnp.DeviceList;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class WeMoUtils
{
  public static final String DELIMITER_COLON = ":";
  public static final String DEVICE_TYPE_AIR_PURIFIER = "airpurifier";
  public static final String DEVICE_TYPE_COFFEE_MAKER = "coffeemaker";
  public static final String DEVICE_TYPE_CROCKPOT = "crockpot";
  public static final String DEVICE_TYPE_HEATER = "heater";
  public static final String DEVICE_TYPE_HUMIDIFIER = "humidifier";
  public static final String TAG = "WeMoUtils";
  
  public static boolean areFetchStoreAPIsSupportedInLocal(String paramString, Context paramContext)
  {
    boolean bool = false;
    if (paramContext != null)
    {
      ControlPoint localControlPoint = (ControlPoint)WeMoSDKContext.getInstance(paramContext).getUpnpControl();
      bool = false;
      if (localControlPoint != null) {
        bool = areFetchStoreAPIsSupportedInLocal(localControlPoint.getDevice(paramString));
      }
    }
    return bool;
  }
  
  public static boolean areFetchStoreAPIsSupportedInLocal(Device paramDevice)
  {
    if (paramDevice != null)
    {
      String str1 = paramDevice.getDeviceType();
      String str2 = paramDevice.getUDN();
      LogUtils.infoLog("WeMoUtils", "Fetch and Store Support Verification: Device type: " + str1 + ", UDN: " + str2);
      if (isSmartDevice(str1)) {
        LogUtils.infoLog("WeMoUtils", "Fetch and Store Support Verification: WeMo device with device type: " + str1 + " is a SMART DEVICE.");
      }
    }
    else
    {
      return false;
    }
    Action localAction1 = paramDevice.getAction("FetchRules");
    Action localAction2 = paramDevice.getAction("StoreRules");
    if ((localAction1 != null) && (localAction2 != null))
    {
      LogUtils.infoLog("WeMoUtils", "Fetch and Store Support Verification: WeMo device SUPPORTS fecthRules() and storeRules() API.");
      return true;
    }
    LogUtils.infoLog("WeMoUtils", "Fetch and Store Support Verification: WeMo device DOES NOT SUPPORT fecthRules() and storeRules() API.");
    return false;
  }
  
  public static int convertDpToPixels(int paramInt, Context paramContext)
  {
    DisplayMetrics localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
    return Math.round(paramInt * (localDisplayMetrics.xdpi / 160.0F));
  }
  
  public static int convertSpToPixels(int paramInt, Context paramContext)
  {
    DisplayMetrics localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
    return (int)TypedValue.applyDimension(2, paramInt, localDisplayMetrics);
  }
  
  public static String createWeeklyCalendarListString(String[] paramArrayOfString)
  {
    str = null;
    try
    {
      Document localDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
      Element localElement1 = localDocument.createElement("CalendarList");
      localDocument.appendChild(localElement1);
      Element localElement2 = localDocument.createElement("Calendar");
      localElement1.appendChild(localElement2);
      if (Pattern.compile("([0-9]*)").matcher(paramArrayOfString[0]).matches())
      {
        Element localElement11 = localDocument.createElement("GroupID");
        localElement11.appendChild(localDocument.createTextNode(paramArrayOfString[0]));
        localElement2.appendChild(localElement11);
      }
      for (;;)
      {
        Element localElement4 = localDocument.createElement("Mon");
        localElement4.appendChild(localDocument.createTextNode(paramArrayOfString[1]));
        localElement2.appendChild(localElement4);
        Element localElement5 = localDocument.createElement("Tues");
        localElement5.appendChild(localDocument.createTextNode(paramArrayOfString[2]));
        localElement2.appendChild(localElement5);
        Element localElement6 = localDocument.createElement("Wed");
        localElement6.appendChild(localDocument.createTextNode(paramArrayOfString[3]));
        localElement2.appendChild(localElement6);
        Element localElement7 = localDocument.createElement("Thurs");
        localElement7.appendChild(localDocument.createTextNode(paramArrayOfString[4]));
        localElement2.appendChild(localElement7);
        Element localElement8 = localDocument.createElement("Fri");
        localElement8.appendChild(localDocument.createTextNode(paramArrayOfString[5]));
        localElement2.appendChild(localElement8);
        Element localElement9 = localDocument.createElement("Sat");
        localElement9.appendChild(localDocument.createTextNode(paramArrayOfString[6]));
        localElement2.appendChild(localElement9);
        Element localElement10 = localDocument.createElement("Sun");
        localElement10.appendChild(localDocument.createTextNode(paramArrayOfString[7]));
        localElement2.appendChild(localElement10);
        Transformer localTransformer = TransformerFactory.newInstance().newTransformer();
        StringWriter localStringWriter = new StringWriter();
        StreamResult localStreamResult = new StreamResult(localStringWriter);
        DOMSource localDOMSource = new DOMSource(localDocument);
        localTransformer.transform(localDOMSource, localStreamResult);
        str = localStringWriter.toString();
        Log.d("WeMoUtils", "File saved calendar!" + str);
        return str;
        Element localElement3 = localDocument.createElement("DeviceID");
        localElement3.appendChild(localDocument.createTextNode(paramArrayOfString[0]));
        localElement2.appendChild(localElement3);
      }
      return str;
    }
    catch (ParserConfigurationException localParserConfigurationException)
    {
      localParserConfigurationException.printStackTrace();
      return str;
    }
    catch (TransformerException localTransformerException)
    {
      localTransformerException.printStackTrace();
    }
  }
  
  public static String createXMLString(String paramString1, String paramString2)
  {
    return "<" + paramString1 + ">" + paramString2 + "</" + paramString1 + ">";
  }
  
  public static byte[] getByteArray(InputStream paramInputStream)
  {
    ByteArrayBuffer localByteArrayBuffer;
    try
    {
      BufferedInputStream localBufferedInputStream = new BufferedInputStream(paramInputStream);
      localByteArrayBuffer = new ByteArrayBuffer(50);
      for (;;)
      {
        int i = localBufferedInputStream.read();
        if (i == -1) {
          break;
        }
        localByteArrayBuffer.append((byte)i);
      }
      localBufferedInputStream.close();
    }
    catch (Exception localException)
    {
      LogUtils.errorLog("WeMoUtils", "Exception while reading from InputStream: ", localException);
      return null;
    }
    paramInputStream.close();
    byte[] arrayOfByte = localByteArrayBuffer.toByteArray();
    return arrayOfByte;
  }
  
  public static String getMakerUDNComparisonString(String paramString)
  {
    boolean bool = TextUtils.isEmpty(paramString);
    String str = null;
    if (!bool)
    {
      String[] arrayOfString = paramString.split(":");
      int i = arrayOfString.length;
      str = null;
      if (i >= 2) {
        str = arrayOfString[0] + ":" + arrayOfString[1];
      }
    }
    LogUtils.infoLog("WeMoUtils", "UDN for comparison: " + str);
    return str;
  }
  
  public static List<DeviceInformation> getWiFiDeviceList(Context paramContext)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = DeviceListManager.getInstance(paramContext).getActiveDeviceInfoList().iterator();
    while (localIterator.hasNext())
    {
      DeviceInformation localDeviceInformation = (DeviceInformation)localIterator.next();
      if (!localDeviceInformation.getType().isEmpty()) {
        localArrayList.add(localDeviceInformation);
      }
    }
    return localArrayList;
  }
  
  public static boolean isLEDModelCodeSupported(String paramString)
  {
    String[] arrayOfString = Constants.SUPPORTED_LED_MODELCODE_ARRAY;
    int i = arrayOfString.length;
    for (int j = 0;; j++)
    {
      boolean bool = false;
      if (j < i)
      {
        if (paramString.equalsIgnoreCase(arrayOfString[j])) {
          bool = true;
        }
      }
      else {
        return bool;
      }
    }
  }
  
  public static boolean isSmartDevice(String paramString)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      String str = paramString.toLowerCase(Locale.getDefault());
      if ((str.contains("heater")) || (str.contains("airpurifier")) || (str.contains("humidifier")) || (str.contains("coffeemaker")) || (str.contains("crockpot"))) {
        return true;
      }
    }
    return false;
  }
  
  public static boolean setActionArguments(Action paramAction, String[] paramArrayOfString1, String[] paramArrayOfString2)
  {
    if ((paramArrayOfString2 != null) && (paramArrayOfString1 != null))
    {
      for (int i = 0; i < paramArrayOfString1.length; i++)
      {
        LogUtils.infoLog("WeMoUtils", "SetActioArguments - Key: " + paramArrayOfString1[i] + ", Value: " + paramArrayOfString2[i]);
        paramAction.setArgumentValue(paramArrayOfString1[i], paramArrayOfString2[i]);
      }
      return true;
    }
    return false;
  }
  
  public static final void syncAppDBVersion(DeviceList paramDeviceList, Context paramContext) {}
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/utils/WeMoUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */