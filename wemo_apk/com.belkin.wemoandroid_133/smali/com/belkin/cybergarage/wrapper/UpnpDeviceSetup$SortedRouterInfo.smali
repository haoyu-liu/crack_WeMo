.class Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;
.super Ljava/lang/Object;
.source "UpnpDeviceSetup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SortedRouterInfo"
.end annotation


# instance fields
.field channel:Ljava/lang/Integer;

.field security:Ljava/lang/String;

.field signal:Ljava/lang/Integer;

.field ssid:Ljava/lang/String;

.field final synthetic this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;


# direct methods
.method constructor <init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;)V
    .locals 0

    .prologue
    .line 1193
    iput-object p1, p0, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup$SortedRouterInfo;->this$0:Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
