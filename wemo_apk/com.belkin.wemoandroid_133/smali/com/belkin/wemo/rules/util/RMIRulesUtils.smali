.class public interface abstract Lcom/belkin/wemo/rules/util/RMIRulesUtils;
.super Ljava/lang/Object;
.source "RMIRulesUtils.java"


# static fields
.field public static final DEVICE_TYPE_AIR_PURIFIER:Ljava/lang/String; = "airpurifier"

.field public static final DEVICE_TYPE_COFFEE_MAKER:Ljava/lang/String; = "coffeemaker"

.field public static final DEVICE_TYPE_CROCKPOT:Ljava/lang/String; = "crockpot"

.field public static final DEVICE_TYPE_HEATER:Ljava/lang/String; = "heater"

.field public static final DEVICE_TYPE_HUMIDIFIER:Ljava/lang/String; = "humidifier"


# virtual methods
.method public abstract copyRulesDB(Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract createZipFileInApp(Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract deleteRulesDBFileInApp()Z
.end method

.method public abstract doesRulesDBFileExist()Z
.end method

.method public abstract download(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract downloadFromUrl(Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract downloadFromUrl([BLjava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getCloudRequestManager()Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
.end method

.method public abstract getDBFilePathWithNameInApp()Ljava/lang/String;
.end method

.method public abstract getDeviceInformationByUDNFromMemory(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
.end method

.method public abstract getFileInBase64Encoding(Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation
.end method

.method public abstract getFileSizeInByte(Ljava/lang/String;)I
.end method

.method public abstract getFirmwareVersionRevisionNumber(Ljava/lang/String;)I
.end method

.method public abstract getOnlineDeviceInformationList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getRulesDBName()Ljava/lang/String;
.end method

.method public abstract getRulesDBPath()Ljava/lang/String;
.end method

.method public abstract getRulesDBPathInDevice(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getRulesDBVerion()Ljava/lang/String;
.end method

.method public abstract getZippedDBFilePathWithNameInApp()Ljava/lang/String;
.end method

.method public abstract isFetchStoreRulesSupportedInDevice(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
.end method

.method public abstract isFetchStoreRulesSupportedInLocalDev(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
.end method

.method public abstract isFetchStoreRulesSupportedInRemoteDev(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
.end method

.method public abstract isLongPressRuleSupported(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
.end method

.method public abstract isSmartDevice(Ljava/lang/String;)Z
.end method

.method public abstract readFile(Ljava/lang/String;)[B
.end method

.method public abstract setRulesDBVersion(Ljava/lang/String;)V
.end method

.method public abstract writeDBToDevice(Ljava/lang/String;Ljava/lang/String;I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract writeDataToURL(Ljava/net/URL;[BI)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
