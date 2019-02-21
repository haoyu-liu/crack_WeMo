.class public Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;
.super Ljava/lang/Object;
.source "CloudRequestAddOrEditGroup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GroupCapabilityProfile"
.end annotation


# instance fields
.field private capabilityIDToValueMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private capabilityIDsAsString:Ljava/lang/String;

.field private capabilityValuesAsString:Ljava/lang/String;

.field final synthetic this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;)V
    .locals 1

    .prologue
    .line 309
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 310
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->capabilityIDsAsString:Ljava/lang/String;

    .line 311
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->capabilityValuesAsString:Ljava/lang/String;

    .line 312
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->capabilityIDToValueMap:Ljava/util/Map;

    .line 313
    return-void
.end method


# virtual methods
.method public getCapabilityIDToValueMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 332
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->capabilityIDToValueMap:Ljava/util/Map;

    return-object v0
.end method

.method public getCapabilityIDsAsString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 316
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->capabilityIDsAsString:Ljava/lang/String;

    return-object v0
.end method

.method public getCapabilityValuesAsString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 324
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->capabilityValuesAsString:Ljava/lang/String;

    return-object v0
.end method

.method public setCapabilityIDToValueMap(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 336
    .local p1, "capabilityIDToValueMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->capabilityIDToValueMap:Ljava/util/Map;

    .line 337
    const-string v0, ","

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->capabilityIDsAsString:Ljava/lang/String;

    .line 338
    const-string v0, ","

    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->capabilityValuesAsString:Ljava/lang/String;

    .line 339
    return-void
.end method

.method public setCapabilityIDsAsString(Ljava/lang/String;)V
    .locals 0
    .param p1, "capabilityIDsAsString"    # Ljava/lang/String;

    .prologue
    .line 320
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->capabilityIDsAsString:Ljava/lang/String;

    .line 321
    return-void
.end method

.method public setCapabilityValuesAsString(Ljava/lang/String;)V
    .locals 0
    .param p1, "capabilityValuesAsString"    # Ljava/lang/String;

    .prologue
    .line 328
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup$GroupCapabilityProfile;->capabilityValuesAsString:Ljava/lang/String;

    .line 329
    return-void
.end method
