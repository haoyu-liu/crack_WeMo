.class Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;
.super Ljava/lang/Object;
.source "WeMoSMARTUIPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;->getLocalDeviceInfo(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 36
    iput-object p1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 39
    const/4 v9, 0x0

    .line 40
    .local v9, "obj":Lorg/json/JSONObject;
    const/4 v5, 0x0

    .line 47
    .local v5, "error":Ljava/lang/String;
    :try_start_0
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 49
    .end local v9    # "obj":Lorg/json/JSONObject;
    .local v10, "obj":Lorg/json/JSONObject;
    :try_start_1
    new-instance v7, Landroid/util/DisplayMetrics;

    invoke-direct {v7}, Landroid/util/DisplayMetrics;-><init>()V

    .line 50
    .local v7, "metrics":Landroid/util/DisplayMetrics;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;

    iget-object v13, v13, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v13}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v13

    invoke-virtual {v13}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v13

    invoke-interface {v13}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v13

    invoke-virtual {v13, v7}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 51
    const-string v13, "widthPixels"

    iget v14, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v10, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 52
    const-string v13, "heightPixels"

    iget v14, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-virtual {v10, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 53
    const-string v13, "xdpi"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;

    iget v15, v7, Landroid/util/DisplayMetrics;->xdpi:F

    float-to-double v0, v15

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    invoke-static {v14, v0, v1}, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;->access$000(Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;D)D

    move-result-wide v14

    invoke-virtual {v10, v13, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 54
    const-string v13, "ydpi"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;

    iget v15, v7, Landroid/util/DisplayMetrics;->ydpi:F

    float-to-double v0, v15

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    invoke-static {v14, v0, v1}, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;->access$000(Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;D)D

    move-result-wide v14

    invoke-virtual {v10, v13, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 55
    iget v13, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v13, v13

    iget v14, v7, Landroid/util/DisplayMetrics;->xdpi:F

    div-float v12, v13, v14

    .line 56
    .local v12, "w":F
    iget v13, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v13, v13

    iget v14, v7, Landroid/util/DisplayMetrics;->ydpi:F

    div-float v6, v13, v14

    .line 57
    .local v6, "h":F
    const-string v13, "widthInches"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;

    float-to-double v0, v12

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    invoke-static {v14, v0, v1}, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;->access$000(Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;D)D

    move-result-wide v14

    invoke-virtual {v10, v13, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 58
    const-string v13, "heightInches"

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;

    float-to-double v0, v6

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    invoke-static {v14, v0, v1}, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;->access$000(Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;D)D

    move-result-wide v14

    invoke-virtual {v10, v13, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 59
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;

    mul-float v14, v12, v12

    mul-float v15, v6, v6

    add-float/2addr v14, v15

    float-to-double v14, v14

    invoke-static {v14, v15}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v14

    invoke-static {v13, v14, v15}, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;->access$000(Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin;D)D

    move-result-wide v2

    .line 60
    .local v2, "diagonal":D
    const-string v13, "diagonalInches"

    invoke-virtual {v10, v13, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 61
    const-wide/high16 v14, 0x4018000000000000L    # 6.0

    cmpl-double v13, v2, v14

    if-lez v13, :cond_1

    .line 62
    const-string v13, "isTablet"

    const-string v14, "true"

    invoke-virtual {v10, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    :goto_0
    const-string v13, "model"

    sget-object v14, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v10, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    const-string v13, "manufacturer"

    sget-object v14, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v10, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    sget-object v11, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 71
    .local v11, "version":Ljava/lang/String;
    const-string v13, "version"

    invoke-virtual {v10, v13, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    const/16 v13, 0x2e

    invoke-virtual {v11, v13}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 73
    .local v8, "n":I
    if-lez v8, :cond_0

    .line 74
    const-string v13, "majorVersion"

    const/4 v14, 0x0

    invoke-virtual {v11, v14, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    const-string v13, "minorVersion"

    add-int/lit8 v14, v8, 0x1

    invoke-virtual {v11, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v10, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    :cond_0
    const-string v13, "sdkVersion"

    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v10, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v9, v10

    .line 83
    .end local v2    # "diagonal":D
    .end local v6    # "h":F
    .end local v7    # "metrics":Landroid/util/DisplayMetrics;
    .end local v8    # "n":I
    .end local v10    # "obj":Lorg/json/JSONObject;
    .end local v11    # "version":Ljava/lang/String;
    .end local v12    # "w":F
    .restart local v9    # "obj":Lorg/json/JSONObject;
    :goto_1
    if-eqz v5, :cond_2

    .line 84
    const-string v13, "WeMoSMARTUIPlugin"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Get local device info error: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v13, v5}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 89
    :goto_2
    return-void

    .line 64
    .end local v9    # "obj":Lorg/json/JSONObject;
    .restart local v2    # "diagonal":D
    .restart local v6    # "h":F
    .restart local v7    # "metrics":Landroid/util/DisplayMetrics;
    .restart local v10    # "obj":Lorg/json/JSONObject;
    .restart local v12    # "w":F
    :cond_1
    :try_start_2
    const-string v13, "isTablet"

    const-string v14, "false"

    invoke-virtual {v10, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 79
    .end local v2    # "diagonal":D
    .end local v6    # "h":F
    .end local v7    # "metrics":Landroid/util/DisplayMetrics;
    .end local v12    # "w":F
    :catch_0
    move-exception v4

    move-object v9, v10

    .line 80
    .end local v10    # "obj":Lorg/json/JSONObject;
    .local v4, "e":Ljava/lang/Exception;
    .restart local v9    # "obj":Lorg/json/JSONObject;
    :goto_3
    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 88
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/cordova/plugin/WeMoSMARTUIPlugin$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v13, v9}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto :goto_2

    .line 79
    :catch_1
    move-exception v4

    goto :goto_3
.end method
