.class public interface abstract Lcom/synconset/HttpRequest$UploadProgress;
.super Ljava/lang/Object;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/synconset/HttpRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "UploadProgress"
.end annotation


# static fields
.field public static final DEFAULT:Lcom/synconset/HttpRequest$UploadProgress;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 480
    new-instance v0, Lcom/synconset/HttpRequest$UploadProgress$1;

    invoke-direct {v0}, Lcom/synconset/HttpRequest$UploadProgress$1;-><init>()V

    sput-object v0, Lcom/synconset/HttpRequest$UploadProgress;->DEFAULT:Lcom/synconset/HttpRequest$UploadProgress;

    return-void
.end method


# virtual methods
.method public abstract onUpload(JJ)V
.end method
