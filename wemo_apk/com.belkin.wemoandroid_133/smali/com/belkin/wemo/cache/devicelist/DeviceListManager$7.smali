.class Lcom/belkin/wemo/cache/devicelist/DeviceListManager$7;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addNotificationListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V
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
        "Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 0

    .prologue
    .line 1164
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$7;->this$0:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)I
    .locals 2
    .param p1, "lhs"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;
    .param p2, "rhs"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;

    .prologue
    .line 1168
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 1164
    check-cast p1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$7;->compare(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)I

    move-result v0

    return v0
.end method
