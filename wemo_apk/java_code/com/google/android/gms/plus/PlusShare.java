package com.google.android.gms.plus;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.internal.bt;
import com.google.android.gms.internal.cc;
import com.google.android.gms.internal.s;
import com.google.android.gms.plus.model.people.Person;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public final class PlusShare
{
  public static final String EXTRA_CALL_TO_ACTION = "com.google.android.apps.plus.CALL_TO_ACTION";
  public static final String EXTRA_CONTENT_DEEP_LINK_ID = "com.google.android.apps.plus.CONTENT_DEEP_LINK_ID";
  public static final String EXTRA_CONTENT_DEEP_LINK_METADATA = "com.google.android.apps.plus.CONTENT_DEEP_LINK_METADATA";
  public static final String EXTRA_CONTENT_URL = "com.google.android.apps.plus.CONTENT_URL";
  public static final String EXTRA_IS_INTERACTIVE_POST = "com.google.android.apps.plus.GOOGLE_INTERACTIVE_POST";
  public static final String EXTRA_SENDER_ID = "com.google.android.apps.plus.SENDER_ID";
  public static final String KEY_CALL_TO_ACTION_DEEP_LINK_ID = "deepLinkId";
  public static final String KEY_CALL_TO_ACTION_LABEL = "label";
  public static final String KEY_CALL_TO_ACTION_URL = "url";
  public static final String KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION = "description";
  public static final String KEY_CONTENT_DEEP_LINK_METADATA_THUMBNAIL_URL = "thumbnailUrl";
  public static final String KEY_CONTENT_DEEP_LINK_METADATA_TITLE = "title";
  public static final String PARAM_CONTENT_DEEP_LINK_ID = "deep_link_id";
  
  @Deprecated
  protected PlusShare()
  {
    throw new AssertionError();
  }
  
  public static Bundle a(String paramString1, String paramString2, Uri paramUri)
  {
    Bundle localBundle = new Bundle();
    localBundle.putString("title", paramString1);
    localBundle.putString("description", paramString2);
    if (paramUri != null) {
      localBundle.putString("thumbnailUrl", paramUri.toString());
    }
    return localBundle;
  }
  
  public static Person createPerson(String paramString1, String paramString2)
  {
    if (TextUtils.isEmpty(paramString1)) {
      throw new IllegalArgumentException("MinimalPerson ID must not be empty.");
    }
    if (TextUtils.isEmpty(paramString2)) {
      throw new IllegalArgumentException("Display name must not be empty.");
    }
    return new cc(paramString2, paramString1, null, 0, null);
  }
  
  public static String getDeepLinkId(Intent paramIntent)
  {
    String str = null;
    if (paramIntent != null)
    {
      Uri localUri = paramIntent.getData();
      str = null;
      if (localUri != null) {
        str = paramIntent.getData().getQueryParameter("deep_link_id");
      }
    }
    return str;
  }
  
  protected static boolean isDeepLinkIdValid(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
    {
      Log.e("GooglePlusPlatform", "The provided deep-link ID is empty.");
      return false;
    }
    if (paramString.contains(" "))
    {
      Log.e("GooglePlusPlatform", "Spaces are not allowed in deep-link IDs.");
      return false;
    }
    return true;
  }
  
  public static class Builder
  {
    private boolean im;
    private ArrayList<Uri> in;
    protected boolean io;
    private final Context mContext;
    private final Intent mIntent;
    
    public Builder(Activity paramActivity)
    {
      this.mContext = paramActivity;
      this.mIntent = new Intent().setAction("android.intent.action.SEND");
      this.mIntent.addFlags(524288);
      if (paramActivity.getComponentName() != null) {
        this.im = true;
      }
    }
    
    public Builder(Activity paramActivity, PlusClient paramPlusClient)
    {
      this(paramActivity);
      boolean bool;
      Person localPerson;
      if (paramPlusClient != null)
      {
        bool = true;
        s.a(bool, "Must include the PlusClient object in PlusShare.Builder constructor to create an interactive post.");
        s.a(paramPlusClient.isConnected(), "PlusClient must be connected to create an interactive post.");
        s.a(paramPlusClient.bu().F("https://www.googleapis.com/auth/plus.login"), "Must request PLUS_LOGIN scope in PlusClient to create an interactive post.");
        localPerson = paramPlusClient.getCurrentPerson();
        if (localPerson == null) {
          break label83;
        }
      }
      label83:
      for (String str = localPerson.getId();; str = "0")
      {
        this.mIntent.putExtra("com.google.android.apps.plus.SENDER_ID", str);
        this.io = true;
        return;
        bool = false;
        break;
      }
    }
    
    public Builder(Context paramContext)
    {
      this.mContext = paramContext;
      this.mIntent = new Intent().setAction("android.intent.action.SEND");
    }
    
    public Builder addCallToAction(String paramString1, Uri paramUri, String paramString2)
    {
      s.a(this.im, "Must include the launching activity with PlusShare.Builder constructor before setting call-to-action");
      if ((paramUri != null) && (!TextUtils.isEmpty(paramUri.toString()))) {}
      for (boolean bool = true;; bool = false)
      {
        s.b(bool, "Must provide a call to action URL");
        s.a(this.io, "Must include PlusClient in PlusShare.Builder constructor to create an interactive post");
        Bundle localBundle = new Bundle();
        if (!TextUtils.isEmpty(paramString1)) {
          localBundle.putString("label", paramString1);
        }
        localBundle.putString("url", paramUri.toString());
        if (!TextUtils.isEmpty(paramString2))
        {
          s.a(PlusShare.isDeepLinkIdValid(paramString2), "The specified deep-link ID was malformed.");
          localBundle.putString("deepLinkId", paramString2);
        }
        this.mIntent.putExtra("com.google.android.apps.plus.CALL_TO_ACTION", localBundle);
        this.mIntent.putExtra("com.google.android.apps.plus.GOOGLE_INTERACTIVE_POST", true);
        this.mIntent.setType("text/plain");
        return this;
      }
    }
    
    public Builder addStream(Uri paramUri)
    {
      Uri localUri = (Uri)this.mIntent.getParcelableExtra("android.intent.extra.STREAM");
      if (localUri == null) {
        return setStream(paramUri);
      }
      if (this.in == null) {
        this.in = new ArrayList();
      }
      this.in.add(localUri);
      this.in.add(paramUri);
      return this;
    }
    
    public Intent getIntent()
    {
      int i = 1;
      if ((this.in != null) && (this.in.size() > i))
      {
        int k = i;
        boolean bool1 = "android.intent.action.SEND_MULTIPLE".equals(this.mIntent.getAction());
        boolean bool2 = this.mIntent.getBooleanExtra("com.google.android.apps.plus.GOOGLE_INTERACTIVE_POST", false);
        if ((k != 0) && (bool2)) {
          break label316;
        }
        int n = i;
        label59:
        s.a(n, "Call-to-action buttons are only available for URLs.");
        if ((bool2) && (!this.mIntent.hasExtra("com.google.android.apps.plus.CONTENT_URL"))) {
          break label322;
        }
        int i2 = i;
        label86:
        s.a(i2, "The content URL is required for interactive posts.");
        if ((bool2) && (!this.mIntent.hasExtra("com.google.android.apps.plus.CONTENT_URL")) && (!this.mIntent.hasExtra("com.google.android.apps.plus.CONTENT_DEEP_LINK_ID"))) {
          break label328;
        }
        label122:
        s.a(i, "Must set content URL or content deep-link ID to use a call-to-action button.");
        if (this.mIntent.hasExtra("com.google.android.apps.plus.CONTENT_DEEP_LINK_ID")) {
          s.a(PlusShare.isDeepLinkIdValid(this.mIntent.getStringExtra("com.google.android.apps.plus.CONTENT_DEEP_LINK_ID")), "The specified deep-link ID was malformed.");
        }
        if ((k == 0) && (bool1))
        {
          this.mIntent.setAction("android.intent.action.SEND");
          if ((this.in == null) || (this.in.isEmpty())) {
            break label333;
          }
          this.mIntent.putExtra("android.intent.extra.STREAM", (Parcelable)this.in.get(0));
          label213:
          this.in = null;
        }
        if ((k != 0) && (!bool1))
        {
          this.mIntent.setAction("android.intent.action.SEND_MULTIPLE");
          if ((this.in == null) || (this.in.isEmpty())) {
            break label345;
          }
          this.mIntent.putParcelableArrayListExtra("android.intent.extra.STREAM", this.in);
        }
      }
      for (;;)
      {
        if ((isGooglePlusAvailable()) || (this.mIntent.hasExtra("android.intent.extra.STREAM"))) {
          break label357;
        }
        this.mIntent.setAction("com.google.android.gms.plus.action.SHARE_GOOGLE");
        this.mIntent.setPackage("com.google.android.gms");
        return this.mIntent;
        int m = 0;
        break;
        label316:
        int i1 = 0;
        break label59;
        label322:
        int i3 = 0;
        break label86;
        label328:
        int j = 0;
        break label122;
        label333:
        this.mIntent.removeExtra("android.intent.extra.STREAM");
        break label213;
        label345:
        this.mIntent.removeExtra("android.intent.extra.STREAM");
      }
      label357:
      this.mIntent.setPackage("com.google.android.apps.plus");
      return this.mIntent;
    }
    
    protected boolean isGooglePlusAvailable()
    {
      PackageManager localPackageManager = this.mContext.getPackageManager();
      if (localPackageManager == null) {}
      for (;;)
      {
        return false;
        try
        {
          ApplicationInfo localApplicationInfo = localPackageManager.getApplicationInfo("com.google.android.apps.plus", 0);
          if (localApplicationInfo != null)
          {
            boolean bool = localApplicationInfo.enabled;
            if (bool) {
              return true;
            }
          }
        }
        catch (PackageManager.NameNotFoundException localNameNotFoundException) {}
      }
      return false;
    }
    
    public Builder setContentDeepLinkId(String paramString)
    {
      return setContentDeepLinkId(paramString, null, null, null);
    }
    
    public Builder setContentDeepLinkId(String paramString1, String paramString2, String paramString3, Uri paramUri)
    {
      s.b(this.im, "Must include the launching activity with PlusShare.Builder constructor before setting deep links");
      if (!TextUtils.isEmpty(paramString1)) {}
      for (boolean bool = true;; bool = false)
      {
        s.b(bool, "The deepLinkId parameter is required.");
        Bundle localBundle = PlusShare.a(paramString2, paramString3, paramUri);
        this.mIntent.putExtra("com.google.android.apps.plus.CONTENT_DEEP_LINK_ID", paramString1);
        this.mIntent.putExtra("com.google.android.apps.plus.CONTENT_DEEP_LINK_METADATA", localBundle);
        this.mIntent.setType("text/plain");
        return this;
      }
    }
    
    public Builder setContentUrl(Uri paramUri)
    {
      String str = null;
      if (paramUri != null) {
        str = paramUri.toString();
      }
      if (TextUtils.isEmpty(str))
      {
        this.mIntent.removeExtra("com.google.android.apps.plus.CONTENT_URL");
        return this;
      }
      this.mIntent.putExtra("com.google.android.apps.plus.CONTENT_URL", str);
      return this;
    }
    
    public Builder setRecipients(List<Person> paramList)
    {
      if (paramList != null) {}
      for (int i = paramList.size(); i == 0; i = 0)
      {
        this.mIntent.removeExtra("com.google.android.apps.plus.RECIPIENT_IDS");
        this.mIntent.removeExtra("com.google.android.apps.plus.RECIPIENT_DISPLAY_NAMES");
        return this;
      }
      ArrayList localArrayList1 = new ArrayList(i);
      ArrayList localArrayList2 = new ArrayList(i);
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Person localPerson = (Person)localIterator.next();
        localArrayList1.add(localPerson.getId());
        localArrayList2.add(localPerson.getDisplayName());
      }
      this.mIntent.putStringArrayListExtra("com.google.android.apps.plus.RECIPIENT_IDS", localArrayList1);
      this.mIntent.putStringArrayListExtra("com.google.android.apps.plus.RECIPIENT_DISPLAY_NAMES", localArrayList2);
      return this;
    }
    
    public Builder setStream(Uri paramUri)
    {
      this.in = null;
      this.mIntent.putExtra("android.intent.extra.STREAM", paramUri);
      return this;
    }
    
    public Builder setText(CharSequence paramCharSequence)
    {
      this.mIntent.putExtra("android.intent.extra.TEXT", paramCharSequence);
      return this;
    }
    
    public Builder setType(String paramString)
    {
      this.mIntent.setType(paramString);
      return this;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/plus/PlusShare.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */