.class final Lcom/localytics/android/ProfileHandler$ProfileListenersSet;
.super Lcom/localytics/android/BaseHandler$ListenersSet;
.source "ProfileHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/ProfileHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ProfileListenersSet"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/ProfileHandler;


# direct methods
.method private constructor <init>(Lcom/localytics/android/ProfileHandler;)V
    .locals 0

    .prologue
    .line 367
    iput-object p1, p0, Lcom/localytics/android/ProfileHandler$ProfileListenersSet;->this$0:Lcom/localytics/android/ProfileHandler;

    invoke-direct {p0, p1}, Lcom/localytics/android/BaseHandler$ListenersSet;-><init>(Lcom/localytics/android/BaseHandler;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/localytics/android/ProfileHandler;Lcom/localytics/android/ProfileHandler$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/localytics/android/ProfileHandler;
    .param p2, "x1"    # Lcom/localytics/android/ProfileHandler$1;

    .prologue
    .line 367
    invoke-direct {p0, p1}, Lcom/localytics/android/ProfileHandler$ProfileListenersSet;-><init>(Lcom/localytics/android/ProfileHandler;)V

    return-void
.end method
