.class Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;
.super Ljava/lang/Object;
.source "WeMoSDKContext.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/localsdk/WeMoSDKContext;->stop()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)V
    .locals 0

    .prologue
    .line 212
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 216
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$002(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 218
    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$100(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-static {v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$100(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->finalizeCP()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    :cond_0
    :goto_0
    return-void

    .line 221
    :catch_0
    move-exception v0

    goto :goto_0
.end method
