.class Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$1;
.super Ljava/lang/Object;
.source "UpnpDeviceSetup.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->parseAPList()Lorg/json/JSONArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;


# direct methods
.method constructor <init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;)V
    .locals 0

    .prologue
    .line 305
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$1;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;)I
    .locals 2
    .param p1, "lhs"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;
    .param p2, "rhs"    # Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    .prologue
    .line 307
    iget-object v0, p1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->signal:Ljava/lang/Integer;

    iget-object v1, p2, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->signal:Ljava/lang/Integer;

    if-ne v0, v1, :cond_0

    .line 308
    const/4 v0, 0x0

    .line 312
    :goto_0
    return v0

    .line 309
    :cond_0
    iget-object v0, p1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->signal:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v1, p2, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->signal:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-le v0, v1, :cond_1

    .line 310
    const/4 v0, -0x1

    goto :goto_0

    .line 312
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 305
    check-cast p1, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$1;->compare(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;)I

    move-result v0

    return v0
.end method
