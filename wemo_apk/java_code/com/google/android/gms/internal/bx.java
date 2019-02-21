package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.plus.model.moments.ItemScope;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class bx
  extends ae
  implements SafeParcelable, ItemScope
{
  public static final by CREATOR = new by();
  private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
  private final int ab;
  private String di;
  private double fy;
  private double fz;
  private final Set<Integer> iD;
  private bx iE;
  private List<String> iF;
  private bx iG;
  private String iH;
  private String iI;
  private String iJ;
  private List<bx> iK;
  private int iL;
  private List<bx> iM;
  private bx iN;
  private List<bx> iO;
  private String iP;
  private String iQ;
  private bx iR;
  private String iS;
  private String iT;
  private String iU;
  private List<bx> iV;
  private String iW;
  private String iX;
  private String iY;
  private String iZ;
  private String ie;
  private String jA;
  private String ja;
  private String jb;
  private String jc;
  private String jd;
  private bx je;
  private String jf;
  private String jg;
  private String jh;
  private String ji;
  private bx jj;
  private bx jk;
  private bx jl;
  private List<bx> jm;
  private String jn;
  private String jo;
  private String jp;
  private String jq;
  private bx jr;
  private String js;
  private String jt;
  private String ju;
  private bx jv;
  private String jw;
  private String jx;
  private String jy;
  private String jz;
  private String mName;
  
  static
  {
    iC.put("about", ae.a.a("about", 2, bx.class));
    iC.put("additionalName", ae.a.g("additionalName", 3));
    iC.put("address", ae.a.a("address", 4, bx.class));
    iC.put("addressCountry", ae.a.f("addressCountry", 5));
    iC.put("addressLocality", ae.a.f("addressLocality", 6));
    iC.put("addressRegion", ae.a.f("addressRegion", 7));
    iC.put("associated_media", ae.a.b("associated_media", 8, bx.class));
    iC.put("attendeeCount", ae.a.c("attendeeCount", 9));
    iC.put("attendees", ae.a.b("attendees", 10, bx.class));
    iC.put("audio", ae.a.a("audio", 11, bx.class));
    iC.put("author", ae.a.b("author", 12, bx.class));
    iC.put("bestRating", ae.a.f("bestRating", 13));
    iC.put("birthDate", ae.a.f("birthDate", 14));
    iC.put("byArtist", ae.a.a("byArtist", 15, bx.class));
    iC.put("caption", ae.a.f("caption", 16));
    iC.put("contentSize", ae.a.f("contentSize", 17));
    iC.put("contentUrl", ae.a.f("contentUrl", 18));
    iC.put("contributor", ae.a.b("contributor", 19, bx.class));
    iC.put("dateCreated", ae.a.f("dateCreated", 20));
    iC.put("dateModified", ae.a.f("dateModified", 21));
    iC.put("datePublished", ae.a.f("datePublished", 22));
    iC.put("description", ae.a.f("description", 23));
    iC.put("duration", ae.a.f("duration", 24));
    iC.put("embedUrl", ae.a.f("embedUrl", 25));
    iC.put("endDate", ae.a.f("endDate", 26));
    iC.put("familyName", ae.a.f("familyName", 27));
    iC.put("gender", ae.a.f("gender", 28));
    iC.put("geo", ae.a.a("geo", 29, bx.class));
    iC.put("givenName", ae.a.f("givenName", 30));
    iC.put("height", ae.a.f("height", 31));
    iC.put("id", ae.a.f("id", 32));
    iC.put("image", ae.a.f("image", 33));
    iC.put("inAlbum", ae.a.a("inAlbum", 34, bx.class));
    iC.put("latitude", ae.a.d("latitude", 36));
    iC.put("location", ae.a.a("location", 37, bx.class));
    iC.put("longitude", ae.a.d("longitude", 38));
    iC.put("name", ae.a.f("name", 39));
    iC.put("partOfTVSeries", ae.a.a("partOfTVSeries", 40, bx.class));
    iC.put("performers", ae.a.b("performers", 41, bx.class));
    iC.put("playerType", ae.a.f("playerType", 42));
    iC.put("postOfficeBoxNumber", ae.a.f("postOfficeBoxNumber", 43));
    iC.put("postalCode", ae.a.f("postalCode", 44));
    iC.put("ratingValue", ae.a.f("ratingValue", 45));
    iC.put("reviewRating", ae.a.a("reviewRating", 46, bx.class));
    iC.put("startDate", ae.a.f("startDate", 47));
    iC.put("streetAddress", ae.a.f("streetAddress", 48));
    iC.put("text", ae.a.f("text", 49));
    iC.put("thumbnail", ae.a.a("thumbnail", 50, bx.class));
    iC.put("thumbnailUrl", ae.a.f("thumbnailUrl", 51));
    iC.put("tickerSymbol", ae.a.f("tickerSymbol", 52));
    iC.put("type", ae.a.f("type", 53));
    iC.put("url", ae.a.f("url", 54));
    iC.put("width", ae.a.f("width", 55));
    iC.put("worstRating", ae.a.f("worstRating", 56));
  }
  
  public bx()
  {
    this.ab = 1;
    this.iD = new HashSet();
  }
  
  bx(Set<Integer> paramSet, int paramInt1, bx parambx1, List<String> paramList, bx parambx2, String paramString1, String paramString2, String paramString3, List<bx> paramList1, int paramInt2, List<bx> paramList2, bx parambx3, List<bx> paramList3, String paramString4, String paramString5, bx parambx4, String paramString6, String paramString7, String paramString8, List<bx> paramList4, String paramString9, String paramString10, String paramString11, String paramString12, String paramString13, String paramString14, String paramString15, String paramString16, String paramString17, bx parambx5, String paramString18, String paramString19, String paramString20, String paramString21, bx parambx6, double paramDouble1, bx parambx7, double paramDouble2, String paramString22, bx parambx8, List<bx> paramList5, String paramString23, String paramString24, String paramString25, String paramString26, bx parambx9, String paramString27, String paramString28, String paramString29, bx parambx10, String paramString30, String paramString31, String paramString32, String paramString33, String paramString34, String paramString35)
  {
    this.iD = paramSet;
    this.ab = paramInt1;
    this.iE = parambx1;
    this.iF = paramList;
    this.iG = parambx2;
    this.iH = paramString1;
    this.iI = paramString2;
    this.iJ = paramString3;
    this.iK = paramList1;
    this.iL = paramInt2;
    this.iM = paramList2;
    this.iN = parambx3;
    this.iO = paramList3;
    this.iP = paramString4;
    this.iQ = paramString5;
    this.iR = parambx4;
    this.iS = paramString6;
    this.iT = paramString7;
    this.iU = paramString8;
    this.iV = paramList4;
    this.iW = paramString9;
    this.iX = paramString10;
    this.iY = paramString11;
    this.di = paramString12;
    this.iZ = paramString13;
    this.ja = paramString14;
    this.jb = paramString15;
    this.jc = paramString16;
    this.jd = paramString17;
    this.je = parambx5;
    this.jf = paramString18;
    this.jg = paramString19;
    this.jh = paramString20;
    this.ji = paramString21;
    this.jj = parambx6;
    this.fy = paramDouble1;
    this.jk = parambx7;
    this.fz = paramDouble2;
    this.mName = paramString22;
    this.jl = parambx8;
    this.jm = paramList5;
    this.jn = paramString23;
    this.jo = paramString24;
    this.jp = paramString25;
    this.jq = paramString26;
    this.jr = parambx9;
    this.js = paramString27;
    this.jt = paramString28;
    this.ju = paramString29;
    this.jv = parambx10;
    this.jw = paramString30;
    this.jx = paramString31;
    this.jy = paramString32;
    this.ie = paramString33;
    this.jz = paramString34;
    this.jA = paramString35;
  }
  
  public bx(Set<Integer> paramSet, bx parambx1, List<String> paramList, bx parambx2, String paramString1, String paramString2, String paramString3, List<bx> paramList1, int paramInt, List<bx> paramList2, bx parambx3, List<bx> paramList3, String paramString4, String paramString5, bx parambx4, String paramString6, String paramString7, String paramString8, List<bx> paramList4, String paramString9, String paramString10, String paramString11, String paramString12, String paramString13, String paramString14, String paramString15, String paramString16, String paramString17, bx parambx5, String paramString18, String paramString19, String paramString20, String paramString21, bx parambx6, double paramDouble1, bx parambx7, double paramDouble2, String paramString22, bx parambx8, List<bx> paramList5, String paramString23, String paramString24, String paramString25, String paramString26, bx parambx9, String paramString27, String paramString28, String paramString29, bx parambx10, String paramString30, String paramString31, String paramString32, String paramString33, String paramString34, String paramString35)
  {
    this.iD = paramSet;
    this.ab = 1;
    this.iE = parambx1;
    this.iF = paramList;
    this.iG = parambx2;
    this.iH = paramString1;
    this.iI = paramString2;
    this.iJ = paramString3;
    this.iK = paramList1;
    this.iL = paramInt;
    this.iM = paramList2;
    this.iN = parambx3;
    this.iO = paramList3;
    this.iP = paramString4;
    this.iQ = paramString5;
    this.iR = parambx4;
    this.iS = paramString6;
    this.iT = paramString7;
    this.iU = paramString8;
    this.iV = paramList4;
    this.iW = paramString9;
    this.iX = paramString10;
    this.iY = paramString11;
    this.di = paramString12;
    this.iZ = paramString13;
    this.ja = paramString14;
    this.jb = paramString15;
    this.jc = paramString16;
    this.jd = paramString17;
    this.je = parambx5;
    this.jf = paramString18;
    this.jg = paramString19;
    this.jh = paramString20;
    this.ji = paramString21;
    this.jj = parambx6;
    this.fy = paramDouble1;
    this.jk = parambx7;
    this.fz = paramDouble2;
    this.mName = paramString22;
    this.jl = parambx8;
    this.jm = paramList5;
    this.jn = paramString23;
    this.jo = paramString24;
    this.jp = paramString25;
    this.jq = paramString26;
    this.jr = parambx9;
    this.js = paramString27;
    this.jt = paramString28;
    this.ju = paramString29;
    this.jv = parambx10;
    this.jw = paramString30;
    this.jx = paramString31;
    this.jy = paramString32;
    this.ie = paramString33;
    this.jz = paramString34;
    this.jA = paramString35;
  }
  
  public HashMap<String, ae.a<?, ?>> T()
  {
    return iC;
  }
  
  protected boolean a(ae.a parama)
  {
    return this.iD.contains(Integer.valueOf(parama.aa()));
  }
  
  protected Object b(ae.a parama)
  {
    switch (parama.aa())
    {
    case 35: 
    default: 
      throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
    case 2: 
      return this.iE;
    case 3: 
      return this.iF;
    case 4: 
      return this.iG;
    case 5: 
      return this.iH;
    case 6: 
      return this.iI;
    case 7: 
      return this.iJ;
    case 8: 
      return this.iK;
    case 9: 
      return Integer.valueOf(this.iL);
    case 10: 
      return this.iM;
    case 11: 
      return this.iN;
    case 12: 
      return this.iO;
    case 13: 
      return this.iP;
    case 14: 
      return this.iQ;
    case 15: 
      return this.iR;
    case 16: 
      return this.iS;
    case 17: 
      return this.iT;
    case 18: 
      return this.iU;
    case 19: 
      return this.iV;
    case 20: 
      return this.iW;
    case 21: 
      return this.iX;
    case 22: 
      return this.iY;
    case 23: 
      return this.di;
    case 24: 
      return this.iZ;
    case 25: 
      return this.ja;
    case 26: 
      return this.jb;
    case 27: 
      return this.jc;
    case 28: 
      return this.jd;
    case 29: 
      return this.je;
    case 30: 
      return this.jf;
    case 31: 
      return this.jg;
    case 32: 
      return this.jh;
    case 33: 
      return this.ji;
    case 34: 
      return this.jj;
    case 36: 
      return Double.valueOf(this.fy);
    case 37: 
      return this.jk;
    case 38: 
      return Double.valueOf(this.fz);
    case 39: 
      return this.mName;
    case 40: 
      return this.jl;
    case 41: 
      return this.jm;
    case 42: 
      return this.jn;
    case 43: 
      return this.jo;
    case 44: 
      return this.jp;
    case 45: 
      return this.jq;
    case 46: 
      return this.jr;
    case 47: 
      return this.js;
    case 48: 
      return this.jt;
    case 49: 
      return this.ju;
    case 50: 
      return this.jv;
    case 51: 
      return this.jw;
    case 52: 
      return this.jx;
    case 53: 
      return this.jy;
    case 54: 
      return this.ie;
    case 55: 
      return this.jz;
    }
    return this.jA;
  }
  
  Set<Integer> bH()
  {
    return this.iD;
  }
  
  bx bI()
  {
    return this.iE;
  }
  
  bx bJ()
  {
    return this.iG;
  }
  
  List<bx> bK()
  {
    return this.iK;
  }
  
  List<bx> bL()
  {
    return this.iM;
  }
  
  bx bM()
  {
    return this.iN;
  }
  
  List<bx> bN()
  {
    return this.iO;
  }
  
  bx bO()
  {
    return this.iR;
  }
  
  List<bx> bP()
  {
    return this.iV;
  }
  
  bx bQ()
  {
    return this.je;
  }
  
  bx bR()
  {
    return this.jj;
  }
  
  bx bS()
  {
    return this.jk;
  }
  
  bx bT()
  {
    return this.jl;
  }
  
  List<bx> bU()
  {
    return this.jm;
  }
  
  bx bV()
  {
    return this.jr;
  }
  
  bx bW()
  {
    return this.jv;
  }
  
  public bx bX()
  {
    return this;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof bx)) {
      return false;
    }
    if (this == paramObject) {
      return true;
    }
    bx localbx = (bx)paramObject;
    Iterator localIterator = iC.values().iterator();
    while (localIterator.hasNext())
    {
      ae.a locala = (ae.a)localIterator.next();
      if (a(locala))
      {
        if (localbx.a(locala))
        {
          if (!b(locala).equals(localbx.b(locala))) {
            return false;
          }
        }
        else {
          return false;
        }
      }
      else if (localbx.a(locala)) {
        return false;
      }
    }
    return true;
  }
  
  public ItemScope getAbout()
  {
    return this.iE;
  }
  
  public List<String> getAdditionalName()
  {
    return this.iF;
  }
  
  public ItemScope getAddress()
  {
    return this.iG;
  }
  
  public String getAddressCountry()
  {
    return this.iH;
  }
  
  public String getAddressLocality()
  {
    return this.iI;
  }
  
  public String getAddressRegion()
  {
    return this.iJ;
  }
  
  public List<ItemScope> getAssociated_media()
  {
    return (ArrayList)this.iK;
  }
  
  public int getAttendeeCount()
  {
    return this.iL;
  }
  
  public List<ItemScope> getAttendees()
  {
    return (ArrayList)this.iM;
  }
  
  public ItemScope getAudio()
  {
    return this.iN;
  }
  
  public List<ItemScope> getAuthor()
  {
    return (ArrayList)this.iO;
  }
  
  public String getBestRating()
  {
    return this.iP;
  }
  
  public String getBirthDate()
  {
    return this.iQ;
  }
  
  public ItemScope getByArtist()
  {
    return this.iR;
  }
  
  public String getCaption()
  {
    return this.iS;
  }
  
  public String getContentSize()
  {
    return this.iT;
  }
  
  public String getContentUrl()
  {
    return this.iU;
  }
  
  public List<ItemScope> getContributor()
  {
    return (ArrayList)this.iV;
  }
  
  public String getDateCreated()
  {
    return this.iW;
  }
  
  public String getDateModified()
  {
    return this.iX;
  }
  
  public String getDatePublished()
  {
    return this.iY;
  }
  
  public String getDescription()
  {
    return this.di;
  }
  
  public String getDuration()
  {
    return this.iZ;
  }
  
  public String getEmbedUrl()
  {
    return this.ja;
  }
  
  public String getEndDate()
  {
    return this.jb;
  }
  
  public String getFamilyName()
  {
    return this.jc;
  }
  
  public String getGender()
  {
    return this.jd;
  }
  
  public ItemScope getGeo()
  {
    return this.je;
  }
  
  public String getGivenName()
  {
    return this.jf;
  }
  
  public String getHeight()
  {
    return this.jg;
  }
  
  public String getId()
  {
    return this.jh;
  }
  
  public String getImage()
  {
    return this.ji;
  }
  
  public ItemScope getInAlbum()
  {
    return this.jj;
  }
  
  public double getLatitude()
  {
    return this.fy;
  }
  
  public ItemScope getLocation()
  {
    return this.jk;
  }
  
  public double getLongitude()
  {
    return this.fz;
  }
  
  public String getName()
  {
    return this.mName;
  }
  
  public ItemScope getPartOfTVSeries()
  {
    return this.jl;
  }
  
  public List<ItemScope> getPerformers()
  {
    return (ArrayList)this.jm;
  }
  
  public String getPlayerType()
  {
    return this.jn;
  }
  
  public String getPostOfficeBoxNumber()
  {
    return this.jo;
  }
  
  public String getPostalCode()
  {
    return this.jp;
  }
  
  public String getRatingValue()
  {
    return this.jq;
  }
  
  public ItemScope getReviewRating()
  {
    return this.jr;
  }
  
  public String getStartDate()
  {
    return this.js;
  }
  
  public String getStreetAddress()
  {
    return this.jt;
  }
  
  public String getText()
  {
    return this.ju;
  }
  
  public ItemScope getThumbnail()
  {
    return this.jv;
  }
  
  public String getThumbnailUrl()
  {
    return this.jw;
  }
  
  public String getTickerSymbol()
  {
    return this.jx;
  }
  
  public String getType()
  {
    return this.jy;
  }
  
  public String getUrl()
  {
    return this.ie;
  }
  
  public String getWidth()
  {
    return this.jz;
  }
  
  public String getWorstRating()
  {
    return this.jA;
  }
  
  public boolean hasAbout()
  {
    return this.iD.contains(Integer.valueOf(2));
  }
  
  public boolean hasAdditionalName()
  {
    return this.iD.contains(Integer.valueOf(3));
  }
  
  public boolean hasAddress()
  {
    return this.iD.contains(Integer.valueOf(4));
  }
  
  public boolean hasAddressCountry()
  {
    return this.iD.contains(Integer.valueOf(5));
  }
  
  public boolean hasAddressLocality()
  {
    return this.iD.contains(Integer.valueOf(6));
  }
  
  public boolean hasAddressRegion()
  {
    return this.iD.contains(Integer.valueOf(7));
  }
  
  public boolean hasAssociated_media()
  {
    return this.iD.contains(Integer.valueOf(8));
  }
  
  public boolean hasAttendeeCount()
  {
    return this.iD.contains(Integer.valueOf(9));
  }
  
  public boolean hasAttendees()
  {
    return this.iD.contains(Integer.valueOf(10));
  }
  
  public boolean hasAudio()
  {
    return this.iD.contains(Integer.valueOf(11));
  }
  
  public boolean hasAuthor()
  {
    return this.iD.contains(Integer.valueOf(12));
  }
  
  public boolean hasBestRating()
  {
    return this.iD.contains(Integer.valueOf(13));
  }
  
  public boolean hasBirthDate()
  {
    return this.iD.contains(Integer.valueOf(14));
  }
  
  public boolean hasByArtist()
  {
    return this.iD.contains(Integer.valueOf(15));
  }
  
  public boolean hasCaption()
  {
    return this.iD.contains(Integer.valueOf(16));
  }
  
  public boolean hasContentSize()
  {
    return this.iD.contains(Integer.valueOf(17));
  }
  
  public boolean hasContentUrl()
  {
    return this.iD.contains(Integer.valueOf(18));
  }
  
  public boolean hasContributor()
  {
    return this.iD.contains(Integer.valueOf(19));
  }
  
  public boolean hasDateCreated()
  {
    return this.iD.contains(Integer.valueOf(20));
  }
  
  public boolean hasDateModified()
  {
    return this.iD.contains(Integer.valueOf(21));
  }
  
  public boolean hasDatePublished()
  {
    return this.iD.contains(Integer.valueOf(22));
  }
  
  public boolean hasDescription()
  {
    return this.iD.contains(Integer.valueOf(23));
  }
  
  public boolean hasDuration()
  {
    return this.iD.contains(Integer.valueOf(24));
  }
  
  public boolean hasEmbedUrl()
  {
    return this.iD.contains(Integer.valueOf(25));
  }
  
  public boolean hasEndDate()
  {
    return this.iD.contains(Integer.valueOf(26));
  }
  
  public boolean hasFamilyName()
  {
    return this.iD.contains(Integer.valueOf(27));
  }
  
  public boolean hasGender()
  {
    return this.iD.contains(Integer.valueOf(28));
  }
  
  public boolean hasGeo()
  {
    return this.iD.contains(Integer.valueOf(29));
  }
  
  public boolean hasGivenName()
  {
    return this.iD.contains(Integer.valueOf(30));
  }
  
  public boolean hasHeight()
  {
    return this.iD.contains(Integer.valueOf(31));
  }
  
  public boolean hasId()
  {
    return this.iD.contains(Integer.valueOf(32));
  }
  
  public boolean hasImage()
  {
    return this.iD.contains(Integer.valueOf(33));
  }
  
  public boolean hasInAlbum()
  {
    return this.iD.contains(Integer.valueOf(34));
  }
  
  public boolean hasLatitude()
  {
    return this.iD.contains(Integer.valueOf(36));
  }
  
  public boolean hasLocation()
  {
    return this.iD.contains(Integer.valueOf(37));
  }
  
  public boolean hasLongitude()
  {
    return this.iD.contains(Integer.valueOf(38));
  }
  
  public boolean hasName()
  {
    return this.iD.contains(Integer.valueOf(39));
  }
  
  public boolean hasPartOfTVSeries()
  {
    return this.iD.contains(Integer.valueOf(40));
  }
  
  public boolean hasPerformers()
  {
    return this.iD.contains(Integer.valueOf(41));
  }
  
  public boolean hasPlayerType()
  {
    return this.iD.contains(Integer.valueOf(42));
  }
  
  public boolean hasPostOfficeBoxNumber()
  {
    return this.iD.contains(Integer.valueOf(43));
  }
  
  public boolean hasPostalCode()
  {
    return this.iD.contains(Integer.valueOf(44));
  }
  
  public boolean hasRatingValue()
  {
    return this.iD.contains(Integer.valueOf(45));
  }
  
  public boolean hasReviewRating()
  {
    return this.iD.contains(Integer.valueOf(46));
  }
  
  public boolean hasStartDate()
  {
    return this.iD.contains(Integer.valueOf(47));
  }
  
  public boolean hasStreetAddress()
  {
    return this.iD.contains(Integer.valueOf(48));
  }
  
  public boolean hasText()
  {
    return this.iD.contains(Integer.valueOf(49));
  }
  
  public boolean hasThumbnail()
  {
    return this.iD.contains(Integer.valueOf(50));
  }
  
  public boolean hasThumbnailUrl()
  {
    return this.iD.contains(Integer.valueOf(51));
  }
  
  public boolean hasTickerSymbol()
  {
    return this.iD.contains(Integer.valueOf(52));
  }
  
  public boolean hasType()
  {
    return this.iD.contains(Integer.valueOf(53));
  }
  
  public boolean hasUrl()
  {
    return this.iD.contains(Integer.valueOf(54));
  }
  
  public boolean hasWidth()
  {
    return this.iD.contains(Integer.valueOf(55));
  }
  
  public boolean hasWorstRating()
  {
    return this.iD.contains(Integer.valueOf(56));
  }
  
  public int hashCode()
  {
    Iterator localIterator = iC.values().iterator();
    int i = 0;
    ae.a locala;
    if (localIterator.hasNext())
    {
      locala = (ae.a)localIterator.next();
      if (!a(locala)) {
        break label66;
      }
    }
    label66:
    for (int j = i + locala.aa() + b(locala).hashCode();; j = i)
    {
      i = j;
      break;
      return i;
    }
  }
  
  int i()
  {
    return this.ab;
  }
  
  public boolean isDataValid()
  {
    return true;
  }
  
  protected Object m(String paramString)
  {
    return null;
  }
  
  protected boolean n(String paramString)
  {
    return false;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    by.a(this, paramParcel, paramInt);
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/bx.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */