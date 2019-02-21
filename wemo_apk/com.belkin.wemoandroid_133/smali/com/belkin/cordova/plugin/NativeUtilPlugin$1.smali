.class Lcom/belkin/cordova/plugin/NativeUtilPlugin$1;
.super Ljava/lang/Object;
.source "NativeUtilPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/NativeUtilPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)V
    .locals 0

    .prologue
    .line 103
    iput-object p1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$1;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 105
    const-string v0, "NativeUtilPlugin"

    const-string v1, "ACTION_DB_RESET_ON_CHANGE_NETWORK"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    iget-object v0, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$1;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->access$000(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)Lcom/belkin/utils/RuleUtility;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/utils/RuleUtility;->checkHomeNetworkStatus()Ljava/lang/String;

    .line 107
    return-void
.end method
