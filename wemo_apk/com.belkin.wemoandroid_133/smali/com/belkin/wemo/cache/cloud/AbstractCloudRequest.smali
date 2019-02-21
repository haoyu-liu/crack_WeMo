.class public abstract Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest;
.super Ljava/lang/Object;
.source "AbstractCloudRequest.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;
    }
.end annotation


# instance fields
.field protected headersMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private requestCompleteListener:Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest;->headersMap:Ljava/util/Map;

    .line 13
    return-void
.end method


# virtual methods
.method public getAdditionalHeadersMap()Ljava/util/Map;
    .locals 1
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

    .prologue
    .line 29
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest;->headersMap:Ljava/util/Map;

    return-object v0
.end method

.method protected getOnCloudRequestCompletedListener()Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest;->requestCompleteListener:Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    return-object v0
.end method

.method public setOnCloudRequestCompletedListener(Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;)V
    .locals 0
    .param p1, "requestCompleteListener"    # Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest;->requestCompleteListener:Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;

    .line 26
    return-void
.end method
