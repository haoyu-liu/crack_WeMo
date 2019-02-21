.class public Lcom/belkin/utils/WiFiSecurityUtil;
.super Ljava/lang/Object;
.source "WiFiSecurityUtil.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "WiFiSecurityUtil"


# instance fields
.field private CHANNEL_NUMBER:I

.field private final PBEWithMD5And128BitAES:Ljava/lang/String;

.field private mpermissionController:Lcom/belkin/wemo/PermissionController;

.field private password:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private username:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/utils/WiFiSecurityUtil;->type:Ljava/lang/String;

    .line 70
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/utils/WiFiSecurityUtil;->username:Ljava/lang/String;

    .line 71
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/utils/WiFiSecurityUtil;->password:Ljava/lang/String;

    .line 72
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/utils/WiFiSecurityUtil;->CHANNEL_NUMBER:I

    .line 73
    const-string v0, "PBEWithMD5And128BitAES-CBC-OpenSSL"

    iput-object v0, p0, Lcom/belkin/utils/WiFiSecurityUtil;->PBEWithMD5And128BitAES:Ljava/lang/String;

    return-void
.end method

.method private generatePrivateKey([Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "dataForSecrecy"    # [Ljava/lang/String;

    .prologue
    .line 335
    const/4 v1, 0x0

    .line 337
    .local v1, "secretKey":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 338
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    aget-object v3, p1, v3

    const/4 v4, 0x0

    const/4 v5, 0x6

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v3, p1, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v3, p1, v3

    const/4 v4, 0x6

    const/16 v5, 0xc

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 343
    :cond_0
    :goto_0
    const-string v2, "WiFiSecurityUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "secretKey: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    return-object v1

    .line 340
    :catch_0
    move-exception v0

    .line 341
    .local v0, "ex":Ljava/lang/Exception;
    const-string v2, "WiFiSecurityUtil"

    const-string v3, "Problem with dataForSecrecy"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static numbGen()J
    .locals 6

    .prologue
    .line 328
    .local v0, "numb":J
    :cond_0
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v2

    const-wide v4, 0x4197d78400000000L    # 1.0E8

    mul-double/2addr v2, v4

    const-wide v4, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v2, v4

    double-to-long v0, v2

    .line 329
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_0

    .line 330
    return-wide v0
.end method


# virtual methods
.method public addNewWiFiSetting(Landroid/content/Context;)Z
    .locals 12
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 84
    new-instance v5, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v5}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 85
    .local v5, "wfc":Landroid/net/wifi/WifiConfiguration;
    const-string v8, "\""

    iget-object v9, p0, Lcom/belkin/utils/WiFiSecurityUtil;->username:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v5, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 86
    iput v6, v5, Landroid/net/wifi/WifiConfiguration;->status:I

    .line 87
    iput-boolean v6, v5, Landroid/net/wifi/WifiConfiguration;->hiddenSSID:Z

    .line 88
    const/16 v8, 0x28

    iput v8, v5, Landroid/net/wifi/WifiConfiguration;->priority:I

    .line 89
    iget-object v8, p0, Lcom/belkin/utils/WiFiSecurityUtil;->type:Ljava/lang/String;

    const-string v9, "OPEN"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 90
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 91
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 92
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 93
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v8}, Ljava/util/BitSet;->clear()V

    .line 94
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 96
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 98
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 99
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 100
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v11}, Ljava/util/BitSet;->set(I)V

    .line 101
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 149
    :goto_0
    const-string v8, "wifi"

    invoke-virtual {p1, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/wifi/WifiManager;

    .line 151
    .local v4, "wfMgr":Landroid/net/wifi/WifiManager;
    invoke-virtual {v4, v5}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result v1

    .line 153
    .local v1, "networkId":I
    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v3

    .line 154
    .local v3, "results":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/ScanResult;

    .line 155
    .local v2, "result":Landroid/net/wifi/ScanResult;
    iget-object v8, v2, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    iget-object v9, p0, Lcom/belkin/utils/WiFiSecurityUtil;->username:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 156
    iget v8, v2, Landroid/net/wifi/ScanResult;->frequency:I

    add-int/lit16 v8, v8, -0x96c

    div-int/lit8 v8, v8, 0x5

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/belkin/utils/WiFiSecurityUtil;->CHANNEL_NUMBER:I

    .line 157
    iget v8, p0, Lcom/belkin/utils/WiFiSecurityUtil;->CHANNEL_NUMBER:I

    const/16 v9, 0xf

    if-lt v8, v9, :cond_1

    .line 158
    const/16 v8, 0xe

    iput v8, p0, Lcom/belkin/utils/WiFiSecurityUtil;->CHANNEL_NUMBER:I

    .line 164
    .end local v2    # "result":Landroid/net/wifi/ScanResult;
    :cond_1
    const/4 v8, -0x1

    if-eq v1, v8, :cond_5

    .line 167
    :goto_1
    return v6

    .line 103
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "networkId":I
    .end local v3    # "results":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    .end local v4    # "wfMgr":Landroid/net/wifi/WifiManager;
    :cond_2
    iget-object v8, p0, Lcom/belkin/utils/WiFiSecurityUtil;->type:Ljava/lang/String;

    const-string v9, "WEP"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 104
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 105
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 106
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 107
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 108
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 110
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 112
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 114
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 115
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 116
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    const-string v9, "\""

    iget-object v10, p0, Lcom/belkin/utils/WiFiSecurityUtil;->password:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v7

    .line 117
    iput v7, v5, Landroid/net/wifi/WifiConfiguration;->wepTxKeyIndex:I

    goto/16 :goto_0

    .line 118
    :cond_3
    iget-object v8, p0, Lcom/belkin/utils/WiFiSecurityUtil;->type:Ljava/lang/String;

    const-string v9, "WPA/WPA2 PSK"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 119
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 120
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 121
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 122
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 124
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 126
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 127
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 128
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v11}, Ljava/util/BitSet;->set(I)V

    .line 129
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 131
    const-string v8, "\""

    iget-object v9, p0, Lcom/belkin/utils/WiFiSecurityUtil;->password:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v5, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto/16 :goto_0

    .line 134
    :cond_4
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 135
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 136
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 137
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 139
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 141
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 142
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 143
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v11}, Ljava/util/BitSet;->set(I)V

    .line 144
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 146
    const-string v8, "\""

    iget-object v9, p0, Lcom/belkin/utils/WiFiSecurityUtil;->password:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v5, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto/16 :goto_0

    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v1    # "networkId":I
    .restart local v3    # "results":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    .restart local v4    # "wfMgr":Landroid/net/wifi/WifiManager;
    :cond_5
    move v6, v7

    .line 167
    goto/16 :goto_1
.end method

.method public decrypt(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 23
    .param p1, "encodedPassword"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 227
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 228
    const-string v19, "WiFiSecurityUtil"

    const-string v20, "Received null encodedPassword"

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    const/4 v6, 0x0

    .line 263
    :goto_0
    return-object v6

    .line 233
    :cond_0
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v16, v19

    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v16, v19

    .line 236
    .local v16, "secretData":[Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/belkin/utils/WiFiSecurityUtil;->generatePrivateKey([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 238
    .local v13, "keydata":Ljava/lang/String;
    if-nez v13, :cond_1

    .line 239
    const/4 v6, 0x0

    goto :goto_0

    .line 242
    :cond_1
    const/16 v19, 0x8

    move/from16 v0, v19

    new-array v15, v0, [B

    .line 243
    .local v15, "saltByte":[B
    const/16 v19, 0x10

    move/from16 v0, v19

    new-array v12, v0, [B

    .line 244
    .local v12, "ivByte":[B
    const/16 v19, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v10

    .line 245
    .local v10, "encryptedPassword":[B
    const/4 v6, 0x0

    .line 246
    .local v6, "decryptedpassword":Ljava/lang/String;
    const/4 v4, 0x1

    .line 248
    .local v4, "SALT_GEN_ITER_COUNT":I
    :try_start_0
    const-string v19, "PBEWithMD5And128BitAES-CBC-OpenSSL"

    invoke-static/range {v19 .. v19}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v11

    .line 249
    .local v11, "factory":Ljavax/crypto/SecretKeyFactory;
    const/16 v19, 0x0

    const/16 v20, 0x8

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->getBytes()[B

    move-result-object v19

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x8

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-static {v0, v1, v15, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 250
    const/16 v19, 0x0

    const/16 v20, 0x10

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->getBytes()[B

    move-result-object v19

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x10

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-static {v0, v1, v12, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 251
    new-instance v18, Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {v13}, Ljava/lang/String;->toCharArray()[C

    move-result-object v19

    const/16 v20, 0x80

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v15, v4, v2}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    .line 252
    .local v18, "spec":Ljavax/crypto/spec/PBEKeySpec;
    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v17

    .line 253
    .local v17, "secretKey":Ljavax/crypto/SecretKey;
    new-instance v14, Ljavax/crypto/spec/SecretKeySpec;

    invoke-interface/range {v17 .. v17}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v19

    const-string v20, "AES"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v14, v0, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 254
    .local v14, "newSecretKey":Ljavax/crypto/SecretKey;
    const-string v19, "AES/CBC/PKCS5Padding"

    invoke-static/range {v19 .. v19}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v8

    .line 255
    .local v8, "decryptionCipher":Ljavax/crypto/Cipher;
    const/16 v19, 0x2

    new-instance v20, Ljavax/crypto/spec/IvParameterSpec;

    move-object/from16 v0, v20

    invoke-direct {v0, v12}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v8, v0, v14, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 256
    invoke-virtual {v8, v10}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v5

    .line 257
    .local v5, "decryptedPassword":[B
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v5}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v6    # "decryptedpassword":Ljava/lang/String;
    .local v7, "decryptedpassword":Ljava/lang/String;
    move-object v6, v7

    .line 261
    .end local v7    # "decryptedpassword":Ljava/lang/String;
    .restart local v6    # "decryptedpassword":Ljava/lang/String;
    goto/16 :goto_0

    .line 259
    .end local v5    # "decryptedPassword":[B
    .end local v8    # "decryptionCipher":Ljavax/crypto/Cipher;
    .end local v11    # "factory":Ljavax/crypto/SecretKeyFactory;
    .end local v14    # "newSecretKey":Ljavax/crypto/SecretKey;
    .end local v17    # "secretKey":Ljavax/crypto/SecretKey;
    .end local v18    # "spec":Ljavax/crypto/spec/PBEKeySpec;
    :catch_0
    move-exception v9

    .line 260
    .local v9, "e":Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public encrypt(Ljava/lang/String;Landroid/content/Context;I[Ljava/lang/String;)Ljava/lang/String;
    .locals 23
    .param p1, "password"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "purpose"    # I
    .param p4, "metaArray"    # [Ljava/lang/String;

    .prologue
    .line 173
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 174
    const-string v19, "WiFiSecurityUtil"

    const-string v20, "Received null password"

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    const/4 v7, 0x0

    .line 222
    :cond_0
    :goto_0
    return-object v7

    .line 179
    :cond_1
    if-nez p3, :cond_2

    .line 180
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/belkin/utils/WiFiSecurityUtil;->generatePrivateKey([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 181
    .local v12, "keydata":Ljava/lang/String;
    sget-object v19, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "keydata is : "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 189
    :goto_1
    if-nez v12, :cond_3

    .line 190
    const/4 v7, 0x0

    goto :goto_0

    .line 184
    .end local v12    # "keydata":Ljava/lang/String;
    :cond_2
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 185
    .local v5, "deviceID":Ljava/lang/String;
    const-string v19, "WiFiSecurityUtil"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "deviceID: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v19, 0x0

    aput-object v5, v16, v19

    const/16 v19, 0x1

    aput-object v5, v16, v19

    .line 187
    .local v16, "secretData":[Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/belkin/utils/WiFiSecurityUtil;->generatePrivateKey([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .restart local v12    # "keydata":Ljava/lang/String;
    goto :goto_1

    .line 192
    .end local v5    # "deviceID":Ljava/lang/String;
    .end local v16    # "secretData":[Ljava/lang/String;
    :cond_3
    const/16 v19, 0x8

    move/from16 v0, v19

    new-array v15, v0, [B

    .line 193
    .local v15, "saltByte":[B
    const/16 v19, 0x10

    move/from16 v0, v19

    new-array v11, v0, [B

    .line 194
    .local v11, "ivByte":[B
    const/4 v8, 0x0

    .line 195
    .local v8, "encryptedPassword":[B
    const/4 v4, 0x1

    .line 197
    .local v4, "SALT_GEN_ITER_COUNT":I
    :try_start_0
    const-string v19, "PBEWithMD5And128BitAES-CBC-OpenSSL"

    invoke-static/range {v19 .. v19}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v10

    .line 198
    .local v10, "factory":Ljavax/crypto/SecretKeyFactory;
    const/16 v19, 0x0

    const/16 v20, 0x8

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->getBytes()[B

    move-result-object v19

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x8

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-static {v0, v1, v15, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 199
    const/16 v19, 0x0

    const/16 v20, 0x10

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->getBytes()[B

    move-result-object v19

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x10

    move-object/from16 v0, v19

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-static {v0, v1, v11, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 200
    new-instance v18, Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {v12}, Ljava/lang/String;->toCharArray()[C

    move-result-object v19

    const/16 v20, 0x80

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v15, v4, v2}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    .line 201
    .local v18, "spec":Ljavax/crypto/spec/PBEKeySpec;
    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v17

    .line 202
    .local v17, "secretKey":Ljavax/crypto/SecretKey;
    new-instance v13, Ljavax/crypto/spec/SecretKeySpec;

    invoke-interface/range {v17 .. v17}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v19

    const-string v20, "AES"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v13, v0, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 203
    .local v13, "newSecretKey":Ljavax/crypto/SecretKey;
    const-string v19, "AES/CBC/PKCS5Padding"

    invoke-static/range {v19 .. v19}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v9

    .line 204
    .local v9, "encryptionCipher":Ljavax/crypto/Cipher;
    const/16 v19, 0x1

    new-instance v20, Ljavax/crypto/spec/IvParameterSpec;

    move-object/from16 v0, v20

    invoke-direct {v0, v11}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v9, v0, v13, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 205
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 212
    .end local v9    # "encryptionCipher":Ljavax/crypto/Cipher;
    .end local v10    # "factory":Ljavax/crypto/SecretKeyFactory;
    .end local v13    # "newSecretKey":Ljavax/crypto/SecretKey;
    .end local v17    # "secretKey":Ljavax/crypto/SecretKey;
    .end local v18    # "spec":Ljavax/crypto/spec/PBEKeySpec;
    :goto_2
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-static {v8, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v7

    .line 213
    .local v7, "encodedPassword":Ljava/lang/String;
    if-nez p3, :cond_0

    .line 214
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 215
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v14

    .line 216
    .local v14, "passwordLen":I
    const/16 v19, 0xf

    move/from16 v0, v19

    if-gt v14, v0, :cond_4

    .line 217
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "0"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 219
    :cond_4
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v20

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_0

    .line 208
    .end local v7    # "encodedPassword":Ljava/lang/String;
    .end local v14    # "passwordLen":I
    :catch_0
    move-exception v6

    .line 209
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method public generateAuthCode(Landroid/content/Context;)Ljava/lang/String;
    .locals 20
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 353
    const-wide/16 v6, 0x0

    .line 354
    .local v6, "lExpirationTime":J
    const-string v15, ""

    .line 355
    .local v15, "strUniqueID":Ljava/lang/String;
    const-string v12, ""

    .line 356
    .local v12, "strBaseString":Ljava/lang/String;
    const-wide/16 v4, 0xc8

    .line 357
    .local v4, "lExpirationDuration":J
    const-string v11, ""

    .line 358
    .local v11, "strAuthorizationHeader":Ljava/lang/String;
    const-string v13, ""

    .line 359
    .local v13, "strPrivateKey":Ljava/lang/String;
    const-string v14, ""

    .line 360
    .local v14, "strSignature":Ljava/lang/String;
    new-instance v10, Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v0, p1

    invoke-direct {v10, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 362
    .local v10, "sharePreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    const-wide/16 v18, 0x3e8

    div-long v16, v16, v18

    const-wide/16 v18, 0xc8

    add-long v6, v16, v18

    .line 363
    invoke-virtual/range {p0 .. p1}, Lcom/belkin/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v15

    .line 364
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "\n"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "\n"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 365
    invoke-virtual {v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getPrivateKey()Ljava/lang/String;

    move-result-object v13

    .line 366
    const/4 v14, 0x0

    .line 368
    if-eqz v13, :cond_0

    .line 370
    :try_start_0
    const-string v16, "HmacSHA1"

    invoke-static/range {v16 .. v16}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v8

    .line 371
    .local v8, "mac":Ljavax/crypto/Mac;
    new-instance v9, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v16

    invoke-virtual {v8}, Ljavax/crypto/Mac;->getAlgorithm()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v9, v0, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 372
    .local v9, "secret":Ljavax/crypto/spec/SecretKeySpec;
    invoke-virtual {v8, v9}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 373
    invoke-virtual {v12}, Ljava/lang/String;->getBytes()[B

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v2

    .line 374
    .local v2, "digest":[B
    new-instance v16, Ljava/lang/String;

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-static {v2, v0}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/String;-><init>([B)V

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    .line 375
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "SDU "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ":"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ":"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v11

    .line 380
    .end local v2    # "digest":[B
    .end local v8    # "mac":Ljavax/crypto/Mac;
    .end local v9    # "secret":Ljavax/crypto/spec/SecretKeySpec;
    :cond_0
    :goto_0
    return-object v11

    .line 376
    :catch_0
    move-exception v3

    .line 377
    .local v3, "excep":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getDeviceID(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v8, 0xa

    .line 268
    move-object v1, p1

    .line 269
    .local v1, "mContext":Landroid/content/Context;
    new-instance v2, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v2, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 270
    .local v2, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getUniqueID()Ljava/lang/String;

    move-result-object v3

    .line 271
    .local v3, "uniqueID":Ljava/lang/String;
    const-string v5, "WiFiSecurityUtil"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SharePref UniqueID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    if-nez v3, :cond_4

    .line 276
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "android_id"

    invoke-static {v5, v6}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 277
    const-string v5, "WiFiSecurityUtil"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Android_id as UniqueID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    if-nez v3, :cond_1

    .line 289
    sget-object v3, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    .line 291
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-gt v5, v8, :cond_0

    .line 292
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "0000"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 294
    :cond_0
    const-string v5, "WiFiSecurityUtil"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SERIAL NO: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    :cond_1
    if-nez v3, :cond_2

    .line 300
    invoke-static {}, Lcom/belkin/utils/WiFiSecurityUtil;->numbGen()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    .line 301
    const-string v5, "WiFiSecurityUtil"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Random uniqueID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    :cond_2
    if-nez v3, :cond_3

    .line 307
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    .line 308
    const-string v5, "WiFiSecurityUtil"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "UUID as uniqueID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    :cond_3
    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setUniqueID(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 318
    :cond_4
    const-string v5, "WiFiSecurityUtil"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "uniqueID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "uniqueID length: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-gt v5, v8, :cond_5

    .line 320
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "0000"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 322
    :cond_5
    const-string v5, "WiFiSecurityUtil"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "uniqueID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    move-object v4, v3

    .line 323
    .end local v3    # "uniqueID":Ljava/lang/String;
    .local v4, "uniqueID":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 314
    .end local v4    # "uniqueID":Ljava/lang/String;
    .restart local v3    # "uniqueID":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 315
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v4, v3

    .line 316
    .end local v3    # "uniqueID":Ljava/lang/String;
    .restart local v4    # "uniqueID":Ljava/lang/String;
    goto :goto_0
.end method
