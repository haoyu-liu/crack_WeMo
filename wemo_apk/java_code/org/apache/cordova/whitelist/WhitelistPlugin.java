package org.apache.cordova.whitelist;

import android.content.Context;
import android.util.Log;
import org.apache.cordova.ConfigXmlParser;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.Whitelist;
import org.xmlpull.v1.XmlPullParser;

public class WhitelistPlugin
  extends CordovaPlugin
{
  private static final String LOG_TAG = "WhitelistPlugin";
  private Whitelist allowedIntents;
  private Whitelist allowedNavigations;
  private Whitelist allowedRequests;
  
  public WhitelistPlugin() {}
  
  public WhitelistPlugin(Context paramContext)
  {
    this(new Whitelist(), new Whitelist(), null);
    new CustomConfigXmlParser(null).parse(paramContext);
  }
  
  public WhitelistPlugin(Whitelist paramWhitelist1, Whitelist paramWhitelist2, Whitelist paramWhitelist3)
  {
    if (paramWhitelist3 == null)
    {
      paramWhitelist3 = new Whitelist();
      paramWhitelist3.addWhiteListEntry("file:///*", false);
      paramWhitelist3.addWhiteListEntry("data:*", false);
    }
    this.allowedNavigations = paramWhitelist1;
    this.allowedIntents = paramWhitelist2;
    this.allowedRequests = paramWhitelist3;
  }
  
  public WhitelistPlugin(XmlPullParser paramXmlPullParser)
  {
    this(new Whitelist(), new Whitelist(), null);
    new CustomConfigXmlParser(null).parse(paramXmlPullParser);
  }
  
  public Whitelist getAllowedIntents()
  {
    return this.allowedIntents;
  }
  
  public Whitelist getAllowedNavigations()
  {
    return this.allowedNavigations;
  }
  
  public Whitelist getAllowedRequests()
  {
    return this.allowedRequests;
  }
  
  public void pluginInitialize()
  {
    if (this.allowedNavigations == null)
    {
      this.allowedNavigations = new Whitelist();
      this.allowedIntents = new Whitelist();
      this.allowedRequests = new Whitelist();
      new CustomConfigXmlParser(null).parse(this.webView.getContext());
    }
  }
  
  public void setAllowedIntents(Whitelist paramWhitelist)
  {
    this.allowedIntents = paramWhitelist;
  }
  
  public void setAllowedNavigations(Whitelist paramWhitelist)
  {
    this.allowedNavigations = paramWhitelist;
  }
  
  public void setAllowedRequests(Whitelist paramWhitelist)
  {
    this.allowedRequests = paramWhitelist;
  }
  
  public Boolean shouldAllowNavigation(String paramString)
  {
    if (this.allowedNavigations.isUrlWhiteListed(paramString)) {
      return Boolean.valueOf(true);
    }
    return null;
  }
  
  public Boolean shouldAllowRequest(String paramString)
  {
    if (Boolean.TRUE == shouldAllowNavigation(paramString)) {
      return Boolean.valueOf(true);
    }
    if (this.allowedRequests.isUrlWhiteListed(paramString)) {
      return Boolean.valueOf(true);
    }
    return null;
  }
  
  public Boolean shouldOpenExternalUrl(String paramString)
  {
    if (this.allowedIntents.isUrlWhiteListed(paramString)) {
      return Boolean.valueOf(true);
    }
    return null;
  }
  
  private class CustomConfigXmlParser
    extends ConfigXmlParser
  {
    private CustomConfigXmlParser() {}
    
    public void handleEndTag(XmlPullParser paramXmlPullParser) {}
    
    public void handleStartTag(XmlPullParser paramXmlPullParser)
    {
      boolean bool1 = true;
      String str1 = paramXmlPullParser.getName();
      if (str1.equals("content"))
      {
        String str6 = paramXmlPullParser.getAttributeValue(null, "src");
        WhitelistPlugin.this.allowedNavigations.addWhiteListEntry(str6, false);
      }
      do
      {
        return;
        if (str1.equals("allow-navigation"))
        {
          String str5 = paramXmlPullParser.getAttributeValue(null, "href");
          if ("*".equals(str5))
          {
            WhitelistPlugin.this.allowedNavigations.addWhiteListEntry("http://*/*", false);
            WhitelistPlugin.this.allowedNavigations.addWhiteListEntry("https://*/*", false);
            WhitelistPlugin.this.allowedNavigations.addWhiteListEntry("data:*", false);
            return;
          }
          WhitelistPlugin.this.allowedNavigations.addWhiteListEntry(str5, false);
          return;
        }
        if (str1.equals("allow-intent"))
        {
          String str4 = paramXmlPullParser.getAttributeValue(null, "href");
          WhitelistPlugin.this.allowedIntents.addWhiteListEntry(str4, false);
          return;
        }
      } while (!str1.equals("access"));
      String str2 = paramXmlPullParser.getAttributeValue(null, "origin");
      String str3 = paramXmlPullParser.getAttributeValue(null, "subdomains");
      boolean bool2;
      label207:
      Whitelist localWhitelist2;
      if (paramXmlPullParser.getAttributeValue(null, "launch-external") != null)
      {
        bool2 = bool1;
        if (str2 == null) {
          break label262;
        }
        if (!bool2) {
          break label269;
        }
        Log.w("WhitelistPlugin", "Found <access launch-external> within config.xml. Please use <allow-intent> instead.");
        localWhitelist2 = WhitelistPlugin.this.allowedIntents;
        if ((str3 == null) || (str3.compareToIgnoreCase("true") != 0)) {
          break label264;
        }
      }
      for (;;)
      {
        localWhitelist2.addWhiteListEntry(str2, bool1);
        return;
        bool2 = false;
        break label207;
        label262:
        break;
        label264:
        bool1 = false;
      }
      label269:
      if ("*".equals(str2))
      {
        WhitelistPlugin.this.allowedRequests.addWhiteListEntry("http://*/*", false);
        WhitelistPlugin.this.allowedRequests.addWhiteListEntry("https://*/*", false);
        return;
      }
      Whitelist localWhitelist1 = WhitelistPlugin.this.allowedRequests;
      if ((str3 != null) && (str3.compareToIgnoreCase("true") == 0)) {}
      for (;;)
      {
        localWhitelist1.addWhiteListEntry(str2, bool1);
        return;
        bool1 = false;
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/whitelist/WhitelistPlugin.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */