.class public Lcom/belkin/utils/NsdUtil;
.super Ljava/lang/Object;
.source "NsdUtil.java"


# static fields
.field public static final SERVICE_TYPE:Ljava/lang/String; = "_hap._tcp."

.field public static final TAG:Ljava/lang/String; = "NsdUtil"


# instance fields
.field hostAdress:Ljava/lang/String;

.field mContext:Landroid/content/Context;

.field mDiscoveryListener:Landroid/net/nsd/NsdManager$DiscoveryListener;

.field mNsdManager:Landroid/net/nsd/NsdManager;

.field mRegistrationListener:Landroid/net/nsd/NsdManager$RegistrationListener;

.field mResolveListener:Landroid/net/nsd/NsdManager$ResolveListener;

.field mService:Landroid/net/nsd/NsdServiceInfo;

.field public mServiceName:Ljava/lang/String;

.field public mServiceNameBridge:Ljava/lang/String;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const-string v0, "F7C064"

    iput-object v0, p0, Lcom/belkin/utils/NsdUtil;->mServiceName:Ljava/lang/String;

    .line 26
    const-string v0, "Wemo Bridge"

    iput-object v0, p0, Lcom/belkin/utils/NsdUtil;->mServiceNameBridge:Ljava/lang/String;

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/utils/NsdUtil;->hostAdress:Ljava/lang/String;

    .line 33
    iput-object p1, p0, Lcom/belkin/utils/NsdUtil;->mContext:Landroid/content/Context;

    .line 34
    const-string v0, "servicediscovery"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/nsd/NsdManager;

    iput-object v0, p0, Lcom/belkin/utils/NsdUtil;->mNsdManager:Landroid/net/nsd/NsdManager;

    .line 35
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v1, p0, Lcom/belkin/utils/NsdUtil;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/utils/NsdUtil;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 36
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/utils/NsdUtil;)Lcom/belkin/wemo/cache/utils/SharePreferences;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/utils/NsdUtil;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/belkin/utils/NsdUtil;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    return-object v0
.end method

.method private initializeResolveListener()V
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lcom/belkin/utils/NsdUtil$1;

    invoke-direct {v0, p0}, Lcom/belkin/utils/NsdUtil$1;-><init>(Lcom/belkin/utils/NsdUtil;)V

    iput-object v0, p0, Lcom/belkin/utils/NsdUtil;->mResolveListener:Landroid/net/nsd/NsdManager$ResolveListener;

    .line 68
    return-void
.end method


# virtual methods
.method public discoverServices()V
    .locals 4

    .prologue
    .line 133
    iget-object v0, p0, Lcom/belkin/utils/NsdUtil;->mNsdManager:Landroid/net/nsd/NsdManager;

    const-string v1, "_hap._tcp."

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/belkin/utils/NsdUtil;->mDiscoveryListener:Landroid/net/nsd/NsdManager$DiscoveryListener;

    invoke-virtual {v0, v1, v2, v3}, Landroid/net/nsd/NsdManager;->discoverServices(Ljava/lang/String;ILandroid/net/nsd/NsdManager$DiscoveryListener;)V

    .line 135
    return-void
.end method

.method public getChosenServiceInfo()Landroid/net/nsd/NsdServiceInfo;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/belkin/utils/NsdUtil;->mService:Landroid/net/nsd/NsdServiceInfo;

    return-object v0
.end method

.method public initializeDiscoveryListener(Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 71
    new-instance v0, Lcom/belkin/utils/NsdUtil$2;

    invoke-direct {v0, p0, p1}, Lcom/belkin/utils/NsdUtil$2;-><init>(Lcom/belkin/utils/NsdUtil;Lorg/apache/cordova/CallbackContext;)V

    iput-object v0, p0, Lcom/belkin/utils/NsdUtil;->mDiscoveryListener:Landroid/net/nsd/NsdManager$DiscoveryListener;

    .line 120
    return-void
.end method

.method public initializeNsd(Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/belkin/utils/NsdUtil;->initializeResolveListener()V

    .line 40
    invoke-virtual {p0, p1}, Lcom/belkin/utils/NsdUtil;->initializeDiscoveryListener(Lorg/apache/cordova/CallbackContext;)V

    .line 42
    return-void
.end method

.method public registerService(I)V
    .locals 4
    .param p1, "port"    # I

    .prologue
    .line 123
    new-instance v0, Landroid/net/nsd/NsdServiceInfo;

    invoke-direct {v0}, Landroid/net/nsd/NsdServiceInfo;-><init>()V

    .line 124
    .local v0, "serviceInfo":Landroid/net/nsd/NsdServiceInfo;
    invoke-virtual {v0, p1}, Landroid/net/nsd/NsdServiceInfo;->setPort(I)V

    .line 125
    iget-object v1, p0, Lcom/belkin/utils/NsdUtil;->mServiceNameBridge:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/net/nsd/NsdServiceInfo;->setServiceName(Ljava/lang/String;)V

    .line 126
    const-string v1, "_hap._tcp."

    invoke-virtual {v0, v1}, Landroid/net/nsd/NsdServiceInfo;->setServiceType(Ljava/lang/String;)V

    .line 128
    iget-object v1, p0, Lcom/belkin/utils/NsdUtil;->mNsdManager:Landroid/net/nsd/NsdManager;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/belkin/utils/NsdUtil;->mRegistrationListener:Landroid/net/nsd/NsdManager$RegistrationListener;

    invoke-virtual {v1, v0, v2, v3}, Landroid/net/nsd/NsdManager;->registerService(Landroid/net/nsd/NsdServiceInfo;ILandroid/net/nsd/NsdManager$RegistrationListener;)V

    .line 131
    return-void
.end method

.method public stopDiscovery()V
    .locals 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/belkin/utils/NsdUtil;->mDiscoveryListener:Landroid/net/nsd/NsdManager$DiscoveryListener;

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/belkin/utils/NsdUtil;->mNsdManager:Landroid/net/nsd/NsdManager;

    iget-object v1, p0, Lcom/belkin/utils/NsdUtil;->mDiscoveryListener:Landroid/net/nsd/NsdManager$DiscoveryListener;

    invoke-virtual {v0, v1}, Landroid/net/nsd/NsdManager;->stopServiceDiscovery(Landroid/net/nsd/NsdManager$DiscoveryListener;)V

    .line 141
    :cond_0
    return-void
.end method

.method public tearDown()V
    .locals 2

    .prologue
    .line 147
    iget-object v0, p0, Lcom/belkin/utils/NsdUtil;->mNsdManager:Landroid/net/nsd/NsdManager;

    iget-object v1, p0, Lcom/belkin/utils/NsdUtil;->mRegistrationListener:Landroid/net/nsd/NsdManager$RegistrationListener;

    invoke-virtual {v0, v1}, Landroid/net/nsd/NsdManager;->unregisterService(Landroid/net/nsd/NsdManager$RegistrationListener;)V

    .line 148
    return-void
.end method
