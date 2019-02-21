package com.google.android.gms.internal;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.net.LocalSocket;
import android.net.LocalSocketAddress;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcelable;
import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.common.data.d;
import com.google.android.gms.games.GameBuffer;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.OnGamesLoadedListener;
import com.google.android.gms.games.OnPlayersLoadedListener;
import com.google.android.gms.games.OnSignOutCompleteListener;
import com.google.android.gms.games.PlayerBuffer;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.games.RealTimeSocket;
import com.google.android.gms.games.achievement.AchievementBuffer;
import com.google.android.gms.games.achievement.OnAchievementUpdatedListener;
import com.google.android.gms.games.achievement.OnAchievementsLoadedListener;
import com.google.android.gms.games.leaderboard.LeaderboardBuffer;
import com.google.android.gms.games.leaderboard.LeaderboardScoreBuffer;
import com.google.android.gms.games.leaderboard.OnLeaderboardMetadataLoadedListener;
import com.google.android.gms.games.leaderboard.OnLeaderboardScoresLoadedListener;
import com.google.android.gms.games.leaderboard.OnScoreSubmittedListener;
import com.google.android.gms.games.leaderboard.SubmitScoreResult;
import com.google.android.gms.games.leaderboard.b;
import com.google.android.gms.games.multiplayer.Invitation;
import com.google.android.gms.games.multiplayer.InvitationBuffer;
import com.google.android.gms.games.multiplayer.OnInvitationReceivedListener;
import com.google.android.gms.games.multiplayer.OnInvitationsLoadedListener;
import com.google.android.gms.games.multiplayer.ParticipantUtils;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMessage;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMessageReceivedListener;
import com.google.android.gms.games.multiplayer.realtime.RealTimeReliableMessageSentListener;
import com.google.android.gms.games.multiplayer.realtime.Room;
import com.google.android.gms.games.multiplayer.realtime.RoomConfig;
import com.google.android.gms.games.multiplayer.realtime.RoomStatusUpdateListener;
import com.google.android.gms.games.multiplayer.realtime.RoomUpdateListener;
import com.google.android.gms.games.multiplayer.realtime.a;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

public final class au
  extends k<az>
{
  private final Map<String, bb> dA;
  private PlayerEntity dB;
  private GameEntity dC;
  private final ba dD;
  private boolean dE = false;
  private final Binder dF;
  private final long dG;
  private final boolean dH;
  private final String dz;
  private final String g;
  
  public au(Context paramContext, String paramString1, String paramString2, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener, String[] paramArrayOfString, int paramInt, View paramView, boolean paramBoolean)
  {
    super(paramContext, paramConnectionCallbacks, paramOnConnectionFailedListener, paramArrayOfString);
    this.dz = paramString1;
    this.g = ((String)s.d(paramString2));
    this.dF = new Binder();
    this.dA = new HashMap();
    this.dD = ba.a(this, paramInt);
    setViewForPopups(paramView);
    this.dG = hashCode();
    this.dH = paramBoolean;
  }
  
  private void av()
  {
    this.dB = null;
  }
  
  private void aw()
  {
    Iterator localIterator = this.dA.values().iterator();
    while (localIterator.hasNext())
    {
      bb localbb = (bb)localIterator.next();
      try
      {
        localbb.close();
      }
      catch (IOException localIOException)
      {
        ax.a("GamesClient", "IOException:", localIOException);
      }
    }
    this.dA.clear();
  }
  
  private bb t(String paramString)
  {
    try
    {
      String str = ((az)C()).v(paramString);
      if (str == null) {
        return null;
      }
      ax.d("GamesClient", "Creating a socket to bind to:" + str);
      LocalSocket localLocalSocket = new LocalSocket();
      bb localbb;
      return null;
    }
    catch (RemoteException localRemoteException)
    {
      try
      {
        localLocalSocket.connect(new LocalSocketAddress(str));
        localbb = new bb(localLocalSocket, paramString);
        this.dA.put(paramString, localbb);
        return localbb;
      }
      catch (IOException localIOException)
      {
        ax.c("GamesClient", "connect() call failed on socket: " + localIOException.getMessage());
      }
      localRemoteException = localRemoteException;
      ax.c("GamesClient", "Unable to create socket. Service died.");
      return null;
    }
  }
  
  private Room x(d paramd)
  {
    a locala = new a(paramd);
    try
    {
      int i = locala.getCount();
      Room localRoom = null;
      if (i > 0) {
        localRoom = (Room)((Room)locala.get(0)).freeze();
      }
      return localRoom;
    }
    finally
    {
      locala.close();
    }
  }
  
  public int a(byte[] paramArrayOfByte, String paramString, String[] paramArrayOfString)
  {
    s.b(paramArrayOfString, "Participant IDs must not be null");
    try
    {
      int i = ((az)C()).b(paramArrayOfByte, paramString, paramArrayOfString);
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
    return -1;
  }
  
  protected void a(int paramInt, IBinder paramIBinder, Bundle paramBundle)
  {
    if ((paramInt == 0) && (paramBundle != null)) {
      this.dE = paramBundle.getBoolean("show_welcome_popup");
    }
    super.a(paramInt, paramIBinder, paramBundle);
  }
  
  public void a(IBinder paramIBinder, Bundle paramBundle)
  {
    if (isConnected()) {}
    try
    {
      ((az)C()).a(paramIBinder, paramBundle);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  protected void a(ConnectionResult paramConnectionResult)
  {
    super.a(paramConnectionResult);
    this.dE = false;
  }
  
  public void a(OnPlayersLoadedListener paramOnPlayersLoadedListener, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    try
    {
      ((az)C()).a(new ae(paramOnPlayersLoadedListener), paramInt, paramBoolean1, paramBoolean2);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void a(OnAchievementUpdatedListener paramOnAchievementUpdatedListener, String paramString)
  {
    if (paramOnAchievementUpdatedListener == null) {}
    for (Object localObject = null;; localObject = locald)
    {
      try
      {
        ((az)C()).a((ay)localObject, paramString, this.dD.aD(), this.dD.aC());
        return;
      }
      catch (RemoteException localRemoteException)
      {
        d locald;
        ax.b("GamesClient", "service died");
      }
      locald = new d(paramOnAchievementUpdatedListener);
    }
  }
  
  public void a(OnAchievementUpdatedListener paramOnAchievementUpdatedListener, String paramString, int paramInt)
  {
    if (paramOnAchievementUpdatedListener == null) {}
    for (Object localObject = null;; localObject = new d(paramOnAchievementUpdatedListener)) {
      try
      {
        ((az)C()).a((ay)localObject, paramString, paramInt, this.dD.aD(), this.dD.aC());
        return;
      }
      catch (RemoteException localRemoteException)
      {
        ax.b("GamesClient", "service died");
      }
    }
  }
  
  public void a(OnScoreSubmittedListener paramOnScoreSubmittedListener, String paramString, long paramLong)
  {
    if (paramOnScoreSubmittedListener == null) {}
    for (Object localObject = null;; localObject = localap)
    {
      try
      {
        ((az)C()).a((ay)localObject, paramString, paramLong);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        ap localap;
        ax.b("GamesClient", "service died");
      }
      localap = new ap(paramOnScoreSubmittedListener);
    }
  }
  
  protected void a(p paramp, k.d paramd)
    throws RemoteException
  {
    String str = getContext().getResources().getConfiguration().locale.toString();
    Bundle localBundle = new Bundle();
    localBundle.putBoolean("com.google.android.gms.games.key.isHeadless", this.dH);
    paramp.a(paramd, 3265100, getContext().getPackageName(), this.g, x(), this.dz, this.dD.aD(), str, localBundle);
  }
  
  protected void a(String... paramVarArgs)
  {
    int i = 0;
    int j = 0;
    boolean bool1 = false;
    if (i < paramVarArgs.length)
    {
      String str = paramVarArgs[i];
      if (str.equals("https://www.googleapis.com/auth/games")) {
        bool1 = true;
      }
      for (;;)
      {
        i++;
        break;
        if (str.equals("https://www.googleapis.com/auth/games.firstparty")) {
          j = 1;
        }
      }
    }
    if (j != 0)
    {
      if (!bool1) {}
      for (boolean bool2 = true;; bool2 = false)
      {
        s.a(bool2, String.format("Cannot have both %s and %s!", new Object[] { "https://www.googleapis.com/auth/games", "https://www.googleapis.com/auth/games.firstparty" }));
        return;
      }
    }
    s.a(bool1, String.format("GamesClient requires %s to function.", new Object[] { "https://www.googleapis.com/auth/games" }));
  }
  
  public void ax()
  {
    if (isConnected()) {}
    try
    {
      ((az)C()).ax();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  protected String b()
  {
    return "com.google.android.gms.games.service.START";
  }
  
  public void b(OnAchievementUpdatedListener paramOnAchievementUpdatedListener, String paramString)
  {
    if (paramOnAchievementUpdatedListener == null) {}
    for (Object localObject = null;; localObject = locald)
    {
      try
      {
        ((az)C()).b((ay)localObject, paramString, this.dD.aD(), this.dD.aC());
        return;
      }
      catch (RemoteException localRemoteException)
      {
        d locald;
        ax.b("GamesClient", "service died");
      }
      locald = new d(paramOnAchievementUpdatedListener);
    }
  }
  
  protected String c()
  {
    return "com.google.android.gms.games.internal.IGamesService";
  }
  
  public void clearNotifications(int paramInt)
  {
    try
    {
      ((az)C()).clearNotifications(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void connect()
  {
    av();
    super.connect();
  }
  
  public void createRoom(RoomConfig paramRoomConfig)
  {
    try
    {
      aj localaj = new aj(paramRoomConfig.getRoomUpdateListener(), paramRoomConfig.getRoomStatusUpdateListener(), paramRoomConfig.getMessageReceivedListener());
      ((az)C()).a(localaj, this.dF, paramRoomConfig.getVariant(), paramRoomConfig.getInvitedPlayerIds(), paramRoomConfig.getAutoMatchCriteria(), paramRoomConfig.isSocketEnabled(), this.dG);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void disconnect()
  {
    this.dE = false;
    if (isConnected()) {}
    try
    {
      az localaz = (az)C();
      localaz.ax();
      localaz.b(this.dG);
      localaz.a(this.dG);
      aw();
      super.disconnect();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      for (;;)
      {
        ax.b("GamesClient", "Failed to notify client disconnect.");
      }
    }
  }
  
  public Intent getAchievementsIntent()
  {
    B();
    Intent localIntent = new Intent("com.google.android.gms.games.VIEW_ACHIEVEMENTS");
    localIntent.addFlags(67108864);
    return aw.b(localIntent);
  }
  
  public Intent getAllLeaderboardsIntent()
  {
    B();
    Intent localIntent = new Intent("com.google.android.gms.games.VIEW_LEADERBOARDS");
    localIntent.putExtra("com.google.android.gms.games.GAME_PACKAGE_NAME", this.dz);
    localIntent.addFlags(67108864);
    return aw.b(localIntent);
  }
  
  public String getAppId()
  {
    try
    {
      String str = ((az)C()).getAppId();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
    return null;
  }
  
  public String getCurrentAccountName()
  {
    try
    {
      String str = ((az)C()).getCurrentAccountName();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
    return null;
  }
  
  /* Error */
  public com.google.android.gms.games.Game getCurrentGame()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 415	com/google/android/gms/internal/au:B	()V
    //   4: aload_0
    //   5: monitorenter
    //   6: aload_0
    //   7: getfield 449	com/google/android/gms/internal/au:dC	Lcom/google/android/gms/games/GameEntity;
    //   10: astore_2
    //   11: aload_2
    //   12: ifnonnull +51 -> 63
    //   15: new 451	com/google/android/gms/games/GameBuffer
    //   18: dup
    //   19: aload_0
    //   20: invokevirtual 135	com/google/android/gms/internal/au:C	()Landroid/os/IInterface;
    //   23: checkcast 137	com/google/android/gms/internal/az
    //   26: invokeinterface 455 1 0
    //   31: invokespecial 456	com/google/android/gms/games/GameBuffer:<init>	(Lcom/google/android/gms/common/data/d;)V
    //   34: astore_3
    //   35: aload_3
    //   36: invokevirtual 457	com/google/android/gms/games/GameBuffer:getCount	()I
    //   39: ifle +20 -> 59
    //   42: aload_0
    //   43: aload_3
    //   44: iconst_0
    //   45: invokevirtual 460	com/google/android/gms/games/GameBuffer:get	(I)Lcom/google/android/gms/games/Game;
    //   48: invokeinterface 463 1 0
    //   53: checkcast 465	com/google/android/gms/games/GameEntity
    //   56: putfield 449	com/google/android/gms/internal/au:dC	Lcom/google/android/gms/games/GameEntity;
    //   59: aload_3
    //   60: invokevirtual 466	com/google/android/gms/games/GameBuffer:close	()V
    //   63: aload_0
    //   64: monitorexit
    //   65: aload_0
    //   66: getfield 449	com/google/android/gms/internal/au:dC	Lcom/google/android/gms/games/GameEntity;
    //   69: areturn
    //   70: astore 4
    //   72: aload_3
    //   73: invokevirtual 466	com/google/android/gms/games/GameBuffer:close	()V
    //   76: aload 4
    //   78: athrow
    //   79: astore 5
    //   81: ldc 117
    //   83: ldc -42
    //   85: invokestatic 216	com/google/android/gms/internal/ax:b	(Ljava/lang/String;Ljava/lang/String;)V
    //   88: goto -25 -> 63
    //   91: astore_1
    //   92: aload_0
    //   93: monitorexit
    //   94: aload_1
    //   95: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	96	0	this	au
    //   91	4	1	localObject1	Object
    //   10	2	2	localGameEntity	GameEntity
    //   34	39	3	localGameBuffer	GameBuffer
    //   70	7	4	localObject2	Object
    //   79	1	5	localRemoteException	RemoteException
    // Exception table:
    //   from	to	target	type
    //   35	59	70	finally
    //   15	35	79	android/os/RemoteException
    //   59	63	79	android/os/RemoteException
    //   72	79	79	android/os/RemoteException
    //   6	11	91	finally
    //   15	35	91	finally
    //   59	63	91	finally
    //   63	65	91	finally
    //   72	79	91	finally
    //   81	88	91	finally
    //   92	94	91	finally
  }
  
  /* Error */
  public com.google.android.gms.games.Player getCurrentPlayer()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 415	com/google/android/gms/internal/au:B	()V
    //   4: aload_0
    //   5: monitorenter
    //   6: aload_0
    //   7: getfield 85	com/google/android/gms/internal/au:dB	Lcom/google/android/gms/games/PlayerEntity;
    //   10: astore_2
    //   11: aload_2
    //   12: ifnonnull +51 -> 63
    //   15: new 470	com/google/android/gms/games/PlayerBuffer
    //   18: dup
    //   19: aload_0
    //   20: invokevirtual 135	com/google/android/gms/internal/au:C	()Landroid/os/IInterface;
    //   23: checkcast 137	com/google/android/gms/internal/az
    //   26: invokeinterface 473 1 0
    //   31: invokespecial 474	com/google/android/gms/games/PlayerBuffer:<init>	(Lcom/google/android/gms/common/data/d;)V
    //   34: astore_3
    //   35: aload_3
    //   36: invokevirtual 475	com/google/android/gms/games/PlayerBuffer:getCount	()I
    //   39: ifle +20 -> 59
    //   42: aload_0
    //   43: aload_3
    //   44: iconst_0
    //   45: invokevirtual 478	com/google/android/gms/games/PlayerBuffer:get	(I)Lcom/google/android/gms/games/Player;
    //   48: invokeinterface 481 1 0
    //   53: checkcast 483	com/google/android/gms/games/PlayerEntity
    //   56: putfield 85	com/google/android/gms/internal/au:dB	Lcom/google/android/gms/games/PlayerEntity;
    //   59: aload_3
    //   60: invokevirtual 484	com/google/android/gms/games/PlayerBuffer:close	()V
    //   63: aload_0
    //   64: monitorexit
    //   65: aload_0
    //   66: getfield 85	com/google/android/gms/internal/au:dB	Lcom/google/android/gms/games/PlayerEntity;
    //   69: areturn
    //   70: astore 4
    //   72: aload_3
    //   73: invokevirtual 484	com/google/android/gms/games/PlayerBuffer:close	()V
    //   76: aload 4
    //   78: athrow
    //   79: astore 5
    //   81: ldc 117
    //   83: ldc -42
    //   85: invokestatic 216	com/google/android/gms/internal/ax:b	(Ljava/lang/String;Ljava/lang/String;)V
    //   88: goto -25 -> 63
    //   91: astore_1
    //   92: aload_0
    //   93: monitorexit
    //   94: aload_1
    //   95: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	96	0	this	au
    //   91	4	1	localObject1	Object
    //   10	2	2	localPlayerEntity	PlayerEntity
    //   34	39	3	localPlayerBuffer	PlayerBuffer
    //   70	7	4	localObject2	Object
    //   79	1	5	localRemoteException	RemoteException
    // Exception table:
    //   from	to	target	type
    //   35	59	70	finally
    //   15	35	79	android/os/RemoteException
    //   59	63	79	android/os/RemoteException
    //   72	79	79	android/os/RemoteException
    //   6	11	91	finally
    //   15	35	91	finally
    //   59	63	91	finally
    //   63	65	91	finally
    //   72	79	91	finally
    //   81	88	91	finally
    //   92	94	91	finally
  }
  
  public String getCurrentPlayerId()
  {
    try
    {
      String str = ((az)C()).getCurrentPlayerId();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
    return null;
  }
  
  public Intent getInvitationInboxIntent()
  {
    B();
    Intent localIntent = new Intent("com.google.android.gms.games.SHOW_INVITATIONS");
    localIntent.putExtra("com.google.android.gms.games.GAME_PACKAGE_NAME", this.dz);
    return aw.b(localIntent);
  }
  
  public Intent getLeaderboardIntent(String paramString)
  {
    B();
    Intent localIntent = new Intent("com.google.android.gms.games.VIEW_LEADERBOARD_SCORES");
    localIntent.putExtra("com.google.android.gms.games.LEADERBOARD_ID", paramString);
    localIntent.addFlags(67108864);
    return aw.b(localIntent);
  }
  
  public RealTimeSocket getRealTimeSocketForParticipant(String paramString1, String paramString2)
  {
    if ((paramString2 == null) || (!ParticipantUtils.z(paramString2))) {
      throw new IllegalArgumentException("Bad participant ID");
    }
    bb localbb = (bb)this.dA.get(paramString2);
    if ((localbb == null) || (localbb.isClosed())) {
      localbb = t(paramString2);
    }
    return localbb;
  }
  
  public Intent getRealTimeWaitingRoomIntent(Room paramRoom, int paramInt)
  {
    B();
    Intent localIntent = new Intent("com.google.android.gms.games.SHOW_REAL_TIME_WAITING_ROOM");
    s.b(paramRoom, "Room parameter must not be null");
    localIntent.putExtra("room", (Parcelable)paramRoom.freeze());
    if (paramInt >= 0) {}
    for (boolean bool = true;; bool = false)
    {
      s.a(bool, "minParticipantsToStart must be >= 0");
      localIntent.putExtra("com.google.android.gms.games.MIN_PARTICIPANTS_TO_START", paramInt);
      return aw.b(localIntent);
    }
  }
  
  public Intent getSelectPlayersIntent(int paramInt1, int paramInt2)
  {
    B();
    Intent localIntent = new Intent("com.google.android.gms.games.SELECT_PLAYERS");
    localIntent.putExtra("com.google.android.gms.games.MIN_SELECTIONS", paramInt1);
    localIntent.putExtra("com.google.android.gms.games.MAX_SELECTIONS", paramInt2);
    return aw.b(localIntent);
  }
  
  public Intent getSettingsIntent()
  {
    B();
    Intent localIntent = new Intent("com.google.android.gms.games.SHOW_SETTINGS");
    localIntent.putExtra("com.google.android.gms.games.GAME_PACKAGE_NAME", this.dz);
    localIntent.addFlags(67108864);
    return aw.b(localIntent);
  }
  
  public void h(String paramString, int paramInt)
  {
    try
    {
      ((az)C()).h(paramString, paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void i(String paramString, int paramInt)
  {
    try
    {
      ((az)C()).i(paramString, paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void joinRoom(RoomConfig paramRoomConfig)
  {
    try
    {
      aj localaj = new aj(paramRoomConfig.getRoomUpdateListener(), paramRoomConfig.getRoomStatusUpdateListener(), paramRoomConfig.getMessageReceivedListener());
      ((az)C()).a(localaj, this.dF, paramRoomConfig.getInvitationId(), paramRoomConfig.isSocketEnabled(), this.dG);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void leaveRoom(RoomUpdateListener paramRoomUpdateListener, String paramString)
  {
    try
    {
      ((az)C()).e(new aj(paramRoomUpdateListener), paramString);
      aw();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void loadAchievements(OnAchievementsLoadedListener paramOnAchievementsLoadedListener, boolean paramBoolean)
  {
    try
    {
      ((az)C()).b(new f(paramOnAchievementsLoadedListener), paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void loadGame(OnGamesLoadedListener paramOnGamesLoadedListener)
  {
    try
    {
      ((az)C()).d(new j(paramOnGamesLoadedListener));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void loadInvitations(OnInvitationsLoadedListener paramOnInvitationsLoadedListener)
  {
    try
    {
      ((az)C()).e(new n(paramOnInvitationsLoadedListener));
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void loadLeaderboardMetadata(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener, String paramString, boolean paramBoolean)
  {
    try
    {
      ((az)C()).c(new s(paramOnLeaderboardMetadataLoadedListener), paramString, paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void loadLeaderboardMetadata(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener, boolean paramBoolean)
  {
    try
    {
      ((az)C()).c(new s(paramOnLeaderboardMetadataLoadedListener), paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void loadMoreScores(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, LeaderboardScoreBuffer paramLeaderboardScoreBuffer, int paramInt1, int paramInt2)
  {
    try
    {
      ((az)C()).a(new q(paramOnLeaderboardScoresLoadedListener), paramLeaderboardScoreBuffer.aF().aG(), paramInt1, paramInt2);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void loadPlayer(OnPlayersLoadedListener paramOnPlayersLoadedListener, String paramString)
  {
    try
    {
      ((az)C()).c(new ae(paramOnPlayersLoadedListener), paramString);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void loadPlayerCenteredScores(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    try
    {
      ((az)C()).b(new q(paramOnLeaderboardScoresLoadedListener), paramString, paramInt1, paramInt2, paramInt3, paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void loadTopScores(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    try
    {
      ((az)C()).a(new q(paramOnLeaderboardScoresLoadedListener), paramString, paramInt1, paramInt2, paramInt3, paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  protected az m(IBinder paramIBinder)
  {
    return az.a.o(paramIBinder);
  }
  
  public void registerInvitationListener(OnInvitationReceivedListener paramOnInvitationReceivedListener)
  {
    try
    {
      l locall = new l(paramOnInvitationReceivedListener);
      ((az)C()).a(locall, this.dG);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public int sendReliableRealTimeMessage(RealTimeReliableMessageSentListener paramRealTimeReliableMessageSentListener, byte[] paramArrayOfByte, String paramString1, String paramString2)
  {
    try
    {
      int i = ((az)C()).a(new ah(paramRealTimeReliableMessageSentListener), paramArrayOfByte, paramString1, paramString2);
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
    return -1;
  }
  
  public int sendUnreliableRealTimeMessageToAll(byte[] paramArrayOfByte, String paramString)
  {
    try
    {
      int i = ((az)C()).b(paramArrayOfByte, paramString, null);
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
    return -1;
  }
  
  public void setGravityForPopups(int paramInt)
  {
    this.dD.setGravity(paramInt);
  }
  
  public void setUseNewPlayerNotificationsFirstParty(boolean paramBoolean)
  {
    try
    {
      ((az)C()).setUseNewPlayerNotificationsFirstParty(paramBoolean);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  public void setViewForPopups(View paramView)
  {
    this.dD.a(paramView);
  }
  
  public void signOut(OnSignOutCompleteListener paramOnSignOutCompleteListener)
  {
    if (paramOnSignOutCompleteListener == null) {}
    for (Object localObject = null;; localObject = localan)
    {
      try
      {
        ((az)C()).a((ay)localObject);
        return;
      }
      catch (RemoteException localRemoteException)
      {
        an localan;
        ax.b("GamesClient", "service died");
      }
      localan = new an(paramOnSignOutCompleteListener);
    }
  }
  
  public void unregisterInvitationListener()
  {
    try
    {
      ((az)C()).b(this.dG);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
  }
  
  protected void y()
  {
    super.y();
    if (this.dE)
    {
      this.dD.aB();
      this.dE = false;
    }
  }
  
  protected Bundle z()
  {
    try
    {
      Bundle localBundle = ((az)C()).z();
      if (localBundle != null) {
        localBundle.setClassLoader(au.class.getClassLoader());
      }
      return localBundle;
    }
    catch (RemoteException localRemoteException)
    {
      ax.b("GamesClient", "service died");
    }
    return null;
  }
  
  abstract class a
    extends au.c
  {
    private final ArrayList<String> dI = new ArrayList();
    
    a(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd, String[] paramArrayOfString)
    {
      super(paramRoomStatusUpdateListener, paramd);
      int i = 0;
      int j = paramArrayOfString.length;
      while (i < j)
      {
        this.dI.add(paramArrayOfString[i]);
        i++;
      }
    }
    
    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      a(paramRoomStatusUpdateListener, paramRoom, this.dI);
    }
    
    protected abstract void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList);
  }
  
  final class aa
    extends au.a
  {
    aa(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd, String[] paramArrayOfString)
    {
      super(paramRoomStatusUpdateListener, paramd, paramArrayOfString);
    }
    
    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeersDisconnected(paramRoom, paramArrayList);
    }
  }
  
  final class ab
    extends au.a
  {
    ab(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd, String[] paramArrayOfString)
    {
      super(paramRoomStatusUpdateListener, paramd, paramArrayOfString);
    }
    
    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeerInvitedToRoom(paramRoom, paramArrayList);
    }
  }
  
  final class ac
    extends au.a
  {
    ac(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd, String[] paramArrayOfString)
    {
      super(paramRoomStatusUpdateListener, paramd, paramArrayOfString);
    }
    
    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeerJoined(paramRoom, paramArrayList);
    }
  }
  
  final class ad
    extends au.a
  {
    ad(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd, String[] paramArrayOfString)
    {
      super(paramRoomStatusUpdateListener, paramd, paramArrayOfString);
    }
    
    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeerLeft(paramRoom, paramArrayList);
    }
  }
  
  final class ae
    extends at
  {
    private final OnPlayersLoadedListener dY;
    
    ae(OnPlayersLoadedListener paramOnPlayersLoadedListener)
    {
      this.dY = ((OnPlayersLoadedListener)s.b(paramOnPlayersLoadedListener, "Listener must not be null"));
    }
    
    public void e(d paramd)
    {
      au.this.a(new au.af(au.this, this.dY, paramd));
    }
  }
  
  final class af
    extends k<az>.c<OnPlayersLoadedListener>
  {
    af(OnPlayersLoadedListener paramOnPlayersLoadedListener, d paramd)
    {
      super(paramOnPlayersLoadedListener, paramd);
    }
    
    protected void a(OnPlayersLoadedListener paramOnPlayersLoadedListener, d paramd)
    {
      paramOnPlayersLoadedListener.onPlayersLoaded(paramd.getStatusCode(), new PlayerBuffer(paramd));
    }
  }
  
  final class ag
    extends k<az>.b<RealTimeReliableMessageSentListener>
  {
    private final String dZ;
    private final int ea;
    private final int p;
    
    ag(RealTimeReliableMessageSentListener paramRealTimeReliableMessageSentListener, int paramInt1, int paramInt2, String paramString)
    {
      super(paramRealTimeReliableMessageSentListener);
      this.p = paramInt1;
      this.ea = paramInt2;
      this.dZ = paramString;
    }
    
    public void a(RealTimeReliableMessageSentListener paramRealTimeReliableMessageSentListener)
    {
      if (paramRealTimeReliableMessageSentListener != null) {
        paramRealTimeReliableMessageSentListener.onRealTimeMessageSent(this.p, this.ea, this.dZ);
      }
    }
    
    protected void d() {}
  }
  
  final class ah
    extends at
  {
    final RealTimeReliableMessageSentListener eb;
    
    public ah(RealTimeReliableMessageSentListener paramRealTimeReliableMessageSentListener)
    {
      this.eb = paramRealTimeReliableMessageSentListener;
    }
    
    public void a(int paramInt1, int paramInt2, String paramString)
    {
      au.this.a(new au.ag(au.this, this.eb, paramInt1, paramInt2, paramString));
    }
  }
  
  final class ai
    extends au.c
  {
    ai(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd)
    {
      super(paramRoomStatusUpdateListener, paramd);
    }
    
    public void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      paramRoomStatusUpdateListener.onRoomAutoMatching(paramRoom);
    }
  }
  
  final class aj
    extends at
  {
    private final RoomUpdateListener ec;
    private final RoomStatusUpdateListener ed;
    private final RealTimeMessageReceivedListener ee;
    
    public aj(RoomUpdateListener paramRoomUpdateListener)
    {
      this.ec = ((RoomUpdateListener)s.b(paramRoomUpdateListener, "Callbacks must not be null"));
      this.ed = null;
      this.ee = null;
    }
    
    public aj(RoomUpdateListener paramRoomUpdateListener, RoomStatusUpdateListener paramRoomStatusUpdateListener, RealTimeMessageReceivedListener paramRealTimeMessageReceivedListener)
    {
      this.ec = ((RoomUpdateListener)s.b(paramRoomUpdateListener, "Callbacks must not be null"));
      this.ed = paramRoomStatusUpdateListener;
      this.ee = paramRealTimeMessageReceivedListener;
    }
    
    public void a(d paramd, String[] paramArrayOfString)
    {
      au.this.a(new au.ab(au.this, this.ed, paramd, paramArrayOfString));
    }
    
    public void b(d paramd, String[] paramArrayOfString)
    {
      au.this.a(new au.ac(au.this, this.ed, paramd, paramArrayOfString));
    }
    
    public void c(d paramd, String[] paramArrayOfString)
    {
      au.this.a(new au.ad(au.this, this.ed, paramd, paramArrayOfString));
    }
    
    public void d(d paramd, String[] paramArrayOfString)
    {
      au.this.a(new au.z(au.this, this.ed, paramd, paramArrayOfString));
    }
    
    public void e(d paramd, String[] paramArrayOfString)
    {
      au.this.a(new au.y(au.this, this.ed, paramd, paramArrayOfString));
    }
    
    public void f(d paramd, String[] paramArrayOfString)
    {
      au.this.a(new au.aa(au.this, this.ed, paramd, paramArrayOfString));
    }
    
    public void n(d paramd)
    {
      au.this.a(new au.am(au.this, this.ec, paramd));
    }
    
    public void o(d paramd)
    {
      au.this.a(new au.p(au.this, this.ec, paramd));
    }
    
    public void onLeftRoom(int paramInt, String paramString)
    {
      au.this.a(new au.u(au.this, this.ec, paramInt, paramString));
    }
    
    public void onP2PConnected(String paramString)
    {
      au.this.a(new au.w(au.this, this.ed, paramString));
    }
    
    public void onP2PDisconnected(String paramString)
    {
      au.this.a(new au.x(au.this, this.ed, paramString));
    }
    
    public void onRealTimeMessageReceived(RealTimeMessage paramRealTimeMessage)
    {
      ax.a("GamesClient", "RoomBinderCallbacks: onRealTimeMessageReceived");
      au.this.a(new au.v(au.this, this.ee, paramRealTimeMessage));
    }
    
    public void p(d paramd)
    {
      au.this.a(new au.al(au.this, this.ed, paramd));
    }
    
    public void q(d paramd)
    {
      au.this.a(new au.ai(au.this, this.ed, paramd));
    }
    
    public void r(d paramd)
    {
      au.this.a(new au.ak(au.this, this.ec, paramd));
    }
    
    public void s(d paramd)
    {
      au.this.a(new au.h(au.this, this.ed, paramd));
    }
    
    public void t(d paramd)
    {
      au.this.a(new au.i(au.this, this.ed, paramd));
    }
  }
  
  final class ak
    extends au.b
  {
    ak(RoomUpdateListener paramRoomUpdateListener, d paramd)
    {
      super(paramRoomUpdateListener, paramd);
    }
    
    public void a(RoomUpdateListener paramRoomUpdateListener, Room paramRoom, int paramInt)
    {
      paramRoomUpdateListener.onRoomConnected(paramInt, paramRoom);
    }
  }
  
  final class al
    extends au.c
  {
    al(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd)
    {
      super(paramRoomStatusUpdateListener, paramd);
    }
    
    public void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      paramRoomStatusUpdateListener.onRoomConnecting(paramRoom);
    }
  }
  
  final class am
    extends au.b
  {
    public am(RoomUpdateListener paramRoomUpdateListener, d paramd)
    {
      super(paramRoomUpdateListener, paramd);
    }
    
    public void a(RoomUpdateListener paramRoomUpdateListener, Room paramRoom, int paramInt)
    {
      paramRoomUpdateListener.onRoomCreated(paramInt, paramRoom);
    }
  }
  
  final class an
    extends at
  {
    private final OnSignOutCompleteListener ef;
    
    public an(OnSignOutCompleteListener paramOnSignOutCompleteListener)
    {
      this.ef = ((OnSignOutCompleteListener)s.b(paramOnSignOutCompleteListener, "Listener must not be null"));
    }
    
    public void onSignOutComplete()
    {
      au.this.a(new au.ao(au.this, this.ef));
    }
  }
  
  final class ao
    extends k<az>.b<OnSignOutCompleteListener>
  {
    public ao(OnSignOutCompleteListener paramOnSignOutCompleteListener)
    {
      super(paramOnSignOutCompleteListener);
    }
    
    public void a(OnSignOutCompleteListener paramOnSignOutCompleteListener)
    {
      paramOnSignOutCompleteListener.onSignOutComplete();
    }
    
    protected void d() {}
  }
  
  final class ap
    extends at
  {
    private final OnScoreSubmittedListener eg;
    
    public ap(OnScoreSubmittedListener paramOnScoreSubmittedListener)
    {
      this.eg = ((OnScoreSubmittedListener)s.b(paramOnScoreSubmittedListener, "Listener must not be null"));
    }
    
    public void d(d paramd)
    {
      SubmitScoreResult localSubmitScoreResult = new SubmitScoreResult(paramd);
      au.this.a(new au.aq(au.this, this.eg, localSubmitScoreResult));
    }
  }
  
  final class aq
    extends k<az>.b<OnScoreSubmittedListener>
  {
    private final SubmitScoreResult eh;
    
    public aq(OnScoreSubmittedListener paramOnScoreSubmittedListener, SubmitScoreResult paramSubmitScoreResult)
    {
      super(paramOnScoreSubmittedListener);
      this.eh = paramSubmitScoreResult;
    }
    
    public void a(OnScoreSubmittedListener paramOnScoreSubmittedListener)
    {
      paramOnScoreSubmittedListener.onScoreSubmitted(this.eh.getStatusCode(), this.eh);
    }
    
    protected void d() {}
  }
  
  abstract class b
    extends k<az>.c<RoomUpdateListener>
  {
    b(RoomUpdateListener paramRoomUpdateListener, d paramd)
    {
      super(paramRoomUpdateListener, paramd);
    }
    
    protected void a(RoomUpdateListener paramRoomUpdateListener, d paramd)
    {
      a(paramRoomUpdateListener, au.a(au.this, paramd), paramd.getStatusCode());
    }
    
    protected abstract void a(RoomUpdateListener paramRoomUpdateListener, Room paramRoom, int paramInt);
  }
  
  abstract class c
    extends k<az>.c<RoomStatusUpdateListener>
  {
    c(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd)
    {
      super(paramRoomStatusUpdateListener, paramd);
    }
    
    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd)
    {
      a(paramRoomStatusUpdateListener, au.a(au.this, paramd));
    }
    
    protected abstract void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom);
  }
  
  final class d
    extends at
  {
    private final OnAchievementUpdatedListener dK;
    
    d(OnAchievementUpdatedListener paramOnAchievementUpdatedListener)
    {
      this.dK = ((OnAchievementUpdatedListener)s.b(paramOnAchievementUpdatedListener, "Listener must not be null"));
    }
    
    public void onAchievementUpdated(int paramInt, String paramString)
    {
      au.this.a(new au.e(au.this, this.dK, paramInt, paramString));
    }
  }
  
  final class e
    extends k<az>.b<OnAchievementUpdatedListener>
  {
    private final String dL;
    private final int p;
    
    e(OnAchievementUpdatedListener paramOnAchievementUpdatedListener, int paramInt, String paramString)
    {
      super(paramOnAchievementUpdatedListener);
      this.p = paramInt;
      this.dL = paramString;
    }
    
    protected void a(OnAchievementUpdatedListener paramOnAchievementUpdatedListener)
    {
      paramOnAchievementUpdatedListener.onAchievementUpdated(this.p, this.dL);
    }
    
    protected void d() {}
  }
  
  final class f
    extends at
  {
    private final OnAchievementsLoadedListener dM;
    
    f(OnAchievementsLoadedListener paramOnAchievementsLoadedListener)
    {
      this.dM = ((OnAchievementsLoadedListener)s.b(paramOnAchievementsLoadedListener, "Listener must not be null"));
    }
    
    public void b(d paramd)
    {
      au.this.a(new au.g(au.this, this.dM, paramd));
    }
  }
  
  final class g
    extends k<az>.c<OnAchievementsLoadedListener>
  {
    g(OnAchievementsLoadedListener paramOnAchievementsLoadedListener, d paramd)
    {
      super(paramOnAchievementsLoadedListener, paramd);
    }
    
    protected void a(OnAchievementsLoadedListener paramOnAchievementsLoadedListener, d paramd)
    {
      paramOnAchievementsLoadedListener.onAchievementsLoaded(paramd.getStatusCode(), new AchievementBuffer(paramd));
    }
  }
  
  final class h
    extends au.c
  {
    h(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd)
    {
      super(paramRoomStatusUpdateListener, paramd);
    }
    
    public void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      paramRoomStatusUpdateListener.onConnectedToRoom(paramRoom);
    }
  }
  
  final class i
    extends au.c
  {
    i(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd)
    {
      super(paramRoomStatusUpdateListener, paramd);
    }
    
    public void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom)
    {
      paramRoomStatusUpdateListener.onDisconnectedFromRoom(paramRoom);
    }
  }
  
  final class j
    extends at
  {
    private final OnGamesLoadedListener dN;
    
    j(OnGamesLoadedListener paramOnGamesLoadedListener)
    {
      this.dN = ((OnGamesLoadedListener)s.b(paramOnGamesLoadedListener, "Listener must not be null"));
    }
    
    public void g(d paramd)
    {
      au.this.a(new au.k(au.this, this.dN, paramd));
    }
  }
  
  final class k
    extends k<az>.c<OnGamesLoadedListener>
  {
    k(OnGamesLoadedListener paramOnGamesLoadedListener, d paramd)
    {
      super(paramOnGamesLoadedListener, paramd);
    }
    
    protected void a(OnGamesLoadedListener paramOnGamesLoadedListener, d paramd)
    {
      paramOnGamesLoadedListener.onGamesLoaded(paramd.getStatusCode(), new GameBuffer(paramd));
    }
  }
  
  final class l
    extends at
  {
    private final OnInvitationReceivedListener dO;
    
    l(OnInvitationReceivedListener paramOnInvitationReceivedListener)
    {
      this.dO = paramOnInvitationReceivedListener;
    }
    
    public void k(d paramd)
    {
      InvitationBuffer localInvitationBuffer = new InvitationBuffer(paramd);
      try
      {
        int i = localInvitationBuffer.getCount();
        Invitation localInvitation = null;
        if (i > 0) {
          localInvitation = (Invitation)((Invitation)localInvitationBuffer.get(0)).freeze();
        }
        localInvitationBuffer.close();
        if (localInvitation != null) {
          au.this.a(new au.m(au.this, this.dO, localInvitation));
        }
        return;
      }
      finally
      {
        localInvitationBuffer.close();
      }
    }
  }
  
  final class m
    extends k<az>.b<OnInvitationReceivedListener>
  {
    private final Invitation dP;
    
    m(OnInvitationReceivedListener paramOnInvitationReceivedListener, Invitation paramInvitation)
    {
      super(paramOnInvitationReceivedListener);
      this.dP = paramInvitation;
    }
    
    protected void a(OnInvitationReceivedListener paramOnInvitationReceivedListener)
    {
      paramOnInvitationReceivedListener.onInvitationReceived(this.dP);
    }
    
    protected void d() {}
  }
  
  final class n
    extends at
  {
    private final OnInvitationsLoadedListener dQ;
    
    n(OnInvitationsLoadedListener paramOnInvitationsLoadedListener)
    {
      this.dQ = paramOnInvitationsLoadedListener;
    }
    
    public void j(d paramd)
    {
      au.this.a(new au.o(au.this, this.dQ, paramd));
    }
  }
  
  final class o
    extends k<az>.c<OnInvitationsLoadedListener>
  {
    o(OnInvitationsLoadedListener paramOnInvitationsLoadedListener, d paramd)
    {
      super(paramOnInvitationsLoadedListener, paramd);
    }
    
    protected void a(OnInvitationsLoadedListener paramOnInvitationsLoadedListener, d paramd)
    {
      paramOnInvitationsLoadedListener.onInvitationsLoaded(paramd.getStatusCode(), new InvitationBuffer(paramd));
    }
  }
  
  final class p
    extends au.b
  {
    public p(RoomUpdateListener paramRoomUpdateListener, d paramd)
    {
      super(paramRoomUpdateListener, paramd);
    }
    
    public void a(RoomUpdateListener paramRoomUpdateListener, Room paramRoom, int paramInt)
    {
      paramRoomUpdateListener.onJoinedRoom(paramInt, paramRoom);
    }
  }
  
  final class q
    extends at
  {
    private final OnLeaderboardScoresLoadedListener dR;
    
    q(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener)
    {
      this.dR = ((OnLeaderboardScoresLoadedListener)s.b(paramOnLeaderboardScoresLoadedListener, "Listener must not be null"));
    }
    
    public void a(d paramd1, d paramd2)
    {
      au.this.a(new au.r(au.this, this.dR, paramd1, paramd2));
    }
  }
  
  final class r
    extends k<az>.b<OnLeaderboardScoresLoadedListener>
  {
    private final d dS;
    private final d dT;
    
    r(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, d paramd1, d paramd2)
    {
      super(paramOnLeaderboardScoresLoadedListener);
      this.dS = paramd1;
      this.dT = paramd2;
    }
    
    protected void a(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener)
    {
      Object localObject1 = null;
      d locald1 = this.dS;
      d locald2 = this.dT;
      if (paramOnLeaderboardScoresLoadedListener != null) {}
      for (;;)
      {
        try
        {
          LeaderboardBuffer localLeaderboardBuffer = new LeaderboardBuffer(locald1);
          LeaderboardScoreBuffer localLeaderboardScoreBuffer = new LeaderboardScoreBuffer(locald2);
          paramOnLeaderboardScoresLoadedListener.onLeaderboardScoresLoaded(locald2.getStatusCode(), localLeaderboardBuffer, localLeaderboardScoreBuffer);
          locald3 = null;
          if (locald3 != null) {
            locald3.close();
          }
          if (localObject1 != null) {
            ((d)localObject1).close();
          }
          return;
        }
        finally
        {
          if (locald1 != null) {
            locald1.close();
          }
          if (locald2 != null) {
            locald2.close();
          }
        }
        localObject1 = locald2;
        d locald3 = locald1;
      }
    }
    
    protected void d()
    {
      if (this.dS != null) {
        this.dS.close();
      }
      if (this.dT != null) {
        this.dT.close();
      }
    }
  }
  
  final class s
    extends at
  {
    private final OnLeaderboardMetadataLoadedListener dU;
    
    s(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener)
    {
      this.dU = ((OnLeaderboardMetadataLoadedListener)s.b(paramOnLeaderboardMetadataLoadedListener, "Listener must not be null"));
    }
    
    public void c(d paramd)
    {
      au.this.a(new au.t(au.this, this.dU, paramd));
    }
  }
  
  final class t
    extends k<az>.c<OnLeaderboardMetadataLoadedListener>
  {
    t(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener, d paramd)
    {
      super(paramOnLeaderboardMetadataLoadedListener, paramd);
    }
    
    protected void a(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener, d paramd)
    {
      paramOnLeaderboardMetadataLoadedListener.onLeaderboardMetadataLoaded(paramd.getStatusCode(), new LeaderboardBuffer(paramd));
    }
  }
  
  final class u
    extends k<az>.b<RoomUpdateListener>
  {
    private final String dV;
    private final int p;
    
    u(RoomUpdateListener paramRoomUpdateListener, int paramInt, String paramString)
    {
      super(paramRoomUpdateListener);
      this.p = paramInt;
      this.dV = paramString;
    }
    
    public void a(RoomUpdateListener paramRoomUpdateListener)
    {
      paramRoomUpdateListener.onLeftRoom(this.p, this.dV);
    }
    
    protected void d() {}
  }
  
  final class v
    extends k<az>.b<RealTimeMessageReceivedListener>
  {
    private final RealTimeMessage dW;
    
    v(RealTimeMessageReceivedListener paramRealTimeMessageReceivedListener, RealTimeMessage paramRealTimeMessage)
    {
      super(paramRealTimeMessageReceivedListener);
      this.dW = paramRealTimeMessage;
    }
    
    public void a(RealTimeMessageReceivedListener paramRealTimeMessageReceivedListener)
    {
      ax.a("GamesClient", "Deliver Message received callback");
      if (paramRealTimeMessageReceivedListener != null) {
        paramRealTimeMessageReceivedListener.onRealTimeMessageReceived(this.dW);
      }
    }
    
    protected void d() {}
  }
  
  final class w
    extends k<az>.b<RoomStatusUpdateListener>
  {
    private final String dX;
    
    w(RoomStatusUpdateListener paramRoomStatusUpdateListener, String paramString)
    {
      super(paramRoomStatusUpdateListener);
      this.dX = paramString;
    }
    
    public void a(RoomStatusUpdateListener paramRoomStatusUpdateListener)
    {
      if (paramRoomStatusUpdateListener != null) {
        paramRoomStatusUpdateListener.onP2PConnected(this.dX);
      }
    }
    
    protected void d() {}
  }
  
  final class x
    extends k<az>.b<RoomStatusUpdateListener>
  {
    private final String dX;
    
    x(RoomStatusUpdateListener paramRoomStatusUpdateListener, String paramString)
    {
      super(paramRoomStatusUpdateListener);
      this.dX = paramString;
    }
    
    public void a(RoomStatusUpdateListener paramRoomStatusUpdateListener)
    {
      if (paramRoomStatusUpdateListener != null) {
        paramRoomStatusUpdateListener.onP2PDisconnected(this.dX);
      }
    }
    
    protected void d() {}
  }
  
  final class y
    extends au.a
  {
    y(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd, String[] paramArrayOfString)
    {
      super(paramRoomStatusUpdateListener, paramd, paramArrayOfString);
    }
    
    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeersConnected(paramRoom, paramArrayList);
    }
  }
  
  final class z
    extends au.a
  {
    z(RoomStatusUpdateListener paramRoomStatusUpdateListener, d paramd, String[] paramArrayOfString)
    {
      super(paramRoomStatusUpdateListener, paramd, paramArrayOfString);
    }
    
    protected void a(RoomStatusUpdateListener paramRoomStatusUpdateListener, Room paramRoom, ArrayList<String> paramArrayList)
    {
      paramRoomStatusUpdateListener.onPeerDeclined(paramRoom, paramArrayList);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/au.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */