package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.internal.ao;
import com.google.android.gms.internal.av;
import com.google.android.gms.internal.r;
import com.google.android.gms.internal.r.a;

public final class GameEntity
  extends av
  implements Game
{
  public static final Parcelable.Creator<GameEntity> CREATOR = new a();
  private final int ab;
  private final String cl;
  private final String df;
  private final String dg;
  private final String dh;
  private final String di;
  private final String dj;
  private final Uri dk;
  private final Uri dl;
  private final Uri dm;
  private final boolean dn;
  private final boolean jdField_do;
  private final String dp;
  private final int dq;
  private final int dr;
  private final int ds;
  
  GameEntity(int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, Uri paramUri1, Uri paramUri2, Uri paramUri3, boolean paramBoolean1, boolean paramBoolean2, String paramString7, int paramInt2, int paramInt3, int paramInt4)
  {
    this.ab = paramInt1;
    this.df = paramString1;
    this.cl = paramString2;
    this.dg = paramString3;
    this.dh = paramString4;
    this.di = paramString5;
    this.dj = paramString6;
    this.dk = paramUri1;
    this.dl = paramUri2;
    this.dm = paramUri3;
    this.dn = paramBoolean1;
    this.jdField_do = paramBoolean2;
    this.dp = paramString7;
    this.dq = paramInt2;
    this.dr = paramInt3;
    this.ds = paramInt4;
  }
  
  public GameEntity(Game paramGame)
  {
    this.ab = 1;
    this.df = paramGame.getApplicationId();
    this.dg = paramGame.getPrimaryCategory();
    this.dh = paramGame.getSecondaryCategory();
    this.di = paramGame.getDescription();
    this.dj = paramGame.getDeveloperName();
    this.cl = paramGame.getDisplayName();
    this.dk = paramGame.getIconImageUri();
    this.dl = paramGame.getHiResImageUri();
    this.dm = paramGame.getFeaturedImageUri();
    this.dn = paramGame.isPlayEnabledGame();
    this.jdField_do = paramGame.isInstanceInstalled();
    this.dp = paramGame.getInstancePackageName();
    this.dq = paramGame.getGameplayAclStatus();
    this.dr = paramGame.getAchievementTotalCount();
    this.ds = paramGame.getLeaderboardCount();
  }
  
  static int a(Game paramGame)
  {
    Object[] arrayOfObject = new Object[15];
    arrayOfObject[0] = paramGame.getApplicationId();
    arrayOfObject[1] = paramGame.getDisplayName();
    arrayOfObject[2] = paramGame.getPrimaryCategory();
    arrayOfObject[3] = paramGame.getSecondaryCategory();
    arrayOfObject[4] = paramGame.getDescription();
    arrayOfObject[5] = paramGame.getDeveloperName();
    arrayOfObject[6] = paramGame.getIconImageUri();
    arrayOfObject[7] = paramGame.getHiResImageUri();
    arrayOfObject[8] = paramGame.getFeaturedImageUri();
    arrayOfObject[9] = Boolean.valueOf(paramGame.isPlayEnabledGame());
    arrayOfObject[10] = Boolean.valueOf(paramGame.isInstanceInstalled());
    arrayOfObject[11] = paramGame.getInstancePackageName();
    arrayOfObject[12] = Integer.valueOf(paramGame.getGameplayAclStatus());
    arrayOfObject[13] = Integer.valueOf(paramGame.getAchievementTotalCount());
    arrayOfObject[14] = Integer.valueOf(paramGame.getLeaderboardCount());
    return r.hashCode(arrayOfObject);
  }
  
  static boolean a(Game paramGame, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Game)) {
      bool = false;
    }
    Game localGame;
    do
    {
      do
      {
        return bool;
      } while (paramGame == paramObject);
      localGame = (Game)paramObject;
    } while ((r.a(localGame.getApplicationId(), paramGame.getApplicationId())) && (r.a(localGame.getDisplayName(), paramGame.getDisplayName())) && (r.a(localGame.getPrimaryCategory(), paramGame.getPrimaryCategory())) && (r.a(localGame.getSecondaryCategory(), paramGame.getSecondaryCategory())) && (r.a(localGame.getDescription(), paramGame.getDescription())) && (r.a(localGame.getDeveloperName(), paramGame.getDeveloperName())) && (r.a(localGame.getIconImageUri(), paramGame.getIconImageUri())) && (r.a(localGame.getHiResImageUri(), paramGame.getHiResImageUri())) && (r.a(localGame.getFeaturedImageUri(), paramGame.getFeaturedImageUri())) && (r.a(Boolean.valueOf(localGame.isPlayEnabledGame()), Boolean.valueOf(paramGame.isPlayEnabledGame()))) && (r.a(Boolean.valueOf(localGame.isInstanceInstalled()), Boolean.valueOf(paramGame.isInstanceInstalled()))) && (r.a(localGame.getInstancePackageName(), paramGame.getInstancePackageName())) && (r.a(Integer.valueOf(localGame.getGameplayAclStatus()), Integer.valueOf(paramGame.getGameplayAclStatus()))) && (r.a(Integer.valueOf(localGame.getAchievementTotalCount()), Integer.valueOf(paramGame.getAchievementTotalCount()))) && (r.a(Integer.valueOf(localGame.getLeaderboardCount()), Integer.valueOf(paramGame.getLeaderboardCount()))));
    return false;
  }
  
  static String b(Game paramGame)
  {
    return r.c(paramGame).a("ApplicationId", paramGame.getApplicationId()).a("DisplayName", paramGame.getDisplayName()).a("PrimaryCategory", paramGame.getPrimaryCategory()).a("SecondaryCategory", paramGame.getSecondaryCategory()).a("Description", paramGame.getDescription()).a("DeveloperName", paramGame.getDeveloperName()).a("IconImageUri", paramGame.getIconImageUri()).a("HiResImageUri", paramGame.getHiResImageUri()).a("FeaturedImageUri", paramGame.getFeaturedImageUri()).a("PlayEnabledGame", Boolean.valueOf(paramGame.isPlayEnabledGame())).a("InstanceInstalled", Boolean.valueOf(paramGame.isInstanceInstalled())).a("InstancePackageName", paramGame.getInstancePackageName()).a("GameplayAclStatus", Integer.valueOf(paramGame.getGameplayAclStatus())).a("AchievementTotalCount", Integer.valueOf(paramGame.getAchievementTotalCount())).a("LeaderboardCount", Integer.valueOf(paramGame.getLeaderboardCount())).toString();
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    return a(this, paramObject);
  }
  
  public Game freeze()
  {
    return this;
  }
  
  public int getAchievementTotalCount()
  {
    return this.dr;
  }
  
  public String getApplicationId()
  {
    return this.df;
  }
  
  public String getDescription()
  {
    return this.di;
  }
  
  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    ao.b(this.di, paramCharArrayBuffer);
  }
  
  public String getDeveloperName()
  {
    return this.dj;
  }
  
  public void getDeveloperName(CharArrayBuffer paramCharArrayBuffer)
  {
    ao.b(this.dj, paramCharArrayBuffer);
  }
  
  public String getDisplayName()
  {
    return this.cl;
  }
  
  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    ao.b(this.cl, paramCharArrayBuffer);
  }
  
  public Uri getFeaturedImageUri()
  {
    return this.dm;
  }
  
  public int getGameplayAclStatus()
  {
    return this.dq;
  }
  
  public Uri getHiResImageUri()
  {
    return this.dl;
  }
  
  public Uri getIconImageUri()
  {
    return this.dk;
  }
  
  public String getInstancePackageName()
  {
    return this.dp;
  }
  
  public int getLeaderboardCount()
  {
    return this.ds;
  }
  
  public String getPrimaryCategory()
  {
    return this.dg;
  }
  
  public String getSecondaryCategory()
  {
    return this.dh;
  }
  
  public int hashCode()
  {
    return a(this);
  }
  
  public int i()
  {
    return this.ab;
  }
  
  public boolean isDataValid()
  {
    return true;
  }
  
  public boolean isInstanceInstalled()
  {
    return this.jdField_do;
  }
  
  public boolean isPlayEnabledGame()
  {
    return this.dn;
  }
  
  public String toString()
  {
    return b(this);
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    int i = 1;
    if (!w())
    {
      a.a(this, paramParcel, paramInt);
      return;
    }
    paramParcel.writeString(this.df);
    paramParcel.writeString(this.cl);
    paramParcel.writeString(this.dg);
    paramParcel.writeString(this.dh);
    paramParcel.writeString(this.di);
    paramParcel.writeString(this.dj);
    String str1;
    String str2;
    label90:
    String str3;
    label110:
    int j;
    if (this.dk == null)
    {
      str1 = null;
      paramParcel.writeString(str1);
      if (this.dl != null) {
        break label189;
      }
      str2 = null;
      paramParcel.writeString(str2);
      Uri localUri = this.dm;
      str3 = null;
      if (localUri != null) {
        break label201;
      }
      paramParcel.writeString(str3);
      if (!this.dn) {
        break label213;
      }
      j = i;
      label126:
      paramParcel.writeInt(j);
      if (!this.jdField_do) {
        break label219;
      }
    }
    for (;;)
    {
      paramParcel.writeInt(i);
      paramParcel.writeString(this.dp);
      paramParcel.writeInt(this.dq);
      paramParcel.writeInt(this.dr);
      paramParcel.writeInt(this.ds);
      return;
      str1 = this.dk.toString();
      break;
      label189:
      str2 = this.dl.toString();
      break label90;
      label201:
      str3 = this.dm.toString();
      break label110;
      label213:
      j = 0;
      break label126;
      label219:
      i = 0;
    }
  }
  
  static final class a
    extends a
  {
    public GameEntity n(Parcel paramParcel)
    {
      if ((GameEntity.b(GameEntity.au())) || (GameEntity.s(GameEntity.class.getCanonicalName()))) {
        return super.n(paramParcel);
      }
      String str1 = paramParcel.readString();
      String str2 = paramParcel.readString();
      String str3 = paramParcel.readString();
      String str4 = paramParcel.readString();
      String str5 = paramParcel.readString();
      String str6 = paramParcel.readString();
      String str7 = paramParcel.readString();
      Uri localUri1;
      String str8;
      Uri localUri2;
      label88:
      String str9;
      Uri localUri3;
      label102:
      boolean bool1;
      if (str7 == null)
      {
        localUri1 = null;
        str8 = paramParcel.readString();
        if (str8 != null) {
          break label177;
        }
        localUri2 = null;
        str9 = paramParcel.readString();
        if (str9 != null) {
          break label187;
        }
        localUri3 = null;
        if (paramParcel.readInt() <= 0) {
          break label197;
        }
        bool1 = true;
        label112:
        if (paramParcel.readInt() <= 0) {
          break label203;
        }
      }
      label177:
      label187:
      label197:
      label203:
      for (boolean bool2 = true;; bool2 = false)
      {
        return new GameEntity(1, str1, str2, str3, str4, str5, str6, localUri1, localUri2, localUri3, bool1, bool2, paramParcel.readString(), paramParcel.readInt(), paramParcel.readInt(), paramParcel.readInt());
        localUri1 = Uri.parse(str7);
        break;
        localUri2 = Uri.parse(str8);
        break label88;
        localUri3 = Uri.parse(str9);
        break label102;
        bool1 = false;
        break label112;
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/games/GameEntity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */