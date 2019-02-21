.class public interface abstract Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
.super Ljava/lang/Object;
.source "CloudRequestInterface.java"


# virtual methods
.method public abstract getAdditionalHeaders()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getBody()Ljava/lang/String;
.end method

.method public abstract getFileByteArray()[B
.end method

.method public abstract getRequestMethod()I
.end method

.method public abstract getTimeout()I
.end method

.method public abstract getTimeoutLimit()I
.end method

.method public abstract getURL()Ljava/lang/String;
.end method

.method public abstract getUploadFileName()Ljava/lang/String;
.end method

.method public abstract isAuthHeaderRequired()Z
.end method

.method public abstract requestComplete(ZI[B)V
.end method
