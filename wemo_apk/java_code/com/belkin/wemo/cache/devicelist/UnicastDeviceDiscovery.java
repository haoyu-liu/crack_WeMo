package com.belkin.wemo.cache.devicelist;

import android.util.Log;
import com.belkin.wemo.WeMo;
import com.belkin.wemo.cache.cloud.CloudRequestManager;
import com.belkin.wemo.cache.cloud.HTTPRequestUnicastDiscovery;
import com.belkin.wemo.cache.cloud.listener.OnRequestCompleteListener;
import com.belkin.wemo.cache.data.DeviceInformation;
import com.belkin.wemo.cache.devicelist.listener.UnicastListener;
import com.belkin.wemo.cache.utils.SDKLogUtils;
import com.belkin.wemo.cache.utils.SharePreferences;
import java.io.IOException;
import java.io.StringReader;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class UnicastDeviceDiscovery
  implements OnRequestCompleteListener
{
  private static final String KEY_DEVICE_TAG = "device";
  private static final String KEY_UDN = "UDN";
  private final int MAX_TRY_COUNTS = 3;
  private final String TAG = UnicastDeviceDiscovery.class.getSimpleName();
  private DeviceInformation devInfo;
  private DeviceListManager deviceListManager;
  private String deviceString;
  private Set<OnUnicastFailedListener> onUnicastFailedListenerSet;
  private int triesCompleted;
  
  public UnicastDeviceDiscovery(DeviceInformation paramDeviceInformation, DeviceListManager paramDeviceListManager)
  {
    this.deviceListManager = paramDeviceListManager;
    this.devInfo = paramDeviceInformation;
    this.onUnicastFailedListenerSet = new HashSet();
  }
  
  private void issueUnicastRequest()
  {
    SDKLogUtils.debugLog(this.TAG, "Unicast Discovery: Issuing unicast request for UDN: " + this.devInfo.getUDN() + "; Num of tries completed: " + this.triesCompleted);
    HTTPRequestUnicastDiscovery localHTTPRequestUnicastDiscovery = new HTTPRequestUnicastDiscovery(this.devInfo.getIP(), this.devInfo.getPort(), this);
    new CloudRequestManager(WeMo.INSTANCE.getContext()).makeRequest(localHTTPRequestUnicastDiscovery);
  }
  
  private void onDiscoveryFailed(String paramString)
  {
    if (this.triesCompleted >= 3)
    {
      this.deviceListManager.deviceNotDiscovered(this.devInfo.getUDN(), this.devInfo.getIP(), this.devInfo.getPort());
      Iterator localIterator = this.onUnicastFailedListenerSet.iterator();
      while (localIterator.hasNext()) {
        ((OnUnicastFailedListener)localIterator.next()).OnUnicastFailed();
      }
      new SharePreferences(WeMo.INSTANCE.getContext()).setFullSuccessfulDiscoveryCounter(0);
      return;
    }
    issueUnicastRequest();
    this.deviceListManager.onDiscoveryRetry(this.devInfo.getUDN());
  }
  
  private boolean parseResponse(String paramString)
  {
    try
    {
      XMLParser localXMLParser = new XMLParser(null);
      NodeList localNodeList = localXMLParser.getDomElement(paramString).getElementsByTagName("device");
      for (int i = 0; i < localNodeList.getLength(); i++)
      {
        boolean bool = localXMLParser.getValue((Element)localNodeList.item(i), "UDN").equalsIgnoreCase(this.devInfo.getUDN());
        if (bool) {
          return true;
        }
      }
      return false;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public boolean addOnUnicastFailedListener(OnUnicastFailedListener paramOnUnicastFailedListener)
  {
    return this.onUnicastFailedListenerSet.add(paramOnUnicastFailedListener);
  }
  
  public void deviceDiscoverCallback(byte[] paramArrayOfByte)
  {
    try
    {
      this.deviceString = new String(paramArrayOfByte, "UTF-8");
      SDKLogUtils.infoLog(this.TAG, "Unicast Discovery callback response: " + this.deviceString);
      if (parseResponse(this.deviceString))
      {
        SDKLogUtils.infoLog(this.TAG, "Device discovered over unicast: " + this.devInfo.getUDN());
        this.deviceListManager.deviceDiscovered(this.devInfo, this.deviceString);
        return;
      }
      onDiscoveryFailed("Can't parse response");
      return;
    }
    catch (Exception localException)
    {
      SDKLogUtils.errorLog(this.TAG, "Exception while parsing unicast discovery response: ", localException);
      onDiscoveryFailed(localException.getMessage());
    }
  }
  
  public void onRequestComplete(boolean paramBoolean, int paramInt, byte[] paramArrayOfByte)
  {
    this.triesCompleted = (1 + this.triesCompleted);
    if (paramBoolean)
    {
      SDKLogUtils.debugLog(this.TAG, "Unicast Discovery: Request SUCCESS of UDN: " + this.devInfo.getUDN() + "; Number of tries completed: " + this.triesCompleted + "; status code: " + paramInt + "; response: " + paramArrayOfByte);
      deviceDiscoverCallback(paramArrayOfByte);
      return;
    }
    SDKLogUtils.errorLog(this.TAG, "Unicast Discovery: Request FALIED of UDN: " + this.devInfo.getUDN() + "; Number of tries completed: " + this.triesCompleted + "; status code: " + paramInt + "; response: " + paramArrayOfByte);
    onDiscoveryFailed("Unicast Discovery Failed. status code: " + paramInt);
  }
  
  public boolean removeOnUnicastFailedListener(OnUnicastFailedListener paramOnUnicastFailedListener)
  {
    return this.onUnicastFailedListenerSet.remove(paramOnUnicastFailedListener);
  }
  
  public void runUnicastDiscovery(UnicastListener paramUnicastListener)
  {
    if ((this.devInfo.getIP() != null) && (!this.devInfo.getIP().isEmpty())) {
      issueUnicastRequest();
    }
    while ("NestThermostat".equalsIgnoreCase(this.devInfo.getProductType())) {
      return;
    }
    onDiscoveryFailed("Invalid IP");
  }
  
  public static abstract interface OnUnicastFailedListener
  {
    public abstract void OnUnicastFailed();
  }
  
  private class XMLParser
  {
    private XMLParser() {}
    
    private final String getElementValue(Node paramNode)
    {
      if ((paramNode != null) && (paramNode.hasChildNodes())) {
        for (Node localNode = paramNode.getFirstChild(); localNode != null; localNode = localNode.getNextSibling()) {
          if (localNode.getNodeType() == 3) {
            return localNode.getNodeValue();
          }
        }
      }
      return "";
    }
    
    public Document getDomElement(String paramString)
    {
      DocumentBuilderFactory localDocumentBuilderFactory = DocumentBuilderFactory.newInstance();
      try
      {
        DocumentBuilder localDocumentBuilder = localDocumentBuilderFactory.newDocumentBuilder();
        InputSource localInputSource = new InputSource();
        localInputSource.setCharacterStream(new StringReader(paramString));
        Document localDocument = localDocumentBuilder.parse(localInputSource);
        return localDocument;
      }
      catch (ParserConfigurationException localParserConfigurationException)
      {
        Log.e("Error: ", localParserConfigurationException.getMessage());
        return null;
      }
      catch (SAXException localSAXException)
      {
        Log.e("Error: ", localSAXException.getMessage());
        return null;
      }
      catch (IOException localIOException)
      {
        Log.e("Error: ", localIOException.getMessage());
      }
      return null;
    }
    
    public String getValue(Element paramElement, String paramString)
    {
      return getElementValue(paramElement.getElementsByTagName(paramString).item(0));
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/devicelist/UnicastDeviceDiscovery.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */