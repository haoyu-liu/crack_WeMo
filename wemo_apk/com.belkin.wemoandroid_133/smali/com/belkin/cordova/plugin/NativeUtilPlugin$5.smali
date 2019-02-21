.class Lcom/belkin/cordova/plugin/NativeUtilPlugin$5;
.super Ljava/lang/Object;
.source "NativeUtilPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/NativeUtilPlugin;->showSpinner(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)V
    .locals 0

    .prologue
    .line 621
    iput-object p1, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$5;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v3, -0x2

    .line 623
    iget-object v2, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$5;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    invoke-virtual {v2}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->hideKeyBoard()V

    .line 625
    new-instance v1, Landroid/widget/ProgressBar;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$5;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->access$300(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    .line 626
    .local v1, "mSpinner":Landroid/widget/ProgressBar;
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 628
    new-instance v2, Landroid/app/Dialog;

    iget-object v3, p0, Lcom/belkin/cordova/plugin/NativeUtilPlugin$5;->this$0:Lcom/belkin/cordova/plugin/NativeUtilPlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/NativeUtilPlugin;->access$300(Lcom/belkin/cordova/plugin/NativeUtilPlugin;)Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    sput-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    .line 629
    const-string v2, "NativeUtilPlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mProgressDialog: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 630
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 631
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/view/Window;->clearFlags(I)V

    .line 632
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 633
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 634
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const v3, 0x106000d

    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 636
    :try_start_0
    sget-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 641
    :goto_0
    return-void

    .line 638
    :catch_0
    move-exception v0

    .line 639
    .local v0, "ex":Ljava/lang/Exception;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method
