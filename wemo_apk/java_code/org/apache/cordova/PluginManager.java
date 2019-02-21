package org.apache.cordova;

import android.content.Intent;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.os.Debug;
import android.util.Log;
import java.io.PrintStream;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import org.json.JSONException;

public class PluginManager
{
  private static final int SLOW_EXEC_WARNING_THRESHOLD;
  private static String TAG = "PluginManager";
  private final CordovaWebView app;
  private final CordovaInterface ctx;
  private final LinkedHashMap<String, PluginEntry> entryMap = new LinkedHashMap();
  private boolean isInitialized;
  private CordovaPlugin permissionRequester;
  private final LinkedHashMap<String, CordovaPlugin> pluginMap = new LinkedHashMap();
  
  static
  {
    if (Debug.isDebuggerConnected()) {}
    for (int i = 60;; i = 16)
    {
      SLOW_EXEC_WARNING_THRESHOLD = i;
      return;
    }
  }
  
  public PluginManager(CordovaWebView paramCordovaWebView, CordovaInterface paramCordovaInterface, Collection<PluginEntry> paramCollection)
  {
    this.ctx = paramCordovaInterface;
    this.app = paramCordovaWebView;
    setPluginEntries(paramCollection);
  }
  
  private CordovaPlugin instantiatePlugin(String paramString)
  {
    Class localClass = null;
    if (paramString != null) {}
    for (;;)
    {
      try
      {
        boolean bool2 = "".equals(paramString);
        localClass = null;
        if (bool2) {
          break label103;
        }
        localClass = Class.forName(paramString);
      }
      catch (Exception localException)
      {
        boolean bool1;
        CordovaPlugin localCordovaPlugin;
        localException.printStackTrace();
        System.out.println("Error adding plugin " + paramString + ".");
        return null;
      }
      bool1 = i & CordovaPlugin.class.isAssignableFrom(localClass);
      localCordovaPlugin = null;
      if (bool1) {
        localCordovaPlugin = (CordovaPlugin)localClass.newInstance();
      }
      return localCordovaPlugin;
      int i = 0;
      continue;
      label103:
      if (localClass != null) {
        i = 1;
      }
    }
  }
  
  private void startupPlugins()
  {
    Iterator localIterator = this.entryMap.values().iterator();
    while (localIterator.hasNext())
    {
      PluginEntry localPluginEntry = (PluginEntry)localIterator.next();
      if (localPluginEntry.onload) {
        getPlugin(localPluginEntry.service);
      } else {
        this.pluginMap.put(localPluginEntry.service, null);
      }
    }
  }
  
  public void addService(String paramString1, String paramString2)
  {
    addService(new PluginEntry(paramString1, paramString2, false));
  }
  
  public void addService(PluginEntry paramPluginEntry)
  {
    this.entryMap.put(paramPluginEntry.service, paramPluginEntry);
    if (paramPluginEntry.plugin != null)
    {
      paramPluginEntry.plugin.privateInitialize(paramPluginEntry.service, this.ctx, this.app, this.app.getPreferences());
      this.pluginMap.put(paramPluginEntry.service, paramPluginEntry.plugin);
    }
  }
  
  public void exec(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    CordovaPlugin localCordovaPlugin = getPlugin(paramString1);
    if (localCordovaPlugin == null)
    {
      Log.d(TAG, "exec() call to unknown plugin: " + paramString1);
      PluginResult localPluginResult = new PluginResult(PluginResult.Status.CLASS_NOT_FOUND_EXCEPTION);
      this.app.sendPluginResult(localPluginResult, paramString3);
    }
    for (;;)
    {
      return;
      CallbackContext localCallbackContext = new CallbackContext(paramString3, this.app);
      try
      {
        long l1 = System.currentTimeMillis();
        boolean bool = localCordovaPlugin.execute(paramString2, paramString4, localCallbackContext);
        long l2 = System.currentTimeMillis() - l1;
        if (l2 > SLOW_EXEC_WARNING_THRESHOLD) {
          Log.w(TAG, "THREAD WARNING: exec() call to " + paramString1 + "." + paramString2 + " blocked the main thread for " + l2 + "ms. Plugin should use CordovaInterface.getThreadPool().");
        }
        if (!bool)
        {
          localCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.INVALID_ACTION));
          return;
        }
      }
      catch (JSONException localJSONException)
      {
        localCallbackContext.sendPluginResult(new PluginResult(PluginResult.Status.JSON_EXCEPTION));
        return;
      }
      catch (Exception localException)
      {
        Log.e(TAG, "Uncaught exception from plugin", localException);
        localCallbackContext.error(localException.getMessage());
      }
    }
  }
  
  public CordovaPlugin getPlugin(String paramString)
  {
    CordovaPlugin localCordovaPlugin = (CordovaPlugin)this.pluginMap.get(paramString);
    PluginEntry localPluginEntry;
    if (localCordovaPlugin == null)
    {
      localPluginEntry = (PluginEntry)this.entryMap.get(paramString);
      if (localPluginEntry == null) {
        return null;
      }
      if (localPluginEntry.plugin == null) {
        break label80;
      }
    }
    label80:
    for (localCordovaPlugin = localPluginEntry.plugin;; localCordovaPlugin = instantiatePlugin(localPluginEntry.pluginClass))
    {
      localCordovaPlugin.privateInitialize(paramString, this.ctx, this.app, this.app.getPreferences());
      this.pluginMap.put(paramString, localCordovaPlugin);
      return localCordovaPlugin;
    }
  }
  
  public Collection<PluginEntry> getPluginEntries()
  {
    return this.entryMap.values();
  }
  
  public void init()
  {
    LOG.d(TAG, "init()");
    this.isInitialized = true;
    onPause(false);
    onDestroy();
    this.pluginMap.clear();
    startupPlugins();
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if (localCordovaPlugin != null) {
        localCordovaPlugin.onConfigurationChanged(paramConfiguration);
      }
    }
  }
  
  public void onDestroy()
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if (localCordovaPlugin != null) {
        localCordovaPlugin.onDestroy();
      }
    }
  }
  
  public void onNewIntent(Intent paramIntent)
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if (localCordovaPlugin != null) {
        localCordovaPlugin.onNewIntent(paramIntent);
      }
    }
  }
  
  public boolean onOverrideUrlLoading(String paramString)
  {
    Iterator localIterator = this.entryMap.values().iterator();
    while (localIterator.hasNext())
    {
      PluginEntry localPluginEntry = (PluginEntry)localIterator.next();
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)this.pluginMap.get(localPluginEntry.service);
      if ((localCordovaPlugin != null) && (localCordovaPlugin.onOverrideUrlLoading(paramString))) {
        return true;
      }
    }
    return false;
  }
  
  public void onPause(boolean paramBoolean)
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if (localCordovaPlugin != null) {
        localCordovaPlugin.onPause(paramBoolean);
      }
    }
  }
  
  public boolean onReceivedClientCertRequest(CordovaWebView paramCordovaWebView, ICordovaClientCertRequest paramICordovaClientCertRequest)
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if ((localCordovaPlugin != null) && (localCordovaPlugin.onReceivedClientCertRequest(this.app, paramICordovaClientCertRequest))) {
        return true;
      }
    }
    return false;
  }
  
  public boolean onReceivedHttpAuthRequest(CordovaWebView paramCordovaWebView, ICordovaHttpAuthHandler paramICordovaHttpAuthHandler, String paramString1, String paramString2)
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if ((localCordovaPlugin != null) && (localCordovaPlugin.onReceivedHttpAuthRequest(this.app, paramICordovaHttpAuthHandler, paramString1, paramString2))) {
        return true;
      }
    }
    return false;
  }
  
  public void onReset()
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if (localCordovaPlugin != null) {
        localCordovaPlugin.onReset();
      }
    }
  }
  
  public void onResume(boolean paramBoolean)
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if (localCordovaPlugin != null) {
        localCordovaPlugin.onResume(paramBoolean);
      }
    }
  }
  
  public Bundle onSaveInstanceState()
  {
    Bundle localBundle1 = new Bundle();
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if (localCordovaPlugin != null)
      {
        Bundle localBundle2 = localCordovaPlugin.onSaveInstanceState();
        if (localBundle2 != null) {
          localBundle1.putBundle(localCordovaPlugin.getServiceName(), localBundle2);
        }
      }
    }
    return localBundle1;
  }
  
  public void onStart()
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if (localCordovaPlugin != null) {
        localCordovaPlugin.onStart();
      }
    }
  }
  
  public void onStop()
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if (localCordovaPlugin != null) {
        localCordovaPlugin.onStop();
      }
    }
  }
  
  public Object postMessage(String paramString, Object paramObject)
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if (localCordovaPlugin != null)
      {
        Object localObject = localCordovaPlugin.onMessage(paramString, paramObject);
        if (localObject != null) {
          return localObject;
        }
      }
    }
    return this.ctx.onMessage(paramString, paramObject);
  }
  
  Uri remapUri(Uri paramUri)
  {
    Iterator localIterator = this.pluginMap.values().iterator();
    while (localIterator.hasNext())
    {
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)localIterator.next();
      if (localCordovaPlugin != null)
      {
        Uri localUri = localCordovaPlugin.remapUri(paramUri);
        if (localUri != null) {
          return localUri;
        }
      }
    }
    return null;
  }
  
  public void setPluginEntries(Collection<PluginEntry> paramCollection)
  {
    if (this.isInitialized)
    {
      onPause(false);
      onDestroy();
      this.pluginMap.clear();
      this.entryMap.clear();
    }
    Iterator localIterator = paramCollection.iterator();
    while (localIterator.hasNext()) {
      addService((PluginEntry)localIterator.next());
    }
    if (this.isInitialized) {
      startupPlugins();
    }
  }
  
  public boolean shouldAllowBridgeAccess(String paramString)
  {
    Iterator localIterator = this.entryMap.values().iterator();
    while (localIterator.hasNext())
    {
      PluginEntry localPluginEntry = (PluginEntry)localIterator.next();
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)this.pluginMap.get(localPluginEntry.service);
      if (localCordovaPlugin != null)
      {
        Boolean localBoolean = localCordovaPlugin.shouldAllowBridgeAccess(paramString);
        if (localBoolean != null) {
          return localBoolean.booleanValue();
        }
      }
    }
    return paramString.startsWith("file://");
  }
  
  public boolean shouldAllowNavigation(String paramString)
  {
    Iterator localIterator = this.entryMap.values().iterator();
    while (localIterator.hasNext())
    {
      PluginEntry localPluginEntry = (PluginEntry)localIterator.next();
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)this.pluginMap.get(localPluginEntry.service);
      if (localCordovaPlugin != null)
      {
        Boolean localBoolean = localCordovaPlugin.shouldAllowNavigation(paramString);
        if (localBoolean != null) {
          return localBoolean.booleanValue();
        }
      }
    }
    return (paramString.startsWith("file://")) || (paramString.startsWith("about:blank"));
  }
  
  public boolean shouldAllowRequest(String paramString)
  {
    boolean bool = true;
    Iterator localIterator = this.entryMap.values().iterator();
    while (localIterator.hasNext())
    {
      PluginEntry localPluginEntry = (PluginEntry)localIterator.next();
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)this.pluginMap.get(localPluginEntry.service);
      if (localCordovaPlugin != null)
      {
        Boolean localBoolean = localCordovaPlugin.shouldAllowRequest(paramString);
        if (localBoolean != null) {
          bool = localBoolean.booleanValue();
        }
      }
    }
    do
    {
      do
      {
        return bool;
      } while ((paramString.startsWith("blob:")) || (paramString.startsWith("data:")) || (paramString.startsWith("about:blank")) || (paramString.startsWith("https://ssl.gstatic.com/accessibility/javascript/android/")));
      if (!paramString.startsWith("file://")) {
        break;
      }
    } while (!paramString.contains("/app_webview/"));
    return false;
    return false;
  }
  
  public Boolean shouldOpenExternalUrl(String paramString)
  {
    Iterator localIterator = this.entryMap.values().iterator();
    while (localIterator.hasNext())
    {
      PluginEntry localPluginEntry = (PluginEntry)localIterator.next();
      CordovaPlugin localCordovaPlugin = (CordovaPlugin)this.pluginMap.get(localPluginEntry.service);
      if (localCordovaPlugin != null)
      {
        Boolean localBoolean = localCordovaPlugin.shouldOpenExternalUrl(paramString);
        if (localBoolean != null) {
          return localBoolean;
        }
      }
    }
    return Boolean.valueOf(false);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/PluginManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */