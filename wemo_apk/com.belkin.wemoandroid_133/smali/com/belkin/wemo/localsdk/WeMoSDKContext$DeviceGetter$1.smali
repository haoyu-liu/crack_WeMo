.class Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;
.super Ljava/lang/Object;
.source "WeMoSDKContext.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;

.field final synthetic val$wemoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;Lcom/belkin/wemo/localsdk/WeMoDevice;)V
    .locals 0

    .prologue
    .line 334
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;->this$1:Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;

    iput-object p2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;->val$wemoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 337
    iget-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;->val$wemoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setAvailability(Z)V

    .line 338
    iget-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;->this$1:Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;

    iget-object v1, v1, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;->val$wemoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-static {v1, v2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$400(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lcom/belkin/wemo/localsdk/WeMoDevice;)Z

    move-result v0

    .line 339
    .local v0, "updateStatus":Z
    if-nez v0, :cond_0

    .line 341
    iget-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;->val$wemoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    const-string v2, "-1"

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 342
    iget-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;->this$1:Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;

    iget-object v1, v1, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    const-string v2, "set_state"

    const-string v3, ""

    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;->val$wemoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v4}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$500(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    :goto_0
    return-void

    .line 346
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;->this$1:Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;

    iget-object v1, v1, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;->this$0:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    const-string v2, "add"

    const-string v3, ""

    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter$1;->val$wemoDevice:Lcom/belkin/wemo/localsdk/WeMoDevice;

    invoke-virtual {v4}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->access$500(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
