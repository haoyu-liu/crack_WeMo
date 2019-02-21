package com.google.android.gms.games;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesClient.ConnectionCallbacks;
import com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener;
import com.google.android.gms.games.achievement.OnAchievementUpdatedListener;
import com.google.android.gms.games.achievement.OnAchievementsLoadedListener;
import com.google.android.gms.games.leaderboard.LeaderboardScoreBuffer;
import com.google.android.gms.games.leaderboard.OnLeaderboardMetadataLoadedListener;
import com.google.android.gms.games.leaderboard.OnLeaderboardScoresLoadedListener;
import com.google.android.gms.games.leaderboard.OnScoreSubmittedListener;
import com.google.android.gms.games.multiplayer.OnInvitationReceivedListener;
import com.google.android.gms.games.multiplayer.OnInvitationsLoadedListener;
import com.google.android.gms.games.multiplayer.realtime.RealTimeReliableMessageSentListener;
import com.google.android.gms.games.multiplayer.realtime.Room;
import com.google.android.gms.games.multiplayer.realtime.RoomConfig;
import com.google.android.gms.games.multiplayer.realtime.RoomUpdateListener;
import com.google.android.gms.internal.au;
import com.google.android.gms.internal.s;
import java.util.List;

public final class GamesClient
  implements GooglePlayServicesClient
{
  public static final String EXTRA_EXCLUSIVE_BIT_MASK = "exclusive_bit_mask";
  public static final String EXTRA_INVITATION = "invitation";
  public static final String EXTRA_MAX_AUTOMATCH_PLAYERS = "max_automatch_players";
  public static final String EXTRA_MIN_AUTOMATCH_PLAYERS = "min_automatch_players";
  public static final String EXTRA_PLAYERS = "players";
  public static final String EXTRA_ROOM = "room";
  public static final int MAX_RELIABLE_MESSAGE_LEN = 1400;
  public static final int MAX_UNRELIABLE_MESSAGE_LEN = 1168;
  public static final int NOTIFICATION_TYPES_ALL = -1;
  public static final int NOTIFICATION_TYPES_MULTIPLAYER = 1;
  public static final int NOTIFICATION_TYPE_INVITATION = 1;
  public static final int STATUS_ACHIEVEMENT_NOT_INCREMENTAL = 3002;
  public static final int STATUS_ACHIEVEMENT_UNKNOWN = 3001;
  public static final int STATUS_ACHIEVEMENT_UNLOCKED = 3003;
  public static final int STATUS_ACHIEVEMENT_UNLOCK_FAILURE = 3000;
  public static final int STATUS_CLIENT_RECONNECT_REQUIRED = 2;
  public static final int STATUS_INTERNAL_ERROR = 1;
  public static final int STATUS_INVALID_REAL_TIME_ROOM_ID = 7002;
  public static final int STATUS_LICENSE_CHECK_FAILED = 7;
  public static final int STATUS_MULTIPLAYER_ERROR_CREATION_NOT_ALLOWED = 6000;
  public static final int STATUS_MULTIPLAYER_ERROR_NOT_TRUSTED_TESTER = 6001;
  public static final int STATUS_NETWORK_ERROR_NO_DATA = 4;
  public static final int STATUS_NETWORK_ERROR_OPERATION_DEFERRED = 5;
  public static final int STATUS_NETWORK_ERROR_OPERATION_FAILED = 6;
  public static final int STATUS_NETWORK_ERROR_STALE_DATA = 3;
  public static final int STATUS_OK = 0;
  public static final int STATUS_PARTICIPANT_NOT_CONNECTED = 7003;
  public static final int STATUS_REAL_TIME_CONNECTION_FAILED = 7000;
  public static final int STATUS_REAL_TIME_INACTIVE_ROOM = 7005;
  public static final int STATUS_REAL_TIME_MESSAGE_FAILED = -1;
  public static final int STATUS_REAL_TIME_MESSAGE_SEND_FAILED = 7001;
  public static final int STATUS_REAL_TIME_ROOM_NOT_JOINED = 7004;
  private final au dt;
  
  private GamesClient(Context paramContext, String paramString1, String paramString2, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener, String[] paramArrayOfString, int paramInt, View paramView)
  {
    this.dt = new au(paramContext, paramString1, paramString2, paramConnectionCallbacks, paramOnConnectionFailedListener, paramArrayOfString, paramInt, paramView, false);
  }
  
  public void clearAllNotifications()
  {
    this.dt.clearNotifications(-1);
  }
  
  public void clearNotifications(int paramInt)
  {
    this.dt.clearNotifications(paramInt);
  }
  
  public void connect()
  {
    this.dt.connect();
  }
  
  public void createRoom(RoomConfig paramRoomConfig)
  {
    this.dt.createRoom(paramRoomConfig);
  }
  
  public void declineRoomInvitation(String paramString)
  {
    this.dt.i(paramString, 0);
  }
  
  public void disconnect()
  {
    this.dt.disconnect();
  }
  
  public void dismissRoomInvitation(String paramString)
  {
    this.dt.h(paramString, 0);
  }
  
  public Intent getAchievementsIntent()
  {
    return this.dt.getAchievementsIntent();
  }
  
  public Intent getAllLeaderboardsIntent()
  {
    return this.dt.getAllLeaderboardsIntent();
  }
  
  public String getAppId()
  {
    return this.dt.getAppId();
  }
  
  public String getCurrentAccountName()
  {
    return this.dt.getCurrentAccountName();
  }
  
  public Game getCurrentGame()
  {
    return this.dt.getCurrentGame();
  }
  
  public Player getCurrentPlayer()
  {
    return this.dt.getCurrentPlayer();
  }
  
  public String getCurrentPlayerId()
  {
    return this.dt.getCurrentPlayerId();
  }
  
  public Intent getInvitationInboxIntent()
  {
    return this.dt.getInvitationInboxIntent();
  }
  
  public Intent getLeaderboardIntent(String paramString)
  {
    return this.dt.getLeaderboardIntent(paramString);
  }
  
  public RealTimeSocket getRealTimeSocketForParticipant(String paramString1, String paramString2)
  {
    return this.dt.getRealTimeSocketForParticipant(paramString1, paramString2);
  }
  
  public Intent getRealTimeWaitingRoomIntent(Room paramRoom, int paramInt)
  {
    return this.dt.getRealTimeWaitingRoomIntent(paramRoom, paramInt);
  }
  
  public Intent getSelectPlayersIntent(int paramInt1, int paramInt2)
  {
    return this.dt.getSelectPlayersIntent(paramInt1, paramInt2);
  }
  
  public Intent getSettingsIntent()
  {
    return this.dt.getSettingsIntent();
  }
  
  public void incrementAchievement(String paramString, int paramInt)
  {
    this.dt.a(null, paramString, paramInt);
  }
  
  public void incrementAchievementImmediate(OnAchievementUpdatedListener paramOnAchievementUpdatedListener, String paramString, int paramInt)
  {
    this.dt.a(paramOnAchievementUpdatedListener, paramString, paramInt);
  }
  
  public boolean isConnected()
  {
    return this.dt.isConnected();
  }
  
  public boolean isConnecting()
  {
    return this.dt.isConnecting();
  }
  
  public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    return this.dt.isConnectionCallbacksRegistered(paramConnectionCallbacks);
  }
  
  public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    return this.dt.isConnectionFailedListenerRegistered(paramOnConnectionFailedListener);
  }
  
  public void joinRoom(RoomConfig paramRoomConfig)
  {
    this.dt.joinRoom(paramRoomConfig);
  }
  
  public void leaveRoom(RoomUpdateListener paramRoomUpdateListener, String paramString)
  {
    this.dt.leaveRoom(paramRoomUpdateListener, paramString);
  }
  
  public void loadAchievements(OnAchievementsLoadedListener paramOnAchievementsLoadedListener, boolean paramBoolean)
  {
    this.dt.loadAchievements(paramOnAchievementsLoadedListener, paramBoolean);
  }
  
  public void loadGame(OnGamesLoadedListener paramOnGamesLoadedListener)
  {
    this.dt.loadGame(paramOnGamesLoadedListener);
  }
  
  public void loadInvitablePlayers(OnPlayersLoadedListener paramOnPlayersLoadedListener, int paramInt, boolean paramBoolean)
  {
    this.dt.a(paramOnPlayersLoadedListener, paramInt, false, paramBoolean);
  }
  
  public void loadInvitations(OnInvitationsLoadedListener paramOnInvitationsLoadedListener)
  {
    this.dt.loadInvitations(paramOnInvitationsLoadedListener);
  }
  
  @Deprecated
  public void loadLeaderboardMetadata(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener)
  {
    loadLeaderboardMetadata(paramOnLeaderboardMetadataLoadedListener, false);
  }
  
  @Deprecated
  public void loadLeaderboardMetadata(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener, String paramString)
  {
    loadLeaderboardMetadata(paramOnLeaderboardMetadataLoadedListener, paramString, false);
  }
  
  public void loadLeaderboardMetadata(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener, String paramString, boolean paramBoolean)
  {
    this.dt.loadLeaderboardMetadata(paramOnLeaderboardMetadataLoadedListener, paramString, paramBoolean);
  }
  
  public void loadLeaderboardMetadata(OnLeaderboardMetadataLoadedListener paramOnLeaderboardMetadataLoadedListener, boolean paramBoolean)
  {
    this.dt.loadLeaderboardMetadata(paramOnLeaderboardMetadataLoadedListener, paramBoolean);
  }
  
  public void loadMoreInvitablePlayers(OnPlayersLoadedListener paramOnPlayersLoadedListener, int paramInt)
  {
    this.dt.a(paramOnPlayersLoadedListener, paramInt, true, false);
  }
  
  public void loadMoreScores(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, LeaderboardScoreBuffer paramLeaderboardScoreBuffer, int paramInt1, int paramInt2)
  {
    this.dt.loadMoreScores(paramOnLeaderboardScoresLoadedListener, paramLeaderboardScoreBuffer, paramInt1, paramInt2);
  }
  
  public void loadPlayer(OnPlayersLoadedListener paramOnPlayersLoadedListener, String paramString)
  {
    this.dt.loadPlayer(paramOnPlayersLoadedListener, paramString);
  }
  
  public void loadPlayerCenteredScores(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, String paramString, int paramInt1, int paramInt2, int paramInt3)
  {
    this.dt.loadPlayerCenteredScores(paramOnLeaderboardScoresLoadedListener, paramString, paramInt1, paramInt2, paramInt3, false);
  }
  
  public void loadPlayerCenteredScores(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    this.dt.loadPlayerCenteredScores(paramOnLeaderboardScoresLoadedListener, paramString, paramInt1, paramInt2, paramInt3, paramBoolean);
  }
  
  public void loadTopScores(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, String paramString, int paramInt1, int paramInt2, int paramInt3)
  {
    this.dt.loadTopScores(paramOnLeaderboardScoresLoadedListener, paramString, paramInt1, paramInt2, paramInt3, false);
  }
  
  public void loadTopScores(OnLeaderboardScoresLoadedListener paramOnLeaderboardScoresLoadedListener, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    this.dt.loadTopScores(paramOnLeaderboardScoresLoadedListener, paramString, paramInt1, paramInt2, paramInt3, paramBoolean);
  }
  
  public void reconnect()
  {
    this.dt.disconnect();
    this.dt.connect();
  }
  
  public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.dt.registerConnectionCallbacks(paramConnectionCallbacks);
  }
  
  public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.dt.registerConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  public void registerInvitationListener(OnInvitationReceivedListener paramOnInvitationReceivedListener)
  {
    this.dt.registerInvitationListener(paramOnInvitationReceivedListener);
  }
  
  public void revealAchievement(String paramString)
  {
    this.dt.a(null, paramString);
  }
  
  public void revealAchievementImmediate(OnAchievementUpdatedListener paramOnAchievementUpdatedListener, String paramString)
  {
    this.dt.a(paramOnAchievementUpdatedListener, paramString);
  }
  
  public int sendReliableRealTimeMessage(RealTimeReliableMessageSentListener paramRealTimeReliableMessageSentListener, byte[] paramArrayOfByte, String paramString1, String paramString2)
  {
    return this.dt.sendReliableRealTimeMessage(paramRealTimeReliableMessageSentListener, paramArrayOfByte, paramString1, paramString2);
  }
  
  public int sendUnreliableRealTimeMessage(byte[] paramArrayOfByte, String paramString1, String paramString2)
  {
    return this.dt.a(paramArrayOfByte, paramString1, new String[] { paramString2 });
  }
  
  public int sendUnreliableRealTimeMessage(byte[] paramArrayOfByte, String paramString, List<String> paramList)
  {
    String[] arrayOfString = (String[])paramList.toArray(new String[paramList.size()]);
    return this.dt.a(paramArrayOfByte, paramString, arrayOfString);
  }
  
  public int sendUnreliableRealTimeMessageToAll(byte[] paramArrayOfByte, String paramString)
  {
    return this.dt.sendUnreliableRealTimeMessageToAll(paramArrayOfByte, paramString);
  }
  
  public void setGravityForPopups(int paramInt)
  {
    this.dt.setGravityForPopups(paramInt);
  }
  
  public void setUseNewPlayerNotificationsFirstParty(boolean paramBoolean)
  {
    this.dt.setUseNewPlayerNotificationsFirstParty(paramBoolean);
  }
  
  public void setViewForPopups(View paramView)
  {
    s.d(paramView);
    this.dt.setViewForPopups(paramView);
  }
  
  public void signOut()
  {
    this.dt.signOut(null);
  }
  
  public void signOut(OnSignOutCompleteListener paramOnSignOutCompleteListener)
  {
    this.dt.signOut(paramOnSignOutCompleteListener);
  }
  
  public void submitScore(String paramString, long paramLong)
  {
    this.dt.a(null, paramString, paramLong);
  }
  
  public void submitScoreImmediate(OnScoreSubmittedListener paramOnScoreSubmittedListener, String paramString, long paramLong)
  {
    this.dt.a(paramOnScoreSubmittedListener, paramString, paramLong);
  }
  
  public void unlockAchievement(String paramString)
  {
    this.dt.b(null, paramString);
  }
  
  public void unlockAchievementImmediate(OnAchievementUpdatedListener paramOnAchievementUpdatedListener, String paramString)
  {
    this.dt.b(paramOnAchievementUpdatedListener, paramString);
  }
  
  public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks)
  {
    this.dt.unregisterConnectionCallbacks(paramConnectionCallbacks);
  }
  
  public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    this.dt.unregisterConnectionFailedListener(paramOnConnectionFailedListener);
  }
  
  public void unregisterInvitationListener()
  {
    this.dt.unregisterInvitationListener();
  }
  
  public static final class Builder
  {
    private final GooglePlayServicesClient.ConnectionCallbacks d;
    private String du;
    private int dv = 49;
    private View dw;
    private final GooglePlayServicesClient.OnConnectionFailedListener e;
    private String[] f = { "https://www.googleapis.com/auth/games" };
    private String g = "<<default account>>";
    private final Context mContext;
    
    public Builder(Context paramContext, GooglePlayServicesClient.ConnectionCallbacks paramConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      this.mContext = paramContext;
      this.du = paramContext.getPackageName();
      this.d = paramConnectionCallbacks;
      this.e = paramOnConnectionFailedListener;
    }
    
    public GamesClient create()
    {
      return new GamesClient(this.mContext, this.du, this.g, this.d, this.e, this.f, this.dv, this.dw, null);
    }
    
    public Builder setAccountName(String paramString)
    {
      this.g = ((String)s.d(paramString));
      return this;
    }
    
    public Builder setGravityForPopups(int paramInt)
    {
      this.dv = paramInt;
      return this;
    }
    
    public Builder setScopes(String... paramVarArgs)
    {
      this.f = paramVarArgs;
      return this;
    }
    
    public Builder setViewForPopups(View paramView)
    {
      this.dw = ((View)s.d(paramView));
      return this;
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/GamesClient.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */