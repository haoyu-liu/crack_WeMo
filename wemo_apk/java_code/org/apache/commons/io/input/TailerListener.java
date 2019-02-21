package org.apache.commons.io.input;

public abstract interface TailerListener
{
  public abstract void fileNotFound();
  
  public abstract void fileRotated();
  
  public abstract void handle(Exception paramException);
  
  public abstract void handle(String paramString);
  
  public abstract void init(Tailer paramTailer);
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/org/apache/commons/io/input/TailerListener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */