package com.belkin.upnp.parser;

import android.util.Log;
import android.util.Xml;
import com.belkin.beans.APListResponseBean;
import java.io.PrintStream;
import java.util.Arrays;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class GetAPListResponse
  extends DefaultHandler
{
  String ATTRIBUTE_APLIST = "ApList";
  String ATTRIBUTE_NETWORKLIST = "NetworkList";
  boolean processValue = false;
  private StringBuffer responseBuffer;
  
  public void characters(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws SAXException
  {
    super.characters(paramArrayOfChar, paramInt1, paramInt2);
    if ((this.processValue == true) && (paramArrayOfChar[0] != '\n'))
    {
      System.out.println("responseBuffer:" + new String(paramArrayOfChar, paramInt1, paramInt2));
      this.responseBuffer.append(new String(paramArrayOfChar, paramInt1, paramInt2));
    }
  }
  
  public void endElement(String paramString1, String paramString2, String paramString3)
    throws SAXException
  {
    super.endElement(paramString1, paramString2, paramString3);
  }
  
  public byte[] hexStringToByteArray(String paramString)
  {
    int i = paramString.length();
    byte[] arrayOfByte = new byte[i / 2];
    for (int j = 0; j < i; j += 2) {
      arrayOfByte[(j / 2)] = ((byte)((Character.digit(paramString.charAt(j), 16) << 4) + Character.digit(paramString.charAt(j + 1), 16)));
    }
    return arrayOfByte;
  }
  
  public APListResponseBean parseForAPList(Object paramObject, String paramString)
  {
    System.out.println("1 parcel is :" + paramObject);
    System.out.println("response: " + paramString);
    this.responseBuffer = new StringBuffer();
    APListResponseBean localAPListResponseBean;
    try
    {
      Xml.parse(paramString, this);
      localAPListResponseBean = (APListResponseBean)paramObject;
      System.out.println("2 responseBuffer is : " + this.responseBuffer);
      String str1 = new String(this.responseBuffer);
      System.out.println("111111111111" + str1);
      int i = str1.indexOf("$");
      String str2 = str1.substring(0, i);
      System.out.println("prefixDollar" + str2);
      String str3 = str1.substring(i + 1);
      System.out.println("postDollar" + str3);
      String[] arrayOfString1 = str2.trim().split(":");
      System.out.println("3333333333333" + Arrays.toString(arrayOfString1));
      String[] arrayOfString2 = arrayOfString1[1].toString().trim().split("/");
      System.out.println("444444444444" + Arrays.toString(arrayOfString2));
      localAPListResponseBean.pageOfAPList = Integer.parseInt(arrayOfString2[0].toString().trim());
      localAPListResponseBean.totalPagesOfAPList = Integer.parseInt(arrayOfString2[1].toString().trim());
      localAPListResponseBean.totalNumberofAPsFound = Integer.parseInt(arrayOfString2[2].toString().trim());
      String[] arrayOfString3 = str3.split(",");
      System.out.println("5555555555" + Arrays.toString(arrayOfString3));
      if (localAPListResponseBean.strSSIDList == null) {
        localAPListResponseBean.strSSIDList = new String[localAPListResponseBean.totalNumberofAPsFound];
      }
      if (localAPListResponseBean.strSecurityStrength == null) {
        localAPListResponseBean.strSecurityStrength = new String[localAPListResponseBean.totalNumberofAPsFound];
      }
      if (localAPListResponseBean.nChannel == null) {
        localAPListResponseBean.nChannel = new Integer[localAPListResponseBean.totalNumberofAPsFound];
      }
      if (localAPListResponseBean.nSignalStrength == null) {
        localAPListResponseBean.nSignalStrength = new Integer[localAPListResponseBean.totalNumberofAPsFound];
      }
      int j = -4 + 4 * localAPListResponseBean.pageOfAPList;
      k = 0;
      if (k < arrayOfString3.length)
      {
        String[] arrayOfString4 = arrayOfString3[k].toString().split("\\|");
        int i3;
        for (int m = 0; (m < arrayOfString4.length) && (arrayOfString4.length == 4); m = i3 + 1)
        {
          String[] arrayOfString5 = localAPListResponseBean.strSSIDList;
          int n = m + 1;
          arrayOfString5[j] = arrayOfString4[m].trim();
          Integer[] arrayOfInteger1 = localAPListResponseBean.nChannel;
          int i1 = n + 1;
          arrayOfInteger1[j] = Integer.valueOf(Integer.parseInt(arrayOfString4[n].toString().trim()));
          Integer[] arrayOfInteger2 = localAPListResponseBean.nSignalStrength;
          int i2 = i1 + 1;
          arrayOfInteger2[j] = Integer.valueOf(Integer.parseInt(arrayOfString4[i1].toString().trim()));
          String[] arrayOfString6 = localAPListResponseBean.strSecurityStrength;
          i3 = i2 + 1;
          arrayOfString6[j] = arrayOfString4[i2];
          j++;
        }
      }
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        int k;
        System.out.println("exception occured: " + localSAXException.getMessage());
        localSAXException.printStackTrace();
        continue;
        k++;
      }
    }
    return localAPListResponseBean;
  }
  
  public APListResponseBean parseForNetworkList(Object paramObject, String paramString)
  {
    System.out.println("1 parcel is :" + paramObject);
    System.out.println("response:" + paramString);
    this.responseBuffer = new StringBuffer();
    APListResponseBean localAPListResponseBean;
    try
    {
      Xml.parse(paramString, this);
      localAPListResponseBean = (APListResponseBean)paramObject;
      System.out.println("2 responseBuffer is : " + this.responseBuffer);
      String str1 = new String(this.responseBuffer);
      System.out.println("111111111111" + str1);
      int i = str1.indexOf("$");
      String str2 = str1.substring(0, i);
      System.out.println("prefixDollar" + str2);
      String str3 = str1.substring(i + 1);
      System.out.println("postDollar" + str3);
      String[] arrayOfString1 = str2.trim().split(":");
      System.out.println("3333333333333" + Arrays.toString(arrayOfString1));
      String[] arrayOfString2 = arrayOfString1[1].toString().trim().split("/");
      System.out.println("444444444444" + Arrays.toString(arrayOfString2));
      localAPListResponseBean.pageOfAPList = Integer.parseInt(arrayOfString2[0].toString().trim());
      localAPListResponseBean.totalPagesOfAPList = Integer.parseInt(arrayOfString2[1].toString().trim());
      localAPListResponseBean.totalNumberofAPsFound = Integer.parseInt(arrayOfString2[2].toString().trim());
      arrayOfString3 = str3.trim().split("\\|");
      System.out.println("5555555555" + Arrays.toString(arrayOfString3));
      j = -4 + 4 * localAPListResponseBean.pageOfAPList;
      System.out.println("responses length :" + arrayOfString3.length);
      System.out.println("k:" + j);
      if (localAPListResponseBean.ssidLength == null) {
        localAPListResponseBean.ssidLength = new Integer[localAPListResponseBean.totalNumberofAPsFound];
      }
      if (localAPListResponseBean.strSSIDList == null) {
        localAPListResponseBean.strSSIDList = new String[localAPListResponseBean.totalNumberofAPsFound];
      }
      if (localAPListResponseBean.strSecurityStrength == null) {
        localAPListResponseBean.strSecurityStrength = new String[localAPListResponseBean.totalNumberofAPsFound];
      }
      if (localAPListResponseBean.nChannel == null) {
        localAPListResponseBean.nChannel = new Integer[localAPListResponseBean.totalNumberofAPsFound];
      }
      if (localAPListResponseBean.nSignalStrength == null) {
        localAPListResponseBean.nSignalStrength = new Integer[localAPListResponseBean.totalNumberofAPsFound];
      }
      k = 0;
      if (k < -1 + arrayOfString3.length)
      {
        System.out.println("strAPDetails :" + k);
        Integer[] arrayOfInteger1 = localAPListResponseBean.ssidLength;
        int m = k + 1;
        arrayOfInteger1[j] = Integer.valueOf(arrayOfString3[k].toString().trim());
        int n = localAPListResponseBean.ssidLength[j].intValue();
        i1 = m + 1;
        localStringBuffer = new StringBuffer(arrayOfString3[m].trim());
        System.out.println("ssidName 1:" + localStringBuffer.toString());
        while (localStringBuffer.toString().length() != n)
        {
          localStringBuffer.append("|");
          int i5 = i1 + 1;
          localStringBuffer.append(arrayOfString3[i1].trim());
          i1 = i5;
        }
      }
    }
    catch (SAXException localSAXException)
    {
      for (;;)
      {
        String[] arrayOfString3;
        int j;
        int i1;
        StringBuffer localStringBuffer;
        System.out.println("exception occured: " + localSAXException.getMessage());
        localSAXException.printStackTrace();
        continue;
        if ((localStringBuffer.length() >= 2) && (localStringBuffer.substring(0, 2).equals("0x")))
        {
          String str4 = new String(hexStringToByteArray(localStringBuffer.substring(2)));
          Log.i("GetAPListResponse.parseForNetworkList", "the converted hexaStr is:: " + str4);
          localStringBuffer = new StringBuffer(str4);
        }
        System.out.println("ssidName 2:" + localStringBuffer.toString());
        localAPListResponseBean.strSSIDList[j] = localStringBuffer.toString();
        Integer[] arrayOfInteger2 = localAPListResponseBean.nChannel;
        int i2 = i1 + 1;
        arrayOfInteger2[j] = Integer.valueOf(Integer.parseInt(arrayOfString3[i1].toString().trim()));
        Integer[] arrayOfInteger3 = localAPListResponseBean.nSignalStrength;
        int i3 = i2 + 1;
        arrayOfInteger3[j] = Integer.valueOf(Integer.parseInt(arrayOfString3[i2].toString().trim()));
        String[] arrayOfString4 = localAPListResponseBean.strSecurityStrength;
        int i4 = i3 + 1;
        arrayOfString4[j] = arrayOfString3[i3];
        j++;
        int k = i4;
      }
      System.out.println("object array:" + localAPListResponseBean);
    }
    return localAPListResponseBean;
  }
  
  public void startElement(String paramString1, String paramString2, String paramString3, Attributes paramAttributes)
    throws SAXException
  {
    super.startElement(paramString1, paramString2, paramString3, paramAttributes);
    System.out.print("localName :" + paramString2);
    if ((paramString2.equals(this.ATTRIBUTE_NETWORKLIST)) || (paramString2.equals(this.ATTRIBUTE_APLIST))) {
      this.processValue = true;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/belkin/upnp/parser/GetAPListResponse.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */