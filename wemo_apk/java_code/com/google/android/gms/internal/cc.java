package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.Person.AgeRange;
import com.google.android.gms.plus.model.people.Person.Cover;
import com.google.android.gms.plus.model.people.Person.Cover.CoverInfo;
import com.google.android.gms.plus.model.people.Person.Cover.CoverPhoto;
import com.google.android.gms.plus.model.people.Person.Emails;
import com.google.android.gms.plus.model.people.Person.Image;
import com.google.android.gms.plus.model.people.Person.Name;
import com.google.android.gms.plus.model.people.Person.Organizations;
import com.google.android.gms.plus.model.people.Person.PlacesLived;
import com.google.android.gms.plus.model.people.Person.Urls;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class cc
  extends ae
  implements SafeParcelable, Person
{
  public static final cd CREATOR = new cd();
  private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
  private final int ab;
  private String cl;
  private final Set<Integer> iD;
  private String ie;
  private String jE;
  private a jF;
  private String jG;
  private String jH;
  private int jI;
  private b jJ;
  private String jK;
  private int jL;
  private c jM;
  private boolean jN;
  private String jO;
  private d jP;
  private String jQ;
  private int jR;
  private List<f> jS;
  private List<g> jT;
  private int jU;
  private int jV;
  private String jW;
  private List<h> jX;
  private boolean jY;
  private String jh;
  
  static
  {
    iC.put("aboutMe", ae.a.f("aboutMe", 2));
    iC.put("ageRange", ae.a.a("ageRange", 3, a.class));
    iC.put("birthday", ae.a.f("birthday", 4));
    iC.put("braggingRights", ae.a.f("braggingRights", 5));
    iC.put("circledByCount", ae.a.c("circledByCount", 6));
    iC.put("cover", ae.a.a("cover", 7, b.class));
    iC.put("currentLocation", ae.a.f("currentLocation", 8));
    iC.put("displayName", ae.a.f("displayName", 9));
    iC.put("gender", ae.a.a("gender", 12, new ab().b("male", 0).b("female", 1).b("other", 2), false));
    iC.put("id", ae.a.f("id", 14));
    iC.put("image", ae.a.a("image", 15, c.class));
    iC.put("isPlusUser", ae.a.e("isPlusUser", 16));
    iC.put("language", ae.a.f("language", 18));
    iC.put("name", ae.a.a("name", 19, d.class));
    iC.put("nickname", ae.a.f("nickname", 20));
    iC.put("objectType", ae.a.a("objectType", 21, new ab().b("person", 0).b("page", 1), false));
    iC.put("organizations", ae.a.b("organizations", 22, f.class));
    iC.put("placesLived", ae.a.b("placesLived", 23, g.class));
    iC.put("plusOneCount", ae.a.c("plusOneCount", 24));
    iC.put("relationshipStatus", ae.a.a("relationshipStatus", 25, new ab().b("single", 0).b("in_a_relationship", 1).b("engaged", 2).b("married", 3).b("its_complicated", 4).b("open_relationship", 5).b("widowed", 6).b("in_domestic_partnership", 7).b("in_civil_union", 8), false));
    iC.put("tagline", ae.a.f("tagline", 26));
    iC.put("url", ae.a.f("url", 27));
    iC.put("urls", ae.a.b("urls", 28, h.class));
    iC.put("verified", ae.a.e("verified", 29));
  }
  
  public cc()
  {
    this.ab = 2;
    this.iD = new HashSet();
  }
  
  public cc(String paramString1, String paramString2, c paramc, int paramInt, String paramString3)
  {
    this.ab = 2;
    this.iD = new HashSet();
    this.cl = paramString1;
    this.iD.add(Integer.valueOf(9));
    this.jh = paramString2;
    this.iD.add(Integer.valueOf(14));
    this.jM = paramc;
    this.iD.add(Integer.valueOf(15));
    this.jR = paramInt;
    this.iD.add(Integer.valueOf(21));
    this.ie = paramString3;
    this.iD.add(Integer.valueOf(27));
  }
  
  cc(Set<Integer> paramSet, int paramInt1, String paramString1, a parama, String paramString2, String paramString3, int paramInt2, b paramb, String paramString4, String paramString5, int paramInt3, String paramString6, c paramc, boolean paramBoolean1, String paramString7, d paramd, String paramString8, int paramInt4, List<f> paramList, List<g> paramList1, int paramInt5, int paramInt6, String paramString9, String paramString10, List<h> paramList2, boolean paramBoolean2)
  {
    this.iD = paramSet;
    this.ab = paramInt1;
    this.jE = paramString1;
    this.jF = parama;
    this.jG = paramString2;
    this.jH = paramString3;
    this.jI = paramInt2;
    this.jJ = paramb;
    this.jK = paramString4;
    this.cl = paramString5;
    this.jL = paramInt3;
    this.jh = paramString6;
    this.jM = paramc;
    this.jN = paramBoolean1;
    this.jO = paramString7;
    this.jP = paramd;
    this.jQ = paramString8;
    this.jR = paramInt4;
    this.jS = paramList;
    this.jT = paramList1;
    this.jU = paramInt5;
    this.jV = paramInt6;
    this.jW = paramString9;
    this.ie = paramString10;
    this.jX = paramList2;
    this.jY = paramBoolean2;
  }
  
  public static cc d(byte[] paramArrayOfByte)
  {
    Parcel localParcel = Parcel.obtain();
    localParcel.unmarshall(paramArrayOfByte, 0, paramArrayOfByte.length);
    localParcel.setDataPosition(0);
    cc localcc = CREATOR.y(localParcel);
    localParcel.recycle();
    return localcc;
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
    case 10: 
    case 11: 
    case 13: 
    case 17: 
    default: 
      throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
    case 2: 
      return this.jE;
    case 3: 
      return this.jF;
    case 4: 
      return this.jG;
    case 5: 
      return this.jH;
    case 6: 
      return Integer.valueOf(this.jI);
    case 7: 
      return this.jJ;
    case 8: 
      return this.jK;
    case 9: 
      return this.cl;
    case 12: 
      return Integer.valueOf(this.jL);
    case 14: 
      return this.jh;
    case 15: 
      return this.jM;
    case 16: 
      return Boolean.valueOf(this.jN);
    case 18: 
      return this.jO;
    case 19: 
      return this.jP;
    case 20: 
      return this.jQ;
    case 21: 
      return Integer.valueOf(this.jR);
    case 22: 
      return this.jS;
    case 23: 
      return this.jT;
    case 24: 
      return Integer.valueOf(this.jU);
    case 25: 
      return Integer.valueOf(this.jV);
    case 26: 
      return this.jW;
    case 27: 
      return this.ie;
    case 28: 
      return this.jX;
    }
    return Boolean.valueOf(this.jY);
  }
  
  Set<Integer> bH()
  {
    return this.iD;
  }
  
  a cc()
  {
    return this.jF;
  }
  
  b cd()
  {
    return this.jJ;
  }
  
  c ce()
  {
    return this.jM;
  }
  
  d cf()
  {
    return this.jP;
  }
  
  List<f> cg()
  {
    return this.jS;
  }
  
  List<g> ch()
  {
    return this.jT;
  }
  
  List<h> ci()
  {
    return this.jX;
  }
  
  public cc cj()
  {
    return this;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof cc)) {
      return false;
    }
    if (this == paramObject) {
      return true;
    }
    cc localcc = (cc)paramObject;
    Iterator localIterator = iC.values().iterator();
    while (localIterator.hasNext())
    {
      ae.a locala = (ae.a)localIterator.next();
      if (a(locala))
      {
        if (localcc.a(locala))
        {
          if (!b(locala).equals(localcc.b(locala))) {
            return false;
          }
        }
        else {
          return false;
        }
      }
      else if (localcc.a(locala)) {
        return false;
      }
    }
    return true;
  }
  
  public String getAboutMe()
  {
    return this.jE;
  }
  
  public Person.AgeRange getAgeRange()
  {
    return this.jF;
  }
  
  public String getBirthday()
  {
    return this.jG;
  }
  
  public String getBraggingRights()
  {
    return this.jH;
  }
  
  public int getCircledByCount()
  {
    return this.jI;
  }
  
  public Person.Cover getCover()
  {
    return this.jJ;
  }
  
  public String getCurrentLocation()
  {
    return this.jK;
  }
  
  public String getDisplayName()
  {
    return this.cl;
  }
  
  @Deprecated
  public List<Person.Emails> getEmails()
  {
    return null;
  }
  
  public int getGender()
  {
    return this.jL;
  }
  
  public String getId()
  {
    return this.jh;
  }
  
  public Person.Image getImage()
  {
    return this.jM;
  }
  
  public String getLanguage()
  {
    return this.jO;
  }
  
  public Person.Name getName()
  {
    return this.jP;
  }
  
  public String getNickname()
  {
    return this.jQ;
  }
  
  public int getObjectType()
  {
    return this.jR;
  }
  
  public List<Person.Organizations> getOrganizations()
  {
    return (ArrayList)this.jS;
  }
  
  public List<Person.PlacesLived> getPlacesLived()
  {
    return (ArrayList)this.jT;
  }
  
  public int getPlusOneCount()
  {
    return this.jU;
  }
  
  public int getRelationshipStatus()
  {
    return this.jV;
  }
  
  public String getTagline()
  {
    return this.jW;
  }
  
  public String getUrl()
  {
    return this.ie;
  }
  
  public List<Person.Urls> getUrls()
  {
    return (ArrayList)this.jX;
  }
  
  public boolean hasAboutMe()
  {
    return this.iD.contains(Integer.valueOf(2));
  }
  
  public boolean hasAgeRange()
  {
    return this.iD.contains(Integer.valueOf(3));
  }
  
  public boolean hasBirthday()
  {
    return this.iD.contains(Integer.valueOf(4));
  }
  
  public boolean hasBraggingRights()
  {
    return this.iD.contains(Integer.valueOf(5));
  }
  
  public boolean hasCircledByCount()
  {
    return this.iD.contains(Integer.valueOf(6));
  }
  
  public boolean hasCover()
  {
    return this.iD.contains(Integer.valueOf(7));
  }
  
  public boolean hasCurrentLocation()
  {
    return this.iD.contains(Integer.valueOf(8));
  }
  
  public boolean hasDisplayName()
  {
    return this.iD.contains(Integer.valueOf(9));
  }
  
  @Deprecated
  public boolean hasEmails()
  {
    return false;
  }
  
  public boolean hasGender()
  {
    return this.iD.contains(Integer.valueOf(12));
  }
  
  public boolean hasId()
  {
    return this.iD.contains(Integer.valueOf(14));
  }
  
  public boolean hasImage()
  {
    return this.iD.contains(Integer.valueOf(15));
  }
  
  public boolean hasIsPlusUser()
  {
    return this.iD.contains(Integer.valueOf(16));
  }
  
  public boolean hasLanguage()
  {
    return this.iD.contains(Integer.valueOf(18));
  }
  
  public boolean hasName()
  {
    return this.iD.contains(Integer.valueOf(19));
  }
  
  public boolean hasNickname()
  {
    return this.iD.contains(Integer.valueOf(20));
  }
  
  public boolean hasObjectType()
  {
    return this.iD.contains(Integer.valueOf(21));
  }
  
  public boolean hasOrganizations()
  {
    return this.iD.contains(Integer.valueOf(22));
  }
  
  public boolean hasPlacesLived()
  {
    return this.iD.contains(Integer.valueOf(23));
  }
  
  public boolean hasPlusOneCount()
  {
    return this.iD.contains(Integer.valueOf(24));
  }
  
  public boolean hasRelationshipStatus()
  {
    return this.iD.contains(Integer.valueOf(25));
  }
  
  public boolean hasTagline()
  {
    return this.iD.contains(Integer.valueOf(26));
  }
  
  public boolean hasUrl()
  {
    return this.iD.contains(Integer.valueOf(27));
  }
  
  public boolean hasUrls()
  {
    return this.iD.contains(Integer.valueOf(28));
  }
  
  public boolean hasVerified()
  {
    return this.iD.contains(Integer.valueOf(29));
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
  
  public boolean isPlusUser()
  {
    return this.jN;
  }
  
  public boolean isVerified()
  {
    return this.jY;
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
    cd.a(this, paramParcel, paramInt);
  }
  
  public static final class a
    extends ae
    implements SafeParcelable, Person.AgeRange
  {
    public static final ce CREATOR = new ce();
    private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
    private final int ab;
    private final Set<Integer> iD;
    private int jZ;
    private int ka;
    
    static
    {
      iC.put("max", ae.a.c("max", 2));
      iC.put("min", ae.a.c("min", 3));
    }
    
    public a()
    {
      this.ab = 1;
      this.iD = new HashSet();
    }
    
    a(Set<Integer> paramSet, int paramInt1, int paramInt2, int paramInt3)
    {
      this.iD = paramSet;
      this.ab = paramInt1;
      this.jZ = paramInt2;
      this.ka = paramInt3;
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
      default: 
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
      case 2: 
        return Integer.valueOf(this.jZ);
      }
      return Integer.valueOf(this.ka);
    }
    
    Set<Integer> bH()
    {
      return this.iD;
    }
    
    public a ck()
    {
      return this;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof a)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      a locala = (a)paramObject;
      Iterator localIterator = iC.values().iterator();
      while (localIterator.hasNext())
      {
        ae.a locala1 = (ae.a)localIterator.next();
        if (a(locala1))
        {
          if (locala.a(locala1))
          {
            if (!b(locala1).equals(locala.b(locala1))) {
              return false;
            }
          }
          else {
            return false;
          }
        }
        else if (locala.a(locala1)) {
          return false;
        }
      }
      return true;
    }
    
    public int getMax()
    {
      return this.jZ;
    }
    
    public int getMin()
    {
      return this.ka;
    }
    
    public boolean hasMax()
    {
      return this.iD.contains(Integer.valueOf(2));
    }
    
    public boolean hasMin()
    {
      return this.iD.contains(Integer.valueOf(3));
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
      ce.a(this, paramParcel, paramInt);
    }
  }
  
  public static final class b
    extends ae
    implements SafeParcelable, Person.Cover
  {
    public static final cf CREATOR = new cf();
    private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
    private final int ab;
    private final Set<Integer> iD;
    private a kb;
    private b kc;
    private int kd;
    
    static
    {
      iC.put("coverInfo", ae.a.a("coverInfo", 2, a.class));
      iC.put("coverPhoto", ae.a.a("coverPhoto", 3, b.class));
      iC.put("layout", ae.a.a("layout", 4, new ab().b("banner", 0), false));
    }
    
    public b()
    {
      this.ab = 1;
      this.iD = new HashSet();
    }
    
    b(Set<Integer> paramSet, int paramInt1, a parama, b paramb, int paramInt2)
    {
      this.iD = paramSet;
      this.ab = paramInt1;
      this.kb = parama;
      this.kc = paramb;
      this.kd = paramInt2;
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
      default: 
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
      case 2: 
        return this.kb;
      case 3: 
        return this.kc;
      }
      return Integer.valueOf(this.kd);
    }
    
    Set<Integer> bH()
    {
      return this.iD;
    }
    
    a cl()
    {
      return this.kb;
    }
    
    b cm()
    {
      return this.kc;
    }
    
    public b cn()
    {
      return this;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof b)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      b localb = (b)paramObject;
      Iterator localIterator = iC.values().iterator();
      while (localIterator.hasNext())
      {
        ae.a locala = (ae.a)localIterator.next();
        if (a(locala))
        {
          if (localb.a(locala))
          {
            if (!b(locala).equals(localb.b(locala))) {
              return false;
            }
          }
          else {
            return false;
          }
        }
        else if (localb.a(locala)) {
          return false;
        }
      }
      return true;
    }
    
    public Person.Cover.CoverInfo getCoverInfo()
    {
      return this.kb;
    }
    
    public Person.Cover.CoverPhoto getCoverPhoto()
    {
      return this.kc;
    }
    
    public int getLayout()
    {
      return this.kd;
    }
    
    public boolean hasCoverInfo()
    {
      return this.iD.contains(Integer.valueOf(2));
    }
    
    public boolean hasCoverPhoto()
    {
      return this.iD.contains(Integer.valueOf(3));
    }
    
    public boolean hasLayout()
    {
      return this.iD.contains(Integer.valueOf(4));
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
      cf.a(this, paramParcel, paramInt);
    }
    
    public static final class a
      extends ae
      implements SafeParcelable, Person.Cover.CoverInfo
    {
      public static final cg CREATOR = new cg();
      private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
      private final int ab;
      private final Set<Integer> iD;
      private int ke;
      private int kf;
      
      static
      {
        iC.put("leftImageOffset", ae.a.c("leftImageOffset", 2));
        iC.put("topImageOffset", ae.a.c("topImageOffset", 3));
      }
      
      public a()
      {
        this.ab = 1;
        this.iD = new HashSet();
      }
      
      a(Set<Integer> paramSet, int paramInt1, int paramInt2, int paramInt3)
      {
        this.iD = paramSet;
        this.ab = paramInt1;
        this.ke = paramInt2;
        this.kf = paramInt3;
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
        default: 
          throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
        case 2: 
          return Integer.valueOf(this.ke);
        }
        return Integer.valueOf(this.kf);
      }
      
      Set<Integer> bH()
      {
        return this.iD;
      }
      
      public a co()
      {
        return this;
      }
      
      public int describeContents()
      {
        return 0;
      }
      
      public boolean equals(Object paramObject)
      {
        if (!(paramObject instanceof a)) {
          return false;
        }
        if (this == paramObject) {
          return true;
        }
        a locala = (a)paramObject;
        Iterator localIterator = iC.values().iterator();
        while (localIterator.hasNext())
        {
          ae.a locala1 = (ae.a)localIterator.next();
          if (a(locala1))
          {
            if (locala.a(locala1))
            {
              if (!b(locala1).equals(locala.b(locala1))) {
                return false;
              }
            }
            else {
              return false;
            }
          }
          else if (locala.a(locala1)) {
            return false;
          }
        }
        return true;
      }
      
      public int getLeftImageOffset()
      {
        return this.ke;
      }
      
      public int getTopImageOffset()
      {
        return this.kf;
      }
      
      public boolean hasLeftImageOffset()
      {
        return this.iD.contains(Integer.valueOf(2));
      }
      
      public boolean hasTopImageOffset()
      {
        return this.iD.contains(Integer.valueOf(3));
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
        cg.a(this, paramParcel, paramInt);
      }
    }
    
    public static final class b
      extends ae
      implements SafeParcelable, Person.Cover.CoverPhoto
    {
      public static final ch CREATOR = new ch();
      private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
      private final int ab;
      private int hL;
      private int hM;
      private final Set<Integer> iD;
      private String ie;
      
      static
      {
        iC.put("height", ae.a.c("height", 2));
        iC.put("url", ae.a.f("url", 3));
        iC.put("width", ae.a.c("width", 4));
      }
      
      public b()
      {
        this.ab = 1;
        this.iD = new HashSet();
      }
      
      b(Set<Integer> paramSet, int paramInt1, int paramInt2, String paramString, int paramInt3)
      {
        this.iD = paramSet;
        this.ab = paramInt1;
        this.hM = paramInt2;
        this.ie = paramString;
        this.hL = paramInt3;
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
        default: 
          throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
        case 2: 
          return Integer.valueOf(this.hM);
        case 3: 
          return this.ie;
        }
        return Integer.valueOf(this.hL);
      }
      
      Set<Integer> bH()
      {
        return this.iD;
      }
      
      public b cp()
      {
        return this;
      }
      
      public int describeContents()
      {
        return 0;
      }
      
      public boolean equals(Object paramObject)
      {
        if (!(paramObject instanceof b)) {
          return false;
        }
        if (this == paramObject) {
          return true;
        }
        b localb = (b)paramObject;
        Iterator localIterator = iC.values().iterator();
        while (localIterator.hasNext())
        {
          ae.a locala = (ae.a)localIterator.next();
          if (a(locala))
          {
            if (localb.a(locala))
            {
              if (!b(locala).equals(localb.b(locala))) {
                return false;
              }
            }
            else {
              return false;
            }
          }
          else if (localb.a(locala)) {
            return false;
          }
        }
        return true;
      }
      
      public int getHeight()
      {
        return this.hM;
      }
      
      public String getUrl()
      {
        return this.ie;
      }
      
      public int getWidth()
      {
        return this.hL;
      }
      
      public boolean hasHeight()
      {
        return this.iD.contains(Integer.valueOf(2));
      }
      
      public boolean hasUrl()
      {
        return this.iD.contains(Integer.valueOf(3));
      }
      
      public boolean hasWidth()
      {
        return this.iD.contains(Integer.valueOf(4));
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
        ch.a(this, paramParcel, paramInt);
      }
    }
  }
  
  public static final class c
    extends ae
    implements SafeParcelable, Person.Image
  {
    public static final ci CREATOR = new ci();
    private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
    private final int ab;
    private final Set<Integer> iD;
    private String ie;
    
    static
    {
      iC.put("url", ae.a.f("url", 2));
    }
    
    public c()
    {
      this.ab = 1;
      this.iD = new HashSet();
    }
    
    public c(String paramString)
    {
      this.iD = new HashSet();
      this.ab = 1;
      this.ie = paramString;
      this.iD.add(Integer.valueOf(2));
    }
    
    c(Set<Integer> paramSet, int paramInt, String paramString)
    {
      this.iD = paramSet;
      this.ab = paramInt;
      this.ie = paramString;
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
      default: 
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
      }
      return this.ie;
    }
    
    Set<Integer> bH()
    {
      return this.iD;
    }
    
    public c cq()
    {
      return this;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof c)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      c localc = (c)paramObject;
      Iterator localIterator = iC.values().iterator();
      while (localIterator.hasNext())
      {
        ae.a locala = (ae.a)localIterator.next();
        if (a(locala))
        {
          if (localc.a(locala))
          {
            if (!b(locala).equals(localc.b(locala))) {
              return false;
            }
          }
          else {
            return false;
          }
        }
        else if (localc.a(locala)) {
          return false;
        }
      }
      return true;
    }
    
    public String getUrl()
    {
      return this.ie;
    }
    
    public boolean hasUrl()
    {
      return this.iD.contains(Integer.valueOf(2));
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
      ci.a(this, paramParcel, paramInt);
    }
  }
  
  public static final class d
    extends ae
    implements SafeParcelable, Person.Name
  {
    public static final cj CREATOR = new cj();
    private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
    private final int ab;
    private final Set<Integer> iD;
    private String jc;
    private String jf;
    private String kg;
    private String kh;
    private String ki;
    private String kj;
    
    static
    {
      iC.put("familyName", ae.a.f("familyName", 2));
      iC.put("formatted", ae.a.f("formatted", 3));
      iC.put("givenName", ae.a.f("givenName", 4));
      iC.put("honorificPrefix", ae.a.f("honorificPrefix", 5));
      iC.put("honorificSuffix", ae.a.f("honorificSuffix", 6));
      iC.put("middleName", ae.a.f("middleName", 7));
    }
    
    public d()
    {
      this.ab = 1;
      this.iD = new HashSet();
    }
    
    d(Set<Integer> paramSet, int paramInt, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
    {
      this.iD = paramSet;
      this.ab = paramInt;
      this.jc = paramString1;
      this.kg = paramString2;
      this.jf = paramString3;
      this.kh = paramString4;
      this.ki = paramString5;
      this.kj = paramString6;
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
      default: 
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
      case 2: 
        return this.jc;
      case 3: 
        return this.kg;
      case 4: 
        return this.jf;
      case 5: 
        return this.kh;
      case 6: 
        return this.ki;
      }
      return this.kj;
    }
    
    Set<Integer> bH()
    {
      return this.iD;
    }
    
    public d cr()
    {
      return this;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof d)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      d locald = (d)paramObject;
      Iterator localIterator = iC.values().iterator();
      while (localIterator.hasNext())
      {
        ae.a locala = (ae.a)localIterator.next();
        if (a(locala))
        {
          if (locald.a(locala))
          {
            if (!b(locala).equals(locald.b(locala))) {
              return false;
            }
          }
          else {
            return false;
          }
        }
        else if (locald.a(locala)) {
          return false;
        }
      }
      return true;
    }
    
    public String getFamilyName()
    {
      return this.jc;
    }
    
    public String getFormatted()
    {
      return this.kg;
    }
    
    public String getGivenName()
    {
      return this.jf;
    }
    
    public String getHonorificPrefix()
    {
      return this.kh;
    }
    
    public String getHonorificSuffix()
    {
      return this.ki;
    }
    
    public String getMiddleName()
    {
      return this.kj;
    }
    
    public boolean hasFamilyName()
    {
      return this.iD.contains(Integer.valueOf(2));
    }
    
    public boolean hasFormatted()
    {
      return this.iD.contains(Integer.valueOf(3));
    }
    
    public boolean hasGivenName()
    {
      return this.iD.contains(Integer.valueOf(4));
    }
    
    public boolean hasHonorificPrefix()
    {
      return this.iD.contains(Integer.valueOf(5));
    }
    
    public boolean hasHonorificSuffix()
    {
      return this.iD.contains(Integer.valueOf(6));
    }
    
    public boolean hasMiddleName()
    {
      return this.iD.contains(Integer.valueOf(7));
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
      cj.a(this, paramParcel, paramInt);
    }
  }
  
  public static class e
  {
    public static int G(String paramString)
    {
      if (paramString.equals("person")) {
        return 0;
      }
      if (paramString.equals("page")) {
        return 1;
      }
      throw new IllegalArgumentException("Unknown objectType string: " + paramString);
    }
  }
  
  public static final class f
    extends ae
    implements SafeParcelable, Person.Organizations
  {
    public static final ck CREATOR = new ck();
    private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
    private int aJ;
    private final int ab;
    private String di;
    private String hs;
    private final Set<Integer> iD;
    private String jb;
    private String js;
    private String kk;
    private String kl;
    private boolean km;
    private String mName;
    
    static
    {
      iC.put("department", ae.a.f("department", 2));
      iC.put("description", ae.a.f("description", 3));
      iC.put("endDate", ae.a.f("endDate", 4));
      iC.put("location", ae.a.f("location", 5));
      iC.put("name", ae.a.f("name", 6));
      iC.put("primary", ae.a.e("primary", 7));
      iC.put("startDate", ae.a.f("startDate", 8));
      iC.put("title", ae.a.f("title", 9));
      iC.put("type", ae.a.a("type", 10, new ab().b("work", 0).b("school", 1), false));
    }
    
    public f()
    {
      this.ab = 1;
      this.iD = new HashSet();
    }
    
    f(Set<Integer> paramSet, int paramInt1, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, boolean paramBoolean, String paramString6, String paramString7, int paramInt2)
    {
      this.iD = paramSet;
      this.ab = paramInt1;
      this.kk = paramString1;
      this.di = paramString2;
      this.jb = paramString3;
      this.kl = paramString4;
      this.mName = paramString5;
      this.km = paramBoolean;
      this.js = paramString6;
      this.hs = paramString7;
      this.aJ = paramInt2;
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
      default: 
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
      case 2: 
        return this.kk;
      case 3: 
        return this.di;
      case 4: 
        return this.jb;
      case 5: 
        return this.kl;
      case 6: 
        return this.mName;
      case 7: 
        return Boolean.valueOf(this.km);
      case 8: 
        return this.js;
      case 9: 
        return this.hs;
      }
      return Integer.valueOf(this.aJ);
    }
    
    Set<Integer> bH()
    {
      return this.iD;
    }
    
    public f cs()
    {
      return this;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof f)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      f localf = (f)paramObject;
      Iterator localIterator = iC.values().iterator();
      while (localIterator.hasNext())
      {
        ae.a locala = (ae.a)localIterator.next();
        if (a(locala))
        {
          if (localf.a(locala))
          {
            if (!b(locala).equals(localf.b(locala))) {
              return false;
            }
          }
          else {
            return false;
          }
        }
        else if (localf.a(locala)) {
          return false;
        }
      }
      return true;
    }
    
    public String getDepartment()
    {
      return this.kk;
    }
    
    public String getDescription()
    {
      return this.di;
    }
    
    public String getEndDate()
    {
      return this.jb;
    }
    
    public String getLocation()
    {
      return this.kl;
    }
    
    public String getName()
    {
      return this.mName;
    }
    
    public String getStartDate()
    {
      return this.js;
    }
    
    public String getTitle()
    {
      return this.hs;
    }
    
    public int getType()
    {
      return this.aJ;
    }
    
    public boolean hasDepartment()
    {
      return this.iD.contains(Integer.valueOf(2));
    }
    
    public boolean hasDescription()
    {
      return this.iD.contains(Integer.valueOf(3));
    }
    
    public boolean hasEndDate()
    {
      return this.iD.contains(Integer.valueOf(4));
    }
    
    public boolean hasLocation()
    {
      return this.iD.contains(Integer.valueOf(5));
    }
    
    public boolean hasName()
    {
      return this.iD.contains(Integer.valueOf(6));
    }
    
    public boolean hasPrimary()
    {
      return this.iD.contains(Integer.valueOf(7));
    }
    
    public boolean hasStartDate()
    {
      return this.iD.contains(Integer.valueOf(8));
    }
    
    public boolean hasTitle()
    {
      return this.iD.contains(Integer.valueOf(9));
    }
    
    public boolean hasType()
    {
      return this.iD.contains(Integer.valueOf(10));
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
    
    public boolean isPrimary()
    {
      return this.km;
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
      ck.a(this, paramParcel, paramInt);
    }
  }
  
  public static final class g
    extends ae
    implements SafeParcelable, Person.PlacesLived
  {
    public static final cl CREATOR = new cl();
    private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
    private final int ab;
    private final Set<Integer> iD;
    private boolean km;
    private String mValue;
    
    static
    {
      iC.put("primary", ae.a.e("primary", 2));
      iC.put("value", ae.a.f("value", 3));
    }
    
    public g()
    {
      this.ab = 1;
      this.iD = new HashSet();
    }
    
    g(Set<Integer> paramSet, int paramInt, boolean paramBoolean, String paramString)
    {
      this.iD = paramSet;
      this.ab = paramInt;
      this.km = paramBoolean;
      this.mValue = paramString;
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
      default: 
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
      case 2: 
        return Boolean.valueOf(this.km);
      }
      return this.mValue;
    }
    
    Set<Integer> bH()
    {
      return this.iD;
    }
    
    public g ct()
    {
      return this;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof g)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      g localg = (g)paramObject;
      Iterator localIterator = iC.values().iterator();
      while (localIterator.hasNext())
      {
        ae.a locala = (ae.a)localIterator.next();
        if (a(locala))
        {
          if (localg.a(locala))
          {
            if (!b(locala).equals(localg.b(locala))) {
              return false;
            }
          }
          else {
            return false;
          }
        }
        else if (localg.a(locala)) {
          return false;
        }
      }
      return true;
    }
    
    public String getValue()
    {
      return this.mValue;
    }
    
    public boolean hasPrimary()
    {
      return this.iD.contains(Integer.valueOf(2));
    }
    
    public boolean hasValue()
    {
      return this.iD.contains(Integer.valueOf(3));
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
    
    public boolean isPrimary()
    {
      return this.km;
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
      cl.a(this, paramParcel, paramInt);
    }
  }
  
  public static final class h
    extends ae
    implements SafeParcelable, Person.Urls
  {
    public static final cm CREATOR = new cm();
    private static final HashMap<String, ae.a<?, ?>> iC = new HashMap();
    private int aJ;
    private final int ab;
    private final Set<Integer> iD;
    private String kn;
    private final int ko = 4;
    private String mValue;
    
    static
    {
      iC.put("label", ae.a.f("label", 5));
      iC.put("type", ae.a.a("type", 6, new ab().b("home", 0).b("work", 1).b("blog", 2).b("profile", 3).b("other", 4).b("otherProfile", 5).b("contributor", 6).b("website", 7), false));
      iC.put("value", ae.a.f("value", 4));
    }
    
    public h()
    {
      this.ab = 2;
      this.iD = new HashSet();
    }
    
    h(Set<Integer> paramSet, int paramInt1, String paramString1, int paramInt2, String paramString2, int paramInt3)
    {
      this.iD = paramSet;
      this.ab = paramInt1;
      this.kn = paramString1;
      this.aJ = paramInt2;
      this.mValue = paramString2;
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
      default: 
        throw new IllegalStateException("Unknown safe parcelable id=" + parama.aa());
      case 5: 
        return this.kn;
      case 6: 
        return Integer.valueOf(this.aJ);
      }
      return this.mValue;
    }
    
    Set<Integer> bH()
    {
      return this.iD;
    }
    
    @Deprecated
    public int cu()
    {
      return 4;
    }
    
    public h cv()
    {
      return this;
    }
    
    public int describeContents()
    {
      return 0;
    }
    
    public boolean equals(Object paramObject)
    {
      if (!(paramObject instanceof h)) {
        return false;
      }
      if (this == paramObject) {
        return true;
      }
      h localh = (h)paramObject;
      Iterator localIterator = iC.values().iterator();
      while (localIterator.hasNext())
      {
        ae.a locala = (ae.a)localIterator.next();
        if (a(locala))
        {
          if (localh.a(locala))
          {
            if (!b(locala).equals(localh.b(locala))) {
              return false;
            }
          }
          else {
            return false;
          }
        }
        else if (localh.a(locala)) {
          return false;
        }
      }
      return true;
    }
    
    public String getLabel()
    {
      return this.kn;
    }
    
    public int getType()
    {
      return this.aJ;
    }
    
    public String getValue()
    {
      return this.mValue;
    }
    
    public boolean hasLabel()
    {
      return this.iD.contains(Integer.valueOf(5));
    }
    
    public boolean hasType()
    {
      return this.iD.contains(Integer.valueOf(6));
    }
    
    public boolean hasValue()
    {
      return this.iD.contains(Integer.valueOf(4));
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
      cm.a(this, paramParcel, paramInt);
    }
  }
}


/* Location:              /root/Documents/wemo_apk/classes-dex2jar.jar!/com/google/android/gms/internal/cc.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */