.class Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$NotifyResponsePacketProcessor;
.super Landroid/os/AsyncTask;
.source "SSDPNotifySocket.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NotifyResponsePacketProcessor"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lorg/cybergarage/upnp/ssdp/SSDPPacket;",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;


# direct methods
.method private constructor <init>(Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;)V
    .locals 0

    .prologue
    .line 165
    iput-object p1, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$NotifyResponsePacketProcessor;->this$0:Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;
    .param p2, "x1"    # Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$1;

    .prologue
    .line 165
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$NotifyResponsePacketProcessor;-><init>(Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # [Ljava/lang/Object;

    .prologue
    .line 165
    check-cast p1, [Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .end local p1    # "x0":[Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$NotifyResponsePacketProcessor;->doInBackground([Lorg/cybergarage/upnp/ssdp/SSDPPacket;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Lorg/cybergarage/upnp/ssdp/SSDPPacket;)Ljava/lang/Object;
    .locals 4
    .param p1, "params"    # [Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 170
    iget-object v2, p0, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket$NotifyResponsePacketProcessor;->this$0:Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;

    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->getControlPoint()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 172
    .local v0, "ctrlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v2, 0x0

    :try_start_0
    aget-object v2, p1, v2

    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/ControlPoint;->notifyReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    :goto_0
    const/4 v2, 0x0

    return-object v2

    .line 173
    :catch_0
    move-exception v1

    .line 174
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocket;->access$100()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Exception: "

    invoke-static {v2, v3, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
