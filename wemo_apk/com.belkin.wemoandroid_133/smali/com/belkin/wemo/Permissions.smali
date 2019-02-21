.class public Lcom/belkin/wemo/Permissions;
.super Ljava/lang/Object;
.source "Permissions.java"

# interfaces
.implements Lcom/belkin/wemo/PermListner;


# static fields
.field private static permissions:Lcom/belkin/wemo/Permissions;


# instance fields
.field private mCallbackContext:Lorg/apache/cordova/CallbackContext;

.field private mContext:Landroid/content/Context;

.field private permissionListners:Lcom/belkin/wemo/PermissionListners;

.field private ruleUtility:Lcom/belkin/utils/RuleUtility;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/Permissions;->mContext:Landroid/content/Context;

    .line 31
    iput-object p1, p0, Lcom/belkin/wemo/Permissions;->mContext:Landroid/content/Context;

    .line 32
    new-instance v0, Lcom/belkin/utils/RuleUtility;

    invoke-direct {v0, p1}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/wemo/Permissions;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    .line 33
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/belkin/wemo/Permissions;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    sget-object v0, Lcom/belkin/wemo/Permissions;->permissions:Lcom/belkin/wemo/Permissions;

    if-nez v0, :cond_0

    .line 25
    new-instance v0, Lcom/belkin/wemo/Permissions;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/Permissions;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/wemo/Permissions;->permissions:Lcom/belkin/wemo/Permissions;

    .line 27
    :cond_0
    sget-object v0, Lcom/belkin/wemo/Permissions;->permissions:Lcom/belkin/wemo/Permissions;

    return-object v0
.end method


# virtual methods
.method public checkLocationPermission()Z
    .locals 2

    .prologue
    .line 51
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/Permissions;->permissionListners:Lcom/belkin/wemo/PermissionListners;

    if-eqz v1, :cond_0

    .line 52
    iget-object v1, p0, Lcom/belkin/wemo/Permissions;->permissionListners:Lcom/belkin/wemo/PermissionListners;

    invoke-interface {v1}, Lcom/belkin/wemo/PermissionListners;->locationPermissionCheck()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 57
    :goto_0
    return v1

    .line 54
    :catch_0
    move-exception v0

    .line 55
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 57
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public fetchPermission(Lorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/belkin/wemo/Permissions;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    .line 41
    iget-object v0, p0, Lcom/belkin/wemo/Permissions;->permissionListners:Lcom/belkin/wemo/PermissionListners;

    if-eqz v0, :cond_0

    .line 42
    iget-object v0, p0, Lcom/belkin/wemo/Permissions;->permissionListners:Lcom/belkin/wemo/PermissionListners;

    sget-object v1, Lcom/belkin/wemo/Permissions;->permissions:Lcom/belkin/wemo/Permissions;

    invoke-interface {v0, v1}, Lcom/belkin/wemo/PermissionListners;->onPermissionCheck(Lcom/belkin/wemo/PermListner;)V

    .line 47
    :goto_0
    return-void

    .line 44
    :cond_0
    const-string v0, "No Permission Listner present"

    invoke-virtual {p1, v0}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onPermDenied()V
    .locals 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/belkin/wemo/Permissions;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    const-string v1, "Location Permission Denied"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public onPermGranted()V
    .locals 4

    .prologue
    .line 63
    :try_start_0
    iget-object v2, p0, Lcom/belkin/wemo/Permissions;->ruleUtility:Lcom/belkin/utils/RuleUtility;

    iget-object v3, p0, Lcom/belkin/wemo/Permissions;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/belkin/utils/RuleUtility;->getLocationDetails(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v1

    .line 64
    .local v1, "locationDetails":Lorg/json/JSONArray;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 65
    iget-object v2, p0, Lcom/belkin/wemo/Permissions;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 72
    .end local v1    # "locationDetails":Lorg/json/JSONArray;
    :goto_0
    return-void

    .line 67
    .restart local v1    # "locationDetails":Lorg/json/JSONArray;
    :cond_0
    iget-object v2, p0, Lcom/belkin/wemo/Permissions;->mCallbackContext:Lorg/apache/cordova/CallbackContext;

    const-string v3, "Location Permission Denied"

    invoke-virtual {v2, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 69
    .end local v1    # "locationDetails":Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 70
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public setLocationRequestListener(Lcom/belkin/wemo/PermissionListners;)V
    .locals 0
    .param p1, "listener1"    # Lcom/belkin/wemo/PermissionListners;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/belkin/wemo/Permissions;->permissionListners:Lcom/belkin/wemo/PermissionListners;

    .line 37
    return-void
.end method
