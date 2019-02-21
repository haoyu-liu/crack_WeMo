.class final Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;
.super Landroid/view/View;
.source "MarketingDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "CloseButton"
.end annotation


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private final mCenterX:F

.field private final mCenterY:F

.field private final mInnerRadius:F

.field private final mOffset:F

.field private final mPaint:Landroid/graphics/Paint;

.field private final mRadius:F

.field private final mShadowInnerPaint:Landroid/graphics/Paint;

.field private final mShadowOuterPaint:Landroid/graphics/Paint;

.field private final mStrokeWidth:F

.field final synthetic this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 10
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/high16 v9, 0x41d00000    # 26.0f

    const/high16 v3, 0x41500000    # 13.0f

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v5, 0x1

    .line 1154
    iput-object p1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    .line 1155
    invoke-direct {p0, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 1157
    invoke-virtual {p0, v5}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->setId(I)V

    .line 1158
    const-string v1, "close_button"

    invoke-virtual {p0, v1}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1161
    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getApiLevel()I

    move-result v1

    const/16 v2, 0xe

    if-lt v1, v2, :cond_0

    .line 1163
    const/4 v1, 0x0

    invoke-virtual {p0, v5, v1}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->setLayerType(ILandroid/graphics/Paint;)V

    .line 1166
    :cond_0
    invoke-virtual {p0}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v7, v1, Landroid/util/DisplayMetrics;->density:F

    .line 1168
    .local v7, "dip":F
    mul-float v1, v3, v7

    iput v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterX:F

    .line 1169
    mul-float v1, v3, v7

    iput v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterY:F

    .line 1170
    mul-float v1, v3, v7

    iput v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mRadius:F

    .line 1171
    const/high16 v1, 0x40a00000    # 5.0f

    mul-float/2addr v1, v7

    iput v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mOffset:F

    .line 1172
    const/high16 v1, 0x40200000    # 2.5f

    mul-float/2addr v1, v7

    iput v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mStrokeWidth:F

    .line 1173
    iget v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mRadius:F

    iget v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mStrokeWidth:F

    mul-float/2addr v2, v8

    sub-float/2addr v1, v2

    iput v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mInnerRadius:F

    .line 1175
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    .line 1177
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mShadowInnerPaint:Landroid/graphics/Paint;

    .line 1178
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mShadowInnerPaint:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/BlurMaskFilter;

    iget v3, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mRadius:F

    sub-float/2addr v3, v7

    sget-object v4, Landroid/graphics/BlurMaskFilter$Blur;->INNER:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v2, v3, v4}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 1179
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v5}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mShadowOuterPaint:Landroid/graphics/Paint;

    .line 1180
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mShadowOuterPaint:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/BlurMaskFilter;

    const/high16 v3, 0x40000000    # 2.0f

    mul-float/2addr v3, v7

    sget-object v4, Landroid/graphics/BlurMaskFilter$Blur;->OUTER:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v2, v3, v4}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 1183
    invoke-static {}, Lcom/localytics/android/MarketingDialogFragment;->access$1600()Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_1

    .line 1185
    const/high16 v6, 0x41f00000    # 30.0f

    .line 1191
    .local v6, "buttonMargin":F
    :goto_0
    mul-float/2addr v6, v7

    .line 1192
    add-float/2addr v6, v8

    .line 1193
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    float-to-int v2, v6

    float-to-int v3, v6

    invoke-direct {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1196
    mul-float v1, v9, v7

    add-float/2addr v1, v8

    float-to-int v1, v1

    mul-float v2, v9, v7

    add-float/2addr v2, v8

    float-to-int v2, v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    .line 1197
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1200
    .local v0, "canvas":Landroid/graphics/Canvas;
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1201
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1202
    iget v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterX:F

    iget v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterY:F

    iget v3, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mRadius:F

    iget-object v4, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1205
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 1206
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 1207
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mStrokeWidth:F

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1208
    iget v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterX:F

    iget v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterY:F

    iget v3, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mInnerRadius:F

    iget-object v4, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1211
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    const/high16 v2, 0x40900000    # 4.5f

    mul-float/2addr v2, v7

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 1212
    iget v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterX:F

    iget v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mOffset:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterY:F

    iget v3, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mOffset:F

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterX:F

    iget v4, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mOffset:F

    add-float/2addr v3, v4

    iget v4, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterY:F

    iget v5, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mOffset:F

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1213
    iget v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterX:F

    iget v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mOffset:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterY:F

    iget v3, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mOffset:F

    add-float/2addr v2, v3

    iget v3, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterX:F

    iget v4, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mOffset:F

    add-float/2addr v3, v4

    iget v4, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterY:F

    iget v5, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mOffset:F

    sub-float/2addr v4, v5

    iget-object v5, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1214
    return-void

    .line 1189
    .end local v0    # "canvas":Landroid/graphics/Canvas;
    .end local v6    # "buttonMargin":F
    :cond_1
    const/high16 v6, 0x42200000    # 40.0f

    .restart local v6    # "buttonMargin":F
    goto/16 :goto_0
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1219
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 1221
    invoke-virtual {p0}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v0, v4, Landroid/util/DisplayMetrics;->density:F

    .line 1225
    .local v0, "dip":F
    invoke-static {}, Lcom/localytics/android/MarketingDialogFragment;->access$1600()Landroid/graphics/Bitmap;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 1227
    invoke-static {}, Lcom/localytics/android/MarketingDialogFragment;->access$1600()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 1228
    .local v1, "image":Landroid/graphics/Bitmap;
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float v3, v4, v5

    .line 1251
    .local v3, "xOffset":F
    :goto_0
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v3, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 1252
    .end local v1    # "image":Landroid/graphics/Bitmap;
    .end local v3    # "xOffset":F
    :cond_0
    return-void

    .line 1230
    :cond_1
    iget-object v4, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_0

    .line 1233
    invoke-static {}, Lcom/localytics/android/MarketingDialogFragment;->access$400()Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    move-result-object v4

    sget-object v5, Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;->LEFT:Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    if-ne v4, v5, :cond_2

    .line 1235
    const/4 v3, 0x0

    .line 1236
    .restart local v3    # "xOffset":F
    move v2, v0

    .line 1243
    .local v2, "shadowOffset":F
    :goto_1
    iget v4, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterX:F

    add-float/2addr v4, v2

    iget v5, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterY:F

    add-float/2addr v5, v0

    iget v6, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mRadius:F

    sub-float/2addr v6, v0

    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mShadowInnerPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1244
    iget v4, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterX:F

    add-float/2addr v4, v2

    iget v5, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mCenterY:F

    add-float/2addr v5, v0

    iget v6, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mRadius:F

    sub-float/2addr v6, v0

    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mShadowOuterPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 1245
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    .line 1246
    .restart local v1    # "image":Landroid/graphics/Bitmap;
    goto :goto_0

    .line 1240
    .end local v1    # "image":Landroid/graphics/Bitmap;
    .end local v2    # "shadowOffset":F
    .end local v3    # "xOffset":F
    :cond_2
    const/high16 v4, 0x40800000    # 4.0f

    mul-float v3, v4, v0

    .line 1241
    .restart local v3    # "xOffset":F
    const/high16 v4, 0x40400000    # 3.0f

    mul-float v2, v4, v0

    .restart local v2    # "shadowOffset":F
    goto :goto_1
.end method

.method public release()V
    .locals 1

    .prologue
    .line 1256
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 1258
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 1259
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$CloseButton;->mBitmap:Landroid/graphics/Bitmap;

    .line 1261
    :cond_0
    return-void
.end method
