package com.soundcloud.android.crop;

import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.net.Uri;
import android.opengl.GLES10;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.concurrent.CountDownLatch;

public class CropImageActivity
  extends MonitoredActivity
{
  private static final int SIZE_DEFAULT = 2048;
  private static final int SIZE_LIMIT = 4096;
  private int aspectX;
  private int aspectY;
  private HighlightView cropView;
  private int exifRotation;
  private final Handler handler = new Handler();
  private CropImageView imageView;
  private boolean isSaving;
  private int maxX;
  private int maxY;
  private RotateBitmap rotateBitmap;
  private int sampleSize;
  private Uri saveUri;
  private Uri sourceUri;
  
  /* Error */
  private int calculateBitmapSampleSize(Uri paramUri)
    throws IOException
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_2
    //   2: new 77	android/graphics/BitmapFactory$Options
    //   5: dup
    //   6: invokespecial 78	android/graphics/BitmapFactory$Options:<init>	()V
    //   9: astore_3
    //   10: aload_3
    //   11: iconst_1
    //   12: putfield 81	android/graphics/BitmapFactory$Options:inJustDecodeBounds	Z
    //   15: aload_0
    //   16: invokevirtual 85	com/soundcloud/android/crop/CropImageActivity:getContentResolver	()Landroid/content/ContentResolver;
    //   19: aload_1
    //   20: invokevirtual 91	android/content/ContentResolver:openInputStream	(Landroid/net/Uri;)Ljava/io/InputStream;
    //   23: astore_2
    //   24: aload_2
    //   25: aconst_null
    //   26: aload_3
    //   27: invokestatic 97	android/graphics/BitmapFactory:decodeStream	(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   30: pop
    //   31: aload_2
    //   32: invokestatic 103	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   35: aload_0
    //   36: invokespecial 107	com/soundcloud/android/crop/CropImageActivity:getMaxImageSize	()I
    //   39: istore 6
    //   41: iconst_1
    //   42: istore 7
    //   44: aload_3
    //   45: getfield 110	android/graphics/BitmapFactory$Options:outHeight	I
    //   48: iload 7
    //   50: idiv
    //   51: iload 6
    //   53: if_icmpgt +15 -> 68
    //   56: aload_3
    //   57: getfield 113	android/graphics/BitmapFactory$Options:outWidth	I
    //   60: iload 7
    //   62: idiv
    //   63: iload 6
    //   65: if_icmple +21 -> 86
    //   68: iload 7
    //   70: iconst_1
    //   71: ishl
    //   72: istore 7
    //   74: goto -30 -> 44
    //   77: astore 4
    //   79: aload_2
    //   80: invokestatic 103	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   83: aload 4
    //   85: athrow
    //   86: iload 7
    //   88: ireturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	89	0	this	CropImageActivity
    //   0	89	1	paramUri	Uri
    //   1	79	2	localInputStream	InputStream
    //   9	48	3	localOptions	BitmapFactory.Options
    //   77	7	4	localObject	Object
    //   39	27	6	i	int
    //   42	45	7	j	int
    // Exception table:
    //   from	to	target	type
    //   15	31	77	finally
  }
  
  private void clearImageView()
  {
    this.imageView.clear();
    if (this.rotateBitmap != null) {
      this.rotateBitmap.recycle();
    }
    System.gc();
  }
  
  /* Error */
  private Bitmap decodeRegionCrop(Rect paramRect, int paramInt1, int paramInt2)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 137	com/soundcloud/android/crop/CropImageActivity:clearImageView	()V
    //   4: aconst_null
    //   5: astore 4
    //   7: aconst_null
    //   8: astore 5
    //   10: aload_0
    //   11: invokevirtual 85	com/soundcloud/android/crop/CropImageActivity:getContentResolver	()Landroid/content/ContentResolver;
    //   14: aload_0
    //   15: getfield 139	com/soundcloud/android/crop/CropImageActivity:sourceUri	Landroid/net/Uri;
    //   18: invokevirtual 91	android/content/ContentResolver:openInputStream	(Landroid/net/Uri;)Ljava/io/InputStream;
    //   21: astore 4
    //   23: aload 4
    //   25: iconst_0
    //   26: invokestatic 145	android/graphics/BitmapRegionDecoder:newInstance	(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;
    //   29: astore 9
    //   31: aload 9
    //   33: invokevirtual 148	android/graphics/BitmapRegionDecoder:getWidth	()I
    //   36: istore 10
    //   38: aload 9
    //   40: invokevirtual 151	android/graphics/BitmapRegionDecoder:getHeight	()I
    //   43: istore 11
    //   45: aload_0
    //   46: getfield 153	com/soundcloud/android/crop/CropImageActivity:exifRotation	I
    //   49: istore 12
    //   51: aconst_null
    //   52: astore 5
    //   54: iload 12
    //   56: ifeq +123 -> 179
    //   59: new 155	android/graphics/Matrix
    //   62: dup
    //   63: invokespecial 156	android/graphics/Matrix:<init>	()V
    //   66: astore 13
    //   68: aload 13
    //   70: aload_0
    //   71: getfield 153	com/soundcloud/android/crop/CropImageActivity:exifRotation	I
    //   74: ineg
    //   75: i2f
    //   76: invokevirtual 160	android/graphics/Matrix:setRotate	(F)V
    //   79: new 162	android/graphics/RectF
    //   82: dup
    //   83: invokespecial 163	android/graphics/RectF:<init>	()V
    //   86: astore 14
    //   88: aload 13
    //   90: aload 14
    //   92: new 162	android/graphics/RectF
    //   95: dup
    //   96: aload_1
    //   97: invokespecial 166	android/graphics/RectF:<init>	(Landroid/graphics/Rect;)V
    //   100: invokevirtual 170	android/graphics/Matrix:mapRect	(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z
    //   103: pop
    //   104: aload 14
    //   106: getfield 174	android/graphics/RectF:left	F
    //   109: fconst_0
    //   110: fcmpg
    //   111: ifge +173 -> 284
    //   114: iload 10
    //   116: i2f
    //   117: fstore 16
    //   119: aload 14
    //   121: getfield 177	android/graphics/RectF:top	F
    //   124: fconst_0
    //   125: fcmpg
    //   126: ifge +164 -> 290
    //   129: iload 11
    //   131: i2f
    //   132: fstore 17
    //   134: aload 14
    //   136: fload 16
    //   138: fload 17
    //   140: invokevirtual 181	android/graphics/RectF:offset	(FF)V
    //   143: new 183	android/graphics/Rect
    //   146: dup
    //   147: aload 14
    //   149: getfield 174	android/graphics/RectF:left	F
    //   152: f2i
    //   153: aload 14
    //   155: getfield 177	android/graphics/RectF:top	F
    //   158: f2i
    //   159: aload 14
    //   161: getfield 186	android/graphics/RectF:right	F
    //   164: f2i
    //   165: aload 14
    //   167: getfield 189	android/graphics/RectF:bottom	F
    //   170: f2i
    //   171: invokespecial 192	android/graphics/Rect:<init>	(IIII)V
    //   174: astore 18
    //   176: aload 18
    //   178: astore_1
    //   179: new 77	android/graphics/BitmapFactory$Options
    //   182: dup
    //   183: invokespecial 78	android/graphics/BitmapFactory$Options:<init>	()V
    //   186: astore 19
    //   188: aload 9
    //   190: aload_1
    //   191: aload 19
    //   193: invokevirtual 196	android/graphics/BitmapRegionDecoder:decodeRegion	(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   196: astore 5
    //   198: aload 5
    //   200: ifnull +76 -> 276
    //   203: aload_1
    //   204: invokevirtual 199	android/graphics/Rect:width	()I
    //   207: iload_2
    //   208: if_icmpgt +11 -> 219
    //   211: aload_1
    //   212: invokevirtual 202	android/graphics/Rect:height	()I
    //   215: iload_3
    //   216: if_icmple +60 -> 276
    //   219: new 155	android/graphics/Matrix
    //   222: dup
    //   223: invokespecial 156	android/graphics/Matrix:<init>	()V
    //   226: astore 21
    //   228: aload 21
    //   230: iload_2
    //   231: i2f
    //   232: aload_1
    //   233: invokevirtual 199	android/graphics/Rect:width	()I
    //   236: i2f
    //   237: fdiv
    //   238: iload_3
    //   239: i2f
    //   240: aload_1
    //   241: invokevirtual 202	android/graphics/Rect:height	()I
    //   244: i2f
    //   245: fdiv
    //   246: invokevirtual 206	android/graphics/Matrix:postScale	(FF)Z
    //   249: pop
    //   250: aload 5
    //   252: iconst_0
    //   253: iconst_0
    //   254: aload 5
    //   256: invokevirtual 209	android/graphics/Bitmap:getWidth	()I
    //   259: aload 5
    //   261: invokevirtual 210	android/graphics/Bitmap:getHeight	()I
    //   264: aload 21
    //   266: iconst_1
    //   267: invokestatic 214	android/graphics/Bitmap:createBitmap	(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    //   270: astore 23
    //   272: aload 23
    //   274: astore 5
    //   276: aload 4
    //   278: invokestatic 103	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   281: aload 5
    //   283: areturn
    //   284: fconst_0
    //   285: fstore 16
    //   287: goto -168 -> 119
    //   290: fconst_0
    //   291: fstore 17
    //   293: goto -159 -> 134
    //   296: astore 20
    //   298: new 135	java/lang/IllegalArgumentException
    //   301: dup
    //   302: new 216	java/lang/StringBuilder
    //   305: dup
    //   306: invokespecial 217	java/lang/StringBuilder:<init>	()V
    //   309: ldc -37
    //   311: invokevirtual 223	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   314: aload_1
    //   315: invokevirtual 226	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   318: ldc -28
    //   320: invokevirtual 223	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   323: iload 10
    //   325: invokevirtual 231	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   328: ldc -23
    //   330: invokevirtual 223	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   333: iload 11
    //   335: invokevirtual 231	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   338: ldc -23
    //   340: invokevirtual 223	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   343: aload_0
    //   344: getfield 153	com/soundcloud/android/crop/CropImageActivity:exifRotation	I
    //   347: invokevirtual 231	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   350: ldc -21
    //   352: invokevirtual 223	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   355: invokevirtual 239	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   358: aload 20
    //   360: invokespecial 242	java/lang/IllegalArgumentException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   363: athrow
    //   364: astore 8
    //   366: new 216	java/lang/StringBuilder
    //   369: dup
    //   370: invokespecial 217	java/lang/StringBuilder:<init>	()V
    //   373: ldc -12
    //   375: invokevirtual 223	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   378: aload 8
    //   380: invokevirtual 247	java/io/IOException:getMessage	()Ljava/lang/String;
    //   383: invokevirtual 223	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   386: invokevirtual 239	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   389: aload 8
    //   391: invokestatic 252	com/soundcloud/android/crop/Log:e	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   394: aload_0
    //   395: aload 8
    //   397: invokespecial 256	com/soundcloud/android/crop/CropImageActivity:setResultException	(Ljava/lang/Throwable;)V
    //   400: aload 4
    //   402: invokestatic 103	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   405: aload 5
    //   407: areturn
    //   408: astore 7
    //   410: new 216	java/lang/StringBuilder
    //   413: dup
    //   414: invokespecial 217	java/lang/StringBuilder:<init>	()V
    //   417: ldc_w 258
    //   420: invokevirtual 223	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   423: aload 7
    //   425: invokevirtual 259	java/lang/OutOfMemoryError:getMessage	()Ljava/lang/String;
    //   428: invokevirtual 223	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   431: invokevirtual 239	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   434: aload 7
    //   436: invokestatic 252	com/soundcloud/android/crop/Log:e	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   439: aload_0
    //   440: aload 7
    //   442: invokespecial 256	com/soundcloud/android/crop/CropImageActivity:setResultException	(Ljava/lang/Throwable;)V
    //   445: aload 4
    //   447: invokestatic 103	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   450: aload 5
    //   452: areturn
    //   453: astore 6
    //   455: aload 4
    //   457: invokestatic 103	com/soundcloud/android/crop/CropUtil:closeSilently	(Ljava/io/Closeable;)V
    //   460: aload 6
    //   462: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	463	0	this	CropImageActivity
    //   0	463	1	paramRect	Rect
    //   0	463	2	paramInt1	int
    //   0	463	3	paramInt2	int
    //   5	451	4	localInputStream	InputStream
    //   8	443	5	localObject1	Object
    //   453	8	6	localObject2	Object
    //   408	33	7	localOutOfMemoryError	OutOfMemoryError
    //   364	32	8	localIOException	IOException
    //   29	160	9	localBitmapRegionDecoder	android.graphics.BitmapRegionDecoder
    //   36	288	10	i	int
    //   43	291	11	j	int
    //   49	6	12	k	int
    //   66	23	13	localMatrix1	Matrix
    //   86	80	14	localRectF	RectF
    //   117	169	16	f1	float
    //   132	160	17	f2	float
    //   174	3	18	localRect	Rect
    //   186	6	19	localOptions	BitmapFactory.Options
    //   296	63	20	localIllegalArgumentException	IllegalArgumentException
    //   226	39	21	localMatrix2	Matrix
    //   270	3	23	localBitmap	Bitmap
    // Exception table:
    //   from	to	target	type
    //   179	198	296	java/lang/IllegalArgumentException
    //   203	219	296	java/lang/IllegalArgumentException
    //   219	272	296	java/lang/IllegalArgumentException
    //   10	51	364	java/io/IOException
    //   59	114	364	java/io/IOException
    //   119	129	364	java/io/IOException
    //   134	176	364	java/io/IOException
    //   179	198	364	java/io/IOException
    //   203	219	364	java/io/IOException
    //   219	272	364	java/io/IOException
    //   298	364	364	java/io/IOException
    //   10	51	408	java/lang/OutOfMemoryError
    //   59	114	408	java/lang/OutOfMemoryError
    //   119	129	408	java/lang/OutOfMemoryError
    //   134	176	408	java/lang/OutOfMemoryError
    //   179	198	408	java/lang/OutOfMemoryError
    //   203	219	408	java/lang/OutOfMemoryError
    //   219	272	408	java/lang/OutOfMemoryError
    //   298	364	408	java/lang/OutOfMemoryError
    //   10	51	453	finally
    //   59	114	453	finally
    //   119	129	453	finally
    //   134	176	453	finally
    //   179	198	453	finally
    //   203	219	453	finally
    //   219	272	453	finally
    //   298	364	453	finally
    //   366	400	453	finally
    //   410	445	453	finally
  }
  
  private int getMaxImageSize()
  {
    int i = getMaxTextureSize();
    if (i == 0) {
      return 2048;
    }
    return Math.min(i, 4096);
  }
  
  private int getMaxTextureSize()
  {
    int[] arrayOfInt = new int[1];
    GLES10.glGetIntegerv(3379, arrayOfInt, 0);
    return arrayOfInt[0];
  }
  
  private void loadInput()
  {
    Intent localIntent = getIntent();
    Bundle localBundle = localIntent.getExtras();
    if (localBundle != null)
    {
      this.aspectX = localBundle.getInt("aspect_x");
      this.aspectY = localBundle.getInt("aspect_y");
      this.maxX = localBundle.getInt("max_x");
      this.maxY = localBundle.getInt("max_y");
      this.saveUri = ((Uri)localBundle.getParcelable("output"));
    }
    this.sourceUri = localIntent.getData();
    InputStream localInputStream;
    if (this.sourceUri != null)
    {
      this.exifRotation = CropUtil.getExifRotation(CropUtil.getFromMediaUri(this, getContentResolver(), this.sourceUri));
      localInputStream = null;
    }
    try
    {
      this.sampleSize = calculateBitmapSampleSize(this.sourceUri);
      localInputStream = getContentResolver().openInputStream(this.sourceUri);
      BitmapFactory.Options localOptions = new BitmapFactory.Options();
      localOptions.inSampleSize = this.sampleSize;
      this.rotateBitmap = new RotateBitmap(BitmapFactory.decodeStream(localInputStream, null, localOptions), this.exifRotation);
      return;
    }
    catch (IOException localIOException)
    {
      Log.e("Error reading image: " + localIOException.getMessage(), localIOException);
      setResultException(localIOException);
      return;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      Log.e("OOM reading image: " + localOutOfMemoryError.getMessage(), localOutOfMemoryError);
      setResultException(localOutOfMemoryError);
      return;
    }
    finally
    {
      CropUtil.closeSilently(localInputStream);
    }
  }
  
  private void onSaveClicked()
  {
    if ((this.cropView == null) || (this.isSaving)) {
      return;
    }
    this.isSaving = true;
    Rect localRect = this.cropView.getScaledCropRect(this.sampleSize);
    int i = localRect.width();
    int j = localRect.height();
    int k = i;
    int m = j;
    float f;
    if ((this.maxX > 0) && (this.maxY > 0) && ((i > this.maxX) || (j > this.maxY)))
    {
      f = i / j;
      if (this.maxX / this.maxY <= f) {
        break label185;
      }
      m = this.maxY;
      k = (int)(0.5F + f * this.maxY);
    }
    for (;;)
    {
      try
      {
        Bitmap localBitmap = decodeRegionCrop(localRect, k, m);
        if (localBitmap != null)
        {
          this.imageView.setImageRotateBitmapResetBase(new RotateBitmap(localBitmap, this.exifRotation), true);
          this.imageView.center();
          this.imageView.highlightViews.clear();
        }
        saveImage(localBitmap);
        return;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        label185:
        setResultException(localIllegalArgumentException);
        finish();
      }
      k = this.maxX;
      m = (int)(0.5F + this.maxX / f);
    }
  }
  
  private void saveImage(final Bitmap paramBitmap)
  {
    if (paramBitmap != null)
    {
      CropUtil.startBackgroundJob(this, null, getResources().getString(R.string.crop__saving), new Runnable()
      {
        public void run()
        {
          CropImageActivity.this.saveOutput(paramBitmap);
        }
      }, this.handler);
      return;
    }
    finish();
  }
  
  private void saveOutput(final Bitmap paramBitmap)
  {
    if (this.saveUri != null) {
      localOutputStream = null;
    }
    try
    {
      localOutputStream = getContentResolver().openOutputStream(this.saveUri);
      if (localOutputStream != null) {
        paramBitmap.compress(Bitmap.CompressFormat.JPEG, 90, localOutputStream);
      }
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        setResultException(localIOException);
        Log.e("Cannot open file: " + this.saveUri, localIOException);
        CropUtil.closeSilently(localOutputStream);
      }
    }
    finally
    {
      CropUtil.closeSilently(localOutputStream);
    }
    CropUtil.copyExifRotation(CropUtil.getFromMediaUri(this, getContentResolver(), this.sourceUri), CropUtil.getFromMediaUri(this, getContentResolver(), this.saveUri));
    setResultUri(this.saveUri);
    this.handler.post(new Runnable()
    {
      public void run()
      {
        CropImageActivity.this.imageView.clear();
        paramBitmap.recycle();
      }
    });
    finish();
  }
  
  private void setResultException(Throwable paramThrowable)
  {
    setResult(404, new Intent().putExtra("error", paramThrowable));
  }
  
  private void setResultUri(Uri paramUri)
  {
    setResult(-1, new Intent().putExtra("output", paramUri));
  }
  
  private void setupViews()
  {
    setContentView(R.layout.crop__activity_crop);
    this.imageView = ((CropImageView)findViewById(R.id.crop_image));
    this.imageView.context = this;
    this.imageView.setRecycler(new ImageViewTouchBase.Recycler()
    {
      public void recycle(Bitmap paramAnonymousBitmap)
      {
        paramAnonymousBitmap.recycle();
        System.gc();
      }
    });
    findViewById(R.id.btn_cancel).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        CropImageActivity.this.setResult(0);
        CropImageActivity.this.finish();
      }
    });
    findViewById(R.id.btn_done).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        CropImageActivity.this.onSaveClicked();
      }
    });
  }
  
  @TargetApi(19)
  private void setupWindowFlags()
  {
    requestWindowFeature(1);
    if (Build.VERSION.SDK_INT >= 19) {
      getWindow().clearFlags(67108864);
    }
  }
  
  private void startCrop()
  {
    if (isFinishing()) {
      return;
    }
    this.imageView.setImageRotateBitmapResetBase(this.rotateBitmap, true);
    CropUtil.startBackgroundJob(this, null, getResources().getString(R.string.crop__wait), new Runnable()
    {
      public void run()
      {
        final CountDownLatch localCountDownLatch = new CountDownLatch(1);
        CropImageActivity.this.handler.post(new Runnable()
        {
          public void run()
          {
            if (CropImageActivity.this.imageView.getScale() == 1.0F) {
              CropImageActivity.this.imageView.center();
            }
            localCountDownLatch.countDown();
          }
        });
        try
        {
          localCountDownLatch.await();
          new CropImageActivity.Cropper(CropImageActivity.this, null).crop();
          return;
        }
        catch (InterruptedException localInterruptedException)
        {
          throw new RuntimeException(localInterruptedException);
        }
      }
    }, this.handler);
  }
  
  public boolean isSaving()
  {
    return this.isSaving;
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    setupWindowFlags();
    setupViews();
    loadInput();
    if (this.rotateBitmap == null)
    {
      finish();
      return;
    }
    startCrop();
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    if (this.rotateBitmap != null) {
      this.rotateBitmap.recycle();
    }
  }
  
  public boolean onSearchRequested()
  {
    return false;
  }
  
  private class Cropper
  {
    private Cropper() {}
    
    private void makeDefault()
    {
      if (CropImageActivity.this.rotateBitmap == null) {
        return;
      }
      HighlightView localHighlightView = new HighlightView(CropImageActivity.this.imageView);
      int i = CropImageActivity.this.rotateBitmap.getWidth();
      int j = CropImageActivity.this.rotateBitmap.getHeight();
      Rect localRect = new Rect(0, 0, i, j);
      int k = 4 * Math.min(i, j) / 5;
      int m = k;
      if ((CropImageActivity.this.aspectX != 0) && (CropImageActivity.this.aspectY != 0))
      {
        if (CropImageActivity.this.aspectX <= CropImageActivity.this.aspectY) {
          break label249;
        }
        m = k * CropImageActivity.this.aspectY / CropImageActivity.this.aspectX;
      }
      for (;;)
      {
        int n = (i - k) / 2;
        int i1 = (j - m) / 2;
        RectF localRectF = new RectF(n, i1, n + k, i1 + m);
        Matrix localMatrix = CropImageActivity.this.imageView.getUnrotatedMatrix();
        int i2 = CropImageActivity.this.aspectX;
        boolean bool = false;
        if (i2 != 0)
        {
          int i3 = CropImageActivity.this.aspectY;
          bool = false;
          if (i3 != 0) {
            bool = true;
          }
        }
        localHighlightView.setup(localMatrix, localRect, localRectF, bool);
        CropImageActivity.this.imageView.add(localHighlightView);
        return;
        label249:
        k = m * CropImageActivity.this.aspectX / CropImageActivity.this.aspectY;
      }
    }
    
    public void crop()
    {
      CropImageActivity.this.handler.post(new Runnable()
      {
        public void run()
        {
          CropImageActivity.Cropper.this.makeDefault();
          CropImageActivity.this.imageView.invalidate();
          if (CropImageActivity.this.imageView.highlightViews.size() == 1)
          {
            CropImageActivity.access$802(CropImageActivity.this, (HighlightView)CropImageActivity.this.imageView.highlightViews.get(0));
            CropImageActivity.this.cropView.setFocus(true);
          }
        }
      });
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/soundcloud/android/crop/CropImageActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */