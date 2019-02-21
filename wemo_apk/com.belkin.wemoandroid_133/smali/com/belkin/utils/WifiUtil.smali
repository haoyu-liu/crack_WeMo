.class public Lcom/belkin/utils/WifiUtil;
.super Ljava/lang/Object;
.source "WifiUtil.java"


# static fields
.field public static final SECURITY_TYPE_EAP:I = 0x3

.field public static final SECURITY_TYPE_NONE:I = 0x0

.field public static final SECURITY_TYPE_PSK:I = 0x4

.field public static final SECURITY_TYPE_WEP:I = 0x1

.field public static final SECURITY_TYPE_WPA:I = 0x5

.field public static final SECURITY_TYPE_WPS:I = 0x2


# instance fields
.field private final FAIL:Ljava/lang/String;

.field private final OPEN:Ljava/lang/String;

.field private final SECURED:Ljava/lang/String;

.field private final SUCCESS:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mWifiManager:Landroid/net/wifi/WifiManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string v0, "Success"

    iput-object v0, p0, Lcom/belkin/utils/WifiUtil;->SUCCESS:Ljava/lang/String;

    .line 17
    const-string v0, "Fail"

    iput-object v0, p0, Lcom/belkin/utils/WifiUtil;->FAIL:Ljava/lang/String;

    .line 21
    const-string v0, "Secured"

    iput-object v0, p0, Lcom/belkin/utils/WifiUtil;->SECURED:Ljava/lang/String;

    .line 22
    const-string v0, "Open"

    iput-object v0, p0, Lcom/belkin/utils/WifiUtil;->OPEN:Ljava/lang/String;

    .line 33
    iput-object p1, p0, Lcom/belkin/utils/WifiUtil;->mContext:Landroid/content/Context;

    .line 34
    return-void
.end method

.method private getSecurityType(Ljava/lang/String;)I
    .locals 2
    .param p1, "capabilities"    # Ljava/lang/String;

    .prologue
    .line 74
    const/4 v0, 0x0

    .line 75
    .local v0, "securityType":I
    const-string v1, "WEP"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 76
    const/4 v0, 0x1

    .line 84
    .end local v0    # "securityType":I
    :cond_0
    :goto_0
    return v0

    .line 77
    .restart local v0    # "securityType":I
    :cond_1
    const-string v1, "PSK"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 78
    const/4 v0, 0x4

    goto :goto_0

    .line 79
    :cond_2
    const-string v1, "EAP"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 80
    const/4 v0, 0x3

    goto :goto_0

    .line 81
    :cond_3
    const-string v1, "WPA"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 82
    const/4 v0, 0x5

    goto :goto_0
.end method

.method private initConfiguration([Ljava/lang/String;)Landroid/net/wifi/WifiConfiguration;
    .locals 10
    .param p1, "mSingleResult"    # [Ljava/lang/String;

    .prologue
    const/16 v9, 0x22

    const/4 v8, 0x1

    const/4 v7, 0x2

    const/4 v6, 0x0

    .line 140
    new-instance v3, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v3}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 141
    .local v3, "wifiConfig":Landroid/net/wifi/WifiConfiguration;
    aget-object v4, p1, v8

    invoke-direct {p0, v4}, Lcom/belkin/utils/WifiUtil;->getSecurityType(Ljava/lang/String;)I

    move-result v2

    .line 142
    .local v2, "securityType":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, p1, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 144
    packed-switch v2, :pswitch_data_0

    .line 198
    :goto_0
    :pswitch_0
    return-object v3

    .line 146
    :pswitch_1
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v4, v6}, Ljava/util/BitSet;->set(I)V

    goto :goto_0

    .line 150
    :pswitch_2
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v4, v6}, Ljava/util/BitSet;->set(I)V

    .line 151
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v4, v6}, Ljava/util/BitSet;->set(I)V

    .line 152
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v4, v8}, Ljava/util/BitSet;->set(I)V

    .line 156
    aget-object v4, p1, v7

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    .line 157
    .local v0, "length":I
    aget-object v1, p1, v7

    .line 160
    .local v1, "password":Ljava/lang/String;
    const/16 v4, 0xa

    if-eq v0, v4, :cond_0

    const/16 v4, 0x1a

    if-eq v0, v4, :cond_0

    const/16 v4, 0x3a

    if-ne v0, v4, :cond_1

    :cond_0
    const-string v4, "[0-9A-Fa-f]*"

    invoke-virtual {v1, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 162
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    aput-object v1, v4, v6

    goto :goto_0

    .line 164
    :cond_1
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    goto :goto_0

    .line 170
    .end local v0    # "length":I
    .end local v1    # "password":Ljava/lang/String;
    :pswitch_3
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v4, v8}, Ljava/util/BitSet;->set(I)V

    .line 174
    aget-object v1, p1, v7

    .line 175
    .restart local v1    # "password":Ljava/lang/String;
    const-string v4, "[0-9A-Fa-f]{64}"

    invoke-virtual {v1, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 176
    iput-object v1, v3, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto :goto_0

    .line 178
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto :goto_0

    .line 184
    .end local v1    # "password":Ljava/lang/String;
    :pswitch_4
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v4, v7}, Ljava/util/BitSet;->set(I)V

    .line 185
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    const/4 v5, 0x3

    invoke-virtual {v4, v5}, Ljava/util/BitSet;->set(I)V

    .line 186
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    aget-object v5, p1, v7

    aput-object v5, v4, v6

    goto/16 :goto_0

    .line 193
    :pswitch_5
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v4, v8}, Ljava/util/BitSet;->set(I)V

    .line 194
    iget-object v4, v3, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v4, v6}, Ljava/util/BitSet;->set(I)V

    .line 195
    aget-object v4, p1, v7

    iput-object v4, v3, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto/16 :goto_0

    .line 144
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_5
    .end packed-switch
.end method


# virtual methods
.method public checkAllWifiConnection()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/net/wifi/ScanResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    iget-object v0, p0, Lcom/belkin/utils/WifiUtil;->mContext:Landroid/content/Context;

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    iput-object v0, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 68
    iget-object v0, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->startScan()Z

    .line 70
    iget-object v0, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public checkConnectionStatus()Z
    .locals 2

    .prologue
    .line 55
    iget-object v1, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    .line 56
    .local v0, "mInfo":Landroid/net/wifi/WifiInfo;
    if-nez v0, :cond_0

    .line 57
    const/4 v1, 0x1

    .line 59
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public checkWifiState()Z
    .locals 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/belkin/utils/WifiUtil;->mContext:Landroid/content/Context;

    const-string v1, "wifi"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    iput-object v0, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 44
    iget-object v0, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    return v0
.end method

.method public connectWiFiNetwork([Ljava/lang/String;)Z
    .locals 9
    .param p1, "wifiParams"    # [Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 102
    invoke-direct {p0, p1}, Lcom/belkin/utils/WifiUtil;->initConfiguration([Ljava/lang/String;)Landroid/net/wifi/WifiConfiguration;

    move-result-object v2

    .line 103
    .local v2, "wifiConfig":Landroid/net/wifi/WifiConfiguration;
    const/4 v5, 0x2

    iput v5, v2, Landroid/net/wifi/WifiConfiguration;->status:I

    .line 104
    iget-object v5, p0, Lcom/belkin/utils/WifiUtil;->mContext:Landroid/content/Context;

    const-string v8, "wifi"

    invoke-virtual {v5, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/wifi/WifiManager;

    iput-object v5, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 107
    iget-object v5, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v5}, Landroid/net/wifi/WifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v3

    .line 108
    .local v3, "wifiList":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/WifiConfiguration;>;"
    const/4 v1, 0x0

    .line 109
    .local v1, "profileID":I
    if-eqz v3, :cond_4

    .line 110
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    .line 111
    .local v4, "wifiListSize":I
    if-eqz v4, :cond_3

    .line 112
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v4, :cond_2

    .line 114
    iget-object v8, v2, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/wifi/WifiConfiguration;

    iget-object v5, v5, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    invoke-virtual {v8, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 116
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/wifi/WifiConfiguration;

    iget v1, v5, Landroid/net/wifi/WifiConfiguration;->networkId:I

    .line 117
    iget-object v5, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v5, v1, v6}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    .line 118
    iget-object v5, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v5}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    .line 119
    iget-object v5, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v5}, Landroid/net/wifi/WifiManager;->reconnect()Z

    move-result v5

    if-eqz v5, :cond_0

    move v5, v6

    .line 136
    .end local v0    # "i":I
    .end local v4    # "wifiListSize":I
    :goto_1
    return v5

    .restart local v0    # "i":I
    .restart local v4    # "wifiListSize":I
    :cond_0
    move v5, v7

    .line 121
    goto :goto_1

    .line 112
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 124
    :cond_2
    iget-object v5, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v5, v2}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result v1

    .line 132
    .end local v0    # "i":I
    .end local v4    # "wifiListSize":I
    :goto_2
    iget-object v5, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v5, v1, v6}, Landroid/net/wifi/WifiManager;->enableNetwork(IZ)Z

    .line 133
    iget-object v5, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v5}, Landroid/net/wifi/WifiManager;->saveConfiguration()Z

    .line 134
    iget-object v5, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v5}, Landroid/net/wifi/WifiManager;->reconnect()Z

    move-result v5

    if-eqz v5, :cond_5

    move v5, v6

    .line 135
    goto :goto_1

    .line 126
    .restart local v4    # "wifiListSize":I
    :cond_3
    iget-object v5, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v5, v2}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result v1

    goto :goto_2

    .line 129
    .end local v4    # "wifiListSize":I
    :cond_4
    iget-object v5, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v5, v2}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result v1

    goto :goto_2

    :cond_5
    move v5, v7

    .line 136
    goto :goto_1
.end method

.method public getConnectedWifiNetwork()Ljava/lang/String;
    .locals 4

    .prologue
    .line 202
    iget-object v2, p0, Lcom/belkin/utils/WifiUtil;->mContext:Landroid/content/Context;

    const-string v3, "wifi"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    iput-object v2, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 204
    const/4 v1, 0x0

    .line 205
    .local v1, "wifiSSID":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    if-eqz v2, :cond_0

    .line 206
    iget-object v2, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v0

    .line 207
    .local v0, "wifiInfo":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v0}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v1

    .line 209
    .end local v0    # "wifiInfo":Landroid/net/wifi/WifiInfo;
    :cond_0
    return-object v1
.end method

.method public ifWifiConnected()Ljava/lang/String;
    .locals 4

    .prologue
    .line 213
    iget-object v2, p0, Lcom/belkin/utils/WifiUtil;->mContext:Landroid/content/Context;

    const-string v3, "wifi"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    iput-object v2, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    .line 215
    iget-object v2, p0, Lcom/belkin/utils/WifiUtil;->mWifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v1

    .line 216
    .local v1, "wifiInfo":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v1}, Landroid/net/wifi/WifiInfo;->getSupplicantState()Landroid/net/wifi/SupplicantState;

    move-result-object v0

    .line 217
    .local v0, "supState":Landroid/net/wifi/SupplicantState;
    sget-object v2, Landroid/net/wifi/SupplicantState;->COMPLETED:Landroid/net/wifi/SupplicantState;

    invoke-virtual {v0, v2}, Landroid/net/wifi/SupplicantState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 218
    const-string v2, "Success"

    .line 220
    :goto_0
    return-object v2

    :cond_0
    const-string v2, "Fail"

    goto :goto_0
.end method

.method public isSecureNetwork(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "capabilities"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/belkin/utils/WifiUtil;->getSecurityType(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 90
    const-string v0, "Open"

    :goto_0
    return-object v0

    .line 89
    :cond_0
    const-string v0, "Secured"

    goto :goto_0
.end method
