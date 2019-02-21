.class final Lcom/localytics/android/LocalyticsManager$HandlerWrapper;
.super Ljava/lang/Object;
.source "LocalyticsManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/LocalyticsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "HandlerWrapper"
.end annotation


# instance fields
.field analyticsHandler:Lcom/localytics/android/AnalyticsHandler;

.field marketingHandler:Lcom/localytics/android/MarketingHandler;

.field profileHandler:Lcom/localytics/android/ProfileHandler;

.field final synthetic this$0:Lcom/localytics/android/LocalyticsManager;


# direct methods
.method private constructor <init>(Lcom/localytics/android/LocalyticsManager;Lcom/localytics/android/AnalyticsHandler;Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/ProfileHandler;)V
    .locals 0
    .param p2, "analyticsHandler"    # Lcom/localytics/android/AnalyticsHandler;
    .param p3, "marketingHandler"    # Lcom/localytics/android/MarketingHandler;
    .param p4, "profileHandler"    # Lcom/localytics/android/ProfileHandler;

    .prologue
    .line 966
    iput-object p1, p0, Lcom/localytics/android/LocalyticsManager$HandlerWrapper;->this$0:Lcom/localytics/android/LocalyticsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 967
    iput-object p2, p0, Lcom/localytics/android/LocalyticsManager$HandlerWrapper;->analyticsHandler:Lcom/localytics/android/AnalyticsHandler;

    .line 968
    iput-object p3, p0, Lcom/localytics/android/LocalyticsManager$HandlerWrapper;->marketingHandler:Lcom/localytics/android/MarketingHandler;

    .line 969
    iput-object p4, p0, Lcom/localytics/android/LocalyticsManager$HandlerWrapper;->profileHandler:Lcom/localytics/android/ProfileHandler;

    .line 970
    return-void
.end method

.method synthetic constructor <init>(Lcom/localytics/android/LocalyticsManager;Lcom/localytics/android/AnalyticsHandler;Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/ProfileHandler;Lcom/localytics/android/LocalyticsManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/localytics/android/LocalyticsManager;
    .param p2, "x1"    # Lcom/localytics/android/AnalyticsHandler;
    .param p3, "x2"    # Lcom/localytics/android/MarketingHandler;
    .param p4, "x3"    # Lcom/localytics/android/ProfileHandler;
    .param p5, "x4"    # Lcom/localytics/android/LocalyticsManager$1;

    .prologue
    .line 957
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/localytics/android/LocalyticsManager$HandlerWrapper;-><init>(Lcom/localytics/android/LocalyticsManager;Lcom/localytics/android/AnalyticsHandler;Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/ProfileHandler;)V

    return-void
.end method
