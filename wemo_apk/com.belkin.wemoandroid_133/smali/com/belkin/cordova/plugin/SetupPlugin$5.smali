.class Lcom/belkin/cordova/plugin/SetupPlugin$5;
.super Ljava/lang/Object;
.source "SetupPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/SetupPlugin;->setupAsync(Lorg/json/JSONArray;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

.field final synthetic val$inParamArray:Lorg/json/JSONArray;

.field final synthetic val$rememberedSetup:Z


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/SetupPlugin;ZLorg/json/JSONArray;)V
    .locals 0

    .prologue
    .line 572
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iput-boolean p2, p0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->val$rememberedSetup:Z

    iput-object p3, p0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->val$inParamArray:Lorg/json/JSONArray;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 22

    .prologue
    .line 576
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDevicePairingStatus(Z)V

    .line 577
    const/4 v14, 0x0

    .line 581
    .local v14, "smart":Z
    const/4 v13, 0x0

    .line 582
    .local v13, "secSSID":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->val$rememberedSetup:Z

    move/from16 v17, v0

    if-eqz v17, :cond_2

    .line 583
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$300(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getSetupCredential()Ljava/lang/String;

    move-result-object v12

    .line 584
    .local v12, "savedConfig":Ljava/lang/String;
    const-string v17, "\\|"

    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 585
    .local v5, "connectionParams":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$500(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/utils/WiFiSecurityUtil;

    move-result-object v18

    const/16 v19, 0x2

    aget-object v19, v5, v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v20

    invoke-virtual/range {v18 .. v20}, Lcom/belkin/utils/WiFiSecurityUtil;->decrypt(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$402(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;)Ljava/lang/String;

    .line 586
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getMetaInfo(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v11

    .line 587
    .local v11, "metaArray":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$500(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/utils/WiFiSecurityUtil;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$400(Lcom/belkin/cordova/plugin/SetupPlugin;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v20

    const/16 v21, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3, v11}, Lcom/belkin/utils/WiFiSecurityUtil;->encrypt(Ljava/lang/String;Landroid/content/Context;I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$402(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;)Ljava/lang/String;

    .line 588
    const/16 v17, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$400(Lcom/belkin/cordova/plugin/SetupPlugin;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v5, v17

    .line 589
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$400(Lcom/belkin/cordova/plugin/SetupPlugin;)Ljava/lang/String;

    move-result-object v8

    .line 590
    .local v8, "encryptedPassword":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->val$inParamArray:Lorg/json/JSONArray;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 591
    .local v16, "wemoSSID":Ljava/lang/String;
    const/16 v17, 0x0

    aget-object v13, v5, v17

    .line 608
    .end local v12    # "savedConfig":Ljava/lang/String;
    :goto_0
    const/4 v6, 0x0

    .line 609
    .local v6, "connectionResult":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->isSuperSmartSetup()Z

    move-result v17

    if-nez v17, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->isSmartSetup()Z

    move-result v17

    if-eqz v17, :cond_4

    .line 610
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->pairAndRegister([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 611
    const/4 v14, 0x1

    .line 615
    :goto_1
    if-eqz v6, :cond_1

    const-string v17, ""

    move-object/from16 v0, v17

    if-ne v6, v0, :cond_5

    .line 616
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    const-string v18, "0"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v13}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$600(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;Ljava/lang/String;)V

    .line 680
    .end local v5    # "connectionParams":[Ljava/lang/String;
    .end local v6    # "connectionResult":Ljava/lang/String;
    .end local v8    # "encryptedPassword":Ljava/lang/String;
    .end local v11    # "metaArray":[Ljava/lang/String;
    .end local v13    # "secSSID":Ljava/lang/String;
    .end local v14    # "smart":Z
    .end local v16    # "wemoSSID":Ljava/lang/String;
    :goto_2
    return-void

    .line 593
    .restart local v13    # "secSSID":Ljava/lang/String;
    .restart local v14    # "smart":Z
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->val$inParamArray:Lorg/json/JSONArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONArray;->length()I

    move-result v17

    move/from16 v0, v17

    new-array v5, v0, [Ljava/lang/String;

    .line 594
    .restart local v5    # "connectionParams":[Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_3
    const/16 v17, 0x5

    move/from16 v0, v17

    if-ge v9, v0, :cond_3

    .line 595
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->val$inParamArray:Lorg/json/JSONArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v5, v9

    .line 594
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 598
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$500(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/utils/WiFiSecurityUtil;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->val$inParamArray:Lorg/json/JSONArray;

    move-object/from16 v18, v0

    const/16 v19, 0x2

    invoke-virtual/range {v18 .. v19}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v19

    const/16 v20, 0x1

    const/16 v21, 0x0

    invoke-virtual/range {v17 .. v21}, Lcom/belkin/utils/WiFiSecurityUtil;->encrypt(Ljava/lang/String;Landroid/content/Context;I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 600
    .restart local v8    # "encryptedPassword":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$500(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/utils/WiFiSecurityUtil;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v8, v1}, Lcom/belkin/utils/WiFiSecurityUtil;->decrypt(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$402(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;)Ljava/lang/String;

    .line 602
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getMetaInfo(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v11

    .line 604
    .restart local v11    # "metaArray":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$500(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/utils/WiFiSecurityUtil;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$400(Lcom/belkin/cordova/plugin/SetupPlugin;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v20

    const/16 v21, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3, v11}, Lcom/belkin/utils/WiFiSecurityUtil;->encrypt(Ljava/lang/String;Landroid/content/Context;I[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$402(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;)Ljava/lang/String;

    .line 605
    const/16 v17, 0x2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$400(Lcom/belkin/cordova/plugin/SetupPlugin;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v5, v17

    .line 606
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->val$inParamArray:Lorg/json/JSONArray;

    move-object/from16 v17, v0

    const/16 v18, 0x5

    invoke-virtual/range {v17 .. v18}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v16

    .restart local v16    # "wemoSSID":Ljava/lang/String;
    goto/16 :goto_0

    .line 613
    .end local v9    # "i":I
    .restart local v6    # "connectionResult":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->connectHomeNetwork([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 619
    :cond_5
    const/16 v17, 0x2

    aput-object v8, v5, v17

    .line 621
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$700(Lcom/belkin/cordova/plugin/SetupPlugin;)V

    .line 623
    const/4 v15, 0x0

    .line 624
    .local v15, "status":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->UpnpInitialization()Z

    move-result v17

    if-eqz v17, :cond_f

    .line 625
    const/4 v10, 0x0

    .line 626
    .local v10, "isErrorPairing":Z
    const/4 v4, 0x1

    .line 627
    .local v4, "connectedToWemo":Z
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_4
    const/16 v17, 0x1e

    move/from16 v0, v17

    if-ge v9, v0, :cond_a

    .line 628
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$200(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v14}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->forceConnectToAP(Ljava/lang/String;Z)Z

    move-result v17

    if-eqz v17, :cond_b

    .line 629
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v17

    if-nez v17, :cond_6

    .line 630
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    new-instance v18, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;-><init>(Landroid/content/Context;)V

    invoke-static/range {v17 .. v18}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$102(Lcom/belkin/cordova/plugin/SetupPlugin;Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    .line 632
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getNetworkStatus()I

    move-result v15

    .line 633
    const/16 v17, 0x1

    move/from16 v0, v17

    if-eq v15, v0, :cond_7

    const/16 v17, 0x3

    move/from16 v0, v17

    if-ne v15, v0, :cond_9

    .line 634
    :cond_7
    const/4 v10, 0x0

    .line 635
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->val$rememberedSetup:Z

    move/from16 v17, v0

    if-nez v17, :cond_8

    invoke-static {v6}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 636
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-static {v0, v5}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$800(Lcom/belkin/cordova/plugin/SetupPlugin;[Ljava/lang/String;)V

    .line 637
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$300(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v17

    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SharePreferences;->saveConfigurationStatus(Z)V

    .line 639
    :cond_8
    if-eqz v14, :cond_a

    .line 627
    :goto_5
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_4

    .line 643
    :cond_9
    if-eqz v15, :cond_c

    .line 644
    const/4 v10, 0x1

    .line 645
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/belkin/utils/RateMe;->doNotShowRatingPopUp(Landroid/content/Context;)V

    .line 661
    :cond_a
    :goto_6
    if-eqz v14, :cond_d

    if-nez v10, :cond_d

    if-nez v4, :cond_d

    .line 662
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-static {v0, v13}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$900(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_2

    .line 676
    .end local v4    # "connectedToWemo":Z
    .end local v5    # "connectionParams":[Ljava/lang/String;
    .end local v6    # "connectionResult":Ljava/lang/String;
    .end local v8    # "encryptedPassword":Ljava/lang/String;
    .end local v9    # "i":I
    .end local v10    # "isErrorPairing":Z
    .end local v11    # "metaArray":[Ljava/lang/String;
    .end local v13    # "secSSID":Ljava/lang/String;
    .end local v14    # "smart":Z
    .end local v15    # "status":I
    .end local v16    # "wemoSSID":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 677
    .local v7, "e":Lorg/json/JSONException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDevicePairingStatus(Z)V

    .line 678
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/belkin/utils/RateMe;->doNotShowRatingPopUp(Landroid/content/Context;)V

    goto/16 :goto_2

    .line 648
    .end local v7    # "e":Lorg/json/JSONException;
    .restart local v4    # "connectedToWemo":Z
    .restart local v5    # "connectionParams":[Ljava/lang/String;
    .restart local v6    # "connectionResult":Ljava/lang/String;
    .restart local v8    # "encryptedPassword":Ljava/lang/String;
    .restart local v9    # "i":I
    .restart local v10    # "isErrorPairing":Z
    .restart local v11    # "metaArray":[Ljava/lang/String;
    .restart local v13    # "secSSID":Ljava/lang/String;
    .restart local v14    # "smart":Z
    .restart local v15    # "status":I
    .restart local v16    # "wemoSSID":Ljava/lang/String;
    :cond_b
    if-eqz v14, :cond_c

    .line 649
    const/4 v4, 0x0

    .line 650
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->val$rememberedSetup:Z

    move/from16 v17, v0

    if-nez v17, :cond_a

    invoke-static {v6}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_a

    .line 651
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-static {v0, v5}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$800(Lcom/belkin/cordova/plugin/SetupPlugin;[Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_6

    .line 656
    :cond_c
    const-wide/16 v18, 0x7d0

    :try_start_2
    invoke-static/range {v18 .. v19}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_5

    .line 657
    :catch_1
    move-exception v7

    .line 658
    .local v7, "e":Ljava/lang/InterruptedException;
    :try_start_3
    invoke-virtual {v7}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_5

    .line 665
    .end local v7    # "e":Ljava/lang/InterruptedException;
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$200(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_e

    .line 666
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, ""

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v13}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$600(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 668
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    const-string v18, "5"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v13}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$600(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 672
    .end local v4    # "connectedToWemo":Z
    .end local v9    # "i":I
    .end local v10    # "isErrorPairing":Z
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, ""

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v13}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$600(Lcom/belkin/cordova/plugin/SetupPlugin;Ljava/lang/String;Ljava/lang/String;)V

    .line 673
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/cordova/plugin/SetupPlugin$5;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/belkin/utils/RateMe;->doNotShowRatingPopUp(Landroid/content/Context;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_2
.end method
