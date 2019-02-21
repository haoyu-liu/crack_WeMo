package net.lingala.zip4j.exception;

public class ZipException
  extends Exception
{
  private static final long serialVersionUID = 1L;
  private int code = -1;
  
  public ZipException() {}
  
  public ZipException(String paramString)
  {
    super(paramString);
  }
  
  public ZipException(String paramString, int paramInt)
  {
    super(paramString);
    this.code = paramInt;
  }
  
  public ZipException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }
  
  public ZipException(String paramString, Throwable paramThrowable, int paramInt)
  {
    super(paramString, paramThrowable);
    this.code = paramInt;
  }
  
  public ZipException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
  
  public ZipException(Throwable paramThrowable, int paramInt)
  {
    super(paramThrowable);
    this.code = paramInt;
  }
  
  public int getCode()
  {
    return this.code;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/exception/ZipException.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */