package android.support.v4.media.session;

import android.app.PendingIntent;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.RatingCompat;
import android.text.TextUtils;
import android.view.KeyEvent;
import java.util.ArrayList;
import java.util.List;

public abstract interface IMediaSession
  extends IInterface
{
  public abstract void adjustVolume(int paramInt1, int paramInt2, String paramString)
    throws RemoteException;
  
  public abstract void fastForward()
    throws RemoteException;
  
  public abstract Bundle getExtras()
    throws RemoteException;
  
  public abstract long getFlags()
    throws RemoteException;
  
  public abstract PendingIntent getLaunchPendingIntent()
    throws RemoteException;
  
  public abstract MediaMetadataCompat getMetadata()
    throws RemoteException;
  
  public abstract String getPackageName()
    throws RemoteException;
  
  public abstract PlaybackStateCompat getPlaybackState()
    throws RemoteException;
  
  public abstract List<MediaSessionCompat.QueueItem> getQueue()
    throws RemoteException;
  
  public abstract CharSequence getQueueTitle()
    throws RemoteException;
  
  public abstract int getRatingType()
    throws RemoteException;
  
  public abstract String getTag()
    throws RemoteException;
  
  public abstract ParcelableVolumeInfo getVolumeAttributes()
    throws RemoteException;
  
  public abstract boolean isTransportControlEnabled()
    throws RemoteException;
  
  public abstract void next()
    throws RemoteException;
  
  public abstract void pause()
    throws RemoteException;
  
  public abstract void play()
    throws RemoteException;
  
  public abstract void playFromMediaId(String paramString, Bundle paramBundle)
    throws RemoteException;
  
  public abstract void playFromSearch(String paramString, Bundle paramBundle)
    throws RemoteException;
  
  public abstract void playFromUri(Uri paramUri, Bundle paramBundle)
    throws RemoteException;
  
  public abstract void previous()
    throws RemoteException;
  
  public abstract void rate(RatingCompat paramRatingCompat)
    throws RemoteException;
  
  public abstract void registerCallbackListener(IMediaControllerCallback paramIMediaControllerCallback)
    throws RemoteException;
  
  public abstract void rewind()
    throws RemoteException;
  
  public abstract void seekTo(long paramLong)
    throws RemoteException;
  
  public abstract void sendCommand(String paramString, Bundle paramBundle, MediaSessionCompat.ResultReceiverWrapper paramResultReceiverWrapper)
    throws RemoteException;
  
  public abstract void sendCustomAction(String paramString, Bundle paramBundle)
    throws RemoteException;
  
  public abstract boolean sendMediaButton(KeyEvent paramKeyEvent)
    throws RemoteException;
  
  public abstract void setVolumeTo(int paramInt1, int paramInt2, String paramString)
    throws RemoteException;
  
  public abstract void skipToQueueItem(long paramLong)
    throws RemoteException;
  
  public abstract void stop()
    throws RemoteException;
  
  public abstract void unregisterCallbackListener(IMediaControllerCallback paramIMediaControllerCallback)
    throws RemoteException;
  
  public static abstract class Stub
    extends Binder
    implements IMediaSession
  {
    private static final String DESCRIPTOR = "android.support.v4.media.session.IMediaSession";
    static final int TRANSACTION_adjustVolume = 11;
    static final int TRANSACTION_fastForward = 22;
    static final int TRANSACTION_getExtras = 31;
    static final int TRANSACTION_getFlags = 9;
    static final int TRANSACTION_getLaunchPendingIntent = 8;
    static final int TRANSACTION_getMetadata = 27;
    static final int TRANSACTION_getPackageName = 6;
    static final int TRANSACTION_getPlaybackState = 28;
    static final int TRANSACTION_getQueue = 29;
    static final int TRANSACTION_getQueueTitle = 30;
    static final int TRANSACTION_getRatingType = 32;
    static final int TRANSACTION_getTag = 7;
    static final int TRANSACTION_getVolumeAttributes = 10;
    static final int TRANSACTION_isTransportControlEnabled = 5;
    static final int TRANSACTION_next = 20;
    static final int TRANSACTION_pause = 18;
    static final int TRANSACTION_play = 13;
    static final int TRANSACTION_playFromMediaId = 14;
    static final int TRANSACTION_playFromSearch = 15;
    static final int TRANSACTION_playFromUri = 16;
    static final int TRANSACTION_previous = 21;
    static final int TRANSACTION_rate = 25;
    static final int TRANSACTION_registerCallbackListener = 3;
    static final int TRANSACTION_rewind = 23;
    static final int TRANSACTION_seekTo = 24;
    static final int TRANSACTION_sendCommand = 1;
    static final int TRANSACTION_sendCustomAction = 26;
    static final int TRANSACTION_sendMediaButton = 2;
    static final int TRANSACTION_setVolumeTo = 12;
    static final int TRANSACTION_skipToQueueItem = 17;
    static final int TRANSACTION_stop = 19;
    static final int TRANSACTION_unregisterCallbackListener = 4;
    
    public Stub()
    {
      attachInterface(this, "android.support.v4.media.session.IMediaSession");
    }
    
    public static IMediaSession asInterface(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("android.support.v4.media.session.IMediaSession");
      if ((localIInterface != null) && ((localIInterface instanceof IMediaSession))) {
        return (IMediaSession)localIInterface;
      }
      return new Proxy(paramIBinder);
    }
    
    public IBinder asBinder()
    {
      return this;
    }
    
    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default: 
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902: 
        paramParcel2.writeString("android.support.v4.media.session.IMediaSession");
        return true;
      case 1: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        String str6 = paramParcel1.readString();
        Bundle localBundle6;
        if (paramParcel1.readInt() != 0)
        {
          localBundle6 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0) {
            break label370;
          }
        }
        for (MediaSessionCompat.ResultReceiverWrapper localResultReceiverWrapper = (MediaSessionCompat.ResultReceiverWrapper)MediaSessionCompat.ResultReceiverWrapper.CREATOR.createFromParcel(paramParcel1);; localResultReceiverWrapper = null)
        {
          sendCommand(str6, localBundle6, localResultReceiverWrapper);
          paramParcel2.writeNoException();
          return true;
          localBundle6 = null;
          break;
        }
      case 2: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        if (paramParcel1.readInt() != 0) {}
        for (KeyEvent localKeyEvent = (KeyEvent)KeyEvent.CREATOR.createFromParcel(paramParcel1);; localKeyEvent = null)
        {
          boolean bool2 = sendMediaButton(localKeyEvent);
          paramParcel2.writeNoException();
          int k = 0;
          if (bool2) {
            k = 1;
          }
          paramParcel2.writeInt(k);
          return true;
        }
      case 3: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        registerCallbackListener(IMediaControllerCallback.Stub.asInterface(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 4: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        unregisterCallbackListener(IMediaControllerCallback.Stub.asInterface(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        boolean bool1 = isTransportControlEnabled();
        paramParcel2.writeNoException();
        int j = 0;
        if (bool1) {
          j = 1;
        }
        paramParcel2.writeInt(j);
        return true;
      case 6: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        String str5 = getPackageName();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str5);
        return true;
      case 7: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        String str4 = getTag();
        paramParcel2.writeNoException();
        paramParcel2.writeString(str4);
        return true;
      case 8: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        PendingIntent localPendingIntent = getLaunchPendingIntent();
        paramParcel2.writeNoException();
        if (localPendingIntent != null)
        {
          paramParcel2.writeInt(1);
          localPendingIntent.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 9: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        long l = getFlags();
        paramParcel2.writeNoException();
        paramParcel2.writeLong(l);
        return true;
      case 10: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        ParcelableVolumeInfo localParcelableVolumeInfo = getVolumeAttributes();
        paramParcel2.writeNoException();
        if (localParcelableVolumeInfo != null)
        {
          paramParcel2.writeInt(1);
          localParcelableVolumeInfo.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 11: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        adjustVolume(paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 12: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        setVolumeTo(paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 13: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        play();
        paramParcel2.writeNoException();
        return true;
      case 14: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        String str3 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle5 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle5 = null)
        {
          playFromMediaId(str3, localBundle5);
          paramParcel2.writeNoException();
          return true;
        }
      case 15: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        String str2 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle4 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle4 = null)
        {
          playFromSearch(str2, localBundle4);
          paramParcel2.writeNoException();
          return true;
        }
      case 16: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        Uri localUri;
        if (paramParcel1.readInt() != 0)
        {
          localUri = (Uri)Uri.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0) {
            break label923;
          }
        }
        for (Bundle localBundle3 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle3 = null)
        {
          playFromUri(localUri, localBundle3);
          paramParcel2.writeNoException();
          return true;
          localUri = null;
          break;
        }
      case 17: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        skipToQueueItem(paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 18: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        pause();
        paramParcel2.writeNoException();
        return true;
      case 19: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        stop();
        paramParcel2.writeNoException();
        return true;
      case 20: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        next();
        paramParcel2.writeNoException();
        return true;
      case 21: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        previous();
        paramParcel2.writeNoException();
        return true;
      case 22: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        fastForward();
        paramParcel2.writeNoException();
        return true;
      case 23: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        rewind();
        paramParcel2.writeNoException();
        return true;
      case 24: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        seekTo(paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 25: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        if (paramParcel1.readInt() != 0) {}
        for (RatingCompat localRatingCompat = (RatingCompat)RatingCompat.CREATOR.createFromParcel(paramParcel1);; localRatingCompat = null)
        {
          rate(localRatingCompat);
          paramParcel2.writeNoException();
          return true;
        }
      case 26: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        String str1 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0) {}
        for (Bundle localBundle2 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1);; localBundle2 = null)
        {
          sendCustomAction(str1, localBundle2);
          paramParcel2.writeNoException();
          return true;
        }
      case 27: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        MediaMetadataCompat localMediaMetadataCompat = getMetadata();
        paramParcel2.writeNoException();
        if (localMediaMetadataCompat != null)
        {
          paramParcel2.writeInt(1);
          localMediaMetadataCompat.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 28: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        PlaybackStateCompat localPlaybackStateCompat = getPlaybackState();
        paramParcel2.writeNoException();
        if (localPlaybackStateCompat != null)
        {
          paramParcel2.writeInt(1);
          localPlaybackStateCompat.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 29: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        List localList = getQueue();
        paramParcel2.writeNoException();
        paramParcel2.writeTypedList(localList);
        return true;
      case 30: 
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        CharSequence localCharSequence = getQueueTitle();
        paramParcel2.writeNoException();
        if (localCharSequence != null)
        {
          paramParcel2.writeInt(1);
          TextUtils.writeToParcel(localCharSequence, paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      case 31: 
        label370:
        label923:
        paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
        Bundle localBundle1 = getExtras();
        paramParcel2.writeNoException();
        if (localBundle1 != null)
        {
          paramParcel2.writeInt(1);
          localBundle1.writeToParcel(paramParcel2, 1);
          return true;
        }
        paramParcel2.writeInt(0);
        return true;
      }
      paramParcel1.enforceInterface("android.support.v4.media.session.IMediaSession");
      int i = getRatingType();
      paramParcel2.writeNoException();
      paramParcel2.writeInt(i);
      return true;
    }
    
    private static class Proxy
      implements IMediaSession
    {
      private IBinder mRemote;
      
      Proxy(IBinder paramIBinder)
      {
        this.mRemote = paramIBinder;
      }
      
      public void adjustVolume(int paramInt1, int paramInt2, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          localParcel1.writeString(paramString);
          this.mRemote.transact(11, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public IBinder asBinder()
      {
        return this.mRemote;
      }
      
      public void fastForward()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(22, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public Bundle getExtras()
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_1
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_2
        //   8: aload_1
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_0
        //   15: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   18: bipush 31
        //   20: aload_1
        //   21: aload_2
        //   22: iconst_0
        //   23: invokeinterface 44 5 0
        //   28: pop
        //   29: aload_2
        //   30: invokevirtual 47	android/os/Parcel:readException	()V
        //   33: aload_2
        //   34: invokevirtual 59	android/os/Parcel:readInt	()I
        //   37: ifeq +28 -> 65
        //   40: getstatic 65	android/os/Bundle:CREATOR	Landroid/os/Parcelable$Creator;
        //   43: aload_2
        //   44: invokeinterface 71 2 0
        //   49: checkcast 61	android/os/Bundle
        //   52: astore 5
        //   54: aload_2
        //   55: invokevirtual 50	android/os/Parcel:recycle	()V
        //   58: aload_1
        //   59: invokevirtual 50	android/os/Parcel:recycle	()V
        //   62: aload 5
        //   64: areturn
        //   65: aconst_null
        //   66: astore 5
        //   68: goto -14 -> 54
        //   71: astore_3
        //   72: aload_2
        //   73: invokevirtual 50	android/os/Parcel:recycle	()V
        //   76: aload_1
        //   77: invokevirtual 50	android/os/Parcel:recycle	()V
        //   80: aload_3
        //   81: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	82	0	this	Proxy
        //   3	74	1	localParcel1	Parcel
        //   7	66	2	localParcel2	Parcel
        //   71	10	3	localObject	Object
        //   52	15	5	localBundle	Bundle
        // Exception table:
        //   from	to	target	type
        //   8	54	71	finally
      }
      
      public long getFlags()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(9, localParcel1, localParcel2, 0);
          localParcel2.readException();
          long l = localParcel2.readLong();
          return l;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public String getInterfaceDescriptor()
      {
        return "android.support.v4.media.session.IMediaSession";
      }
      
      /* Error */
      public PendingIntent getLaunchPendingIntent()
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_1
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_2
        //   8: aload_1
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_0
        //   15: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   18: bipush 8
        //   20: aload_1
        //   21: aload_2
        //   22: iconst_0
        //   23: invokeinterface 44 5 0
        //   28: pop
        //   29: aload_2
        //   30: invokevirtual 47	android/os/Parcel:readException	()V
        //   33: aload_2
        //   34: invokevirtual 59	android/os/Parcel:readInt	()I
        //   37: ifeq +28 -> 65
        //   40: getstatic 83	android/app/PendingIntent:CREATOR	Landroid/os/Parcelable$Creator;
        //   43: aload_2
        //   44: invokeinterface 71 2 0
        //   49: checkcast 82	android/app/PendingIntent
        //   52: astore 5
        //   54: aload_2
        //   55: invokevirtual 50	android/os/Parcel:recycle	()V
        //   58: aload_1
        //   59: invokevirtual 50	android/os/Parcel:recycle	()V
        //   62: aload 5
        //   64: areturn
        //   65: aconst_null
        //   66: astore 5
        //   68: goto -14 -> 54
        //   71: astore_3
        //   72: aload_2
        //   73: invokevirtual 50	android/os/Parcel:recycle	()V
        //   76: aload_1
        //   77: invokevirtual 50	android/os/Parcel:recycle	()V
        //   80: aload_3
        //   81: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	82	0	this	Proxy
        //   3	74	1	localParcel1	Parcel
        //   7	66	2	localParcel2	Parcel
        //   71	10	3	localObject	Object
        //   52	15	5	localPendingIntent	PendingIntent
        // Exception table:
        //   from	to	target	type
        //   8	54	71	finally
      }
      
      /* Error */
      public MediaMetadataCompat getMetadata()
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_1
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_2
        //   8: aload_1
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_0
        //   15: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   18: bipush 27
        //   20: aload_1
        //   21: aload_2
        //   22: iconst_0
        //   23: invokeinterface 44 5 0
        //   28: pop
        //   29: aload_2
        //   30: invokevirtual 47	android/os/Parcel:readException	()V
        //   33: aload_2
        //   34: invokevirtual 59	android/os/Parcel:readInt	()I
        //   37: ifeq +28 -> 65
        //   40: getstatic 88	android/support/v4/media/MediaMetadataCompat:CREATOR	Landroid/os/Parcelable$Creator;
        //   43: aload_2
        //   44: invokeinterface 71 2 0
        //   49: checkcast 87	android/support/v4/media/MediaMetadataCompat
        //   52: astore 5
        //   54: aload_2
        //   55: invokevirtual 50	android/os/Parcel:recycle	()V
        //   58: aload_1
        //   59: invokevirtual 50	android/os/Parcel:recycle	()V
        //   62: aload 5
        //   64: areturn
        //   65: aconst_null
        //   66: astore 5
        //   68: goto -14 -> 54
        //   71: astore_3
        //   72: aload_2
        //   73: invokevirtual 50	android/os/Parcel:recycle	()V
        //   76: aload_1
        //   77: invokevirtual 50	android/os/Parcel:recycle	()V
        //   80: aload_3
        //   81: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	82	0	this	Proxy
        //   3	74	1	localParcel1	Parcel
        //   7	66	2	localParcel2	Parcel
        //   71	10	3	localObject	Object
        //   52	15	5	localMediaMetadataCompat	MediaMetadataCompat
        // Exception table:
        //   from	to	target	type
        //   8	54	71	finally
      }
      
      public String getPackageName()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(6, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public PlaybackStateCompat getPlaybackState()
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_1
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_2
        //   8: aload_1
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_0
        //   15: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   18: bipush 28
        //   20: aload_1
        //   21: aload_2
        //   22: iconst_0
        //   23: invokeinterface 44 5 0
        //   28: pop
        //   29: aload_2
        //   30: invokevirtual 47	android/os/Parcel:readException	()V
        //   33: aload_2
        //   34: invokevirtual 59	android/os/Parcel:readInt	()I
        //   37: ifeq +28 -> 65
        //   40: getstatic 97	android/support/v4/media/session/PlaybackStateCompat:CREATOR	Landroid/os/Parcelable$Creator;
        //   43: aload_2
        //   44: invokeinterface 71 2 0
        //   49: checkcast 96	android/support/v4/media/session/PlaybackStateCompat
        //   52: astore 5
        //   54: aload_2
        //   55: invokevirtual 50	android/os/Parcel:recycle	()V
        //   58: aload_1
        //   59: invokevirtual 50	android/os/Parcel:recycle	()V
        //   62: aload 5
        //   64: areturn
        //   65: aconst_null
        //   66: astore 5
        //   68: goto -14 -> 54
        //   71: astore_3
        //   72: aload_2
        //   73: invokevirtual 50	android/os/Parcel:recycle	()V
        //   76: aload_1
        //   77: invokevirtual 50	android/os/Parcel:recycle	()V
        //   80: aload_3
        //   81: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	82	0	this	Proxy
        //   3	74	1	localParcel1	Parcel
        //   7	66	2	localParcel2	Parcel
        //   71	10	3	localObject	Object
        //   52	15	5	localPlaybackStateCompat	PlaybackStateCompat
        // Exception table:
        //   from	to	target	type
        //   8	54	71	finally
      }
      
      public List<MediaSessionCompat.QueueItem> getQueue()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(29, localParcel1, localParcel2, 0);
          localParcel2.readException();
          ArrayList localArrayList = localParcel2.createTypedArrayList(MediaSessionCompat.QueueItem.CREATOR);
          return localArrayList;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public CharSequence getQueueTitle()
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_1
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_2
        //   8: aload_1
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_0
        //   15: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   18: bipush 30
        //   20: aload_1
        //   21: aload_2
        //   22: iconst_0
        //   23: invokeinterface 44 5 0
        //   28: pop
        //   29: aload_2
        //   30: invokevirtual 47	android/os/Parcel:readException	()V
        //   33: aload_2
        //   34: invokevirtual 59	android/os/Parcel:readInt	()I
        //   37: ifeq +28 -> 65
        //   40: getstatic 113	android/text/TextUtils:CHAR_SEQUENCE_CREATOR	Landroid/os/Parcelable$Creator;
        //   43: aload_2
        //   44: invokeinterface 71 2 0
        //   49: checkcast 115	java/lang/CharSequence
        //   52: astore 5
        //   54: aload_2
        //   55: invokevirtual 50	android/os/Parcel:recycle	()V
        //   58: aload_1
        //   59: invokevirtual 50	android/os/Parcel:recycle	()V
        //   62: aload 5
        //   64: areturn
        //   65: aconst_null
        //   66: astore 5
        //   68: goto -14 -> 54
        //   71: astore_3
        //   72: aload_2
        //   73: invokevirtual 50	android/os/Parcel:recycle	()V
        //   76: aload_1
        //   77: invokevirtual 50	android/os/Parcel:recycle	()V
        //   80: aload_3
        //   81: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	82	0	this	Proxy
        //   3	74	1	localParcel1	Parcel
        //   7	66	2	localParcel2	Parcel
        //   71	10	3	localObject	Object
        //   52	15	5	localCharSequence	CharSequence
        // Exception table:
        //   from	to	target	type
        //   8	54	71	finally
      }
      
      public int getRatingType()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(32, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public String getTag()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(7, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public ParcelableVolumeInfo getVolumeAttributes()
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_1
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_2
        //   8: aload_1
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_0
        //   15: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   18: bipush 10
        //   20: aload_1
        //   21: aload_2
        //   22: iconst_0
        //   23: invokeinterface 44 5 0
        //   28: pop
        //   29: aload_2
        //   30: invokevirtual 47	android/os/Parcel:readException	()V
        //   33: aload_2
        //   34: invokevirtual 59	android/os/Parcel:readInt	()I
        //   37: ifeq +28 -> 65
        //   40: getstatic 122	android/support/v4/media/session/ParcelableVolumeInfo:CREATOR	Landroid/os/Parcelable$Creator;
        //   43: aload_2
        //   44: invokeinterface 71 2 0
        //   49: checkcast 121	android/support/v4/media/session/ParcelableVolumeInfo
        //   52: astore 5
        //   54: aload_2
        //   55: invokevirtual 50	android/os/Parcel:recycle	()V
        //   58: aload_1
        //   59: invokevirtual 50	android/os/Parcel:recycle	()V
        //   62: aload 5
        //   64: areturn
        //   65: aconst_null
        //   66: astore 5
        //   68: goto -14 -> 54
        //   71: astore_3
        //   72: aload_2
        //   73: invokevirtual 50	android/os/Parcel:recycle	()V
        //   76: aload_1
        //   77: invokevirtual 50	android/os/Parcel:recycle	()V
        //   80: aload_3
        //   81: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	82	0	this	Proxy
        //   3	74	1	localParcel1	Parcel
        //   7	66	2	localParcel2	Parcel
        //   71	10	3	localObject	Object
        //   52	15	5	localParcelableVolumeInfo	ParcelableVolumeInfo
        // Exception table:
        //   from	to	target	type
        //   8	54	71	finally
      }
      
      public boolean isTransportControlEnabled()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0) {
            bool = true;
          }
          return bool;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void next()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(20, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void pause()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(18, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void play()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(13, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public void playFromMediaId(String paramString, Bundle paramBundle)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 27
        //   12: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_3
        //   16: aload_1
        //   17: invokevirtual 38	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   20: aload_2
        //   21: ifnull +45 -> 66
        //   24: aload_3
        //   25: iconst_1
        //   26: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   29: aload_2
        //   30: aload_3
        //   31: iconst_0
        //   32: invokevirtual 133	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   35: aload_0
        //   36: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   39: bipush 14
        //   41: aload_3
        //   42: aload 4
        //   44: iconst_0
        //   45: invokeinterface 44 5 0
        //   50: pop
        //   51: aload 4
        //   53: invokevirtual 47	android/os/Parcel:readException	()V
        //   56: aload 4
        //   58: invokevirtual 50	android/os/Parcel:recycle	()V
        //   61: aload_3
        //   62: invokevirtual 50	android/os/Parcel:recycle	()V
        //   65: return
        //   66: aload_3
        //   67: iconst_0
        //   68: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   71: goto -36 -> 35
        //   74: astore 5
        //   76: aload 4
        //   78: invokevirtual 50	android/os/Parcel:recycle	()V
        //   81: aload_3
        //   82: invokevirtual 50	android/os/Parcel:recycle	()V
        //   85: aload 5
        //   87: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	88	0	this	Proxy
        //   0	88	1	paramString	String
        //   0	88	2	paramBundle	Bundle
        //   3	79	3	localParcel1	Parcel
        //   7	70	4	localParcel2	Parcel
        //   74	12	5	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   9	20	74	finally
        //   24	35	74	finally
        //   35	56	74	finally
        //   66	71	74	finally
      }
      
      /* Error */
      public void playFromSearch(String paramString, Bundle paramBundle)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 27
        //   12: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_3
        //   16: aload_1
        //   17: invokevirtual 38	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   20: aload_2
        //   21: ifnull +45 -> 66
        //   24: aload_3
        //   25: iconst_1
        //   26: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   29: aload_2
        //   30: aload_3
        //   31: iconst_0
        //   32: invokevirtual 133	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   35: aload_0
        //   36: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   39: bipush 15
        //   41: aload_3
        //   42: aload 4
        //   44: iconst_0
        //   45: invokeinterface 44 5 0
        //   50: pop
        //   51: aload 4
        //   53: invokevirtual 47	android/os/Parcel:readException	()V
        //   56: aload 4
        //   58: invokevirtual 50	android/os/Parcel:recycle	()V
        //   61: aload_3
        //   62: invokevirtual 50	android/os/Parcel:recycle	()V
        //   65: return
        //   66: aload_3
        //   67: iconst_0
        //   68: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   71: goto -36 -> 35
        //   74: astore 5
        //   76: aload 4
        //   78: invokevirtual 50	android/os/Parcel:recycle	()V
        //   81: aload_3
        //   82: invokevirtual 50	android/os/Parcel:recycle	()V
        //   85: aload 5
        //   87: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	88	0	this	Proxy
        //   0	88	1	paramString	String
        //   0	88	2	paramBundle	Bundle
        //   3	79	3	localParcel1	Parcel
        //   7	70	4	localParcel2	Parcel
        //   74	12	5	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   9	20	74	finally
        //   24	35	74	finally
        //   35	56	74	finally
        //   66	71	74	finally
      }
      
      public void playFromUri(Uri paramUri, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
            if (paramUri != null)
            {
              localParcel1.writeInt(1);
              paramUri.writeToParcel(localParcel1, 0);
              if (paramBundle != null)
              {
                localParcel1.writeInt(1);
                paramBundle.writeToParcel(localParcel1, 0);
                this.mRemote.transact(16, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      public void previous()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(21, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public void rate(RatingCompat paramRatingCompat)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +42 -> 57
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 145	android/support/v4/media/RatingCompat:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   33: bipush 25
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 44 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 47	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 50	android/os/Parcel:recycle	()V
        //   52: aload_2
        //   53: invokevirtual 50	android/os/Parcel:recycle	()V
        //   56: return
        //   57: aload_2
        //   58: iconst_0
        //   59: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   62: goto -33 -> 29
        //   65: astore 4
        //   67: aload_3
        //   68: invokevirtual 50	android/os/Parcel:recycle	()V
        //   71: aload_2
        //   72: invokevirtual 50	android/os/Parcel:recycle	()V
        //   75: aload 4
        //   77: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	78	0	this	Proxy
        //   0	78	1	paramRatingCompat	RatingCompat
        //   3	69	2	localParcel1	Parcel
        //   7	61	3	localParcel2	Parcel
        //   65	11	4	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   8	14	65	finally
        //   18	29	65	finally
        //   29	48	65	finally
        //   57	62	65	finally
      }
      
      /* Error */
      public void registerCallbackListener(IMediaControllerCallback paramIMediaControllerCallback)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +44 -> 59
        //   18: aload_1
        //   19: invokeinterface 151 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 154	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   36: iconst_3
        //   37: aload_2
        //   38: aload_3
        //   39: iconst_0
        //   40: invokeinterface 44 5 0
        //   45: pop
        //   46: aload_3
        //   47: invokevirtual 47	android/os/Parcel:readException	()V
        //   50: aload_3
        //   51: invokevirtual 50	android/os/Parcel:recycle	()V
        //   54: aload_2
        //   55: invokevirtual 50	android/os/Parcel:recycle	()V
        //   58: return
        //   59: aconst_null
        //   60: astore 5
        //   62: goto -36 -> 26
        //   65: astore 4
        //   67: aload_3
        //   68: invokevirtual 50	android/os/Parcel:recycle	()V
        //   71: aload_2
        //   72: invokevirtual 50	android/os/Parcel:recycle	()V
        //   75: aload 4
        //   77: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	78	0	this	Proxy
        //   0	78	1	paramIMediaControllerCallback	IMediaControllerCallback
        //   3	69	2	localParcel1	Parcel
        //   7	61	3	localParcel2	Parcel
        //   65	11	4	localObject	Object
        //   24	37	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	65	finally
        //   18	26	65	finally
        //   26	50	65	finally
      }
      
      public void rewind()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(23, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void seekTo(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          localParcel1.writeLong(paramLong);
          this.mRemote.transact(24, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void sendCommand(String paramString, Bundle paramBundle, MediaSessionCompat.ResultReceiverWrapper paramResultReceiverWrapper)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
            localParcel1.writeString(paramString);
            if (paramBundle != null)
            {
              localParcel1.writeInt(1);
              paramBundle.writeToParcel(localParcel1, 0);
              if (paramResultReceiverWrapper != null)
              {
                localParcel1.writeInt(1);
                paramResultReceiverWrapper.writeToParcel(localParcel1, 0);
                this.mRemote.transact(1, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      /* Error */
      public void sendCustomAction(String paramString, Bundle paramBundle)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 27
        //   12: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_3
        //   16: aload_1
        //   17: invokevirtual 38	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   20: aload_2
        //   21: ifnull +45 -> 66
        //   24: aload_3
        //   25: iconst_1
        //   26: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   29: aload_2
        //   30: aload_3
        //   31: iconst_0
        //   32: invokevirtual 133	android/os/Bundle:writeToParcel	(Landroid/os/Parcel;I)V
        //   35: aload_0
        //   36: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   39: bipush 26
        //   41: aload_3
        //   42: aload 4
        //   44: iconst_0
        //   45: invokeinterface 44 5 0
        //   50: pop
        //   51: aload 4
        //   53: invokevirtual 47	android/os/Parcel:readException	()V
        //   56: aload 4
        //   58: invokevirtual 50	android/os/Parcel:recycle	()V
        //   61: aload_3
        //   62: invokevirtual 50	android/os/Parcel:recycle	()V
        //   65: return
        //   66: aload_3
        //   67: iconst_0
        //   68: invokevirtual 35	android/os/Parcel:writeInt	(I)V
        //   71: goto -36 -> 35
        //   74: astore 5
        //   76: aload 4
        //   78: invokevirtual 50	android/os/Parcel:recycle	()V
        //   81: aload_3
        //   82: invokevirtual 50	android/os/Parcel:recycle	()V
        //   85: aload 5
        //   87: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	88	0	this	Proxy
        //   0	88	1	paramString	String
        //   0	88	2	paramBundle	Bundle
        //   3	79	3	localParcel1	Parcel
        //   7	70	4	localParcel2	Parcel
        //   74	12	5	localObject	Object
        // Exception table:
        //   from	to	target	type
        //   9	20	74	finally
        //   24	35	74	finally
        //   35	56	74	finally
        //   66	71	74	finally
      }
      
      public boolean sendMediaButton(KeyEvent paramKeyEvent)
        throws RemoteException
      {
        boolean bool = true;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
            if (paramKeyEvent != null)
            {
              localParcel1.writeInt(1);
              paramKeyEvent.writeToParcel(localParcel1, 0);
              this.mRemote.transact(2, localParcel1, localParcel2, 0);
              localParcel2.readException();
              int i = localParcel2.readInt();
              if (i != 0) {
                return bool;
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
            bool = false;
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      public void setVolumeTo(int paramInt1, int paramInt2, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          localParcel1.writeString(paramString);
          this.mRemote.transact(12, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void skipToQueueItem(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          localParcel1.writeLong(paramLong);
          this.mRemote.transact(17, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void stop()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("android.support.v4.media.session.IMediaSession");
          this.mRemote.transact(19, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public void unregisterCallbackListener(IMediaControllerCallback paramIMediaControllerCallback)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 25	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 27
        //   11: invokevirtual 31	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +44 -> 59
        //   18: aload_1
        //   19: invokeinterface 151 1 0
        //   24: astore 5
        //   26: aload_2
        //   27: aload 5
        //   29: invokevirtual 154	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   32: aload_0
        //   33: getfield 15	android/support/v4/media/session/IMediaSession$Stub$Proxy:mRemote	Landroid/os/IBinder;
        //   36: iconst_4
        //   37: aload_2
        //   38: aload_3
        //   39: iconst_0
        //   40: invokeinterface 44 5 0
        //   45: pop
        //   46: aload_3
        //   47: invokevirtual 47	android/os/Parcel:readException	()V
        //   50: aload_3
        //   51: invokevirtual 50	android/os/Parcel:recycle	()V
        //   54: aload_2
        //   55: invokevirtual 50	android/os/Parcel:recycle	()V
        //   58: return
        //   59: aconst_null
        //   60: astore 5
        //   62: goto -36 -> 26
        //   65: astore 4
        //   67: aload_3
        //   68: invokevirtual 50	android/os/Parcel:recycle	()V
        //   71: aload_2
        //   72: invokevirtual 50	android/os/Parcel:recycle	()V
        //   75: aload 4
        //   77: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	78	0	this	Proxy
        //   0	78	1	paramIMediaControllerCallback	IMediaControllerCallback
        //   3	69	2	localParcel1	Parcel
        //   7	61	3	localParcel2	Parcel
        //   65	11	4	localObject	Object
        //   24	37	5	localIBinder	IBinder
        // Exception table:
        //   from	to	target	type
        //   8	14	65	finally
        //   18	26	65	finally
        //   26	50	65	finally
      }
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/media/session/IMediaSession.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */