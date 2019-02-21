.class public final Lcom/localytics/android/MarketingDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "MarketingDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;
    }
.end annotation


# static fields
.field private static final AMP_DESCRIPTION:Ljava/lang/String; = "amp_view"

.field private static final CLOSE_BUTTON_DESCRIPTION:Ljava/lang/String; = "close_button"

.field private static final CLOSE_BUTTON_ID:I = 0x1

.field static final DIALOG_TAG:Ljava/lang/String; = "marketing_dialog"

.field private static final OPENING_EXTERNAL:I = 0x2

.field private static final OPENING_INTERNAL:I = 0x1

.field private static final PROTOCOL_UNMATCHED:I = -0x1

.field private static final PROTOCOL_UNRECOGNIZED:I = -0x2

.field private static final WEB_VIEW_ID:I = 0x2

.field private static dismissButtonLocation:Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

.field private static sDismissButtonImage:Landroid/graphics/Bitmap;


# instance fields
.field private mCallbacks:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/localytics/android/MarketingCallable;",
            ">;"
        }
    .end annotation
.end field

.field private final mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mExitAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mJavaScriptClient:Lcom/localytics/android/JavaScriptClient;

.field private mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

.field private mMarketingMessage:Lcom/localytics/android/MarketingMessage;

.field private final mUploadedViewEvent:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 100
    const/4 v0, 0x0

    sput-object v0, Lcom/localytics/android/MarketingDialogFragment;->sDismissButtonImage:Landroid/graphics/Bitmap;

    .line 101
    sget-object v0, Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;->LEFT:Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    sput-object v0, Lcom/localytics/android/MarketingDialogFragment;->dismissButtonLocation:Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 130
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 131
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 132
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mExitAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 133
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mUploadedViewEvent:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 134
    return-void
.end method

.method static synthetic access$000(Lcom/localytics/android/MarketingDialogFragment;)Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingDialogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/localytics/android/MarketingDialogFragment;)Lcom/localytics/android/JavaScriptClient;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingDialogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mJavaScriptClient:Lcom/localytics/android/JavaScriptClient;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/localytics/android/MarketingDialogFragment;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingDialogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$1600()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/localytics/android/MarketingDialogFragment;->sDismissButtonImage:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$200(Lcom/localytics/android/MarketingDialogFragment;)Lcom/localytics/android/MarketingMessage;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingDialogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingMessage:Lcom/localytics/android/MarketingMessage;

    return-object v0
.end method

.method static synthetic access$300(Lcom/localytics/android/MarketingDialogFragment;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingDialogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mExitAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$400()Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/localytics/android/MarketingDialogFragment;->dismissButtonLocation:Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    return-object v0
.end method

.method static synthetic access$500(Lcom/localytics/android/MarketingDialogFragment;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingDialogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mCallbacks:Landroid/util/SparseArray;

    return-object v0
.end method

.method static getInAppDismissButtonLocation()Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;
    .locals 1

    .prologue
    .line 157
    sget-object v0, Lcom/localytics/android/MarketingDialogFragment;->dismissButtonLocation:Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    return-object v0
.end method

.method private getValueByQueryKey(Ljava/lang/String;Ljava/net/URI;)Ljava/lang/String;
    .locals 11
    .param p1, "queryKey"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/net/URI;

    .prologue
    const/4 v8, 0x0

    .line 558
    invoke-virtual {p2}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v7

    .line 560
    .local v7, "query":Ljava/lang/String;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 585
    :cond_0
    :goto_0
    return-object v8

    .line 565
    :cond_1
    invoke-virtual {p2}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v9

    const-string v10, "[&]"

    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 566
    .local v6, "pairs":[Ljava/lang/String;
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_0

    aget-object v5, v0, v3

    .line 568
    .local v5, "pair":Ljava/lang/String;
    const-string v9, "[=]"

    invoke-virtual {v5, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 569
    .local v1, "components":[Ljava/lang/String;
    const/4 v9, 0x0

    aget-object v9, v1, v9

    invoke-virtual {v9, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_2

    .line 571
    const/4 v9, 0x2

    array-length v10, v1

    if-ne v9, v10, :cond_2

    .line 575
    const/4 v9, 0x1

    :try_start_0
    aget-object v9, v1, v9

    const-string v10, "UTF-8"

    invoke-static {v9, v10}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    goto :goto_0

    .line 577
    :catch_0
    move-exception v2

    .line 579
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    goto :goto_0

    .line 566
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method private getValueByQueryKey(Ljava/lang/String;Ljava/net/URL;)Ljava/lang/String;
    .locals 2
    .param p1, "queryKey"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/net/URL;

    .prologue
    .line 592
    :try_start_0
    invoke-virtual {p2}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/localytics/android/MarketingDialogFragment;->getValueByQueryKey(Ljava/lang/String;Ljava/net/URI;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 596
    :goto_0
    return-object v1

    .line 594
    :catch_0
    move-exception v0

    .line 596
    .local v0, "e":Ljava/net/URISyntaxException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private handleCustomProtocolRequest(Ljava/lang/String;Landroid/app/Activity;)I
    .locals 4
    .param p1, "urlString"    # Ljava/lang/String;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 543
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 544
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v2}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 545
    .local v0, "activities":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 547
    const-string v2, "[In-app Nav Handler]: An app on this device is registered to handle this protocol scheme. Opening..."

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 548
    const/high16 v2, 0x20000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 549
    invoke-virtual {p2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 550
    const/4 v2, 0x2

    .line 553
    :goto_0
    return v2

    :cond_0
    const/4 v2, -0x2

    goto :goto_0
.end method

.method private handleCustomProtocolRequest(Ljava/net/URL;Landroid/app/Activity;)I
    .locals 1
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 538
    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/localytics/android/MarketingDialogFragment;->handleCustomProtocolRequest(Ljava/lang/String;Landroid/app/Activity;)I

    move-result v0

    return v0
.end method

.method private handleFileProtocolRequest(Ljava/net/URL;)I
    .locals 2
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 495
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 497
    const/4 v0, -0x1

    .line 502
    :goto_0
    return v0

    .line 500
    :cond_0
    const-string v0, "[In-app Nav Handler]: Displaying content from your local creatives."

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 502
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private handleHttpProtocolRequest(Ljava/net/URL;Landroid/app/Activity;)I
    .locals 9
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v4, 0x1

    const/4 v8, 0x0

    .line 507
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    .line 508
    .local v3, "protocol":Ljava/lang/String;
    const-string v5, "http"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "https"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 510
    const/4 v4, -0x1

    .line 533
    :goto_0
    return v4

    .line 513
    :cond_0
    const-string v5, "[In-app Nav Handler]: Handling a request for an external HTTP address."

    invoke-static {v5}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 516
    const-string v5, "ampExternalOpen"

    invoke-direct {p0, v5, p1}, Lcom/localytics/android/MarketingDialogFragment;->getValueByQueryKey(Ljava/lang/String;Ljava/net/URL;)Ljava/lang/String;

    move-result-object v2

    .line 517
    .local v2, "openExternalValue":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "true"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 519
    const-string v5, "[In-app Nav Handler]: Query string hook [%s] set to true. Opening the URL in chrome"

    new-array v6, v4, [Ljava/lang/Object;

    const-string v7, "ampExternalOpen"

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 521
    new-instance v1, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v1, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 522
    .local v1, "intent":Landroid/content/Intent;
    iget-object v5, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v5}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {v5, v1, v8}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 523
    .local v0, "activities":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 525
    invoke-virtual {p2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 526
    const/4 v4, 0x2

    goto :goto_0

    .line 531
    .end local v0    # "activities":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_1
    const-string v5, "[In-app Nav Handler]: Loading HTTP request inside the current in-app view"

    invoke-static {v5}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    goto :goto_0
.end method

.method static newInstance()Lcom/localytics/android/MarketingDialogFragment;
    .locals 2

    .prologue
    .line 141
    new-instance v0, Lcom/localytics/android/MarketingDialogFragment;

    invoke-direct {v0}, Lcom/localytics/android/MarketingDialogFragment;-><init>()V

    .line 142
    .local v0, "fragment":Lcom/localytics/android/MarketingDialogFragment;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingDialogFragment;->setRetainInstance(Z)V

    .line 143
    return-object v0
.end method

.method static setDismissButtonImage(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p0, "image"    # Landroid/graphics/Bitmap;

    .prologue
    .line 148
    sget-object v0, Lcom/localytics/android/MarketingDialogFragment;->sDismissButtonImage:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 150
    sget-object v0, Lcom/localytics/android/MarketingDialogFragment;->sDismissButtonImage:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 152
    :cond_0
    sput-object p0, Lcom/localytics/android/MarketingDialogFragment;->sDismissButtonImage:Landroid/graphics/Bitmap;

    .line 153
    return-void
.end method

.method static setInAppDismissButtonLocation(Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;)V
    .locals 0
    .param p0, "buttonLocation"    # Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    .prologue
    .line 162
    sput-object p0, Lcom/localytics/android/MarketingDialogFragment;->dismissButtonLocation:Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    .line 163
    return-void
.end method

.method private tagMarketingActionEventWithAction(Ljava/lang/String;)V
    .locals 13
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 264
    invoke-static {}, Lcom/localytics/android/Constants;->isTestModeEnabled()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 313
    :cond_0
    :goto_0
    return-void

    .line 269
    :cond_1
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment;->mUploadedViewEvent:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v7, v10}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 271
    const-string v7, "The in-app action for this message has already been set. Ignoring in-app Action: [%s]"

    new-array v8, v10, [Ljava/lang/Object;

    aput-object p1, v8, v11

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    goto :goto_0

    .line 276
    :cond_2
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 277
    .local v1, "attributes":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, "ampAction"

    invoke-virtual {v1, v7, p1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    const-string v7, "type"

    const-string v8, "In-App"

    invoke-virtual {v1, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    const-string v7, "ampCampaignId"

    iget-object v8, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingMessage:Lcom/localytics/android/MarketingMessage;

    const-string v9, "campaign_id"

    invoke-virtual {v8, v9}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    const-string v7, "ampCampaign"

    iget-object v8, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingMessage:Lcom/localytics/android/MarketingMessage;

    const-string v9, "rule_name_non_unique"

    invoke-virtual {v8, v9}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    const-string v7, "Schema Version - Client"

    const/4 v8, 0x3

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingMessage:Lcom/localytics/android/MarketingMessage;

    const-string v8, "schema_version"

    invoke-virtual {v7, v8}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 283
    .local v6, "schemaVersion":Ljava/lang/Object;
    if-eqz v6, :cond_3

    .line 285
    const-string v7, "Schema Version - Server"

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v7, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    :cond_3
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingMessage:Lcom/localytics/android/MarketingMessage;

    const-string v8, "ab_test"

    invoke-virtual {v7, v8}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 289
    .local v0, "ab":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 291
    const-string v7, "ampAB"

    invoke-virtual {v1, v7, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    :cond_4
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment;->mCallbacks:Landroid/util/SparseArray;

    if-eqz v7, :cond_0

    .line 297
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment;->mCallbacks:Landroid/util/SparseArray;

    invoke-virtual {v7, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/localytics/android/MarketingCallable;

    .line 298
    .local v3, "callable":Lcom/localytics/android/MarketingCallable;
    if-eqz v3, :cond_5

    .line 300
    new-array v7, v12, [Ljava/lang/Object;

    const-string v8, "ampView"

    aput-object v8, v7, v11

    aput-object v1, v7, v10

    invoke-virtual {v3, v7}, Lcom/localytics/android/MarketingCallable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    :cond_5
    sget-boolean v7, Lcom/localytics/android/Constants;->IS_LOGGING_ENABLED:Z

    if-eqz v7, :cond_0

    .line 305
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 306
    .local v2, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 308
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, "Key = "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", Value = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 310
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_6
    const-string v7, "In-app event tagged successfully.\n   Attributes Dictionary = \n%s"

    new-array v8, v10, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method private tagMarketingActionForURL(Ljava/net/URI;)V
    .locals 5
    .param p1, "url"    # Ljava/net/URI;

    .prologue
    .line 475
    const-string v2, "ampAction"

    invoke-direct {p0, v2, p1}, Lcom/localytics/android/MarketingDialogFragment;->getValueByQueryKey(Ljava/lang/String;Ljava/net/URI;)Ljava/lang/String;

    move-result-object v0

    .line 476
    .local v0, "marketingActionValue":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 478
    const-string v2, "Attempting to tag event with custom in-app action. [Action: %s]"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 479
    invoke-direct {p0, v0}, Lcom/localytics/android/MarketingDialogFragment;->tagMarketingActionEventWithAction(Ljava/lang/String;)V

    .line 491
    :cond_0
    :goto_0
    return-void

    .line 485
    :cond_1
    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 486
    .local v1, "protocol":Ljava/lang/String;
    const-string v2, "file"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "http"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "https"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 488
    const-string v2, "click"

    invoke-direct {p0, v2}, Lcom/localytics/android/MarketingDialogFragment;->tagMarketingActionEventWithAction(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method dismissCampaign()V
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    if-eqz v0, :cond_1

    .line 169
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingMessage:Lcom/localytics/android/MarketingMessage;

    if-eqz v0, :cond_0

    .line 171
    const-string v0, "X"

    invoke-direct {p0, v0}, Lcom/localytics/android/MarketingDialogFragment;->tagMarketingActionEventWithAction(Ljava/lang/String;)V

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v0}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->dismiss()V

    .line 175
    :cond_1
    return-void
.end method

.method handleUrl(Ljava/lang/String;Landroid/app/Activity;)Z
    .locals 11
    .param p1, "urlString"    # Ljava/lang/String;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v10, 0x2

    .line 407
    move-object v3, p1

    .line 409
    .local v3, "url":Ljava/lang/String;
    const-string v6, "[In-app Nav Handler]: Evaluating in-app URL:\n\tURL:%s"

    new-array v7, v4, [Ljava/lang/Object;

    aput-object v3, v7, v5

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 411
    const/4 v2, 0x0

    .line 414
    .local v2, "result":I
    :try_start_0
    const-string v6, "://"

    invoke-virtual {v3, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 416
    const/4 v6, 0x0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 420
    :cond_0
    new-instance v6, Ljava/net/URI;

    invoke-direct {v6, v3}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v6}, Lcom/localytics/android/MarketingDialogFragment;->tagMarketingActionForURL(Ljava/net/URI;)V

    .line 426
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 429
    .local v0, "aURL":Ljava/net/URL;
    invoke-direct {p0, v0}, Lcom/localytics/android/MarketingDialogFragment;->handleFileProtocolRequest(Ljava/net/URL;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-lez v2, :cond_3

    .line 431
    if-ne v2, v10, :cond_2

    .line 462
    :goto_0
    if-ne v2, v10, :cond_1

    .line 464
    iget-object v5, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v5}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->dismissWithAnimation()V

    .line 469
    .end local v0    # "aURL":Ljava/net/URL;
    :cond_1
    :goto_1
    return v4

    .restart local v0    # "aURL":Ljava/net/URL;
    :cond_2
    move v4, v5

    .line 431
    goto :goto_0

    .line 435
    :cond_3
    :try_start_1
    invoke-direct {p0, v0, p2}, Lcom/localytics/android/MarketingDialogFragment;->handleHttpProtocolRequest(Ljava/net/URL;Landroid/app/Activity;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    if-lez v2, :cond_5

    .line 437
    if-ne v2, v10, :cond_4

    .line 462
    :goto_2
    if-ne v2, v10, :cond_1

    .line 464
    iget-object v5, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v5}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->dismissWithAnimation()V

    goto :goto_1

    :cond_4
    move v4, v5

    .line 437
    goto :goto_2

    .line 441
    :cond_5
    :try_start_2
    invoke-direct {p0, v0, p2}, Lcom/localytics/android/MarketingDialogFragment;->handleCustomProtocolRequest(Ljava/net/URL;Landroid/app/Activity;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v2

    if-lez v2, :cond_7

    .line 443
    if-ne v2, v10, :cond_6

    .line 462
    :goto_3
    if-ne v2, v10, :cond_1

    .line 464
    iget-object v5, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v5}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->dismissWithAnimation()V

    goto :goto_1

    :cond_6
    move v4, v5

    .line 443
    goto :goto_3

    .line 446
    :cond_7
    :try_start_3
    const-string v6, "[In-app Nav Handler]: Protocol handler scheme not recognized. Attempting to load the URL... [Scheme: %s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 462
    if-ne v2, v10, :cond_8

    .line 464
    iget-object v4, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v4}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->dismissWithAnimation()V

    .end local v0    # "aURL":Ljava/net/URL;
    :cond_8
    :goto_4
    move v4, v5

    .line 469
    goto :goto_1

    .line 448
    :catch_0
    move-exception v1

    .line 451
    .local v1, "e":Ljava/lang/Exception;
    :try_start_4
    invoke-direct {p0, v3, p2}, Lcom/localytics/android/MarketingDialogFragment;->handleCustomProtocolRequest(Ljava/lang/String;Landroid/app/Activity;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result v2

    if-lez v2, :cond_a

    .line 453
    if-ne v2, v10, :cond_9

    .line 462
    :goto_5
    if-ne v2, v10, :cond_1

    .line 464
    iget-object v5, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v5}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->dismissWithAnimation()V

    goto :goto_1

    :cond_9
    move v4, v5

    .line 453
    goto :goto_5

    .line 456
    :cond_a
    :try_start_5
    const-string v4, "[In-app Nav Handler]: Invalid url %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 457
    iget-object v4, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v4}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->dismissWithAnimation()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 462
    if-ne v2, v10, :cond_8

    .line 464
    iget-object v4, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v4}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->dismissWithAnimation()V

    goto :goto_4

    .line 462
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    if-ne v2, v10, :cond_b

    .line 464
    iget-object v5, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v5}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->dismissWithAnimation()V

    :cond_b
    throw v4
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 226
    const-string v0, "[InAppDialogFragment]: onActivityCreated"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 227
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 228
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 180
    const-string v0, "[InAppDialogFragment]: onAttach"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 181
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 182
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 194
    const-string v0, "[InAppDialogFragment]: onCreate"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 195
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 196
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 201
    const-string v0, "[InAppDialogFragment]: onCreateDialog"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 202
    new-instance v0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {p0}, Lcom/localytics/android/MarketingDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x103000b

    invoke-direct {v0, p0, v1, v2}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;-><init>(Lcom/localytics/android/MarketingDialogFragment;Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingDialog:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 318
    const-string v0, "[InAppDialogFragment]: onCreateView"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 319
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/DialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 346
    const-string v1, "[InAppDialogFragment]: onDestroy"

    invoke-static {v1}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 347
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment;->mCallbacks:Landroid/util/SparseArray;

    if-eqz v1, :cond_0

    .line 349
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment;->mCallbacks:Landroid/util/SparseArray;

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/localytics/android/MarketingCallable;

    .line 350
    .local v0, "callable":Lcom/localytics/android/MarketingCallable;
    invoke-static {}, Lcom/localytics/android/Constants;->isTestModeEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    .line 352
    new-array v1, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingMessage:Lcom/localytics/android/MarketingMessage;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingCallable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    .end local v0    # "callable":Lcom/localytics/android/MarketingCallable;
    :cond_0
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroy()V

    .line 356
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    .line 254
    const-string v0, "[InAppDialogFragment]: onDestroyView"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 255
    invoke-virtual {p0}, Lcom/localytics/android/MarketingDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/localytics/android/MarketingDialogFragment;->getRetainInstance()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 257
    invoke-virtual {p0}, Lcom/localytics/android/MarketingDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 259
    :cond_0
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroyView()V

    .line 260
    return-void
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 187
    const-string v0, "[InAppDialogFragment]: onDetach"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 188
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDetach()V

    .line 189
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 208
    const-string v1, "[InAppDialogFragment]: onDismiss"

    invoke-static {v1}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 211
    :try_start_0
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingMessage:Lcom/localytics/android/MarketingMessage;

    if-eqz v1, :cond_0

    .line 213
    const-string v1, "X"

    invoke-direct {p0, v1}, Lcom/localytics/android/MarketingDialogFragment;->tagMarketingActionEventWithAction(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 221
    return-void

    .line 216
    :catch_0
    move-exception v0

    .line 218
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "MarketingDialogFragment onDismiss"

    invoke-static {v1, v0}, Lcom/localytics/android/Localytics$Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 339
    const-string v0, "[InAppDialogFragment]: onPause"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 340
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onPause()V

    .line 341
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 332
    const-string v0, "[InAppDialogFragment]: onResume"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 333
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onResume()V

    .line 334
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 240
    const-string v0, "[InAppDialogFragment]: onSaveInstanceState"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 241
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 242
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 233
    const-string v0, "[InAppDialogFragment]: onStart"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 234
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onStart()V

    .line 235
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 247
    const-string v0, "[InAppDialogFragment]: onStop"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 248
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onStop()V

    .line 249
    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 325
    const-string v0, "[InAppDialogFragment]: onViewStateRestored"

    invoke-static {v0}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 326
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onViewStateRestored(Landroid/os/Bundle;)V

    .line 327
    return-void
.end method

.method public setCallbacks(Landroid/util/SparseArray;)Lcom/localytics/android/MarketingDialogFragment;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/localytics/android/MarketingCallable;",
            ">;)",
            "Lcom/localytics/android/MarketingDialogFragment;"
        }
    .end annotation

    .prologue
    .line 602
    .local p1, "callbacks":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/localytics/android/MarketingCallable;>;"
    iput-object p1, p0, Lcom/localytics/android/MarketingDialogFragment;->mCallbacks:Landroid/util/SparseArray;

    .line 603
    return-object p0
.end method

.method setData(Lcom/localytics/android/MarketingMessage;)Lcom/localytics/android/MarketingDialogFragment;
    .locals 0
    .param p1, "marketingMessage"    # Lcom/localytics/android/MarketingMessage;

    .prologue
    .line 360
    iput-object p1, p0, Lcom/localytics/android/MarketingDialogFragment;->mMarketingMessage:Lcom/localytics/android/MarketingMessage;

    .line 361
    return-object p0
.end method

.method setJavaScriptClient(Lcom/localytics/android/JavaScriptClient;)Lcom/localytics/android/MarketingDialogFragment;
    .locals 3
    .param p1, "javaScriptClient"    # Lcom/localytics/android/JavaScriptClient;

    .prologue
    .line 366
    iput-object p1, p0, Lcom/localytics/android/MarketingDialogFragment;->mJavaScriptClient:Lcom/localytics/android/JavaScriptClient;

    .line 367
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment;->mJavaScriptClient:Lcom/localytics/android/JavaScriptClient;

    invoke-virtual {v1}, Lcom/localytics/android/JavaScriptClient;->getCallbacks()Landroid/util/SparseArray;

    move-result-object v0

    .line 369
    .local v0, "callbacks":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/localytics/android/MarketingCallable;>;"
    const/16 v1, 0xf

    new-instance v2, Lcom/localytics/android/MarketingDialogFragment$1;

    invoke-direct {v2, p0}, Lcom/localytics/android/MarketingDialogFragment$1;-><init>(Lcom/localytics/android/MarketingDialogFragment;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 391
    const/4 v1, 0x4

    new-instance v2, Lcom/localytics/android/MarketingDialogFragment$2;

    invoke-direct {v2, p0}, Lcom/localytics/android/MarketingDialogFragment$2;-><init>(Lcom/localytics/android/MarketingDialogFragment;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 402
    return-object p0
.end method
