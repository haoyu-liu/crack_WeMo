package com.belkin.wemo.cache.data;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import java.io.FileOutputStream;
import java.io.IOException;

public class ZigBeeDeviceInformation
{
  private String bridgeUDN;
  private String capabilities;
  private String checkingStatus;
  private String discoveryState;
  private long endDiscoveryTime = 0L;
  private String firmwareVersion;
  private String foundTime = "";
  private String groupCapability;
  private int groupId;
  private String groupName;
  private String icon;
  private String iconUploadId = "";
  private int inactive;
  private boolean isDiscovered = false;
  private String manufacturerName = "";
  private String modelCode;
  private String name;
  private long startDiscoveryTime = 0L;
  private int state;
  private String timestamp = "";
  private String uniqueID;
  private String wemoCertified = "";
  private String whichDiscovered = "";
  private String whichFound = "";
  
  public String getBridgeUDN()
  {
    return this.bridgeUDN;
  }
  
  public String getCapabilities()
  {
    return this.capabilities;
  }
  
  public String getCheckingStatus()
  {
    return this.checkingStatus;
  }
  
  public String getDiscoveryState()
  {
    return this.discoveryState;
  }
  
  public long getEndDiscoveryTime()
  {
    return this.endDiscoveryTime;
  }
  
  public String getFirmwareVersion()
  {
    return this.firmwareVersion;
  }
  
  public String getFoundTime()
  {
    return this.foundTime;
  }
  
  public String getGroupCapability()
  {
    return this.groupCapability;
  }
  
  public int getGroupId()
  {
    return this.groupId;
  }
  
  public String getGroupName()
  {
    return this.groupName;
  }
  
  public String getIcon()
  {
    return this.icon;
  }
  
  public String getIconUploadID()
  {
    return this.iconUploadId;
  }
  
  public int getInactive()
  {
    return this.inactive;
  }
  
  public boolean getIsDiscovered()
  {
    return this.isDiscovered;
  }
  
  public String getManufacturerName()
  {
    return this.manufacturerName;
  }
  
  public String getModelCode()
  {
    return this.modelCode;
  }
  
  public String getName()
  {
    return this.name;
  }
  
  public long getStartDiscoveryTime()
  {
    return this.startDiscoveryTime;
  }
  
  public int getState()
  {
    return this.state;
  }
  
  public String getTimestamp()
  {
    return this.timestamp;
  }
  
  public String getUniqueID()
  {
    return this.uniqueID;
  }
  
  public String getWemoCertified()
  {
    return this.wemoCertified;
  }
  
  public String getWhichDiscovered()
  {
    return this.whichDiscovered;
  }
  
  public String getWhichFound()
  {
    return this.whichFound;
  }
  
  public String saveIconToFile(Bitmap paramBitmap, Context paramContext)
  {
    String str1 = String.valueOf(getUniqueID().hashCode());
    String str2 = str1 + ".png";
    localFileOutputStream = null;
    try
    {
      localFileOutputStream = paramContext.openFileOutput(str2, 0);
      paramBitmap.compress(Bitmap.CompressFormat.PNG, 90, localFileOutputStream);
      if (localFileOutputStream != null) {}
      try
      {
        localFileOutputStream.close();
        return str2;
      }
      catch (IOException localIOException3)
      {
        localIOException3.printStackTrace();
        return str2;
      }
      try
      {
        localFileOutputStream.close();
        throw ((Throwable)localObject);
      }
      catch (IOException localIOException1)
      {
        for (;;)
        {
          localIOException1.printStackTrace();
        }
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      if (localFileOutputStream != null) {}
      try
      {
        localFileOutputStream.close();
        return "";
      }
      catch (IOException localIOException2)
      {
        for (;;)
        {
          localIOException2.printStackTrace();
        }
      }
    }
    finally
    {
      if (localFileOutputStream == null) {}
    }
  }
  
  public void setBridgeUDN(String paramString)
  {
    this.bridgeUDN = paramString;
  }
  
  public void setCapabilities(String paramString)
  {
    this.capabilities = paramString;
  }
  
  public void setCheckingStatus(String paramString)
  {
    this.checkingStatus = paramString;
  }
  
  public void setDiscoveryState(String paramString)
  {
    this.discoveryState = paramString;
  }
  
  public void setEndDiscoveryTime(long paramLong)
  {
    this.endDiscoveryTime = paramLong;
  }
  
  public void setFirmwareVersion(String paramString)
  {
    this.firmwareVersion = paramString;
  }
  
  public void setFoundTime(String paramString)
  {
    this.foundTime = paramString;
  }
  
  public void setGroupCapability(String paramString)
  {
    this.groupCapability = paramString;
  }
  
  public void setGroupId(int paramInt)
  {
    this.groupId = paramInt;
  }
  
  public void setGroupName(String paramString)
  {
    this.groupName = paramString;
  }
  
  public void setIcon(String paramString)
  {
    this.icon = paramString;
  }
  
  public void setIconUploadId(String paramString)
  {
    this.iconUploadId = paramString;
  }
  
  public void setInActive(int paramInt)
  {
    this.inactive = paramInt;
  }
  
  public void setIsDiscovered(boolean paramBoolean)
  {
    this.isDiscovered = paramBoolean;
  }
  
  public void setManufacturerName(String paramString)
  {
    this.manufacturerName = paramString;
  }
  
  public void setModelCode(String paramString)
  {
    this.modelCode = paramString;
  }
  
  public void setName(String paramString)
  {
    this.name = paramString;
  }
  
  public void setStartDiscoveryTime(long paramLong)
  {
    this.startDiscoveryTime = paramLong;
  }
  
  public void setState(int paramInt)
  {
    this.state = paramInt;
  }
  
  public void setTimestamp(String paramString)
  {
    this.timestamp = paramString;
  }
  
  public void setUniqueID(String paramString)
  {
    this.uniqueID = paramString;
  }
  
  public void setWemoCertified(String paramString)
  {
    this.wemoCertified = paramString;
  }
  
  public void setWhichDiscovered(String paramString)
  {
    this.whichDiscovered = paramString;
  }
  
  public void setWhichFound(String paramString)
  {
    this.whichFound = paramString;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/wemo/cache/data/ZigBeeDeviceInformation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */