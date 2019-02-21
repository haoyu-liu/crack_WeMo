package org.apache.http.client.params;

import org.apache.http.auth.params.AuthPNames;
import org.apache.http.conn.params.ConnConnectionPNames;
import org.apache.http.conn.params.ConnManagerPNames;
import org.apache.http.conn.params.ConnRoutePNames;
import org.apache.http.cookie.params.CookieSpecPNames;
import org.apache.http.params.CoreProtocolPNames;

@Deprecated
public abstract interface AllClientPNames
  extends CoreProtocolPNames, ClientPNames, AuthPNames, CookieSpecPNames, ConnConnectionPNames, ConnManagerPNames, ConnRoutePNames
{}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/http/client/params/AllClientPNames.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */