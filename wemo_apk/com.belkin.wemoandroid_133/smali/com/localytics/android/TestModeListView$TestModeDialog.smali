.class final Lcom/localytics/android/TestModeListView$TestModeDialog;
.super Landroid/app/Dialog;
.source "TestModeListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/TestModeListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "TestModeDialog"
.end annotation


# instance fields
.field private mAnimIn:Landroid/view/animation/TranslateAnimation;

.field private mAnimOut:Landroid/view/animation/TranslateAnimation;

.field private mDialogLayout:Landroid/widget/RelativeLayout;

.field private mMetrics:Landroid/util/DisplayMetrics;

.field final synthetic this$0:Lcom/localytics/android/TestModeListView;


# direct methods
.method public constructor <init>(Lcom/localytics/android/TestModeListView;Landroid/content/Context;I)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "theme"    # I

    .prologue
    .line 234
    iput-object p1, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->this$0:Lcom/localytics/android/TestModeListView;

    .line 235
    invoke-direct {p0, p2, p3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 237
    invoke-direct {p0}, Lcom/localytics/android/TestModeListView$TestModeDialog;->setupViews()V

    .line 238
    invoke-direct {p0}, Lcom/localytics/android/TestModeListView$TestModeDialog;->createAnimations()V

    .line 239
    invoke-direct {p0}, Lcom/localytics/android/TestModeListView$TestModeDialog;->adjustLayout()V

    .line 240
    return-void
.end method

.method static synthetic access$000(Lcom/localytics/android/TestModeListView$TestModeDialog;)Landroid/view/animation/TranslateAnimation;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/TestModeListView$TestModeDialog;

    .prologue
    .line 209
    iget-object v0, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mAnimOut:Landroid/view/animation/TranslateAnimation;

    return-object v0
.end method

.method static synthetic access$100(Lcom/localytics/android/TestModeListView$TestModeDialog;)Landroid/widget/RelativeLayout;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/TestModeListView$TestModeDialog;

    .prologue
    .line 209
    iget-object v0, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method private adjustLayout()V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/16 v6, 0x400

    const/4 v5, 0x0

    .line 380
    new-instance v3, Landroid/util/DisplayMetrics;

    invoke-direct {v3}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v3, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mMetrics:Landroid/util/DisplayMetrics;

    .line 381
    iget-object v3, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v3}, Lcom/localytics/android/TestModeListView;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const-string v4, "window"

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    .line 382
    .local v2, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    iget-object v4, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mMetrics:Landroid/util/DisplayMetrics;

    invoke-virtual {v3, v4}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 387
    invoke-virtual {p0}, Lcom/localytics/android/TestModeListView$TestModeDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    .line 388
    .local v1, "window":Landroid/view/Window;
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v3, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 389
    const/16 v3, 0x11

    invoke-virtual {v1, v3}, Landroid/view/Window;->setGravity(I)V

    .line 390
    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 391
    .local v0, "params":Landroid/view/WindowManager$LayoutParams;
    const/4 v3, 0x0

    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 392
    iget-object v3, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mMetrics:Landroid/util/DisplayMetrics;

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 393
    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 395
    iget-object v3, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-static {v3}, Lcom/localytics/android/TestModeListView;->access$400(Lcom/localytics/android/TestModeListView;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 397
    iget-object v3, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mAnimIn:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 401
    :cond_0
    invoke-virtual {v1, v6, v6}, Landroid/view/Window;->setFlags(II)V

    .line 402
    return-void
.end method

.method private createAnimations()V
    .locals 9

    .prologue
    .line 355
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mAnimIn:Landroid/view/animation/TranslateAnimation;

    .line 356
    iget-object v0, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mAnimIn:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 357
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    iput-object v0, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mAnimOut:Landroid/view/animation/TranslateAnimation;

    .line 358
    iget-object v0, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mAnimOut:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 359
    iget-object v0, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mAnimOut:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Lcom/localytics/android/TestModeListView$TestModeDialog$4;

    invoke-direct {v1, p0}, Lcom/localytics/android/TestModeListView$TestModeDialog$4;-><init>(Lcom/localytics/android/TestModeListView$TestModeDialog;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 374
    return-void
.end method

.method private setupViews()V
    .locals 21

    .prologue
    .line 244
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/localytics/android/TestModeListView$TestModeDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-virtual {v13}, Lcom/localytics/android/TestModeListView;->getResources()Landroid/content/res/Resources;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v13

    iget v4, v13, Landroid/util/DisplayMetrics;->density:F

    .line 247
    .local v4, "dip":F
    new-instance v13, Landroid/widget/RelativeLayout;

    invoke-virtual/range {p0 .. p0}, Lcom/localytics/android/TestModeListView$TestModeDialog;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-direct {v13, v14}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v13, v0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    .line 248
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    new-instance v14, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v15, -0x1

    const/16 v16, -0x1

    invoke-direct/range {v14 .. v16}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v13, v14}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 249
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    const/4 v14, -0x1

    invoke-virtual {v13, v14}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 252
    new-instance v11, Landroid/widget/RelativeLayout;

    invoke-virtual/range {p0 .. p0}, Lcom/localytics/android/TestModeListView$TestModeDialog;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v11, v13}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 253
    .local v11, "topLayout":Landroid/widget/RelativeLayout;
    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v13, -0x1

    const/4 v14, -0x2

    invoke-direct {v12, v13, v14}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 254
    .local v12, "topParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v13, 0xa

    invoke-virtual {v12, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 255
    const/4 v13, 0x1

    invoke-virtual {v11, v13}, Landroid/widget/RelativeLayout;->setId(I)V

    .line 256
    invoke-virtual {v11, v12}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 257
    const/16 v13, 0xff

    const/16 v14, 0x49

    const/16 v15, 0x49

    const/16 v16, 0x49

    invoke-static/range {v13 .. v16}, Landroid/graphics/Color;->argb(IIII)I

    move-result v13

    invoke-virtual {v11, v13}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 258
    const/high16 v13, 0x41000000    # 8.0f

    mul-float/2addr v13, v4

    const/high16 v14, 0x3f000000    # 0.5f

    add-float/2addr v13, v14

    float-to-int v13, v13

    const/high16 v14, 0x41400000    # 12.0f

    mul-float/2addr v14, v4

    const/high16 v15, 0x3f000000    # 0.5f

    add-float/2addr v14, v15

    float-to-int v14, v14

    const/high16 v15, 0x41000000    # 8.0f

    mul-float/2addr v15, v4

    const/high16 v16, 0x3f000000    # 0.5f

    add-float v15, v15, v16

    float-to-int v15, v15

    const/high16 v16, 0x41400000    # 12.0f

    mul-float v16, v16, v4

    const/high16 v17, 0x3f000000    # 0.5f

    add-float v16, v16, v17

    move/from16 v0, v16

    float-to-int v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-virtual {v11, v13, v14, v15, v0}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 259
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v13, v11}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 262
    new-instance v3, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/localytics/android/TestModeListView$TestModeDialog;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v3, v13}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 263
    .local v3, "close":Landroid/widget/TextView;
    const-string v13, "Close"

    invoke-virtual {v3, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 264
    const/high16 v13, 0x41b00000    # 22.0f

    invoke-virtual {v3, v13}, Landroid/widget/TextView;->setTextSize(F)V

    .line 265
    new-instance v13, Landroid/content/res/ColorStateList;

    const/4 v14, 0x3

    new-array v14, v14, [[I

    const/4 v15, 0x0

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [I

    move-object/from16 v16, v0

    const/16 v17, 0x0

    const v18, 0x10100a7

    aput v18, v16, v17

    aput-object v16, v14, v15

    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [I

    move-object/from16 v16, v0

    const/16 v17, 0x0

    const v18, 0x101009c

    aput v18, v16, v17

    aput-object v16, v14, v15

    const/4 v15, 0x2

    const/16 v16, 0x0

    move/from16 v0, v16

    new-array v0, v0, [I

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    const/4 v15, 0x3

    new-array v15, v15, [I

    const/16 v16, 0x0

    const/16 v17, 0xff

    const/16 v18, 0xff

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v17 .. v20}, Landroid/graphics/Color;->argb(IIII)I

    move-result v17

    aput v17, v15, v16

    const/16 v16, 0x1

    const/16 v17, 0xff

    const/16 v18, 0x0

    const/16 v19, 0x5b

    const/16 v20, 0xff

    invoke-static/range {v17 .. v20}, Landroid/graphics/Color;->argb(IIII)I

    move-result v17

    aput v17, v15, v16

    const/16 v16, 0x2

    const/16 v17, 0xff

    const/16 v18, 0x0

    const/16 v19, 0x5b

    const/16 v20, 0xff

    invoke-static/range {v17 .. v20}, Landroid/graphics/Color;->argb(IIII)I

    move-result v17

    aput v17, v15, v16

    invoke-direct {v13, v14, v15}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v3, v13}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 266
    new-instance v13, Lcom/localytics/android/TestModeListView$TestModeDialog$1;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lcom/localytics/android/TestModeListView$TestModeDialog$1;-><init>(Lcom/localytics/android/TestModeListView$TestModeDialog;)V

    invoke-virtual {v3, v13}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 282
    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v13, -0x2

    const/4 v14, -0x2

    invoke-direct {v7, v13, v14}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 283
    .local v7, "paramsClose":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v13, 0x9

    invoke-virtual {v7, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 284
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 285
    invoke-virtual {v11, v3}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 288
    new-instance v10, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/localytics/android/TestModeListView$TestModeDialog;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v10, v13}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 289
    .local v10, "title":Landroid/widget/TextView;
    const-string v13, "Localytics"

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 290
    const/high16 v13, 0x41b00000    # 22.0f

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setTextSize(F)V

    .line 291
    const/4 v13, -0x1

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setTextColor(I)V

    .line 292
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v13, -0x2

    const/4 v14, -0x2

    invoke-direct {v9, v13, v14}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 293
    .local v9, "paramsTitle":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v13, 0xd

    invoke-virtual {v9, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 294
    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 295
    invoke-virtual {v11, v10}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 298
    new-instance v6, Landroid/widget/TextView;

    invoke-virtual/range {p0 .. p0}, Lcom/localytics/android/TestModeListView$TestModeDialog;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v6, v13}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 299
    .local v6, "menu":Landroid/widget/TextView;
    const-string v13, "Menu"

    invoke-virtual {v6, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 300
    const/high16 v13, 0x41b00000    # 22.0f

    invoke-virtual {v6, v13}, Landroid/widget/TextView;->setTextSize(F)V

    .line 301
    new-instance v13, Landroid/content/res/ColorStateList;

    const/4 v14, 0x3

    new-array v14, v14, [[I

    const/4 v15, 0x0

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [I

    move-object/from16 v16, v0

    const/16 v17, 0x0

    const v18, 0x10100a7

    aput v18, v16, v17

    aput-object v16, v14, v15

    const/4 v15, 0x1

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [I

    move-object/from16 v16, v0

    const/16 v17, 0x0

    const v18, 0x101009c

    aput v18, v16, v17

    aput-object v16, v14, v15

    const/4 v15, 0x2

    const/16 v16, 0x0

    move/from16 v0, v16

    new-array v0, v0, [I

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    const/4 v15, 0x3

    new-array v15, v15, [I

    const/16 v16, 0x0

    const/16 v17, 0xff

    const/16 v18, 0xff

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v17 .. v20}, Landroid/graphics/Color;->argb(IIII)I

    move-result v17

    aput v17, v15, v16

    const/16 v16, 0x1

    const/16 v17, 0xff

    const/16 v18, 0x0

    const/16 v19, 0x5b

    const/16 v20, 0xff

    invoke-static/range {v17 .. v20}, Landroid/graphics/Color;->argb(IIII)I

    move-result v17

    aput v17, v15, v16

    const/16 v16, 0x2

    const/16 v17, 0xff

    const/16 v18, 0x0

    const/16 v19, 0x5b

    const/16 v20, 0xff

    invoke-static/range {v17 .. v20}, Landroid/graphics/Color;->argb(IIII)I

    move-result v17

    aput v17, v15, v16

    invoke-direct {v13, v14, v15}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    invoke-virtual {v6, v13}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 302
    new-instance v13, Lcom/localytics/android/TestModeListView$TestModeDialog$2;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lcom/localytics/android/TestModeListView$TestModeDialog$2;-><init>(Lcom/localytics/android/TestModeListView$TestModeDialog;)V

    invoke-virtual {v6, v13}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 314
    new-instance v8, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v13, -0x2

    const/4 v14, -0x2

    invoke-direct {v8, v13, v14}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 315
    .local v8, "paramsMenu":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v13, 0xb

    invoke-virtual {v8, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 316
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 317
    invoke-virtual {v11, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 320
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-virtual/range {p0 .. p0}, Lcom/localytics/android/TestModeListView$TestModeDialog;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v1, v13}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 321
    .local v1, "bottomLayout":Landroid/widget/RelativeLayout;
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v13, -0x1

    const/4 v14, -0x1

    invoke-direct {v2, v13, v14}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 322
    .local v2, "bottomParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v13, 0x3

    const/4 v14, 0x1

    invoke-virtual {v2, v13, v14}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 323
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 324
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v13, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 327
    new-instance v5, Landroid/widget/ListView;

    invoke-virtual/range {p0 .. p0}, Lcom/localytics/android/TestModeListView$TestModeDialog;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v5, v13}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 328
    .local v5, "listView":Landroid/widget/ListView;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/localytics/android/TestModeListView$TestModeDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-static {v13}, Lcom/localytics/android/TestModeListView;->access$300(Lcom/localytics/android/TestModeListView;)Landroid/widget/ListAdapter;

    move-result-object v13

    invoke-virtual {v5, v13}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 329
    new-instance v13, Lcom/localytics/android/TestModeListView$TestModeDialog$3;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lcom/localytics/android/TestModeListView$TestModeDialog$3;-><init>(Lcom/localytics/android/TestModeListView$TestModeDialog;)V

    invoke-virtual {v5, v13}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 344
    invoke-virtual {v1, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 346
    const/4 v13, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/localytics/android/TestModeListView$TestModeDialog;->requestWindowFeature(I)Z

    .line 347
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/localytics/android/TestModeListView$TestModeDialog;->setContentView(Landroid/view/View;)V

    .line 348
    return-void
.end method


# virtual methods
.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 407
    const/4 v1, 0x4

    if-ne p1, v1, :cond_1

    .line 409
    iget-object v1, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mDialogLayout:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->mAnimOut:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 410
    iget-object v1, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-static {v1}, Lcom/localytics/android/TestModeListView;->access$200(Lcom/localytics/android/TestModeListView;)Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 412
    iget-object v1, p0, Lcom/localytics/android/TestModeListView$TestModeDialog;->this$0:Lcom/localytics/android/TestModeListView;

    invoke-static {v1}, Lcom/localytics/android/TestModeListView;->access$200(Lcom/localytics/android/TestModeListView;)Ljava/util/Map;

    move-result-object v1

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/localytics/android/MarketingCallable;

    .line 413
    .local v0, "callable":Lcom/localytics/android/MarketingCallable;
    if-eqz v0, :cond_0

    .line 415
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingCallable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    .end local v0    # "callable":Lcom/localytics/android/MarketingCallable;
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    .line 420
    :goto_0
    return v1

    :cond_1
    invoke-super {p0, p1, p2}, Landroid/app/Dialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0
.end method
