.class Lcom/localytics/android/TestModeListView$TestModeDialog$4;
.super Ljava/lang/Object;
.source "TestModeListView.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/TestModeListView$TestModeDialog;->createAnimations()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/TestModeListView$TestModeDialog;


# direct methods
.method constructor <init>(Lcom/localytics/android/TestModeListView$TestModeDialog;)V
    .locals 0

    .prologue
    .line 360
    iput-object p1, p0, Lcom/localytics/android/TestModeListView$TestModeDialog$4;->this$1:Lcom/localytics/android/TestModeListView$TestModeDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 367
    iget-object v0, p0, Lcom/localytics/android/TestModeListView$TestModeDialog$4;->this$1:Lcom/localytics/android/TestModeListView$TestModeDialog;

    iget-object v0, v0, Lcom/localytics/android/TestModeListView$TestModeDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v0}, Lcom/localytics/android/TestModeListView;->dismiss()V

    .line 368
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 372
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 363
    return-void
.end method
