package android.support.v4.print;

import android.content.ContentResolver;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.CancellationSignal.OnCancelListener;
import android.print.PrintAttributes;
import android.print.PrintAttributes.Builder;
import android.print.PrintAttributes.MediaSize;
import android.print.PrintDocumentAdapter;
import android.print.PrintDocumentAdapter.LayoutResultCallback;
import android.print.PrintDocumentInfo;
import android.print.PrintDocumentInfo.Builder;
import android.print.PrintManager;
import android.util.Log;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

class PrintHelperKitkat
{
  public static final int COLOR_MODE_COLOR = 2;
  public static final int COLOR_MODE_MONOCHROME = 1;
  private static final String LOG_TAG = "PrintHelperKitkat";
  private static final int MAX_PRINT_SIZE = 3500;
  public static final int ORIENTATION_LANDSCAPE = 1;
  public static final int ORIENTATION_PORTRAIT = 2;
  public static final int SCALE_MODE_FILL = 2;
  public static final int SCALE_MODE_FIT = 1;
  int mColorMode = 2;
  final Context mContext;
  BitmapFactory.Options mDecodeOptions = null;
  private final Object mLock = new Object();
  int mOrientation = 1;
  int mScaleMode = 2;
  
  PrintHelperKitkat(Context paramContext)
  {
    this.mContext = paramContext;
  }
  
  private Bitmap convertBitmapForColorMode(Bitmap paramBitmap, int paramInt)
  {
    if (paramInt != 1) {
      return paramBitmap;
    }
    Bitmap localBitmap = Bitmap.createBitmap(paramBitmap.getWidth(), paramBitmap.getHeight(), Bitmap.Config.ARGB_8888);
    Canvas localCanvas = new Canvas(localBitmap);
    Paint localPaint = new Paint();
    ColorMatrix localColorMatrix = new ColorMatrix();
    localColorMatrix.setSaturation(0.0F);
    localPaint.setColorFilter(new ColorMatrixColorFilter(localColorMatrix));
    localCanvas.drawBitmap(paramBitmap, 0.0F, 0.0F, localPaint);
    localCanvas.setBitmap(null);
    return localBitmap;
  }
  
  private Matrix getMatrix(int paramInt1, int paramInt2, RectF paramRectF, int paramInt3)
  {
    Matrix localMatrix = new Matrix();
    float f1 = paramRectF.width() / paramInt1;
    if (paramInt3 == 2) {}
    for (float f2 = Math.max(f1, paramRectF.height() / paramInt2);; f2 = Math.min(f1, paramRectF.height() / paramInt2))
    {
      localMatrix.postScale(f2, f2);
      localMatrix.postTranslate((paramRectF.width() - f2 * paramInt1) / 2.0F, (paramRectF.height() - f2 * paramInt2) / 2.0F);
      return localMatrix;
    }
  }
  
  private Bitmap loadBitmap(Uri paramUri, BitmapFactory.Options paramOptions)
    throws FileNotFoundException
  {
    if ((paramUri == null) || (this.mContext == null)) {
      throw new IllegalArgumentException("bad argument to loadBitmap");
    }
    localInputStream = null;
    try
    {
      localInputStream = this.mContext.getContentResolver().openInputStream(paramUri);
      Bitmap localBitmap = BitmapFactory.decodeStream(localInputStream, null, paramOptions);
      if (localInputStream != null) {}
      try
      {
        localInputStream.close();
        return localBitmap;
      }
      catch (IOException localIOException2)
      {
        Log.w("PrintHelperKitkat", "close fail ", localIOException2);
        return localBitmap;
      }
      try
      {
        localInputStream.close();
        throw ((Throwable)localObject);
      }
      catch (IOException localIOException1)
      {
        for (;;)
        {
          Log.w("PrintHelperKitkat", "close fail ", localIOException1);
        }
      }
    }
    finally
    {
      if (localInputStream == null) {}
    }
  }
  
  private Bitmap loadConstrainedBitmap(Uri paramUri, int paramInt)
    throws FileNotFoundException
  {
    if ((paramInt <= 0) || (paramUri == null) || (this.mContext == null)) {
      throw new IllegalArgumentException("bad argument to getScaledBitmap");
    }
    BitmapFactory.Options localOptions1 = new BitmapFactory.Options();
    localOptions1.inJustDecodeBounds = true;
    loadBitmap(paramUri, localOptions1);
    int i = localOptions1.outWidth;
    int j = localOptions1.outHeight;
    if ((i <= 0) || (j <= 0)) {}
    int m;
    do
    {
      return null;
      int k = Math.max(i, j);
      m = 1;
      while (k > paramInt)
      {
        k >>>= 1;
        m <<= 1;
      }
    } while ((m <= 0) || (Math.min(i, j) / m <= 0));
    BitmapFactory.Options localOptions2;
    synchronized (this.mLock)
    {
      this.mDecodeOptions = new BitmapFactory.Options();
      this.mDecodeOptions.inMutable = true;
      this.mDecodeOptions.inSampleSize = m;
      localOptions2 = this.mDecodeOptions;
    }
    try
    {
      Bitmap localBitmap = loadBitmap(paramUri, localOptions2);
      synchronized (this.mLock)
      {
        this.mDecodeOptions = null;
        return localBitmap;
      }
      localObject2 = finally;
      throw ((Throwable)localObject2);
    }
    finally {}
  }
  
  public int getColorMode()
  {
    return this.mColorMode;
  }
  
  public int getOrientation()
  {
    return this.mOrientation;
  }
  
  public int getScaleMode()
  {
    return this.mScaleMode;
  }
  
  public void printBitmap(final String paramString, final Bitmap paramBitmap, final OnPrintFinishCallback paramOnPrintFinishCallback)
  {
    if (paramBitmap == null) {
      return;
    }
    final int i = this.mScaleMode;
    PrintManager localPrintManager = (PrintManager)this.mContext.getSystemService("print");
    PrintAttributes.MediaSize localMediaSize = PrintAttributes.MediaSize.UNKNOWN_PORTRAIT;
    if (paramBitmap.getWidth() > paramBitmap.getHeight()) {
      localMediaSize = PrintAttributes.MediaSize.UNKNOWN_LANDSCAPE;
    }
    PrintAttributes localPrintAttributes = new PrintAttributes.Builder().setMediaSize(localMediaSize).setColorMode(this.mColorMode).build();
    localPrintManager.print(paramString, new PrintDocumentAdapter()
    {
      private PrintAttributes mAttributes;
      
      public void onFinish()
      {
        if (paramOnPrintFinishCallback != null) {
          paramOnPrintFinishCallback.onFinish();
        }
      }
      
      public void onLayout(PrintAttributes paramAnonymousPrintAttributes1, PrintAttributes paramAnonymousPrintAttributes2, CancellationSignal paramAnonymousCancellationSignal, PrintDocumentAdapter.LayoutResultCallback paramAnonymousLayoutResultCallback, Bundle paramAnonymousBundle)
      {
        int i = 1;
        this.mAttributes = paramAnonymousPrintAttributes2;
        PrintDocumentInfo localPrintDocumentInfo = new PrintDocumentInfo.Builder(paramString).setContentType(i).setPageCount(i).build();
        if (!paramAnonymousPrintAttributes2.equals(paramAnonymousPrintAttributes1)) {}
        for (;;)
        {
          paramAnonymousLayoutResultCallback.onLayoutFinished(localPrintDocumentInfo, i);
          return;
          int j = 0;
        }
      }
      
      /* Error */
      public void onWrite(android.print.PageRange[] paramAnonymousArrayOfPageRange, android.os.ParcelFileDescriptor paramAnonymousParcelFileDescriptor, CancellationSignal paramAnonymousCancellationSignal, android.print.PrintDocumentAdapter.WriteResultCallback paramAnonymousWriteResultCallback)
      {
        // Byte code:
        //   0: new 79	android/print/pdf/PrintedPdfDocument
        //   3: dup
        //   4: aload_0
        //   5: getfield 25	android/support/v4/print/PrintHelperKitkat$1:this$0	Landroid/support/v4/print/PrintHelperKitkat;
        //   8: getfield 83	android/support/v4/print/PrintHelperKitkat:mContext	Landroid/content/Context;
        //   11: aload_0
        //   12: getfield 45	android/support/v4/print/PrintHelperKitkat$1:mAttributes	Landroid/print/PrintAttributes;
        //   15: invokespecial 86	android/print/pdf/PrintedPdfDocument:<init>	(Landroid/content/Context;Landroid/print/PrintAttributes;)V
        //   18: astore 5
        //   20: aload_0
        //   21: getfield 25	android/support/v4/print/PrintHelperKitkat$1:this$0	Landroid/support/v4/print/PrintHelperKitkat;
        //   24: aload_0
        //   25: getfield 29	android/support/v4/print/PrintHelperKitkat$1:val$bitmap	Landroid/graphics/Bitmap;
        //   28: aload_0
        //   29: getfield 45	android/support/v4/print/PrintHelperKitkat$1:mAttributes	Landroid/print/PrintAttributes;
        //   32: invokevirtual 90	android/print/PrintAttributes:getColorMode	()I
        //   35: invokestatic 94	android/support/v4/print/PrintHelperKitkat:access$000	(Landroid/support/v4/print/PrintHelperKitkat;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
        //   38: astore 6
        //   40: aload 5
        //   42: iconst_1
        //   43: invokevirtual 98	android/print/pdf/PrintedPdfDocument:startPage	(I)Landroid/graphics/pdf/PdfDocument$Page;
        //   46: astore 9
        //   48: new 100	android/graphics/RectF
        //   51: dup
        //   52: aload 9
        //   54: invokevirtual 106	android/graphics/pdf/PdfDocument$Page:getInfo	()Landroid/graphics/pdf/PdfDocument$PageInfo;
        //   57: invokevirtual 112	android/graphics/pdf/PdfDocument$PageInfo:getContentRect	()Landroid/graphics/Rect;
        //   60: invokespecial 115	android/graphics/RectF:<init>	(Landroid/graphics/Rect;)V
        //   63: astore 10
        //   65: aload_0
        //   66: getfield 25	android/support/v4/print/PrintHelperKitkat$1:this$0	Landroid/support/v4/print/PrintHelperKitkat;
        //   69: aload 6
        //   71: invokevirtual 120	android/graphics/Bitmap:getWidth	()I
        //   74: aload 6
        //   76: invokevirtual 123	android/graphics/Bitmap:getHeight	()I
        //   79: aload 10
        //   81: aload_0
        //   82: getfield 31	android/support/v4/print/PrintHelperKitkat$1:val$fittingMode	I
        //   85: invokestatic 127	android/support/v4/print/PrintHelperKitkat:access$100	(Landroid/support/v4/print/PrintHelperKitkat;IILandroid/graphics/RectF;I)Landroid/graphics/Matrix;
        //   88: astore 11
        //   90: aload 9
        //   92: invokevirtual 131	android/graphics/pdf/PdfDocument$Page:getCanvas	()Landroid/graphics/Canvas;
        //   95: aload 6
        //   97: aload 11
        //   99: aconst_null
        //   100: invokevirtual 137	android/graphics/Canvas:drawBitmap	(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
        //   103: aload 5
        //   105: aload 9
        //   107: invokevirtual 141	android/print/pdf/PrintedPdfDocument:finishPage	(Landroid/graphics/pdf/PdfDocument$Page;)V
        //   110: aload 5
        //   112: new 143	java/io/FileOutputStream
        //   115: dup
        //   116: aload_2
        //   117: invokevirtual 149	android/os/ParcelFileDescriptor:getFileDescriptor	()Ljava/io/FileDescriptor;
        //   120: invokespecial 152	java/io/FileOutputStream:<init>	(Ljava/io/FileDescriptor;)V
        //   123: invokevirtual 156	android/print/pdf/PrintedPdfDocument:writeTo	(Ljava/io/OutputStream;)V
        //   126: iconst_1
        //   127: anewarray 158	android/print/PageRange
        //   130: astore 15
        //   132: aload 15
        //   134: iconst_0
        //   135: getstatic 162	android/print/PageRange:ALL_PAGES	Landroid/print/PageRange;
        //   138: aastore
        //   139: aload 4
        //   141: aload 15
        //   143: invokevirtual 168	android/print/PrintDocumentAdapter$WriteResultCallback:onWriteFinished	([Landroid/print/PageRange;)V
        //   146: aload 5
        //   148: ifnull +8 -> 156
        //   151: aload 5
        //   153: invokevirtual 171	android/print/pdf/PrintedPdfDocument:close	()V
        //   156: aload_2
        //   157: ifnull +7 -> 164
        //   160: aload_2
        //   161: invokevirtual 172	android/os/ParcelFileDescriptor:close	()V
        //   164: aload 6
        //   166: aload_0
        //   167: getfield 29	android/support/v4/print/PrintHelperKitkat$1:val$bitmap	Landroid/graphics/Bitmap;
        //   170: if_acmpeq +8 -> 178
        //   173: aload 6
        //   175: invokevirtual 175	android/graphics/Bitmap:recycle	()V
        //   178: return
        //   179: astore 12
        //   181: ldc -79
        //   183: ldc -77
        //   185: aload 12
        //   187: invokestatic 185	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
        //   190: pop
        //   191: aload 4
        //   193: aconst_null
        //   194: invokevirtual 189	android/print/PrintDocumentAdapter$WriteResultCallback:onWriteFailed	(Ljava/lang/CharSequence;)V
        //   197: goto -51 -> 146
        //   200: astore 7
        //   202: aload 5
        //   204: ifnull +8 -> 212
        //   207: aload 5
        //   209: invokevirtual 171	android/print/pdf/PrintedPdfDocument:close	()V
        //   212: aload_2
        //   213: ifnull +7 -> 220
        //   216: aload_2
        //   217: invokevirtual 172	android/os/ParcelFileDescriptor:close	()V
        //   220: aload 6
        //   222: aload_0
        //   223: getfield 29	android/support/v4/print/PrintHelperKitkat$1:val$bitmap	Landroid/graphics/Bitmap;
        //   226: if_acmpeq +8 -> 234
        //   229: aload 6
        //   231: invokevirtual 175	android/graphics/Bitmap:recycle	()V
        //   234: aload 7
        //   236: athrow
        //   237: astore 14
        //   239: goto -75 -> 164
        //   242: astore 8
        //   244: goto -24 -> 220
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	247	0	this	1
        //   0	247	1	paramAnonymousArrayOfPageRange	android.print.PageRange[]
        //   0	247	2	paramAnonymousParcelFileDescriptor	android.os.ParcelFileDescriptor
        //   0	247	3	paramAnonymousCancellationSignal	CancellationSignal
        //   0	247	4	paramAnonymousWriteResultCallback	android.print.PrintDocumentAdapter.WriteResultCallback
        //   18	190	5	localPrintedPdfDocument	android.print.pdf.PrintedPdfDocument
        //   38	192	6	localBitmap	Bitmap
        //   200	35	7	localObject	Object
        //   242	1	8	localIOException1	IOException
        //   46	60	9	localPage	android.graphics.pdf.PdfDocument.Page
        //   63	17	10	localRectF	RectF
        //   88	10	11	localMatrix	Matrix
        //   179	7	12	localIOException2	IOException
        //   237	1	14	localIOException3	IOException
        //   130	12	15	arrayOfPageRange	android.print.PageRange[]
        // Exception table:
        //   from	to	target	type
        //   110	146	179	java/io/IOException
        //   40	110	200	finally
        //   110	146	200	finally
        //   181	197	200	finally
        //   160	164	237	java/io/IOException
        //   216	220	242	java/io/IOException
      }
    }, localPrintAttributes);
  }
  
  public void printBitmap(final String paramString, final Uri paramUri, final OnPrintFinishCallback paramOnPrintFinishCallback)
    throws FileNotFoundException
  {
    PrintDocumentAdapter local2 = new PrintDocumentAdapter()
    {
      private PrintAttributes mAttributes;
      Bitmap mBitmap = null;
      AsyncTask<Uri, Boolean, Bitmap> mLoadBitmap;
      
      private void cancelLoad()
      {
        synchronized (PrintHelperKitkat.this.mLock)
        {
          if (PrintHelperKitkat.this.mDecodeOptions != null)
          {
            PrintHelperKitkat.this.mDecodeOptions.requestCancelDecode();
            PrintHelperKitkat.this.mDecodeOptions = null;
          }
          return;
        }
      }
      
      public void onFinish()
      {
        super.onFinish();
        cancelLoad();
        if (this.mLoadBitmap != null) {
          this.mLoadBitmap.cancel(true);
        }
        if (paramOnPrintFinishCallback != null) {
          paramOnPrintFinishCallback.onFinish();
        }
        if (this.mBitmap != null)
        {
          this.mBitmap.recycle();
          this.mBitmap = null;
        }
      }
      
      public void onLayout(final PrintAttributes paramAnonymousPrintAttributes1, final PrintAttributes paramAnonymousPrintAttributes2, final CancellationSignal paramAnonymousCancellationSignal, final PrintDocumentAdapter.LayoutResultCallback paramAnonymousLayoutResultCallback, Bundle paramAnonymousBundle)
      {
        int i = 1;
        this.mAttributes = paramAnonymousPrintAttributes2;
        if (paramAnonymousCancellationSignal.isCanceled())
        {
          paramAnonymousLayoutResultCallback.onLayoutCancelled();
          return;
        }
        if (this.mBitmap != null)
        {
          PrintDocumentInfo localPrintDocumentInfo = new PrintDocumentInfo.Builder(paramString).setContentType(i).setPageCount(i).build();
          if (!paramAnonymousPrintAttributes2.equals(paramAnonymousPrintAttributes1)) {}
          for (;;)
          {
            paramAnonymousLayoutResultCallback.onLayoutFinished(localPrintDocumentInfo, i);
            return;
            int j = 0;
          }
        }
        this.mLoadBitmap = new AsyncTask()
        {
          protected Bitmap doInBackground(Uri... paramAnonymous2VarArgs)
          {
            try
            {
              Bitmap localBitmap = PrintHelperKitkat.this.loadConstrainedBitmap(PrintHelperKitkat.2.this.val$imageFile, 3500);
              return localBitmap;
            }
            catch (FileNotFoundException localFileNotFoundException) {}
            return null;
          }
          
          protected void onCancelled(Bitmap paramAnonymous2Bitmap)
          {
            paramAnonymousLayoutResultCallback.onLayoutCancelled();
            PrintHelperKitkat.2.this.mLoadBitmap = null;
          }
          
          protected void onPostExecute(Bitmap paramAnonymous2Bitmap)
          {
            int i = 1;
            super.onPostExecute(paramAnonymous2Bitmap);
            PrintHelperKitkat.2.this.mBitmap = paramAnonymous2Bitmap;
            if (paramAnonymous2Bitmap != null)
            {
              PrintDocumentInfo localPrintDocumentInfo = new PrintDocumentInfo.Builder(PrintHelperKitkat.2.this.val$jobName).setContentType(i).setPageCount(i).build();
              if (!paramAnonymousPrintAttributes2.equals(paramAnonymousPrintAttributes1)) {
                paramAnonymousLayoutResultCallback.onLayoutFinished(localPrintDocumentInfo, i);
              }
            }
            for (;;)
            {
              PrintHelperKitkat.2.this.mLoadBitmap = null;
              return;
              int j = 0;
              break;
              paramAnonymousLayoutResultCallback.onLayoutFailed(null);
            }
          }
          
          protected void onPreExecute()
          {
            paramAnonymousCancellationSignal.setOnCancelListener(new CancellationSignal.OnCancelListener()
            {
              public void onCancel()
              {
                PrintHelperKitkat.2.this.cancelLoad();
                PrintHelperKitkat.2.1.this.cancel(false);
              }
            });
          }
        }.execute(new Uri[0]);
      }
      
      /* Error */
      public void onWrite(android.print.PageRange[] paramAnonymousArrayOfPageRange, android.os.ParcelFileDescriptor paramAnonymousParcelFileDescriptor, CancellationSignal paramAnonymousCancellationSignal, android.print.PrintDocumentAdapter.WriteResultCallback paramAnonymousWriteResultCallback)
      {
        // Byte code:
        //   0: new 138	android/print/pdf/PrintedPdfDocument
        //   3: dup
        //   4: aload_0
        //   5: getfield 30	android/support/v4/print/PrintHelperKitkat$2:this$0	Landroid/support/v4/print/PrintHelperKitkat;
        //   8: getfield 142	android/support/v4/print/PrintHelperKitkat:mContext	Landroid/content/Context;
        //   11: aload_0
        //   12: getfield 84	android/support/v4/print/PrintHelperKitkat$2:mAttributes	Landroid/print/PrintAttributes;
        //   15: invokespecial 145	android/print/pdf/PrintedPdfDocument:<init>	(Landroid/content/Context;Landroid/print/PrintAttributes;)V
        //   18: astore 5
        //   20: aload_0
        //   21: getfield 30	android/support/v4/print/PrintHelperKitkat$2:this$0	Landroid/support/v4/print/PrintHelperKitkat;
        //   24: aload_0
        //   25: getfield 43	android/support/v4/print/PrintHelperKitkat$2:mBitmap	Landroid/graphics/Bitmap;
        //   28: aload_0
        //   29: getfield 84	android/support/v4/print/PrintHelperKitkat$2:mAttributes	Landroid/print/PrintAttributes;
        //   32: invokevirtual 149	android/print/PrintAttributes:getColorMode	()I
        //   35: invokestatic 153	android/support/v4/print/PrintHelperKitkat:access$000	(Landroid/support/v4/print/PrintHelperKitkat;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
        //   38: astore 6
        //   40: aload 5
        //   42: iconst_1
        //   43: invokevirtual 157	android/print/pdf/PrintedPdfDocument:startPage	(I)Landroid/graphics/pdf/PdfDocument$Page;
        //   46: astore 9
        //   48: new 159	android/graphics/RectF
        //   51: dup
        //   52: aload 9
        //   54: invokevirtual 165	android/graphics/pdf/PdfDocument$Page:getInfo	()Landroid/graphics/pdf/PdfDocument$PageInfo;
        //   57: invokevirtual 171	android/graphics/pdf/PdfDocument$PageInfo:getContentRect	()Landroid/graphics/Rect;
        //   60: invokespecial 174	android/graphics/RectF:<init>	(Landroid/graphics/Rect;)V
        //   63: astore 10
        //   65: aload_0
        //   66: getfield 30	android/support/v4/print/PrintHelperKitkat$2:this$0	Landroid/support/v4/print/PrintHelperKitkat;
        //   69: aload_0
        //   70: getfield 43	android/support/v4/print/PrintHelperKitkat$2:mBitmap	Landroid/graphics/Bitmap;
        //   73: invokevirtual 177	android/graphics/Bitmap:getWidth	()I
        //   76: aload_0
        //   77: getfield 43	android/support/v4/print/PrintHelperKitkat$2:mBitmap	Landroid/graphics/Bitmap;
        //   80: invokevirtual 180	android/graphics/Bitmap:getHeight	()I
        //   83: aload 10
        //   85: aload_0
        //   86: getfield 38	android/support/v4/print/PrintHelperKitkat$2:val$fittingMode	I
        //   89: invokestatic 184	android/support/v4/print/PrintHelperKitkat:access$100	(Landroid/support/v4/print/PrintHelperKitkat;IILandroid/graphics/RectF;I)Landroid/graphics/Matrix;
        //   92: astore 11
        //   94: aload 9
        //   96: invokevirtual 188	android/graphics/pdf/PdfDocument$Page:getCanvas	()Landroid/graphics/Canvas;
        //   99: aload 6
        //   101: aload 11
        //   103: aconst_null
        //   104: invokevirtual 194	android/graphics/Canvas:drawBitmap	(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V
        //   107: aload 5
        //   109: aload 9
        //   111: invokevirtual 198	android/print/pdf/PrintedPdfDocument:finishPage	(Landroid/graphics/pdf/PdfDocument$Page;)V
        //   114: aload 5
        //   116: new 200	java/io/FileOutputStream
        //   119: dup
        //   120: aload_2
        //   121: invokevirtual 206	android/os/ParcelFileDescriptor:getFileDescriptor	()Ljava/io/FileDescriptor;
        //   124: invokespecial 209	java/io/FileOutputStream:<init>	(Ljava/io/FileDescriptor;)V
        //   127: invokevirtual 213	android/print/pdf/PrintedPdfDocument:writeTo	(Ljava/io/OutputStream;)V
        //   130: iconst_1
        //   131: anewarray 215	android/print/PageRange
        //   134: astore 15
        //   136: aload 15
        //   138: iconst_0
        //   139: getstatic 219	android/print/PageRange:ALL_PAGES	Landroid/print/PageRange;
        //   142: aastore
        //   143: aload 4
        //   145: aload 15
        //   147: invokevirtual 225	android/print/PrintDocumentAdapter$WriteResultCallback:onWriteFinished	([Landroid/print/PageRange;)V
        //   150: aload 5
        //   152: ifnull +8 -> 160
        //   155: aload 5
        //   157: invokevirtual 228	android/print/pdf/PrintedPdfDocument:close	()V
        //   160: aload_2
        //   161: ifnull +7 -> 168
        //   164: aload_2
        //   165: invokevirtual 229	android/os/ParcelFileDescriptor:close	()V
        //   168: aload 6
        //   170: aload_0
        //   171: getfield 43	android/support/v4/print/PrintHelperKitkat$2:mBitmap	Landroid/graphics/Bitmap;
        //   174: if_acmpeq +8 -> 182
        //   177: aload 6
        //   179: invokevirtual 80	android/graphics/Bitmap:recycle	()V
        //   182: return
        //   183: astore 12
        //   185: ldc -25
        //   187: ldc -23
        //   189: aload 12
        //   191: invokestatic 239	android/util/Log:e	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
        //   194: pop
        //   195: aload 4
        //   197: aconst_null
        //   198: invokevirtual 243	android/print/PrintDocumentAdapter$WriteResultCallback:onWriteFailed	(Ljava/lang/CharSequence;)V
        //   201: goto -51 -> 150
        //   204: astore 7
        //   206: aload 5
        //   208: ifnull +8 -> 216
        //   211: aload 5
        //   213: invokevirtual 228	android/print/pdf/PrintedPdfDocument:close	()V
        //   216: aload_2
        //   217: ifnull +7 -> 224
        //   220: aload_2
        //   221: invokevirtual 229	android/os/ParcelFileDescriptor:close	()V
        //   224: aload 6
        //   226: aload_0
        //   227: getfield 43	android/support/v4/print/PrintHelperKitkat$2:mBitmap	Landroid/graphics/Bitmap;
        //   230: if_acmpeq +8 -> 238
        //   233: aload 6
        //   235: invokevirtual 80	android/graphics/Bitmap:recycle	()V
        //   238: aload 7
        //   240: athrow
        //   241: astore 14
        //   243: goto -75 -> 168
        //   246: astore 8
        //   248: goto -24 -> 224
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	251	0	this	2
        //   0	251	1	paramAnonymousArrayOfPageRange	android.print.PageRange[]
        //   0	251	2	paramAnonymousParcelFileDescriptor	android.os.ParcelFileDescriptor
        //   0	251	3	paramAnonymousCancellationSignal	CancellationSignal
        //   0	251	4	paramAnonymousWriteResultCallback	android.print.PrintDocumentAdapter.WriteResultCallback
        //   18	194	5	localPrintedPdfDocument	android.print.pdf.PrintedPdfDocument
        //   38	196	6	localBitmap	Bitmap
        //   204	35	7	localObject	Object
        //   246	1	8	localIOException1	IOException
        //   46	64	9	localPage	android.graphics.pdf.PdfDocument.Page
        //   63	21	10	localRectF	RectF
        //   92	10	11	localMatrix	Matrix
        //   183	7	12	localIOException2	IOException
        //   241	1	14	localIOException3	IOException
        //   134	12	15	arrayOfPageRange	android.print.PageRange[]
        // Exception table:
        //   from	to	target	type
        //   114	150	183	java/io/IOException
        //   40	114	204	finally
        //   114	150	204	finally
        //   185	201	204	finally
        //   164	168	241	java/io/IOException
        //   220	224	246	java/io/IOException
      }
    };
    PrintManager localPrintManager = (PrintManager)this.mContext.getSystemService("print");
    PrintAttributes.Builder localBuilder = new PrintAttributes.Builder();
    localBuilder.setColorMode(this.mColorMode);
    if (this.mOrientation == 1) {
      localBuilder.setMediaSize(PrintAttributes.MediaSize.UNKNOWN_LANDSCAPE);
    }
    for (;;)
    {
      localPrintManager.print(paramString, local2, localBuilder.build());
      return;
      if (this.mOrientation == 2) {
        localBuilder.setMediaSize(PrintAttributes.MediaSize.UNKNOWN_PORTRAIT);
      }
    }
  }
  
  public void setColorMode(int paramInt)
  {
    this.mColorMode = paramInt;
  }
  
  public void setOrientation(int paramInt)
  {
    this.mOrientation = paramInt;
  }
  
  public void setScaleMode(int paramInt)
  {
    this.mScaleMode = paramInt;
  }
  
  public static abstract interface OnPrintFinishCallback
  {
    public abstract void onFinish();
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/print/PrintHelperKitkat.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */