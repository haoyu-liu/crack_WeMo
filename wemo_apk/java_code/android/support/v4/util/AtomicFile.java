package android.support.v4.util;

import android.util.Log;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class AtomicFile
{
  private final File mBackupName;
  private final File mBaseName;
  
  public AtomicFile(File paramFile)
  {
    this.mBaseName = paramFile;
    this.mBackupName = new File(paramFile.getPath() + ".bak");
  }
  
  static boolean sync(FileOutputStream paramFileOutputStream)
  {
    if (paramFileOutputStream != null) {}
    try
    {
      paramFileOutputStream.getFD().sync();
      return true;
    }
    catch (IOException localIOException) {}
    return false;
  }
  
  public void delete()
  {
    this.mBaseName.delete();
    this.mBackupName.delete();
  }
  
  public void failWrite(FileOutputStream paramFileOutputStream)
  {
    if (paramFileOutputStream != null) {
      sync(paramFileOutputStream);
    }
    try
    {
      paramFileOutputStream.close();
      this.mBaseName.delete();
      this.mBackupName.renameTo(this.mBaseName);
      return;
    }
    catch (IOException localIOException)
    {
      Log.w("AtomicFile", "failWrite: Got exception:", localIOException);
    }
  }
  
  public void finishWrite(FileOutputStream paramFileOutputStream)
  {
    if (paramFileOutputStream != null) {
      sync(paramFileOutputStream);
    }
    try
    {
      paramFileOutputStream.close();
      this.mBackupName.delete();
      return;
    }
    catch (IOException localIOException)
    {
      Log.w("AtomicFile", "finishWrite: Got exception:", localIOException);
    }
  }
  
  public File getBaseFile()
  {
    return this.mBaseName;
  }
  
  public FileInputStream openRead()
    throws FileNotFoundException
  {
    if (this.mBackupName.exists())
    {
      this.mBaseName.delete();
      this.mBackupName.renameTo(this.mBaseName);
    }
    return new FileInputStream(this.mBaseName);
  }
  
  /* Error */
  public byte[] readFully()
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 96	android/support/v4/util/AtomicFile:openRead	()Ljava/io/FileInputStream;
    //   4: astore_1
    //   5: iconst_0
    //   6: istore_2
    //   7: aload_1
    //   8: invokevirtual 100	java/io/FileInputStream:available	()I
    //   11: newarray <illegal type>
    //   13: astore 4
    //   15: aload_1
    //   16: aload 4
    //   18: iload_2
    //   19: aload 4
    //   21: arraylength
    //   22: iload_2
    //   23: isub
    //   24: invokevirtual 104	java/io/FileInputStream:read	([BII)I
    //   27: istore 5
    //   29: iload 5
    //   31: ifgt +10 -> 41
    //   34: aload_1
    //   35: invokevirtual 105	java/io/FileInputStream:close	()V
    //   38: aload 4
    //   40: areturn
    //   41: iload_2
    //   42: iload 5
    //   44: iadd
    //   45: istore_2
    //   46: aload_1
    //   47: invokevirtual 100	java/io/FileInputStream:available	()I
    //   50: istore 6
    //   52: iload 6
    //   54: aload 4
    //   56: arraylength
    //   57: iload_2
    //   58: isub
    //   59: if_icmple -44 -> 15
    //   62: iload_2
    //   63: iload 6
    //   65: iadd
    //   66: newarray <illegal type>
    //   68: astore 7
    //   70: aload 4
    //   72: iconst_0
    //   73: aload 7
    //   75: iconst_0
    //   76: iload_2
    //   77: invokestatic 111	java/lang/System:arraycopy	(Ljava/lang/Object;ILjava/lang/Object;II)V
    //   80: aload 7
    //   82: astore 4
    //   84: goto -69 -> 15
    //   87: astore_3
    //   88: aload_1
    //   89: invokevirtual 105	java/io/FileInputStream:close	()V
    //   92: aload_3
    //   93: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	94	0	this	AtomicFile
    //   4	85	1	localFileInputStream	FileInputStream
    //   6	71	2	i	int
    //   87	6	3	localObject1	Object
    //   13	70	4	localObject2	Object
    //   27	18	5	j	int
    //   50	16	6	k	int
    //   68	13	7	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   7	15	87	finally
    //   15	29	87	finally
    //   46	80	87	finally
  }
  
  public FileOutputStream startWrite()
    throws IOException
  {
    if (this.mBaseName.exists())
    {
      if (this.mBackupName.exists()) {
        break label88;
      }
      if (!this.mBaseName.renameTo(this.mBackupName)) {
        Log.w("AtomicFile", "Couldn't rename file " + this.mBaseName + " to backup file " + this.mBackupName);
      }
    }
    for (;;)
    {
      try
      {
        FileOutputStream localFileOutputStream1 = new FileOutputStream(this.mBaseName);
        return localFileOutputStream1;
      }
      catch (FileNotFoundException localFileNotFoundException1)
      {
        label88:
        if (this.mBaseName.getParentFile().mkdirs()) {
          continue;
        }
        throw new IOException("Couldn't create directory " + this.mBaseName);
        try
        {
          FileOutputStream localFileOutputStream2 = new FileOutputStream(this.mBaseName);
          return localFileOutputStream2;
        }
        catch (FileNotFoundException localFileNotFoundException2)
        {
          throw new IOException("Couldn't create " + this.mBaseName);
        }
      }
      this.mBaseName.delete();
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/android/support/v4/util/AtomicFile.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */