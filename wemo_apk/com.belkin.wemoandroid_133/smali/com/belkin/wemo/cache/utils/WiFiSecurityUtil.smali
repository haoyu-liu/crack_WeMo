.class public Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;
.super Ljava/lang/Object;
.source "WiFiSecurityUtil.java"


# static fields
.field public static final MIN_LENGTH_UNIQUE_ID:I = 0xd

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
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->type:Ljava/lang/String;

    .line 65
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->username:Ljava/lang/String;

    .line 66
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->password:Ljava/lang/String;

    .line 67
    const/4 v0, -0x1

    iput v0, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->CHANNEL_NUMBER:I

    .line 68
    const-string v0, "PBEWithMD5And128BitAES-CBC-OpenSSL"

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->PBEWithMD5And128BitAES:Ljava/lang/String;

    return-void
.end method

.method private generatePrivateKey([Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "dataForSecrecy"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x6

    const/4 v3, 0x0

    .line 327
    const/4 v0, 0x0

    .line 329
    .local v0, "secretKey":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 330
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v2, p1, v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x1

    aget-object v2, p1, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    aget-object v2, p1, v3

    const/16 v3, 0xd

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 333
    :cond_0
    return-object v0
.end method

.method private static numbGen()J
    .locals 6

    .prologue
    .line 320
    .local v0, "numb":J
    :cond_0
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v2

    const-wide v4, 0x4197d78400000000L    # 1.0E8

    mul-double/2addr v2, v4

    const-wide v4, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v2, v4

    double-to-long v0, v2

    .line 321
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_0

    .line 322
    return-wide v0
.end method

.method private padString(Ljava/lang/String;IC)Ljava/lang/String;
    .locals 5
    .param p1, "inputString"    # Ljava/lang/String;
    .param p2, "minOutputLength"    # I
    .param p3, "fill"    # C

    .prologue
    .line 308
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v3, p2, :cond_0

    .line 309
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v2, p2, v3

    .line 310
    .local v2, "size":I
    new-array v0, v2, [C

    .line 311
    .local v0, "array":[C
    invoke-static {v0, p3}, Ljava/util/Arrays;->fill([CC)V

    .line 312
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 315
    .end local v0    # "array":[C
    .end local v2    # "size":I
    :goto_0
    return-object v1

    :cond_0
    move-object v1, p1

    goto :goto_0
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

    .line 80
    new-instance v5, Landroid/net/wifi/WifiConfiguration;

    invoke-direct {v5}, Landroid/net/wifi/WifiConfiguration;-><init>()V

    .line 81
    .local v5, "wfc":Landroid/net/wifi/WifiConfiguration;
    const-string v8, "\""

    iget-object v9, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->username:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v5, Landroid/net/wifi/WifiConfiguration;->SSID:Ljava/lang/String;

    .line 82
    iput v6, v5, Landroid/net/wifi/WifiConfiguration;->status:I

    .line 83
    iput-boolean v6, v5, Landroid/net/wifi/WifiConfiguration;->hiddenSSID:Z

    .line 84
    const/16 v8, 0x28

    iput v8, v5, Landroid/net/wifi/WifiConfiguration;->priority:I

    .line 85
    iget-object v8, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->type:Ljava/lang/String;

    const-string v9, "OPEN"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 86
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 87
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 88
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 89
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v8}, Ljava/util/BitSet;->clear()V

    .line 90
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 92
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 94
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 95
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 96
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v11}, Ljava/util/BitSet;->set(I)V

    .line 97
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 145
    :goto_0
    const-string v8, "wifi"

    invoke-virtual {p1, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/wifi/WifiManager;

    .line 147
    .local v4, "wfMgr":Landroid/net/wifi/WifiManager;
    invoke-virtual {v4, v5}, Landroid/net/wifi/WifiManager;->addNetwork(Landroid/net/wifi/WifiConfiguration;)I

    move-result v1

    .line 149
    .local v1, "networkId":I
    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getScanResults()Ljava/util/List;

    move-result-object v3

    .line 150
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

    .line 151
    .local v2, "result":Landroid/net/wifi/ScanResult;
    iget-object v8, v2, Landroid/net/wifi/ScanResult;->SSID:Ljava/lang/String;

    iget-object v9, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->username:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 152
    iget v8, v2, Landroid/net/wifi/ScanResult;->frequency:I

    add-int/lit16 v8, v8, -0x96c

    div-int/lit8 v8, v8, 0x5

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->CHANNEL_NUMBER:I

    .line 153
    iget v8, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->CHANNEL_NUMBER:I

    const/16 v9, 0xf

    if-lt v8, v9, :cond_1

    .line 154
    const/16 v8, 0xe

    iput v8, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->CHANNEL_NUMBER:I

    .line 160
    .end local v2    # "result":Landroid/net/wifi/ScanResult;
    :cond_1
    const/4 v8, -0x1

    if-eq v1, v8, :cond_5

    .line 163
    :goto_1
    return v6

    .line 99
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "networkId":I
    .end local v3    # "results":Ljava/util/List;, "Ljava/util/List<Landroid/net/wifi/ScanResult;>;"
    .end local v4    # "wfMgr":Landroid/net/wifi/WifiManager;
    :cond_2
    iget-object v8, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->type:Ljava/lang/String;

    const-string v9, "WEP"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 100
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 101
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 102
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 103
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 104
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedAuthAlgorithms:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 106
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 108
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 110
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 111
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 112
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->wepKeys:[Ljava/lang/String;

    const-string v9, "\""

    iget-object v10, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->password:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v7

    .line 113
    iput v7, v5, Landroid/net/wifi/WifiConfiguration;->wepTxKeyIndex:I

    goto/16 :goto_0

    .line 114
    :cond_3
    iget-object v8, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->type:Ljava/lang/String;

    const-string v9, "WPA/WPA2 PSK"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 115
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 116
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 117
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 118
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 120
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 122
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 123
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 124
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v11}, Ljava/util/BitSet;->set(I)V

    .line 125
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 127
    const-string v8, "\""

    iget-object v9, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->password:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v5, Landroid/net/wifi/WifiConfiguration;->preSharedKey:Ljava/lang/String;

    goto/16 :goto_0

    .line 130
    :cond_4
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 131
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedProtocols:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 132
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedKeyManagement:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 133
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 135
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedPairwiseCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 137
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v7}, Ljava/util/BitSet;->set(I)V

    .line 138
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v6}, Ljava/util/BitSet;->set(I)V

    .line 139
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v11}, Ljava/util/BitSet;->set(I)V

    .line 140
    iget-object v8, v5, Landroid/net/wifi/WifiConfiguration;->allowedGroupCiphers:Ljava/util/BitSet;

    invoke-virtual {v8, v10}, Ljava/util/BitSet;->set(I)V

    .line 142
    const-string v8, "\""

    iget-object v9, p0, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->password:Ljava/lang/String;

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

    .line 163
    goto/16 :goto_1
.end method

.method public decrypt(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 23
    .param p1, "encodedPassword"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 220
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v16, v19

    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v16, v19

    .line 223
    .local v16, "secretData":[Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->generatePrivateKey([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 225
    .local v13, "keydata":Ljava/lang/String;
    if-nez v13, :cond_0

    .line 226
    const/4 v6, 0x0

    .line 250
    :goto_0
    return-object v6

    .line 229
    :cond_0
    const/16 v19, 0x8

    move/from16 v0, v19

    new-array v15, v0, [B

    .line 230
    .local v15, "saltByte":[B
    const/16 v19, 0x10

    move/from16 v0, v19

    new-array v12, v0, [B

    .line 231
    .local v12, "ivByte":[B
    const/16 v19, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v10

    .line 232
    .local v10, "encryptedPassword":[B
    const/4 v6, 0x0

    .line 233
    .local v6, "decryptedpassword":Ljava/lang/String;
    const/4 v4, 0x1

    .line 235
    .local v4, "SALT_GEN_ITER_COUNT":I
    :try_start_0
    const-string v19, "PBEWithMD5And128BitAES-CBC-OpenSSL"

    invoke-static/range {v19 .. v19}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v11

    .line 236
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

    .line 237
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

    .line 238
    new-instance v18, Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {v13}, Ljava/lang/String;->toCharArray()[C

    move-result-object v19

    const/16 v20, 0x80

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v15, v4, v2}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    .line 239
    .local v18, "spec":Ljavax/crypto/spec/PBEKeySpec;
    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v17

    .line 240
    .local v17, "secretKey":Ljavax/crypto/SecretKey;
    new-instance v14, Ljavax/crypto/spec/SecretKeySpec;

    invoke-interface/range {v17 .. v17}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v19

    const-string v20, "AES"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v14, v0, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 241
    .local v14, "newSecretKey":Ljavax/crypto/SecretKey;
    const-string v19, "AES/CBC/PKCS5Padding"

    invoke-static/range {v19 .. v19}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v8

    .line 242
    .local v8, "decryptionCipher":Ljavax/crypto/Cipher;
    const/16 v19, 0x2

    new-instance v20, Ljavax/crypto/spec/IvParameterSpec;

    move-object/from16 v0, v20

    invoke-direct {v0, v12}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v8, v0, v14, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 243
    invoke-virtual {v8, v10}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v5

    .line 244
    .local v5, "decryptedPassword":[B
    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v5}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v6    # "decryptedpassword":Ljava/lang/String;
    .local v7, "decryptedpassword":Ljava/lang/String;
    move-object v6, v7

    .line 248
    .end local v7    # "decryptedpassword":Ljava/lang/String;
    .restart local v6    # "decryptedpassword":Ljava/lang/String;
    goto/16 :goto_0

    .line 246
    .end local v5    # "decryptedPassword":[B
    .end local v8    # "decryptionCipher":Ljavax/crypto/Cipher;
    .end local v11    # "factory":Ljavax/crypto/SecretKeyFactory;
    .end local v14    # "newSecretKey":Ljavax/crypto/SecretKey;
    .end local v17    # "secretKey":Ljavax/crypto/SecretKey;
    .end local v18    # "spec":Ljavax/crypto/spec/PBEKeySpec;
    :catch_0
    move-exception v9

    .line 247
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
    .line 171
    if-nez p3, :cond_1

    .line 172
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->generatePrivateKey([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 173
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

    .line 180
    :goto_0
    if-nez v12, :cond_2

    .line 181
    const/4 v7, 0x0

    .line 213
    :cond_0
    :goto_1
    return-object v7

    .line 176
    .end local v12    # "keydata":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 177
    .local v5, "deviceID":Ljava/lang/String;
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v19, 0x0

    aput-object v5, v16, v19

    const/16 v19, 0x1

    aput-object v5, v16, v19

    .line 178
    .local v16, "secretData":[Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->generatePrivateKey([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .restart local v12    # "keydata":Ljava/lang/String;
    goto :goto_0

    .line 183
    .end local v5    # "deviceID":Ljava/lang/String;
    .end local v16    # "secretData":[Ljava/lang/String;
    :cond_2
    const/16 v19, 0x8

    move/from16 v0, v19

    new-array v15, v0, [B

    .line 184
    .local v15, "saltByte":[B
    const/16 v19, 0x10

    move/from16 v0, v19

    new-array v11, v0, [B

    .line 185
    .local v11, "ivByte":[B
    const/4 v8, 0x0

    .line 186
    .local v8, "encryptedPassword":[B
    const/4 v4, 0x1

    .line 188
    .local v4, "SALT_GEN_ITER_COUNT":I
    :try_start_0
    const-string v19, "PBEWithMD5And128BitAES-CBC-OpenSSL"

    invoke-static/range {v19 .. v19}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object v10

    .line 189
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

    .line 190
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

    .line 191
    new-instance v18, Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {v12}, Ljava/lang/String;->toCharArray()[C

    move-result-object v19

    const/16 v20, 0x80

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v15, v4, v2}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    .line 192
    .local v18, "spec":Ljavax/crypto/spec/PBEKeySpec;
    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object v17

    .line 193
    .local v17, "secretKey":Ljavax/crypto/SecretKey;
    new-instance v13, Ljavax/crypto/spec/SecretKeySpec;

    invoke-interface/range {v17 .. v17}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v19

    const-string v20, "AES"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v13, v0, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 194
    .local v13, "newSecretKey":Ljavax/crypto/SecretKey;
    const-string v19, "AES/CBC/PKCS5Padding"

    invoke-static/range {v19 .. v19}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v9

    .line 195
    .local v9, "encryptionCipher":Ljavax/crypto/Cipher;
    const/16 v19, 0x1

    new-instance v20, Ljavax/crypto/spec/IvParameterSpec;

    move-object/from16 v0, v20

    invoke-direct {v0, v11}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    move/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v9, v0, v13, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 196
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 203
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

    .line 204
    .local v7, "encodedPassword":Ljava/lang/String;
    if-nez p3, :cond_0

    .line 205
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

    .line 206
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v14

    .line 207
    .local v14, "passwordLen":I
    const/16 v19, 0xf

    move/from16 v0, v19

    if-gt v14, v0, :cond_3

    .line 208
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

    .line 210
    :cond_3
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

    goto/16 :goto_1

    .line 199
    .end local v7    # "encodedPassword":Ljava/lang/String;
    .end local v14    # "passwordLen":I
    :catch_0
    move-exception v6

    .line 200
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method public generateAuthCode(Landroid/content/Context;)Ljava/lang/String;
    .locals 20
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 342
    const-wide/16 v6, 0x0

    .line 343
    .local v6, "lExpirationTime":J
    const-string v15, ""

    .line 344
    .local v15, "strUniqueID":Ljava/lang/String;
    const-string v12, ""

    .line 345
    .local v12, "strBaseString":Ljava/lang/String;
    const-wide/16 v4, 0xc8

    .line 346
    .local v4, "lExpirationDuration":J
    const-string v11, ""

    .line 347
    .local v11, "strAuthorizationHeader":Ljava/lang/String;
    const-string v13, ""

    .line 348
    .local v13, "strPrivateKey":Ljava/lang/String;
    const-string v14, ""

    .line 349
    .local v14, "strSignature":Ljava/lang/String;
    new-instance v10, Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object/from16 v0, p1

    invoke-direct {v10, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 351
    .local v10, "sharePreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    const-wide/16 v18, 0x3e8

    div-long v16, v16, v18

    const-wide/16 v18, 0xc8

    add-long v6, v16, v18

    .line 352
    invoke-virtual/range {p0 .. p1}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v15

    .line 353
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

    .line 354
    invoke-virtual {v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getPrivateKey()Ljava/lang/String;

    move-result-object v13

    .line 355
    const/4 v14, 0x0

    .line 357
    if-eqz v13, :cond_0

    .line 359
    :try_start_0
    const-string v16, "HmacSHA1"

    invoke-static/range {v16 .. v16}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v8

    .line 360
    .local v8, "mac":Ljavax/crypto/Mac;
    new-instance v9, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v13}, Ljava/lang/String;->getBytes()[B

    move-result-object v16

    invoke-virtual {v8}, Ljavax/crypto/Mac;->getAlgorithm()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-direct {v9, v0, v1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 361
    .local v9, "secret":Ljavax/crypto/spec/SecretKeySpec;
    invoke-virtual {v8, v9}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 362
    invoke-virtual {v12}, Ljava/lang/String;->getBytes()[B

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v8, v0}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object v2

    .line 363
    .local v2, "digest":[B
    new-instance v16, Ljava/lang/String;

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-static {v2, v0}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/String;-><init>([B)V

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    .line 364
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "\n SDU "

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

    .line 369
    .end local v2    # "digest":[B
    .end local v8    # "mac":Ljavax/crypto/Mac;
    .end local v9    # "secret":Ljavax/crypto/spec/SecretKeySpec;
    :cond_0
    :goto_0
    return-object v11

    .line 365
    :catch_0
    move-exception v3

    .line 366
    .local v3, "excep":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getDeviceID(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v8, 0xd

    .line 255
    move-object v1, p1

    .line 256
    .local v1, "mContext":Landroid/content/Context;
    new-instance v2, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v2, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 257
    .local v2, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    const/4 v3, 0x0

    .line 259
    .local v3, "uniqueID":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getUniqueID()Ljava/lang/String;

    move-result-object v3

    .line 260
    if-nez v3, :cond_4

    .line 263
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "android_id"

    invoke-static {v5, v6}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 264
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

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    if-nez v3, :cond_0

    .line 275
    sget-object v3, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    .line 279
    :cond_0
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v5, v8, :cond_1

    .line 280
    const/16 v5, 0xd

    const/16 v6, 0x30

    invoke-direct {p0, v3, v5, v6}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->padString(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v3

    .line 284
    :cond_1
    if-nez v3, :cond_2

    .line 287
    invoke-static {}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->numbGen()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    .line 291
    :cond_2
    if-nez v3, :cond_3

    .line 293
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    .line 294
    const-string v5, "WiFiSecurityUtil"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "UUID  as uniqueID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    :cond_3
    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setUniqueID(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_4
    move-object v4, v3

    .line 304
    .end local v3    # "uniqueID":Ljava/lang/String;
    .local v4, "uniqueID":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 300
    .end local v4    # "uniqueID":Ljava/lang/String;
    .restart local v3    # "uniqueID":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 301
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v4, v3

    .line 302
    .end local v3    # "uniqueID":Ljava/lang/String;
    .restart local v4    # "uniqueID":Ljava/lang/String;
    goto :goto_0
.end method
