.class public final Lcom/belkin/wemoandroid/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemoandroid/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final CropImageView:[I

.field public static final CropImageView_highlightColor:I = 0x0

.field public static final CropImageView_showCircle:I = 0x2

.field public static final CropImageView_showHandles:I = 0x3

.field public static final CropImageView_showThirds:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 211
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/belkin/wemoandroid/R$styleable;->CropImageView:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x7f010001
        0x7f010002
        0x7f010003
        0x7f010004
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method