.class Lcom/localytics/android/TestModeButton$TestModeDialog$1;
.super Ljava/lang/Object;
.source "TestModeButton.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/TestModeButton$TestModeDialog;->setupViews()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/TestModeButton$TestModeDialog;


# direct methods
.method constructor <init>(Lcom/localytics/android/TestModeButton$TestModeDialog;)V
    .locals 0

    .prologue
    .line 248
    iput-object p1, p0, Lcom/localytics/android/TestModeButton$TestModeDialog$1;->this$1:Lcom/localytics/android/TestModeButton$TestModeDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 251
    iget-object v1, p0, Lcom/localytics/android/TestModeButton$TestModeDialog$1;->this$1:Lcom/localytics/android/TestModeButton$TestModeDialog;

    invoke-static {v1}, Lcom/localytics/android/TestModeButton$TestModeDialog;->access$100(Lcom/localytics/android/TestModeButton$TestModeDialog;)Landroid/widget/RelativeLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/localytics/android/TestModeButton$TestModeDialog$1;->this$1:Lcom/localytics/android/TestModeButton$TestModeDialog;

    invoke-static {v2}, Lcom/localytics/android/TestModeButton$TestModeDialog;->access$000(Lcom/localytics/android/TestModeButton$TestModeDialog;)Landroid/view/animation/TranslateAnimation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 252
    iget-object v1, p0, Lcom/localytics/android/TestModeButton$TestModeDialog$1;->this$1:Lcom/localytics/android/TestModeButton$TestModeDialog;

    iget-object v1, v1, Lcom/localytics/android/TestModeButton$TestModeDialog;->this$0:Lcom/localytics/android/TestModeButton;

    invoke-static {v1}, Lcom/localytics/android/TestModeButton;->access$200(Lcom/localytics/android/TestModeButton;)Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 254
    iget-object v1, p0, Lcom/localytics/android/TestModeButton$TestModeDialog$1;->this$1:Lcom/localytics/android/TestModeButton$TestModeDialog;

    iget-object v1, v1, Lcom/localytics/android/TestModeButton$TestModeDialog;->this$0:Lcom/localytics/android/TestModeButton;

    invoke-static {v1}, Lcom/localytics/android/TestModeButton;->access$200(Lcom/localytics/android/TestModeButton;)Ljava/util/Map;

    move-result-object v1

    const/16 v2, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/localytics/android/MarketingCallable;

    .line 255
    .local v0, "callable":Lcom/localytics/android/MarketingCallable;
    if-eqz v0, :cond_0

    .line 257
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingCallable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    .end local v0    # "callable":Lcom/localytics/android/MarketingCallable;
    :cond_0
    return-void
.end method
