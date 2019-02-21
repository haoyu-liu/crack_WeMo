package org.apache.cordova;

import android.app.Activity;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;

public class NativeToJsMessageQueue
{
  static final boolean DISABLE_EXEC_CHAINING = false;
  private static final boolean FORCE_ENCODE_USING_EVAL = false;
  private static final String LOG_TAG = "JsMessageQueue";
  private static int MAX_PAYLOAD_SIZE = 524288000;
  private BridgeMode activeBridgeMode;
  private ArrayList<BridgeMode> bridgeModes = new ArrayList();
  private boolean paused;
  private final LinkedList<JsMessage> queue = new LinkedList();
  
  private int calculatePackedMessageLength(JsMessage paramJsMessage)
  {
    int i = paramJsMessage.calculateEncodedLength();
    return 1 + (i + String.valueOf(i).length());
  }
  
  private void enqueueMessage(JsMessage paramJsMessage)
  {
    try
    {
      if (this.activeBridgeMode == null)
      {
        Log.d("JsMessageQueue", "Dropping Native->JS message due to disabled bridge");
        return;
      }
      this.queue.add(paramJsMessage);
      if (!this.paused) {
        this.activeBridgeMode.onNativeToJsMessageAvailable(this);
      }
      return;
    }
    finally {}
  }
  
  private void packMessage(JsMessage paramJsMessage, StringBuilder paramStringBuilder)
  {
    paramStringBuilder.append(paramJsMessage.calculateEncodedLength()).append(' ');
    paramJsMessage.encodeAsMessage(paramStringBuilder);
  }
  
  public void addBridgeMode(BridgeMode paramBridgeMode)
  {
    this.bridgeModes.add(paramBridgeMode);
  }
  
  public void addJavaScript(String paramString)
  {
    enqueueMessage(new JsMessage(paramString));
  }
  
  public void addPluginResult(PluginResult paramPluginResult, String paramString)
  {
    if (paramString == null)
    {
      Log.e("JsMessageQueue", "Got plugin result with no callbackId", new Throwable());
      return;
    }
    if (paramPluginResult.getStatus() == PluginResult.Status.NO_RESULT.ordinal()) {}
    for (int i = 1;; i = 0)
    {
      boolean bool = paramPluginResult.getKeepCallback();
      if ((i != 0) && (bool)) {
        break;
      }
      enqueueMessage(new JsMessage(paramPluginResult, paramString));
      return;
    }
  }
  
  public boolean isBridgeEnabled()
  {
    return this.activeBridgeMode != null;
  }
  
  public boolean isEmpty()
  {
    return this.queue.isEmpty();
  }
  
  public String popAndEncode(boolean paramBoolean)
  {
    try
    {
      if (this.activeBridgeMode == null) {
        return null;
      }
      this.activeBridgeMode.notifyOfFlush(this, paramBoolean);
      if (this.queue.isEmpty()) {
        return null;
      }
    }
    finally {}
    int i = 0;
    int j = 0;
    Iterator localIterator = this.queue.iterator();
    for (;;)
    {
      int m;
      if (localIterator.hasNext())
      {
        m = calculatePackedMessageLength((JsMessage)localIterator.next());
        if ((j <= 0) || (i + m <= MAX_PAYLOAD_SIZE) || (MAX_PAYLOAD_SIZE <= 0)) {}
      }
      else
      {
        StringBuilder localStringBuilder = new StringBuilder(i);
        for (int k = 0; k < j; k++) {
          packMessage((JsMessage)this.queue.removeFirst(), localStringBuilder);
        }
        if (!this.queue.isEmpty()) {
          localStringBuilder.append('*');
        }
        String str = localStringBuilder.toString();
        return str;
      }
      i += m;
      j++;
    }
  }
  
  public String popAndEncodeAsJs()
  {
    int i;
    int j;
    int i2;
    int k;
    label91:
    int m;
    label99:
    StringBuilder localStringBuilder;
    int n;
    try
    {
      if (this.queue.size() == 0) {
        return null;
      }
      i = 0;
      j = 0;
      Iterator localIterator = this.queue.iterator();
      if (localIterator.hasNext())
      {
        i2 = 50 + ((JsMessage)localIterator.next()).calculateEncodedLength();
        if ((j <= 0) || (i + i2 <= MAX_PAYLOAD_SIZE) || (MAX_PAYLOAD_SIZE <= 0)) {
          break label241;
        }
      }
      if (j != this.queue.size()) {
        break label252;
      }
      k = 1;
      if (k == 0) {
        break label258;
      }
      m = 0;
      localStringBuilder = new StringBuilder(m + i);
      n = 0;
      label115:
      if (n < j)
      {
        JsMessage localJsMessage = (JsMessage)this.queue.removeFirst();
        if ((k != 0) && (n + 1 == j))
        {
          localJsMessage.encodeAsJsMessage(localStringBuilder);
        }
        else
        {
          localStringBuilder.append("try{");
          localJsMessage.encodeAsJsMessage(localStringBuilder);
          localStringBuilder.append("}finally{");
        }
      }
    }
    finally {}
    if (k == 0) {
      localStringBuilder.append("window.setTimeout(function(){cordova.require('cordova/plugin/android/polling').pollOnce();},0);");
    }
    for (;;)
    {
      int i1;
      if (i1 < j)
      {
        localStringBuilder.append('}');
        i1++;
      }
      else
      {
        String str = localStringBuilder.toString();
        return str;
        n++;
        break label115;
        label241:
        i += i2;
        j++;
        break;
        label252:
        k = 0;
        break label91;
        label258:
        m = 100;
        break label99;
        if (k != 0) {
          i1 = 1;
        } else {
          i1 = 0;
        }
      }
    }
  }
  
  public void reset()
  {
    try
    {
      this.queue.clear();
      setBridgeMode(-1);
      return;
    }
    finally {}
  }
  
  public void setBridgeMode(int paramInt)
  {
    if ((paramInt < -1) || (paramInt >= this.bridgeModes.size()))
    {
      Log.d("JsMessageQueue", "Invalid NativeToJsBridgeMode: " + paramInt);
      return;
    }
    BridgeMode localBridgeMode;
    label48:
    StringBuilder localStringBuilder;
    if (paramInt < 0)
    {
      localBridgeMode = null;
      if (localBridgeMode == this.activeBridgeMode) {
        break label154;
      }
      localStringBuilder = new StringBuilder().append("Set native->JS mode to ");
      if (localBridgeMode != null) {
        break label156;
      }
    }
    label154:
    label156:
    for (String str = "null";; str = localBridgeMode.getClass().getSimpleName())
    {
      Log.d("JsMessageQueue", str);
      try
      {
        this.activeBridgeMode = localBridgeMode;
        if (localBridgeMode != null)
        {
          localBridgeMode.reset();
          if ((!this.paused) && (!this.queue.isEmpty())) {
            localBridgeMode.onNativeToJsMessageAvailable(this);
          }
        }
        return;
      }
      finally {}
      localBridgeMode = (BridgeMode)this.bridgeModes.get(paramInt);
      break label48;
      break;
    }
  }
  
  public void setPaused(boolean paramBoolean)
  {
    if ((this.paused) && (paramBoolean)) {
      Log.e("JsMessageQueue", "nested call to setPaused detected.", new Throwable());
    }
    this.paused = paramBoolean;
    if (!paramBoolean) {
      try
      {
        if ((!this.queue.isEmpty()) && (this.activeBridgeMode != null)) {
          this.activeBridgeMode.onNativeToJsMessageAvailable(this);
        }
        return;
      }
      finally {}
    }
  }
  
  public static abstract class BridgeMode
  {
    public void notifyOfFlush(NativeToJsMessageQueue paramNativeToJsMessageQueue, boolean paramBoolean) {}
    
    public abstract void onNativeToJsMessageAvailable(NativeToJsMessageQueue paramNativeToJsMessageQueue);
    
    public void reset() {}
  }
  
  private static class JsMessage
  {
    final String jsPayloadOrCallbackId;
    final PluginResult pluginResult;
    
    JsMessage(String paramString)
    {
      if (paramString == null) {
        throw new NullPointerException();
      }
      this.jsPayloadOrCallbackId = paramString;
      this.pluginResult = null;
    }
    
    JsMessage(PluginResult paramPluginResult, String paramString)
    {
      if ((paramString == null) || (paramPluginResult == null)) {
        throw new NullPointerException();
      }
      this.jsPayloadOrCallbackId = paramString;
      this.pluginResult = paramPluginResult;
    }
    
    static int calculateEncodedLengthHelper(PluginResult paramPluginResult)
    {
      int i;
      switch (paramPluginResult.getMessageType())
      {
      case 2: 
      default: 
        i = paramPluginResult.getMessage().length();
      }
      for (;;)
      {
        return i;
        return 1;
        return 1 + paramPluginResult.getMessage().length();
        return 1 + paramPluginResult.getStrMessage().length();
        return 1 + paramPluginResult.getMessage().length();
        return 1 + paramPluginResult.getMessage().length();
        i = 1;
        for (int j = 0; j < paramPluginResult.getMultipartMessagesSize(); j++)
        {
          int k = calculateEncodedLengthHelper(paramPluginResult.getMultipartMessage(j));
          i += k + (1 + String.valueOf(k).length());
        }
      }
    }
    
    static void encodeAsMessageHelper(StringBuilder paramStringBuilder, PluginResult paramPluginResult)
    {
      switch (paramPluginResult.getMessageType())
      {
      case 2: 
      default: 
        paramStringBuilder.append(paramPluginResult.getMessage());
      }
      for (;;)
      {
        return;
        paramStringBuilder.append(paramPluginResult.getMessage().charAt(0));
        return;
        paramStringBuilder.append('N');
        return;
        paramStringBuilder.append('n').append(paramPluginResult.getMessage());
        return;
        paramStringBuilder.append('s');
        paramStringBuilder.append(paramPluginResult.getStrMessage());
        return;
        paramStringBuilder.append('S');
        paramStringBuilder.append(paramPluginResult.getMessage());
        return;
        paramStringBuilder.append('A');
        paramStringBuilder.append(paramPluginResult.getMessage());
        return;
        paramStringBuilder.append('M');
        for (int i = 0; i < paramPluginResult.getMultipartMessagesSize(); i++)
        {
          PluginResult localPluginResult = paramPluginResult.getMultipartMessage(i);
          paramStringBuilder.append(String.valueOf(calculateEncodedLengthHelper(localPluginResult)));
          paramStringBuilder.append(' ');
          encodeAsMessageHelper(paramStringBuilder, localPluginResult);
        }
      }
    }
    
    int calculateEncodedLength()
    {
      if (this.pluginResult == null) {
        return 1 + this.jsPayloadOrCallbackId.length();
      }
      return 1 + (1 + (2 + String.valueOf(this.pluginResult.getStatus()).length()) + this.jsPayloadOrCallbackId.length()) + calculateEncodedLengthHelper(this.pluginResult);
    }
    
    void encodeAsJsMessage(StringBuilder paramStringBuilder)
    {
      if (this.pluginResult == null)
      {
        paramStringBuilder.append(this.jsPayloadOrCallbackId);
        return;
      }
      int i = this.pluginResult.getStatus();
      boolean bool;
      if ((i == PluginResult.Status.OK.ordinal()) || (i == PluginResult.Status.NO_RESULT.ordinal()))
      {
        bool = true;
        paramStringBuilder.append("cordova.callbackFromNative('").append(this.jsPayloadOrCallbackId).append("',").append(bool).append(",").append(i).append(",[");
        switch (this.pluginResult.getMessageType())
        {
        default: 
          paramStringBuilder.append(this.pluginResult.getMessage());
        }
      }
      for (;;)
      {
        paramStringBuilder.append("],").append(this.pluginResult.getKeepCallback()).append(");");
        return;
        bool = false;
        break;
        paramStringBuilder.append("atob('").append(this.pluginResult.getMessage()).append("')");
        continue;
        paramStringBuilder.append("cordova.require('cordova/base64').toArrayBuffer('").append(this.pluginResult.getMessage()).append("')");
      }
    }
    
    void encodeAsMessage(StringBuilder paramStringBuilder)
    {
      if (this.pluginResult == null)
      {
        paramStringBuilder.append('J').append(this.jsPayloadOrCallbackId);
        return;
      }
      int i = this.pluginResult.getStatus();
      int j;
      int k;
      label55:
      char c1;
      label77:
      StringBuilder localStringBuilder;
      if (i == PluginResult.Status.NO_RESULT.ordinal())
      {
        j = 1;
        if (i != PluginResult.Status.OK.ordinal()) {
          break label137;
        }
        k = 1;
        boolean bool = this.pluginResult.getKeepCallback();
        if ((j == 0) && (k == 0)) {
          break label143;
        }
        c1 = 'S';
        localStringBuilder = paramStringBuilder.append(c1);
        if (!bool) {
          break label150;
        }
      }
      label137:
      label143:
      label150:
      for (char c2 = '1';; c2 = '0')
      {
        localStringBuilder.append(c2).append(i).append(' ').append(this.jsPayloadOrCallbackId).append(' ');
        encodeAsMessageHelper(paramStringBuilder, this.pluginResult);
        return;
        j = 0;
        break;
        k = 0;
        break label55;
        c1 = 'F';
        break label77;
      }
    }
  }
  
  public static class LoadUrlBridgeMode
    extends NativeToJsMessageQueue.BridgeMode
  {
    private final CordovaInterface cordova;
    private final CordovaWebViewEngine engine;
    
    public LoadUrlBridgeMode(CordovaWebViewEngine paramCordovaWebViewEngine, CordovaInterface paramCordovaInterface)
    {
      this.engine = paramCordovaWebViewEngine;
      this.cordova = paramCordovaInterface;
    }
    
    public void onNativeToJsMessageAvailable(final NativeToJsMessageQueue paramNativeToJsMessageQueue)
    {
      this.cordova.getActivity().runOnUiThread(new Runnable()
      {
        public void run()
        {
          String str = paramNativeToJsMessageQueue.popAndEncodeAsJs();
          if (str != null) {
            NativeToJsMessageQueue.LoadUrlBridgeMode.this.engine.loadUrl("javascript:" + str, false);
          }
        }
      });
    }
  }
  
  public static class NoOpBridgeMode
    extends NativeToJsMessageQueue.BridgeMode
  {
    public void onNativeToJsMessageAvailable(NativeToJsMessageQueue paramNativeToJsMessageQueue) {}
  }
  
  public static class OnlineEventsBridgeMode
    extends NativeToJsMessageQueue.BridgeMode
  {
    private final OnlineEventsBridgeModeDelegate delegate;
    private boolean ignoreNextFlush;
    private boolean online;
    
    public OnlineEventsBridgeMode(OnlineEventsBridgeModeDelegate paramOnlineEventsBridgeModeDelegate)
    {
      this.delegate = paramOnlineEventsBridgeModeDelegate;
    }
    
    public void notifyOfFlush(NativeToJsMessageQueue paramNativeToJsMessageQueue, boolean paramBoolean)
    {
      if ((paramBoolean) && (!this.ignoreNextFlush)) {
        if (this.online) {
          break label26;
        }
      }
      label26:
      for (boolean bool = true;; bool = false)
      {
        this.online = bool;
        return;
      }
    }
    
    public void onNativeToJsMessageAvailable(final NativeToJsMessageQueue paramNativeToJsMessageQueue)
    {
      this.delegate.runOnUiThread(new Runnable()
      {
        public void run()
        {
          if (!paramNativeToJsMessageQueue.isEmpty())
          {
            NativeToJsMessageQueue.OnlineEventsBridgeMode.access$202(NativeToJsMessageQueue.OnlineEventsBridgeMode.this, false);
            NativeToJsMessageQueue.OnlineEventsBridgeMode.this.delegate.setNetworkAvailable(NativeToJsMessageQueue.OnlineEventsBridgeMode.this.online);
          }
        }
      });
    }
    
    public void reset()
    {
      this.delegate.runOnUiThread(new Runnable()
      {
        public void run()
        {
          NativeToJsMessageQueue.OnlineEventsBridgeMode.access$102(NativeToJsMessageQueue.OnlineEventsBridgeMode.this, false);
          NativeToJsMessageQueue.OnlineEventsBridgeMode.access$202(NativeToJsMessageQueue.OnlineEventsBridgeMode.this, true);
          NativeToJsMessageQueue.OnlineEventsBridgeMode.this.delegate.setNetworkAvailable(true);
        }
      });
    }
    
    public static abstract interface OnlineEventsBridgeModeDelegate
    {
      public abstract void runOnUiThread(Runnable paramRunnable);
      
      public abstract void setNetworkAvailable(boolean paramBoolean);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/cordova/NativeToJsMessageQueue.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */