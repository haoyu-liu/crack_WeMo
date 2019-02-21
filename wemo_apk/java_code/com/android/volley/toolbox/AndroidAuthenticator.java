package com.android.volley.toolbox;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AccountManagerFuture;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.android.volley.AuthFailureError;

public class AndroidAuthenticator
  implements Authenticator
{
  private final Account mAccount;
  private final AccountManager mAccountManager;
  private final String mAuthTokenType;
  private final boolean mNotifyAuthFailure;
  
  AndroidAuthenticator(AccountManager paramAccountManager, Account paramAccount, String paramString, boolean paramBoolean)
  {
    this.mAccountManager = paramAccountManager;
    this.mAccount = paramAccount;
    this.mAuthTokenType = paramString;
    this.mNotifyAuthFailure = paramBoolean;
  }
  
  public AndroidAuthenticator(Context paramContext, Account paramAccount, String paramString)
  {
    this(paramContext, paramAccount, paramString, false);
  }
  
  public AndroidAuthenticator(Context paramContext, Account paramAccount, String paramString, boolean paramBoolean)
  {
    this(AccountManager.get(paramContext), paramAccount, paramString, paramBoolean);
  }
  
  public Account getAccount()
  {
    return this.mAccount;
  }
  
  public String getAuthToken()
    throws AuthFailureError
  {
    AccountManagerFuture localAccountManagerFuture = this.mAccountManager.getAuthToken(this.mAccount, this.mAuthTokenType, this.mNotifyAuthFailure, null, null);
    Bundle localBundle;
    try
    {
      localBundle = (Bundle)localAccountManagerFuture.getResult();
      boolean bool1 = localAccountManagerFuture.isDone();
      str = null;
      if (!bool1) {
        break label110;
      }
      boolean bool2 = localAccountManagerFuture.isCancelled();
      str = null;
      if (bool2) {
        break label110;
      }
      if (localBundle.containsKey("intent")) {
        throw new AuthFailureError((Intent)localBundle.getParcelable("intent"));
      }
    }
    catch (Exception localException)
    {
      throw new AuthFailureError("Error while retrieving auth token", localException);
    }
    String str = localBundle.getString("authtoken");
    label110:
    if (str == null) {
      throw new AuthFailureError("Got null auth token for type: " + this.mAuthTokenType);
    }
    return str;
  }
  
  public String getAuthTokenType()
  {
    return this.mAuthTokenType;
  }
  
  public void invalidateAuthToken(String paramString)
  {
    this.mAccountManager.invalidateAuthToken(this.mAccount.type, paramString);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/android/volley/toolbox/AndroidAuthenticator.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */