.class public Lcom/belkin/controller/DeviceListController;
.super Ljava/lang/Object;
.source "DeviceListController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;,
        Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;,
        Lcom/belkin/controller/DeviceListController$IconCroppedCallback;,
        Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;,
        Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;,
        Lcom/belkin/controller/DeviceListController$SetNightModeConfigurationCallback;,
        Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;
    }
.end annotation


# static fields
.field public static final ATTRIBUTES:Ljava/lang/String; = "attributes"

.field public static final DEVICECAPABILITIES:Ljava/lang/String; = "deviceCapabilities"

.field public static final INFORMATION:Ljava/lang/String; = "information"

.field public static final PROPERTIES:Ljava/lang/String; = "properties"

.field public static final TAG:Ljava/lang/String; = "DeviceListController"

.field private static devListController:Lcom/belkin/controller/DeviceListController;

.field public static sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mSDKNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private photoRequestedListener:Lcom/belkin/controller/listener/PhotoRequestedListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/controller/DeviceListController;->devListController:Lcom/belkin/controller/DeviceListController;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    .line 95
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    .line 96
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    sput-object v0, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 97
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    iget-object v1, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/controller/DeviceListController;->mSDKNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 98
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/controller/DeviceListController;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/controller/DeviceListController;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/controller/DeviceListController;)Lcom/belkin/controller/listener/PhotoRequestedListener;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/controller/DeviceListController;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController;->photoRequestedListener:Lcom/belkin/controller/listener/PhotoRequestedListener;

    return-object v0
.end method

.method static synthetic access$200()Lcom/belkin/controller/DeviceListController;
    .locals 1

    .prologue
    .line 67
    sget-object v0, Lcom/belkin/controller/DeviceListController;->devListController:Lcom/belkin/controller/DeviceListController;

    return-object v0
.end method

.method private createJSONObj(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;
    .locals 32
    .param p1, "devInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 737
    const-string v29, "DeviceListController"

    const-string v30, "In createJSONObj"

    invoke-static/range {v29 .. v30}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 738
    new-instance v20, Lorg/json/JSONObject;

    invoke-direct/range {v20 .. v20}, Lorg/json/JSONObject;-><init>()V

    .line 740
    .local v20, "jsonObj":Lorg/json/JSONObject;
    :try_start_0
    new-instance v19, Lorg/json/JSONObject;

    invoke-direct/range {v19 .. v19}, Lorg/json/JSONObject;-><init>()V

    .line 742
    .local v19, "infoJsonObj":Lorg/json/JSONObject;
    sget-object v29, Lcom/belkin/constant/DeviceListConstants$Information;->infos:Ljava/util/Set;

    invoke-interface/range {v29 .. v29}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_4

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/belkin/constant/DeviceListConstants$Information;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 745
    .local v18, "info":Lcom/belkin/constant/DeviceListConstants$Information;
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v29

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "get"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v18 .. v18}, Lcom/belkin/constant/DeviceListConstants$Information;->getValue()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    const/16 v31, 0x0

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v31, v0

    invoke-virtual/range {v29 .. v31}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v24

    .line 746
    .local v24, "method":Ljava/lang/reflect/Method;
    invoke-virtual/range {v24 .. v24}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v27

    .line 747
    .local v27, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v26, 0x0

    .line 748
    .local v26, "response":Ljava/lang/Object;
    const-class v29, Ljava/lang/String;

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v29

    if-eqz v29, :cond_2

    .line 749
    const/16 v29, 0x0

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    .end local v26    # "response":Ljava/lang/Object;
    check-cast v26, Ljava/lang/String;

    .line 756
    :cond_0
    :goto_1
    invoke-virtual/range {v18 .. v18}, Lcom/belkin/constant/DeviceListConstants$Information;->getValue()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lcom/belkin/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v19

    move-object/from16 v1, v29

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 757
    .end local v24    # "method":Ljava/lang/reflect/Method;
    .end local v27    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v14

    .line 759
    .local v14, "e":Ljava/lang/NoSuchMethodException;
    :try_start_2
    invoke-virtual {v14}, Ljava/lang/NoSuchMethodException;->printStackTrace()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 875
    .end local v14    # "e":Ljava/lang/NoSuchMethodException;
    .end local v17    # "i$":Ljava/util/Iterator;
    .end local v18    # "info":Lcom/belkin/constant/DeviceListConstants$Information;
    .end local v19    # "infoJsonObj":Lorg/json/JSONObject;
    :catch_1
    move-exception v14

    .line 877
    .local v14, "e":Lorg/json/JSONException;
    invoke-virtual {v14}, Lorg/json/JSONException;->printStackTrace()V

    .line 879
    const/16 v20, 0x0

    .end local v14    # "e":Lorg/json/JSONException;
    .end local v20    # "jsonObj":Lorg/json/JSONObject;
    :cond_1
    :goto_2
    return-object v20

    .line 750
    .restart local v17    # "i$":Ljava/util/Iterator;
    .restart local v18    # "info":Lcom/belkin/constant/DeviceListConstants$Information;
    .restart local v19    # "infoJsonObj":Lorg/json/JSONObject;
    .restart local v20    # "jsonObj":Lorg/json/JSONObject;
    .restart local v24    # "method":Ljava/lang/reflect/Method;
    .restart local v26    # "response":Ljava/lang/Object;
    .restart local v27    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    :try_start_3
    sget-object v29, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v29

    if-eqz v29, :cond_3

    .line 751
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v29, 0x0

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/Integer;

    move-object/from16 v0, v30

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, ""

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    .local v26, "response":Ljava/lang/String;
    goto :goto_1

    .line 752
    .local v26, "response":Ljava/lang/Object;
    :cond_3
    sget-object v29, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v29

    if-eqz v29, :cond_0

    .line 753
    const/16 v29, 0x0

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    .end local v26    # "response":Ljava/lang/Object;
    check-cast v26, Ljava/lang/Boolean;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    .local v26, "response":Ljava/lang/Boolean;
    goto :goto_1

    .line 760
    .end local v24    # "method":Ljava/lang/reflect/Method;
    .end local v26    # "response":Ljava/lang/Boolean;
    .end local v27    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_2
    move-exception v14

    .line 762
    .local v14, "e":Ljava/lang/IllegalAccessException;
    :try_start_4
    invoke-virtual {v14}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto/16 :goto_0

    .line 763
    .end local v14    # "e":Ljava/lang/IllegalAccessException;
    :catch_3
    move-exception v14

    .line 765
    .local v14, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v14}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto/16 :goto_0

    .line 766
    .end local v14    # "e":Ljava/lang/IllegalArgumentException;
    :catch_4
    move-exception v14

    .line 768
    .local v14, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v14}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto/16 :goto_0

    .line 774
    .end local v14    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v18    # "info":Lcom/belkin/constant/DeviceListConstants$Information;
    :cond_4
    new-instance v25, Lorg/json/JSONObject;

    invoke-direct/range {v25 .. v25}, Lorg/json/JSONObject;-><init>()V

    .line 775
    .local v25, "propertyJsonObj":Lorg/json/JSONObject;
    sget-object v29, Lcom/belkin/constant/DeviceListConstants$Properties;->properties:Ljava/util/Set;

    invoke-interface/range {v29 .. v29}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_3
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_8

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/belkin/constant/DeviceListConstants$Properties;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_1

    .line 778
    .local v18, "info":Lcom/belkin/constant/DeviceListConstants$Properties;
    :try_start_5
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v29

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "get"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v18 .. v18}, Lcom/belkin/constant/DeviceListConstants$Properties;->getValue()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    const/16 v31, 0x0

    move/from16 v0, v31

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v31, v0

    invoke-virtual/range {v29 .. v31}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v24

    .line 779
    .restart local v24    # "method":Ljava/lang/reflect/Method;
    invoke-virtual/range {v24 .. v24}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v27

    .line 780
    .restart local v27    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v26, 0x0

    .line 781
    .local v26, "response":Ljava/lang/Object;
    const-class v29, Ljava/lang/String;

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v29

    if-eqz v29, :cond_6

    .line 782
    const/16 v29, 0x0

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    .end local v26    # "response":Ljava/lang/Object;
    check-cast v26, Ljava/lang/String;

    .line 788
    :cond_5
    :goto_4
    invoke-virtual/range {v18 .. v18}, Lcom/belkin/constant/DeviceListConstants$Properties;->getValue()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lcom/belkin/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v25

    move-object/from16 v1, v29

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_8
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_5} :catch_9

    goto :goto_3

    .line 790
    .end local v24    # "method":Ljava/lang/reflect/Method;
    .end local v27    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_5
    move-exception v14

    .line 792
    .local v14, "e":Lorg/json/JSONException;
    :try_start_6
    invoke-virtual {v14}, Lorg/json/JSONException;->printStackTrace()V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_3

    .line 783
    .end local v14    # "e":Lorg/json/JSONException;
    .restart local v24    # "method":Ljava/lang/reflect/Method;
    .restart local v26    # "response":Ljava/lang/Object;
    .restart local v27    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_6
    :try_start_7
    sget-object v29, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v29

    if-eqz v29, :cond_7

    .line 784
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v29, 0x0

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Ljava/lang/Integer;

    move-object/from16 v0, v30

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v29

    const-string v30, ""

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    .local v26, "response":Ljava/lang/String;
    goto :goto_4

    .line 785
    .local v26, "response":Ljava/lang/Object;
    :cond_7
    sget-object v29, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v29

    if-eqz v29, :cond_5

    .line 786
    const/16 v29, 0x0

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    .end local v26    # "response":Ljava/lang/Object;
    check-cast v26, Ljava/lang/Boolean;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_7 .. :try_end_7} :catch_6
    .catch Ljava/lang/IllegalAccessException; {:try_start_7 .. :try_end_7} :catch_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7 .. :try_end_7} :catch_8
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_7 .. :try_end_7} :catch_9

    .local v26, "response":Ljava/lang/Boolean;
    goto :goto_4

    .line 793
    .end local v24    # "method":Ljava/lang/reflect/Method;
    .end local v26    # "response":Ljava/lang/Boolean;
    .end local v27    # "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_6
    move-exception v14

    .line 795
    .local v14, "e":Ljava/lang/NoSuchMethodException;
    :try_start_8
    invoke-virtual {v14}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto/16 :goto_3

    .line 796
    .end local v14    # "e":Ljava/lang/NoSuchMethodException;
    :catch_7
    move-exception v14

    .line 798
    .local v14, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v14}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto/16 :goto_3

    .line 799
    .end local v14    # "e":Ljava/lang/IllegalAccessException;
    :catch_8
    move-exception v14

    .line 801
    .local v14, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v14}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto/16 :goto_3

    .line 802
    .end local v14    # "e":Ljava/lang/IllegalArgumentException;
    :catch_9
    move-exception v14

    .line 804
    .local v14, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v14}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto/16 :goto_3

    .line 808
    .end local v14    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v18    # "info":Lcom/belkin/constant/DeviceListConstants$Properties;
    :cond_8
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 810
    .local v4, "attributesJsonObj":Lorg/json/JSONObject;
    const-string v29, "binaryState"

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBinaryState()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 811
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v3

    .line 812
    .local v3, "attributes":Lorg/json/JSONObject;
    const-string v29, "DeviceListController"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "Create Device properties JSON. device attributes: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 814
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v22

    .line 815
    .local v22, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    invoke-virtual {v3}, Lorg/json/JSONObject;->length()I

    move-result v29

    if-lez v29, :cond_9

    .line 816
    :goto_5
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_a

    .line 817
    invoke-interface/range {v22 .. v22}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/String;
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_1

    .line 819
    .local v21, "key":Ljava/lang/String;
    :try_start_9
    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lorg/json/JSONObject;

    .line 820
    .local v28, "value":Lorg/json/JSONObject;
    invoke-static/range {v21 .. v21}, Lcom/belkin/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    const-string v30, "value"

    move-object/from16 v0, v28

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9
    .catch Ljava/lang/ClassCastException; {:try_start_9 .. :try_end_9} :catch_a
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_b

    goto :goto_5

    .line 821
    .end local v28    # "value":Lorg/json/JSONObject;
    :catch_a
    move-exception v14

    .line 822
    .local v14, "e":Ljava/lang/ClassCastException;
    :try_start_a
    const-string v29, "DeviceListController"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "ClassCastException while creating JSON object. Defective attribute: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    .line 823
    .end local v14    # "e":Ljava/lang/ClassCastException;
    :catch_b
    move-exception v15

    .line 824
    .local v15, "e1":Lorg/json/JSONException;
    const-string v29, "DeviceListController"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "JSONException while creating JSON object. Defective attribute key: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-static {v0, v1, v15}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5

    .line 828
    .end local v15    # "e1":Lorg/json/JSONException;
    .end local v21    # "key":Ljava/lang/String;
    :cond_9
    const-string v29, "DeviceListController"

    const-string v30, "NO KEY"

    invoke-static/range {v29 .. v30}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 831
    :cond_a
    const-string v29, "information"

    move-object/from16 v0, v20

    move-object/from16 v1, v29

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 832
    const-string v29, "properties"

    move-object/from16 v0, v20

    move-object/from16 v1, v29

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 833
    const-string v29, "attributes"

    move-object/from16 v0, v20

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 835
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v29

    if-nez v29, :cond_1

    .line 836
    const/4 v6, 0x0

    .line 837
    .local v6, "capabilitiesJsonObj":Lorg/json/JSONObject;
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilities()Ljava/lang/String;

    move-result-object v7

    .line 839
    .local v7, "capabilitiesJsonStr":Ljava/lang/String;
    const-string v29, "DeviceListController"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "Zigbee Capabilities. Capabilities from DeviceInformation: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "; Length: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 841
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v29

    if-eqz v29, :cond_d

    .line 843
    new-instance v6, Lorg/json/JSONObject;

    .end local v6    # "capabilitiesJsonObj":Lorg/json/JSONObject;
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 845
    .restart local v6    # "capabilitiesJsonObj":Lorg/json/JSONObject;
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilityID()Ljava/lang/String;

    move-result-object v9

    .line 846
    .local v9, "capabilityIDList":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCurrentState()Ljava/lang/String;

    move-result-object v13

    .line 848
    .local v13, "currentStateList":Ljava/lang/String;
    const-string v29, "DeviceListController"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "ZIGBEE Capabilities. ID List: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "; current state List: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 849
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v29

    if-nez v29, :cond_c

    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v29

    if-nez v29, :cond_c

    .line 850
    const-string v29, ","

    const/16 v30, -0x1

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-virtual {v9, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    .line 851
    .local v5, "capabilitiesArr":[Ljava/lang/String;
    const-string v29, ","

    const/16 v30, -0x1

    move-object/from16 v0, v29

    move/from16 v1, v30

    invoke-virtual {v13, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v12

    .line 853
    .local v12, "currentStateArr":[Ljava/lang/String;
    array-length v0, v5

    move/from16 v23, v0

    .line 854
    .local v23, "length":I
    array-length v0, v12

    move/from16 v29, v0

    move/from16 v0, v23

    move/from16 v1, v29

    if-ne v0, v1, :cond_b

    .line 856
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_6
    move/from16 v0, v16

    move/from16 v1, v23

    if-ge v0, v1, :cond_c

    .line 857
    aget-object v8, v5, v16

    .line 858
    .local v8, "capabilityID":Ljava/lang/String;
    aget-object v11, v12, v16

    .line 860
    .local v11, "currentState":Ljava/lang/String;
    const-string v29, "DeviceListController"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "ZIGBEE Capabilities. ID: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, "; current state: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 861
    sget-object v29, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    move-object/from16 v0, v29

    invoke-virtual {v0, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 862
    .local v10, "capabilityStr":Ljava/lang/String;
    invoke-virtual {v6, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 856
    add-int/lit8 v16, v16, 0x1

    goto :goto_6

    .line 865
    .end local v8    # "capabilityID":Ljava/lang/String;
    .end local v10    # "capabilityStr":Ljava/lang/String;
    .end local v11    # "currentState":Ljava/lang/String;
    .end local v16    # "i":I
    :cond_b
    const-string v29, "DeviceListController"

    const-string v30, "NO KEY"

    invoke-static/range {v29 .. v30}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 872
    .end local v5    # "capabilitiesArr":[Ljava/lang/String;
    .end local v9    # "capabilityIDList":Ljava/lang/String;
    .end local v12    # "currentStateArr":[Ljava/lang/String;
    .end local v13    # "currentStateList":Ljava/lang/String;
    .end local v23    # "length":I
    :cond_c
    :goto_7
    const-string v29, "deviceCapabilities"

    move-object/from16 v0, v20

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_2

    .line 869
    :cond_d
    new-instance v6, Lorg/json/JSONObject;

    .end local v6    # "capabilitiesJsonObj":Lorg/json/JSONObject;
    invoke-direct {v6, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_1

    .restart local v6    # "capabilitiesJsonObj":Lorg/json/JSONObject;
    goto :goto_7
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 88
    sget-object v0, Lcom/belkin/controller/DeviceListController;->devListController:Lcom/belkin/controller/DeviceListController;

    if-nez v0, :cond_0

    .line 89
    new-instance v0, Lcom/belkin/controller/DeviceListController;

    invoke-direct {v0, p0}, Lcom/belkin/controller/DeviceListController;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/controller/DeviceListController;->devListController:Lcom/belkin/controller/DeviceListController;

    .line 91
    :cond_0
    sget-object v0, Lcom/belkin/controller/DeviceListController;->devListController:Lcom/belkin/controller/DeviceListController;

    return-object v0
.end method

.method private processRulesFetchReset(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p3, "resetType"    # Ljava/lang/String;
    .param p4, "device"    # Lorg/json/JSONObject;
    .param p5, "stateData"    # Lorg/json/JSONObject;

    .prologue
    .line 1218
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/rules/impl/WeMoRulesFactory;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/rules/IWeMoRules;

    move-result-object v7

    .line 1219
    .local v7, "rules":Lcom/belkin/wemo/rules/IWeMoRules;
    new-instance v0, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;-><init>(Lcom/belkin/controller/DeviceListController;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 1220
    .local v0, "callback":Lcom/belkin/controller/DeviceListController$FetchDevicesRulesCallback;
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-interface {v7, v1, v0, v0}, Lcom/belkin/wemo/rules/IWeMoRules;->fetchRulesAndSyncDevices(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;)V

    .line 1221
    return-void
.end method


# virtual methods
.method public addDevice(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 596
    const-string v1, "DeviceListController"

    const-string v2, " In addDevice "

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 597
    if-nez p1, :cond_0

    .line 598
    const/4 v0, 0x0

    .line 604
    :goto_0
    return-object v0

    .line 600
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 602
    .local v0, "deviceObj":Lorg/json/JSONObject;
    invoke-direct {p0, p1}, Lcom/belkin/controller/DeviceListController;->createJSONObj(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;

    move-result-object v0

    .line 603
    const-string v1, "DeviceListController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " In add device deviceObj: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public addToGroup(Lorg/json/JSONArray;)Z
    .locals 9
    .param p1, "params"    # Lorg/json/JSONArray;

    .prologue
    .line 675
    const/4 v0, 0x1

    .line 676
    .local v0, "areParamsValid":Z
    const-string v6, "DeviceListController"

    const-string v7, " In addToGroup "

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 677
    if-nez p1, :cond_1

    .line 678
    const/4 v0, 0x0

    .line 700
    :cond_0
    :goto_0
    return v0

    .line 680
    :cond_1
    const-string v6, "DeviceListController"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " Params:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 682
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v6

    const/4 v7, 0x3

    if-lt v6, v7, :cond_0

    .line 683
    const/4 v6, 0x0

    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 684
    .local v1, "bridgeUDN":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 685
    const/4 v0, 0x0

    .line 686
    const-string v6, "DeviceListController"

    const-string v7, "addToGroup(). Bridge UDN is Empty/Null"

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 693
    .end local v1    # "bridgeUDN":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 695
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 688
    .end local v2    # "e":Lorg/json/JSONException;
    .restart local v1    # "bridgeUDN":Ljava/lang/String;
    :cond_2
    const/4 v6, 0x1

    :try_start_1
    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 689
    .local v4, "groupProperties":Lorg/json/JSONObject;
    const/4 v6, 0x2

    invoke-virtual {p1, v6}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v5

    .line 690
    .local v5, "isNewGroup":Z
    sget-object v6, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v7, "CreateGroup"

    invoke-virtual {v6, v7, v1, v4, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addGroup(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 696
    .end local v1    # "bridgeUDN":Ljava/lang/String;
    .end local v4    # "groupProperties":Lorg/json/JSONObject;
    .end local v5    # "isNewGroup":Z
    :catch_1
    move-exception v3

    .line 697
    .local v3, "ex":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public areNestFirmwareSupported()Z
    .locals 2

    .prologue
    .line 1013
    sget-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v1, :cond_0

    .line 1014
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    sput-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 1016
    :cond_0
    sget-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->areNestFirmwareSupported()Z

    move-result v0

    .line 1017
    .local v0, "isNestFWSupported":Z
    return v0
.end method

.method public calibrate(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 10
    .param p1, "parameters"    # Lorg/json/JSONObject;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 324
    if-eqz p1, :cond_4

    .line 325
    const-string v0, "DeviceListController"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "calibrate: json containing calibration parameters: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    :try_start_0
    const-string v0, "udn"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 328
    .local v1, "udn":Ljava/lang/String;
    const-string v0, "binaryState"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "binaryState"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 329
    .local v2, "state":Ljava/lang/String;
    :goto_0
    const-string v0, "fader"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "fader"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 330
    .local v3, "fader":Ljava/lang/String;
    :goto_1
    const-string v0, "level"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "level"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 332
    .local v4, "level":Ljava/lang/String;
    :goto_2
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    new-instance v5, Lcom/belkin/controller/DeviceListController$3;

    invoke-direct {v5, p0, p2}, Lcom/belkin/controller/DeviceListController$3;-><init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V

    new-instance v6, Lcom/belkin/controller/DeviceListController$4;

    invoke-direct {v6, p0, p2}, Lcom/belkin/controller/DeviceListController$4;-><init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->calibrate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/CalibrateSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;)V

    .line 364
    .end local v1    # "udn":Ljava/lang/String;
    .end local v2    # "state":Ljava/lang/String;
    .end local v3    # "fader":Ljava/lang/String;
    .end local v4    # "level":Ljava/lang/String;
    :cond_0
    :goto_3
    return-void

    .line 328
    .restart local v1    # "udn":Ljava/lang/String;
    :cond_1
    const-string v2, ""

    goto :goto_0

    .line 329
    .restart local v2    # "state":Ljava/lang/String;
    :cond_2
    const-string v3, ""

    goto :goto_1

    .line 330
    .restart local v3    # "fader":Ljava/lang/String;
    :cond_3
    const-string v4, ""
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 349
    .end local v1    # "udn":Ljava/lang/String;
    .end local v2    # "state":Ljava/lang/String;
    .end local v3    # "fader":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 350
    .local v7, "e":Lorg/json/JSONException;
    const-string v0, "DeviceListController"

    const-string v5, "calibrate: NumberFormatException while parsing ruleId: "

    invoke-static {v0, v5, v7}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 351
    if-eqz p2, :cond_0

    .line 352
    new-instance v9, Lorg/apache/cordova/PluginResult;

    sget-object v0, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v9, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 353
    .local v9, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v9}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_3

    .line 357
    .end local v7    # "e":Lorg/json/JSONException;
    .end local v9    # "result":Lorg/apache/cordova/PluginResult;
    :cond_4
    const-string v8, "calibrate: JSONObject containing params in NULL"

    .line 358
    .local v8, "error":Ljava/lang/String;
    const-string v0, "DeviceListController"

    invoke-static {v0, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 359
    if-eqz p2, :cond_0

    .line 360
    new-instance v9, Lorg/apache/cordova/PluginResult;

    sget-object v0, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v9, v0, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 361
    .restart local v9    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v9}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_3
.end method

.method public checkBhonjourInNetwork(Landroid/content/Context;Lorg/apache/cordova/CallbackContext;)V
    .locals 4
    .param p1, "mContext"    # Landroid/content/Context;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 1355
    :try_start_0
    new-instance v1, Lcom/belkin/utils/NsdUtil;

    invoke-direct {v1, p1}, Lcom/belkin/utils/NsdUtil;-><init>(Landroid/content/Context;)V

    .line 1356
    .local v1, "nsdUtil":Lcom/belkin/utils/NsdUtil;
    invoke-virtual {v1, p2}, Lcom/belkin/utils/NsdUtil;->initializeNsd(Lorg/apache/cordova/CallbackContext;)V

    .line 1357
    invoke-virtual {v1}, Lcom/belkin/utils/NsdUtil;->discoverServices()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1362
    .end local v1    # "nsdUtil":Lcom/belkin/utils/NsdUtil;
    :goto_0
    return-void

    .line 1358
    :catch_0
    move-exception v0

    .line 1359
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "DeviceListController"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public clearCache()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 1416
    iget-object v4, p0, Lcom/belkin/controller/DeviceListController;->mSDKNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1417
    const-string v4, "DeviceListController"

    const-string v5, "Remote mode clearing cache"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1418
    sget-object v4, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetHomeNetwork()V

    .line 1420
    :cond_0
    new-instance v3, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v4, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 1421
    .local v3, "sharedPreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v3, v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteEnabled(Z)Z

    .line 1422
    invoke-virtual {v3, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAccessSSID(Ljava/lang/String;)Z

    .line 1423
    invoke-virtual {v3, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 1424
    invoke-virtual {v3, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 1425
    iget-object v4, p0, Lcom/belkin/controller/DeviceListController;->mSDKNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getArpMac()Ljava/lang/String;

    move-result-object v0

    .line 1426
    .local v0, "currentARPMac":Ljava/lang/String;
    invoke-virtual {v3, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setCacheArpMac(Ljava/lang/String;)Z

    .line 1427
    invoke-virtual {v3, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storePrivateKey(Ljava/lang/String;)V

    .line 1428
    invoke-virtual {v3, v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAutoEnableNeeded(Z)V

    .line 1429
    const-string v4, "0"

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 1431
    invoke-static {}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->getInstance()Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->remoteDisabledNotify()V

    .line 1433
    sget-object v4, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceUDNListFromDB()Ljava/util/List;

    move-result-object v1

    .line 1434
    .local v1, "devicesInDBList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v4, "DeviceListController"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Nest devicesInDBList: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1435
    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 1436
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_2

    .line 1437
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "WEMO00"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1438
    sget-object v5, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v5, v4, v8, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->removeDeviceByUDN(Ljava/lang/String;ZZ)V

    .line 1436
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1442
    .end local v2    # "i":I
    :cond_2
    return-void
.end method

.method public collectEmailIDToCloud()V
    .locals 2

    .prologue
    .line 727
    const-string v0, "DeviceListController"

    const-string v1, " In collectEmailIDToCloud "

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 728
    sget-object v0, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->collectEmailIDToCloud()V

    .line 729
    return-void
.end method

.method public configureDimmingRange(Lorg/apache/cordova/CallbackContext;Lorg/json/JSONObject;)V
    .locals 11
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "parameters"    # Lorg/json/JSONObject;

    .prologue
    .line 184
    if-eqz p2, :cond_1

    .line 185
    const-string v0, "DeviceListController"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "configureDimmingRange: parameters: "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    :try_start_0
    const-string v0, "udn"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "udn":Ljava/lang/String;
    const-string v0, "turnOnLevel"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 189
    .local v4, "turnOnBrightness":Ljava/lang/String;
    const-string v0, "minLevel"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 190
    .local v2, "minBrightness":Ljava/lang/String;
    const-string v0, "maxLevel"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 192
    .local v3, "maxBrightness":Ljava/lang/String;
    new-instance v5, Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;

    invoke-direct {v5, p0, p1}, Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;-><init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V

    .line 193
    .local v5, "callback":Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    move-object v6, v5

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->configureDimmingRange(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 215
    .end local v1    # "udn":Ljava/lang/String;
    .end local v2    # "minBrightness":Ljava/lang/String;
    .end local v3    # "maxBrightness":Ljava/lang/String;
    .end local v4    # "turnOnBrightness":Ljava/lang/String;
    .end local v5    # "callback":Lcom/belkin/controller/DeviceListController$ConfigureDimmingRangeCallback;
    :cond_0
    :goto_0
    return-void

    .line 194
    :catch_0
    move-exception v7

    .line 195
    .local v7, "e":Lorg/json/JSONException;
    const-string v0, "DeviceListController"

    const-string v6, "configureDimmingRange: JSONException while parsing parameters: "

    invoke-static {v0, v6, v7}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 196
    if-eqz p1, :cond_0

    .line 197
    new-instance v9, Lorg/apache/cordova/PluginResult;

    sget-object v0, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v9, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 198
    .local v9, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v9}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 200
    .end local v7    # "e":Lorg/json/JSONException;
    .end local v9    # "result":Lorg/apache/cordova/PluginResult;
    :catch_1
    move-exception v7

    .line 201
    .local v7, "e":Ljava/lang/NumberFormatException;
    const-string v0, "DeviceListController"

    const-string v6, "configureDimmingRange: NumberFormatException while parsing parameters: "

    invoke-static {v0, v6, v7}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 202
    if-eqz p1, :cond_0

    .line 203
    new-instance v9, Lorg/apache/cordova/PluginResult;

    sget-object v0, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v9, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 204
    .restart local v9    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v9}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 208
    .end local v7    # "e":Ljava/lang/NumberFormatException;
    .end local v9    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1
    const-string v8, "JSONObject containing configureDimmingRange params in NULL"

    .line 209
    .local v8, "error":Ljava/lang/String;
    const-string v0, "DeviceListController"

    invoke-static {v0, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    if-eqz p1, :cond_0

    .line 211
    new-instance v9, Lorg/apache/cordova/PluginResult;

    sget-object v0, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v9, v0, v8}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 212
    .restart local v9    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v9}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method

.method public configureHushMode(Lorg/apache/cordova/CallbackContext;Lorg/json/JSONObject;)V
    .locals 9
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "parameters"    # Lorg/json/JSONObject;

    .prologue
    .line 147
    if-eqz p2, :cond_1

    .line 148
    const-string v6, "DeviceListController"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "configureHushMode: parameters: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    :try_start_0
    const-string v6, "udn"

    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 152
    .local v5, "udn":Ljava/lang/String;
    const-string v6, "hushMode"

    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 153
    .local v3, "hushModeValue":Ljava/lang/String;
    new-instance v0, Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;

    invoke-direct {v0, p0, p1}, Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;-><init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V

    .line 154
    .local v0, "callback":Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;
    iget-object v6, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    invoke-virtual {v6, v5, v3, v0, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->configureHushMode(Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    .end local v0    # "callback":Lcom/belkin/controller/DeviceListController$ConfigureHushModeCallback;
    .end local v3    # "hushModeValue":Ljava/lang/String;
    .end local v5    # "udn":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 155
    :catch_0
    move-exception v1

    .line 156
    .local v1, "e":Lorg/json/JSONException;
    const-string v6, "DeviceListController"

    const-string v7, "configureHushMode: JSONException while parsing parameters for configureHushMode: "

    invoke-static {v6, v7, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 157
    if-eqz p1, :cond_0

    .line 158
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v6, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 159
    .local v4, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 164
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v4    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1
    const-string v2, "JSONObject containing night mode configuration params in NULL"

    .line 165
    .local v2, "error":Ljava/lang/String;
    const-string v6, "DeviceListController"

    invoke-static {v6, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    if-eqz p1, :cond_0

    .line 167
    new-instance v4, Lorg/apache/cordova/PluginResult;

    sget-object v6, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v4, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 168
    .restart local v4    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method

.method public deauthorizeNest()V
    .locals 1

    .prologue
    .line 1000
    sget-object v0, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v0, :cond_0

    .line 1001
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    sput-object v0, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 1003
    :cond_0
    sget-object v0, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->deActivateNest()V

    .line 1004
    return-void
.end method

.method public findLedBulb(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 4
    .param p1, "ledDeviceId"    # Ljava/lang/String;

    .prologue
    .line 948
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 951
    .local v1, "response":Lorg/json/JSONArray;
    :try_start_0
    sget-object v2, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v2, :cond_0

    .line 952
    iget-object v2, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v2

    sput-object v2, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 954
    :cond_0
    sget-object v2, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->findLedBulb(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 959
    :goto_0
    return-object v1

    .line 956
    :catch_0
    move-exception v0

    .line 957
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "DeviceListController"

    const-string v3, "Exception in findLedBulb"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getAttributeListConfigParameters(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 8
    .param p1, "attributeList"    # Ljava/lang/String;

    .prologue
    .line 889
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 890
    :cond_0
    const/4 v1, 0x0

    .line 911
    :cond_1
    :goto_0
    return-object v1

    .line 892
    :cond_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 894
    .local v1, "attributesConfigObj":Lorg/json/JSONObject;
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 895
    .local v0, "attributes":Lorg/json/JSONObject;
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .line 897
    .local v4, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    invoke-virtual {v0}, Lorg/json/JSONObject;->length()I

    move-result v6

    if-lez v6, :cond_3

    .line 898
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 899
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 900
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/json/JSONObject;

    .line 901
    .local v5, "value":Lorg/json/JSONObject;
    const-string v6, "value"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 902
    invoke-virtual {v1, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 907
    .end local v0    # "attributes":Lorg/json/JSONObject;
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v5    # "value":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 909
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 905
    .end local v2    # "e":Lorg/json/JSONException;
    .restart local v0    # "attributes":Lorg/json/JSONObject;
    .restart local v4    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_3
    :try_start_1
    const-string v6, "DeviceListController"

    const-string v7, "NO KEY"

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public getBlobStorage(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 1155
    const/4 v1, 0x0

    .line 1157
    .local v1, "isRequestInProcess":Z
    :try_start_0
    sget-object v2, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2, p1, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getBlobStorage(Ljava/lang/String;Lorg/json/JSONObject;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 1161
    :goto_0
    return v1

    .line 1158
    :catch_0
    move-exception v0

    .line 1159
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "DeviceListController"

    const-string v3, "Exception in getBlobStorage"

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getDevice(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 566
    const-string v3, "DeviceListController"

    const-string v4, " In getDevice "

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 567
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 568
    :cond_0
    const/4 v1, 0x0

    .line 587
    :cond_1
    :goto_0
    return-object v1

    .line 570
    :cond_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 571
    .local v1, "deviceObj":Lorg/json/JSONObject;
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v3, :cond_3

    .line 572
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    sput-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 575
    :cond_3
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceObjectByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 577
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_1

    .line 579
    :try_start_0
    invoke-direct {p0, v0}, Lcom/belkin/controller/DeviceListController;->createJSONObj(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;

    move-result-object v1

    .line 580
    const-string v3, "DeviceListController"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " In getDevice deviceObj: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    const-string v3, "attributes"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 582
    :catch_0
    move-exception v2

    .line 583
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public getDevices()Lorg/json/JSONArray;
    .locals 9

    .prologue
    .line 466
    const-string v6, "DeviceListController"

    const-string v7, "In getDevices"

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 468
    .local v2, "deviceListArray":Lorg/json/JSONArray;
    sget-object v6, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationListFromDB()Ljava/util/List;

    move-result-object v1

    .line 470
    .local v1, "deviceInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const-string v6, "DeviceListController"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Count of initial devices fetched from DeviceListManager: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 474
    .local v4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 476
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 477
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v6, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v6, :cond_1

    .line 478
    iget-object v6, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v6

    sput-object v6, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 480
    :cond_1
    sget-object v6, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v5

    .line 481
    .local v5, "newDev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v5, :cond_2

    .line 482
    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getSerialNumber()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setSerialNumber(Ljava/lang/String;)V

    .line 484
    :cond_2
    invoke-direct {p0, v0}, Lcom/belkin/controller/DeviceListController;->createJSONObj(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;

    move-result-object v3

    .line 485
    .local v3, "deviceObject":Lorg/json/JSONObject;
    const-string v6, "DeviceListController"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "getDevices(): Device in iterator: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 486
    if-eqz v3, :cond_0

    .line 487
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 490
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "deviceObject":Lorg/json/JSONObject;
    .end local v5    # "newDev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_3
    return-object v2
.end method

.method public getDevicesInfo()Lorg/json/JSONArray;
    .locals 12

    .prologue
    .line 494
    const/4 v5, 0x0

    .local v5, "ip":Ljava/lang/String;
    const/4 v7, 0x0

    .line 495
    .local v7, "macAddress":Ljava/lang/String;
    const-string v9, "DeviceListController"

    const-string v10, "In getDevicesInfo"

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 496
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 497
    .local v3, "deviceListArray":Lorg/json/JSONArray;
    sget-object v9, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationListFromDB()Ljava/util/List;

    move-result-object v2

    .line 498
    .local v2, "deviceInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const-string v9, "DeviceListController"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Count of initial devices fetched from DeviceListManager: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 500
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 501
    .local v6, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 503
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 504
    .local v1, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v9, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v9, :cond_1

    .line 505
    iget-object v9, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v9

    sput-object v9, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 507
    :cond_1
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    .line 508
    .local v0, "UDN":Ljava/lang/String;
    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/IsDevice;->Bridge(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 509
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v5

    .line 510
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v7

    .line 511
    const-string v9, "DeviceListController"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Device is bridge and its ip - "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " :macAddress: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    :cond_2
    sget-object v9, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v8

    .line 514
    .local v8, "newDev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v8, :cond_3

    .line 515
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getSerialNumber()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setSerialNumber(Ljava/lang/String;)V

    .line 517
    :cond_3
    sget-object v9, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isZigbee(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 518
    invoke-virtual {v1, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIP(Ljava/lang/String;)V

    .line 519
    invoke-virtual {v1, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setMAC(Ljava/lang/String;)V

    .line 520
    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setSerialNumber(Ljava/lang/String;)V

    .line 521
    const-string v9, "DeviceListController"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "IsDevice.Bridge(UDN) ip - "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " :macAddress: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " :serialNo: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 523
    :cond_4
    invoke-direct {p0, v1}, Lcom/belkin/controller/DeviceListController;->createJSONObj(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;

    move-result-object v4

    .line 524
    .local v4, "deviceObject":Lorg/json/JSONObject;
    const-string v9, "DeviceListController"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "getDevices(): Device in iterator: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    if-eqz v4, :cond_0

    .line 526
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto/16 :goto_0

    .line 529
    .end local v0    # "UDN":Ljava/lang/String;
    .end local v1    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v4    # "deviceObject":Lorg/json/JSONObject;
    .end local v8    # "newDev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_5
    return-object v3
.end method

.method public getFirmwareList()Lorg/json/JSONArray;
    .locals 11

    .prologue
    .line 536
    invoke-virtual {p0}, Lcom/belkin/controller/DeviceListController;->getDevices()Lorg/json/JSONArray;

    move-result-object v0

    .line 537
    .local v0, "deviceListArray":Lorg/json/JSONArray;
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 540
    .local v2, "firmwareList":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v3, v8, :cond_0

    .line 541
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 542
    .local v5, "jsonObject":Lorg/json/JSONObject;
    const-string v8, "information"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 543
    .local v4, "information":Lorg/json/JSONObject;
    const-string v8, "properties"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 544
    .local v7, "properties":Lorg/json/JSONObject;
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 545
    .local v6, "newObject":Lorg/json/JSONObject;
    const-string v8, "udn"

    const-string v9, "udn"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 546
    const-string v8, "friendlyName"

    const-string v9, "friendlyName"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 547
    const-string v8, "type"

    const-string v9, "productType"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 548
    const-string v8, "devicefirmware"

    const-string v9, "firmwareVersion"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 549
    const-string v8, "pluginId"

    const-string v9, ""

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 550
    const-string v8, "macAddress"

    const-string v9, ""

    invoke-virtual {v6, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 551
    invoke-virtual {v2, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 540
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 553
    .end local v4    # "information":Lorg/json/JSONObject;
    .end local v5    # "jsonObject":Lorg/json/JSONObject;
    .end local v6    # "newObject":Lorg/json/JSONObject;
    .end local v7    # "properties":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 554
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    .line 557
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    const-string v8, "DeviceListController"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "smartDevicePlugin:Native:firmware list result:: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 558
    return-object v2
.end method

.method public getNestDevices()V
    .locals 1

    .prologue
    .line 994
    sget-object v0, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v0, :cond_0

    .line 995
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    sput-object v0, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 997
    :cond_0
    sget-object v0, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getNestDevicesFromCloud()V

    .line 998
    return-void
.end method

.method public getNightModeConfiguration()V
    .locals 0

    .prologue
    .line 458
    return-void
.end method

.method public getSubDevicesCount(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 963
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSubDevicesCount(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hideDevice(Ljava/lang/String;I)V
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "hide"    # I

    .prologue
    .line 973
    :try_start_0
    sget-object v2, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v2, :cond_0

    .line 974
    iget-object v2, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v2

    sput-object v2, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 976
    :cond_0
    sget-object v2, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2, p1, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->hideDevice(Ljava/lang/String;I)V

    .line 977
    new-instance v1, Lcom/belkin/remoteservice/BridgeAPI;

    iget-object v2, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/belkin/remoteservice/BridgeAPI;-><init>(Landroid/content/Context;)V

    .line 978
    .local v1, "mBridgeAPI":Lcom/belkin/remoteservice/BridgeAPI;
    invoke-virtual {v1, p1}, Lcom/belkin/remoteservice/BridgeAPI;->makeRequstToBridge(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 983
    .end local v1    # "mBridgeAPI":Lcom/belkin/remoteservice/BridgeAPI;
    :goto_0
    return-void

    .line 980
    :catch_0
    move-exception v0

    .line 981
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "DeviceListController"

    const-string v3, "Exception in findLedBulb"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public hideGroup(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;Lcom/belkin/cordova/plugin/SmartDevicePlugin;)V
    .locals 2
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p3, "plugin"    # Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    .prologue
    .line 986
    sget-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v1, :cond_0

    .line 987
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    sput-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 990
    :cond_0
    new-instance v0, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;

    invoke-direct {v0, p2, p3}, Lcom/belkin/cordova/plugin/callback/HideGroupCallback;-><init>(Lorg/apache/cordova/CallbackContext;Lcom/belkin/cordova/plugin/SmartDevicePlugin;)V

    .line 991
    .local v0, "callback":Lcom/belkin/cordova/plugin/callback/HideGroupCallback;
    sget-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1, p1, v0, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->hideGroup(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;)V

    .line 992
    return-void
.end method

.method public isFWUpgradeInProgress()Z
    .locals 2

    .prologue
    .line 1022
    sget-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v1, :cond_0

    .line 1023
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    sput-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 1025
    :cond_0
    sget-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isFWUpdateInProgress()Z

    move-result v0

    .line 1026
    .local v0, "isFWProgress":Z
    return v0
.end method

.method public nestTokenExists()V
    .locals 1

    .prologue
    .line 1006
    sget-object v0, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v0, :cond_0

    .line 1007
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    sput-object v0, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 1009
    :cond_0
    sget-object v0, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->nestTokenExistenceCheck()V

    .line 1010
    return-void
.end method

.method public refreshLongPressRuleDetails(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 8
    .param p1, "parameters"    # Lorg/json/JSONObject;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 367
    if-eqz p1, :cond_1

    .line 368
    const-string v5, "DeviceListController"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "refreshLongPressRuleDetails: json containing UDN for refresh: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    :try_start_0
    const-string v5, "ruleId"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 371
    .local v3, "ruleId":Ljava/lang/String;
    const-string v5, "udn"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 372
    .local v4, "udn":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v5, v6, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->refreshLongPressRuleDetails(ILjava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 394
    .end local v3    # "ruleId":Ljava/lang/String;
    .end local v4    # "udn":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 373
    :catch_0
    move-exception v0

    .line 374
    .local v0, "e":Lorg/json/JSONException;
    const-string v5, "DeviceListController"

    const-string v6, "refreshLongPressRuleDetails: JSONException while parsing params: "

    invoke-static {v5, v6, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 375
    if-eqz p2, :cond_0

    .line 376
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 377
    .local v2, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 379
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v2    # "result":Lorg/apache/cordova/PluginResult;
    :catch_1
    move-exception v0

    .line 380
    .local v0, "e":Ljava/lang/NumberFormatException;
    const-string v5, "DeviceListController"

    const-string v6, "refreshLongPressRuleDetails: NumberFormatException while parsing ruleId: "

    invoke-static {v5, v6, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 381
    if-eqz p2, :cond_0

    .line 382
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 383
    .restart local v2    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 387
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    .end local v2    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1
    const-string v1, "refreshLongPressRuleDetails: JSONObject containing params in NULL"

    .line 388
    .local v1, "error":Ljava/lang/String;
    const-string v5, "DeviceListController"

    invoke-static {v5, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    if-eqz p2, :cond_0

    .line 390
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v5, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 391
    .restart local v2    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method

.method public removeGroup(Lorg/json/JSONArray;)V
    .locals 7
    .param p1, "params"    # Lorg/json/JSONArray;

    .prologue
    .line 709
    const-string v4, "DeviceListController"

    const-string v5, " In removeFromGroup "

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 710
    if-nez p1, :cond_0

    .line 724
    :goto_0
    return-void

    .line 713
    :cond_0
    const-string v4, "DeviceListController"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " Params:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 715
    const/4 v4, 0x0

    :try_start_0
    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 716
    .local v0, "bridgeUDN":Ljava/lang/String;
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->getInt(I)I

    move-result v3

    .line 717
    .local v3, "groupID":I
    sget-object v4, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v5, "RemoveGroup"

    invoke-virtual {v4, v5, v0, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->removeGroup(Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 718
    .end local v0    # "bridgeUDN":Ljava/lang/String;
    .end local v3    # "groupID":I
    :catch_0
    move-exception v1

    .line 720
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 721
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v2

    .line 722
    .local v2, "ex":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public varargs resetDevice(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;[Ljava/lang/Boolean;)Lorg/json/JSONObject;
    .locals 28
    .param p1, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p3, "resetType"    # Ljava/lang/String;
    .param p4, "device"    # Lorg/json/JSONObject;
    .param p5, "stateData"    # Lorg/json/JSONObject;
    .param p6, "areRulesReset"    # [Ljava/lang/Boolean;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1042
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 1043
    .local v4, "msgObj":Lorg/json/JSONObject;
    new-instance v26, Lcom/belkin/remoteservice/BridgeAPI;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    move-object/from16 v0, v26

    invoke-direct {v0, v1}, Lcom/belkin/remoteservice/BridgeAPI;-><init>(Landroid/content/Context;)V

    .line 1045
    .local v26, "mBridgeAPI":Lcom/belkin/remoteservice/BridgeAPI;
    :try_start_0
    const-string v1, "udn"

    move-object/from16 v0, p4

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 1048
    .local v12, "udn":Ljava/lang/String;
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    if-nez p4, :cond_2

    .line 1049
    :cond_0
    const-string v1, "DeviceListController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resetType or device missing: resetType: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",stateData: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p5

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1051
    const-string v1, "error"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resetType, device or stateData missing: resetType: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",stateData: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p5

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1151
    .end local v12    # "udn":Ljava/lang/String;
    :cond_1
    :goto_0
    return-object v4

    .line 1056
    .restart local v12    # "udn":Ljava/lang/String;
    :cond_2
    const-string v1, "DeviceListController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resetDevice start resetType: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", stateData: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p5

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1059
    const-string v1, "all"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "fnIconRules"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1061
    :cond_3
    new-instance v8, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v8, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 1063
    .local v8, "latch":Ljava/util/concurrent/CountDownLatch;
    move-object/from16 v27, v12

    .line 1064
    .local v27, "rulesUDN":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isZigbee(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1065
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    invoke-virtual {v1, v12}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v22

    .line 1066
    .local v22, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual/range {v22 .. v22}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v21

    .line 1068
    .local v21, "bridgeUdn":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 1071
    .end local v21    # "bridgeUdn":Ljava/lang/String;
    .end local v22    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_4
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v9

    new-instance v10, Lcom/belkin/controller/DeviceListController$5;

    move-object/from16 v0, p0

    invoke-direct {v10, v0, v8}, Lcom/belkin/controller/DeviceListController$5;-><init>(Lcom/belkin/controller/DeviceListController;Ljava/util/concurrent/CountDownLatch;)V

    new-instance v1, Lcom/belkin/controller/DeviceListController$6;

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    invoke-direct/range {v1 .. v8}, Lcom/belkin/controller/DeviceListController$6;-><init>(Lcom/belkin/controller/DeviceListController;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/concurrent/CountDownLatch;)V

    move-object/from16 v0, v27

    invoke-interface {v9, v0, v10, v1}, Lcom/belkin/wemo/rules/RMIRules;->deleteRulesFromDevice(Ljava/lang/String;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1097
    :try_start_1
    invoke-virtual {v8}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1109
    .end local v8    # "latch":Ljava/util/concurrent/CountDownLatch;
    .end local v27    # "rulesUDN":Ljava/lang/String;
    :cond_5
    :try_start_2
    const-string v1, "wifi"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "resetUsageData"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "resetThreshold"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "resetAutoThreshold"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 1111
    if-nez p5, :cond_6

    .line 1112
    const-string v1, "error"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " stateData missing: resetType: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",stateData: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p5

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 1143
    .end local v12    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v23

    .line 1144
    .local v23, "e":Lorg/json/JSONException;
    const-string v1, "DeviceListController"

    const-string v2, "Exception in resetDevice"

    move-object/from16 v0, v23

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1146
    :try_start_3
    const-string v1, "error"

    const-string v2, "exception resetDevice- check log"

    invoke-virtual {v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_0

    .line 1147
    :catch_1
    move-exception v24

    .line 1148
    .local v24, "e1":Ljava/lang/Exception;
    const-string v1, "DeviceListController"

    const-string v2, "Exception in resetDevice"

    move-object/from16 v0, v23

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1098
    .end local v23    # "e":Lorg/json/JSONException;
    .end local v24    # "e1":Ljava/lang/Exception;
    .restart local v8    # "latch":Ljava/util/concurrent/CountDownLatch;
    .restart local v12    # "udn":Ljava/lang/String;
    .restart local v27    # "rulesUDN":Ljava/lang/String;
    :catch_2
    move-exception v23

    .line 1099
    .local v23, "e":Ljava/lang/InterruptedException;
    :try_start_4
    const-string v1, "DeviceListController"

    const-string v2, "InterruptedException in resetDevice: "

    move-object/from16 v0, v23

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1100
    const-string v1, "error"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "InterruptedException - resetType: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",stateData: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p5

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 1118
    .end local v8    # "latch":Ljava/util/concurrent/CountDownLatch;
    .end local v23    # "e":Ljava/lang/InterruptedException;
    .end local v27    # "rulesUDN":Ljava/lang/String;
    :cond_6
    const/16 v25, 0x0

    .line 1119
    .local v25, "isRequestInProcess":Z
    sget-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v1, :cond_7

    .line 1120
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    sput-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 1123
    :cond_7
    const-string v1, "all"

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1124
    sget-object v9, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    move-object/from16 v13, p4

    move-object/from16 v14, p5

    invoke-virtual/range {v9 .. v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetDeviceAll(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z

    move-result v25

    .line 1125
    move-object/from16 v0, v26

    invoke-virtual {v0, v12}, Lcom/belkin/remoteservice/BridgeAPI;->makeRequstToBridge(Ljava/lang/String;)V

    .line 1140
    :cond_8
    :goto_1
    if-nez v25, :cond_1

    .line 1141
    const-string v1, "error"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Reset Type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", request result error"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 1126
    :cond_9
    const-string v1, "wifi"

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 1128
    new-instance v14, Lorg/json/JSONObject;

    invoke-direct {v14}, Lorg/json/JSONObject;-><init>()V

    .line 1129
    .local v14, "subStateData":Lorg/json/JSONObject;
    sget-object v9, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    move-object/from16 v13, p4

    invoke-virtual/range {v9 .. v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetWiFi(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z

    move-result v25

    .line 1130
    move-object/from16 v0, v26

    invoke-virtual {v0, v12}, Lcom/belkin/remoteservice/BridgeAPI;->makeRequstToBridge(Ljava/lang/String;)V

    goto :goto_1

    .line 1131
    .end local v14    # "subStateData":Lorg/json/JSONObject;
    :cond_a
    const-string v1, "fnIconRules"

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 1132
    sget-object v15, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v16, p1

    move-object/from16 v17, p2

    move-object/from16 v18, v12

    move-object/from16 v19, p4

    move-object/from16 v20, p5

    invoke-virtual/range {v15 .. v20}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetFNIconRules(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z

    move-result v25

    goto :goto_1

    .line 1133
    :cond_b
    const-string v1, "resetUsageData"

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 1134
    sget-object v15, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v16, p1

    move-object/from16 v17, p2

    move-object/from16 v18, v12

    move-object/from16 v19, p4

    move-object/from16 v20, p5

    invoke-virtual/range {v15 .. v20}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetUsageData(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z

    move-result v25

    goto :goto_1

    .line 1135
    :cond_c
    const-string v1, "resetThreshold"

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 1136
    sget-object v15, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v16, p1

    move-object/from16 v17, p2

    move-object/from16 v18, v12

    move-object/from16 v19, p4

    move-object/from16 v20, p5

    invoke-virtual/range {v15 .. v20}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetThreshold(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z

    move-result v25

    goto/16 :goto_1

    .line 1137
    :cond_d
    const-string v1, "resetAutoThreshold"

    move-object/from16 v0, p3

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1138
    sget-object v15, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-object/from16 v16, p1

    move-object/from16 v17, p2

    move-object/from16 v18, v12

    move-object/from16 v19, p4

    move-object/from16 v20, p5

    invoke-virtual/range {v15 .. v20}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetAutoThreshold(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    move-result v25

    goto/16 :goto_1
.end method

.method public selectPhoto(Lorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 1204
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController;->photoRequestedListener:Lcom/belkin/controller/listener/PhotoRequestedListener;

    if-eqz v0, :cond_0

    .line 1205
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController;->photoRequestedListener:Lcom/belkin/controller/listener/PhotoRequestedListener;

    new-instance v1, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;

    invoke-direct {v1, p0, p1}, Lcom/belkin/controller/DeviceListController$PhotoGalleryProcessor;-><init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v0, v1}, Lcom/belkin/controller/listener/PhotoRequestedListener;->onSelectPhoto(Lcom/belkin/controller/listener/SelectPhotoListener;)V

    .line 1209
    :goto_0
    return-void

    .line 1207
    :cond_0
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {p1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method

.method public setBlobStorage(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 1165
    const/4 v1, 0x0

    .line 1167
    .local v1, "isRequestInProcess":Z
    :try_start_0
    sget-object v2, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2, p1, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setBlobStorage(Ljava/lang/String;Lorg/json/JSONObject;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 1171
    :goto_0
    return v1

    .line 1168
    :catch_0
    move-exception v0

    .line 1169
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "DeviceListController"

    const-string v3, "Exception in setBlobStorage"

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public setBulbType(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 8
    .param p1, "parameters"    # Lorg/json/JSONObject;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 269
    if-eqz p1, :cond_1

    .line 270
    const-string v5, "DeviceListController"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setBulbType: json containing Bulb Type: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    :try_start_0
    const-string v5, "bulbType"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 273
    .local v0, "bulbType":Ljava/lang/String;
    const-string v5, "udn"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 274
    .local v4, "udn":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    new-instance v6, Lcom/belkin/controller/DeviceListController$1;

    invoke-direct {v6, p0, p2}, Lcom/belkin/controller/DeviceListController$1;-><init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V

    new-instance v7, Lcom/belkin/controller/DeviceListController$2;

    invoke-direct {v7, p0, p2}, Lcom/belkin/controller/DeviceListController$2;-><init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V

    invoke-virtual {v5, v4, v0, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setBulbType(Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 321
    .end local v0    # "bulbType":Ljava/lang/String;
    .end local v4    # "udn":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 306
    :catch_0
    move-exception v1

    .line 307
    .local v1, "e":Lorg/json/JSONException;
    const-string v5, "DeviceListController"

    const-string v6, "setBulbType: JSONException while parsing params: "

    invoke-static {v5, v6, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 308
    if-eqz p2, :cond_0

    .line 309
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 310
    .local v3, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 314
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v3    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1
    const-string v2, "setBulbType: JSONObject containing params in NULL"

    .line 315
    .local v2, "error":Ljava/lang/String;
    const-string v5, "DeviceListController"

    invoke-static {v5, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    if-eqz p2, :cond_0

    .line 317
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v5, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 318
    .restart local v3    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method

.method public setDeviceProperties(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "device"    # Lorg/json/JSONObject;
    .param p2, "props"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 916
    const-string v3, "DeviceListController"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " In setDeviceProperties,model: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ",props: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 917
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 919
    .local v1, "msgObj":Lorg/json/JSONObject;
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 920
    :cond_0
    const-string v3, "error"

    const-string v4, "device or props missing"

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 938
    :goto_0
    return-object v1

    .line 925
    :cond_1
    :try_start_0
    const-string v3, "udn"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 927
    .local v2, "udn":Ljava/lang/String;
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v3, :cond_2

    .line 928
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v3

    sput-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 930
    :cond_2
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3, v2, p1, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceProperties(Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 932
    .end local v2    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 933
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "DeviceListController"

    const-string v4, "Exception in setDeviceProperties"

    invoke-static {v3, v4, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 934
    const-string v3, "error"

    const-string v4, "exception setDeviceProperties- check log"

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0
.end method

.method public setDeviceState(Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "device"    # Lorg/json/JSONObject;
    .param p2, "attributes"    # Lorg/json/JSONObject;

    .prologue
    .line 632
    const-string v3, "DeviceListController"

    const-string v4, " In setDeviceState "

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 633
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 646
    :cond_0
    :goto_0
    return-void

    .line 637
    :cond_1
    :try_start_0
    const-string v3, "udn"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 638
    .local v2, "udn":Ljava/lang/String;
    const-string v3, "type"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 639
    .local v1, "type":Ljava/lang/String;
    const-string v3, "DeviceListController"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " udn: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " :type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " :attributes: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 640
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3, v2, p2, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceState(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 641
    .end local v1    # "type":Ljava/lang/String;
    .end local v2    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 643
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public setGroupState(Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "device"    # Lorg/json/JSONObject;
    .param p2, "attributes"    # Lorg/json/JSONObject;

    .prologue
    .line 654
    const-string v3, "DeviceListController"

    const-string v4, " In setGroupState "

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 655
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 667
    :cond_0
    :goto_0
    return-void

    .line 659
    :cond_1
    :try_start_0
    const-string v3, "udn"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 660
    .local v2, "udn":Ljava/lang/String;
    const-string v3, "bridgeUDN"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 661
    .local v0, "bridgeUDN":Ljava/lang/String;
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3, v2, p2, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setGroupState(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 662
    .end local v0    # "bridgeUDN":Ljava/lang/String;
    .end local v2    # "udn":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 664
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public setInsightDrawerState(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
    .locals 8
    .param p1, "parameters"    # Lorg/json/JSONObject;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 244
    if-eqz p1, :cond_1

    .line 245
    const-string v5, "DeviceListController"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setInsightDrawerState: params = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    :try_start_0
    const-string v5, "isOpen"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 248
    .local v2, "isOpened":I
    const-string v5, "udn"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 249
    .local v4, "udn":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v5, v2, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setInsightDrawerState(ILjava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 265
    .end local v2    # "isOpened":I
    .end local v4    # "udn":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 250
    :catch_0
    move-exception v0

    .line 251
    .local v0, "e":Lorg/json/JSONException;
    const-string v5, "DeviceListController"

    const-string v6, "setInsightDrawerState: JSONException while parsing params: "

    invoke-static {v5, v6, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 252
    if-eqz p2, :cond_0

    .line 253
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v5}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 254
    .local v3, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 258
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v3    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1
    const-string v1, "setInsightDrawerState: JSONObject containing params in NULL"

    .line 259
    .local v1, "error":Ljava/lang/String;
    const-string v5, "DeviceListController"

    invoke-static {v5, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    if-eqz p2, :cond_0

    .line 261
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v5, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v5, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 262
    .restart local v3    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p2, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method

.method public setNightModeConfiguration(Lorg/apache/cordova/CallbackContext;Lorg/json/JSONObject;)V
    .locals 12
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "parameters"    # Lorg/json/JSONObject;

    .prologue
    .line 112
    if-eqz p2, :cond_1

    .line 113
    const-string v0, "DeviceListController"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "setNightModeConfiguration: parameters: "

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    :try_start_0
    const-string v0, "udn"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 116
    .local v1, "udn":Ljava/lang/String;
    const-string v0, "nightModeBrightness"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 117
    .local v5, "nightModeBrightness":I
    const-string v0, "nightMode"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 118
    .local v2, "nightMode":I
    const-string v0, "startTime"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 119
    .local v3, "startTime":I
    const-string v0, "endTime"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 120
    .local v4, "endTime":I
    new-instance v6, Lcom/belkin/controller/DeviceListController$SetNightModeConfigurationCallback;

    invoke-direct {v6, p0, p1}, Lcom/belkin/controller/DeviceListController$SetNightModeConfigurationCallback;-><init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V

    .line 121
    .local v6, "callback":Lcom/belkin/controller/DeviceListController$SetNightModeConfigurationCallback;
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    move-object v7, v6

    invoke-virtual/range {v0 .. v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setNightModeConfiguration(Ljava/lang/String;IIIILcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 143
    .end local v1    # "udn":Ljava/lang/String;
    .end local v2    # "nightMode":I
    .end local v3    # "startTime":I
    .end local v4    # "endTime":I
    .end local v5    # "nightModeBrightness":I
    .end local v6    # "callback":Lcom/belkin/controller/DeviceListController$SetNightModeConfigurationCallback;
    :cond_0
    :goto_0
    return-void

    .line 122
    :catch_0
    move-exception v8

    .line 123
    .local v8, "e":Lorg/json/JSONException;
    const-string v0, "DeviceListController"

    const-string v7, "setNightModeConfiguration: JSONException while parsing parameters for setNightModeConfiguration: "

    invoke-static {v0, v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 124
    if-eqz p1, :cond_0

    .line 125
    new-instance v10, Lorg/apache/cordova/PluginResult;

    sget-object v0, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v10, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 126
    .local v10, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v10}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 128
    .end local v8    # "e":Lorg/json/JSONException;
    .end local v10    # "result":Lorg/apache/cordova/PluginResult;
    :catch_1
    move-exception v8

    .line 129
    .local v8, "e":Ljava/lang/NumberFormatException;
    const-string v0, "DeviceListController"

    const-string v7, "setNightModeConfiguration: NumberFormatException while parsing parameters for setNightModeConfiguration: "

    invoke-static {v0, v7, v8}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 130
    if-eqz p1, :cond_0

    .line 131
    new-instance v10, Lorg/apache/cordova/PluginResult;

    sget-object v0, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v10, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 132
    .restart local v10    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v10}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 136
    .end local v8    # "e":Ljava/lang/NumberFormatException;
    .end local v10    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1
    const-string v9, "JSONObject containing night mode configuration params in NULL"

    .line 137
    .local v9, "error":Ljava/lang/String;
    const-string v0, "DeviceListController"

    invoke-static {v0, v9}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    if-eqz p1, :cond_0

    .line 139
    new-instance v10, Lorg/apache/cordova/PluginResult;

    sget-object v0, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v10, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 140
    .restart local v10    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v10}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method

.method public setPhotoRequestListener(Lcom/belkin/controller/listener/PhotoRequestedListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/belkin/controller/listener/PhotoRequestedListener;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController;->photoRequestedListener:Lcom/belkin/controller/listener/PhotoRequestedListener;

    .line 85
    return-void
.end method

.method public takePicture(Lorg/apache/cordova/CallbackContext;)V
    .locals 5
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 1181
    :try_start_0
    const-string v3, "DeviceListController"

    const-string v4, "EDIT ICON: takePicture"

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1182
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController;->photoRequestedListener:Lcom/belkin/controller/listener/PhotoRequestedListener;

    if-eqz v3, :cond_1

    .line 1183
    sget-object v3, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->generateEditedIconFile()Ljava/io/File;

    move-result-object v1

    .line 1184
    .local v1, "file":Ljava/io/File;
    if-eqz v1, :cond_0

    .line 1185
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    .line 1186
    .local v2, "uri":Landroid/net/Uri;
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController;->photoRequestedListener:Lcom/belkin/controller/listener/PhotoRequestedListener;

    new-instance v4, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;

    invoke-direct {v4, p0, p1}, Lcom/belkin/controller/DeviceListController$CameraPictureProcessor;-><init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V

    invoke-interface {v3, v4, v2}, Lcom/belkin/controller/listener/PhotoRequestedListener;->onTakePicture(Lcom/belkin/controller/listener/TakePictureListener;Landroid/net/Uri;)V

    .line 1197
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "uri":Landroid/net/Uri;
    :goto_0
    return-void

    .line 1188
    .restart local v1    # "file":Ljava/io/File;
    :cond_0
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1193
    .end local v1    # "file":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 1194
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 1195
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 1191
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1
    :try_start_1
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public updateDevice(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 614
    const-string v1, "DeviceListController"

    const-string v2, " In updateDevice "

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 615
    if-nez p1, :cond_0

    .line 616
    const/4 v0, 0x0

    .line 622
    :goto_0
    return-object v0

    .line 618
    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 620
    .local v0, "deviceObj":Lorg/json/JSONObject;
    invoke-direct {p0, p1}, Lcom/belkin/controller/DeviceListController;->createJSONObj(Lcom/belkin/wemo/cache/data/DeviceInformation;)Lorg/json/JSONObject;

    move-result-object v0

    .line 621
    const-string v1, "DeviceListController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " In updateDevice deviceObj: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public updateFwStatus(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "fwStatus"    # Ljava/lang/String;

    .prologue
    .line 1406
    sget-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDevicesArray(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 1407
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 1408
    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFwStatus(Ljava/lang/String;)V

    .line 1409
    sget-object v1, Lcom/belkin/controller/DeviceListController;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1412
    :cond_0
    return-void
.end method
