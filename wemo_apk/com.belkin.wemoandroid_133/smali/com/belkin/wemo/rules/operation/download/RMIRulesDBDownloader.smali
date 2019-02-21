.class public interface abstract Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;
.super Ljava/lang/Object;
.source "RMIRulesDBDownloader.java"


# static fields
.field public static final KEY_DOWNLOAD_URL:Ljava/lang/String; = "download_url"

.field public static final KEY_FILENAME:Ljava/lang/String; = "download_location"

.field public static final KEY_MAC_ADDRESS:Ljava/lang/String; = "mac_address"


# virtual methods
.method public abstract downloadRulesDB(Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation
.end method
