package android.support.v4.media;

import android.os.Bundle;
import java.util.List;

public class MediaBrowserCompatUtils
{
  public static List<MediaBrowserCompat.MediaItem> applyOptions(List<MediaBrowserCompat.MediaItem> paramList, Bundle paramBundle)
  {
    int i = paramBundle.getInt("android.media.browse.extra.PAGE", -1);
    int j = paramBundle.getInt("android.media.browse.extra.PAGE_SIZE", -1);
    if ((i == -1) && (j == -1)) {
      return paramList;
    }
    int k = j * (i - 1);
    int m = k + j;
    if ((i < 1) || (j < 1) || (k >= paramList.size())) {
      return null;
    }
    if (m > paramList.size()) {
      m = paramList.size();
    }
    return paramList.subList(k, m);
  }
  
  public static boolean areSameOptions(Bundle paramBundle1, Bundle paramBundle2)
  {
    if (paramBundle1 == paramBundle2) {}
    do
    {
      do
      {
        do
        {
          return true;
          if (paramBundle1 != null) {
            break;
          }
        } while ((paramBundle2.getInt("android.media.browse.extra.PAGE", -1) == -1) && (paramBundle2.getInt("android.media.browse.extra.PAGE_SIZE", -1) == -1));
        return false;
        if (paramBundle2 != null) {
          break;
        }
      } while ((paramBundle1.getInt("android.media.browse.extra.PAGE", -1) == -1) && (paramBundle1.getInt("android.media.browse.extra.PAGE_SIZE", -1) == -1));
      return false;
    } while ((paramBundle1.getInt("android.media.browse.extra.PAGE", -1) == paramBundle2.getInt("android.media.browse.extra.PAGE", -1)) && (paramBundle1.getInt("android.media.browse.extra.PAGE_SIZE", -1) == paramBundle2.getInt("android.media.browse.extra.PAGE_SIZE", -1)));
    return false;
  }
  
  public static boolean hasDuplicatedItems(Bundle paramBundle1, Bundle paramBundle2)
  {
    int i;
    int j;
    label12:
    int k;
    label19:
    int m;
    label26:
    int n;
    int i1;
    label44:
    int i2;
    int i3;
    if (paramBundle1 == null)
    {
      i = -1;
      if (paramBundle2 != null) {
        break label89;
      }
      j = -1;
      if (paramBundle1 != null) {
        break label100;
      }
      k = -1;
      if (paramBundle2 != null) {
        break label112;
      }
      m = -1;
      if ((i != -1) && (k != -1)) {
        break label124;
      }
      n = 0;
      i1 = Integer.MAX_VALUE;
      if ((j != -1) && (m != -1)) {
        break label144;
      }
      i2 = 0;
      i3 = Integer.MAX_VALUE;
      label62:
      if ((n > i2) || (i2 > i1)) {
        break label164;
      }
    }
    label89:
    label100:
    label112:
    label124:
    label144:
    label164:
    while ((n <= i3) && (i3 <= i1))
    {
      return true;
      i = paramBundle1.getInt("android.media.browse.extra.PAGE", -1);
      break;
      j = paramBundle2.getInt("android.media.browse.extra.PAGE", -1);
      break label12;
      k = paramBundle1.getInt("android.media.browse.extra.PAGE_SIZE", -1);
      break label19;
      m = paramBundle2.getInt("android.media.browse.extra.PAGE_SIZE", -1);
      break label26;
      n = k * (i - 1);
      i1 = -1 + (n + k);
      break label44;
      i2 = m * (j - 1);
      i3 = -1 + (i2 + m);
      break label62;
    }
    return false;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/media/MediaBrowserCompatUtils.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */