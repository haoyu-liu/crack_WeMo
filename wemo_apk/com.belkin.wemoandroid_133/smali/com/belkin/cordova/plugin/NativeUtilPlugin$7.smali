.class Lcom/belkin/cordova/plugin/NativeUtilPlugin$7;
.super Ljava/lang/Object;
.source "NativeUtilPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/NativeUtilPlugin;->showProgressDialog(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/NativeUtilPlugin;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 700
    iput-object p1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$7;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$7;->val$title:Ljava/lang/String;

    iput-object p3, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$7;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 703
    new-instance v1, Landroid/app/Dialog;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$7;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->access$300(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    .line 704
    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$7;->val$title:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$7;->val$title:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 705
    :cond_0
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 709
    :goto_0
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    const v2, 0x7f030002

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setContentView(I)V

    .line 710
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    const v2, 0x7f090008

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$7;->val$message:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 712
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 714
    :try_start_0
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 720
    :goto_1
    return-void

    .line 707
    :cond_1
    sget-object v1, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$7;->val$title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 716
    :catch_0
    move-exception v0

    .line 717
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1
.end method
