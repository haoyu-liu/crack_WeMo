package net.lingala.zip4j.model;

public class UnzipParameters
{
  private boolean ignoreAllFileAttributes;
  private boolean ignoreArchiveFileAttribute;
  private boolean ignoreDateTimeAttributes;
  private boolean ignoreHiddenFileAttribute;
  private boolean ignoreReadOnlyFileAttribute;
  private boolean ignoreSystemFileAttribute;
  
  public boolean isIgnoreAllFileAttributes()
  {
    return this.ignoreAllFileAttributes;
  }
  
  public boolean isIgnoreArchiveFileAttribute()
  {
    return this.ignoreArchiveFileAttribute;
  }
  
  public boolean isIgnoreDateTimeAttributes()
  {
    return this.ignoreDateTimeAttributes;
  }
  
  public boolean isIgnoreHiddenFileAttribute()
  {
    return this.ignoreHiddenFileAttribute;
  }
  
  public boolean isIgnoreReadOnlyFileAttribute()
  {
    return this.ignoreReadOnlyFileAttribute;
  }
  
  public boolean isIgnoreSystemFileAttribute()
  {
    return this.ignoreSystemFileAttribute;
  }
  
  public void setIgnoreAllFileAttributes(boolean paramBoolean)
  {
    this.ignoreAllFileAttributes = paramBoolean;
  }
  
  public void setIgnoreArchiveFileAttribute(boolean paramBoolean)
  {
    this.ignoreArchiveFileAttribute = paramBoolean;
  }
  
  public void setIgnoreDateTimeAttributes(boolean paramBoolean)
  {
    this.ignoreDateTimeAttributes = paramBoolean;
  }
  
  public void setIgnoreHiddenFileAttribute(boolean paramBoolean)
  {
    this.ignoreHiddenFileAttribute = paramBoolean;
  }
  
  public void setIgnoreReadOnlyFileAttribute(boolean paramBoolean)
  {
    this.ignoreReadOnlyFileAttribute = paramBoolean;
  }
  
  public void setIgnoreSystemFileAttribute(boolean paramBoolean)
  {
    this.ignoreSystemFileAttribute = paramBoolean;
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/net/lingala/zip4j/model/UnzipParameters.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */