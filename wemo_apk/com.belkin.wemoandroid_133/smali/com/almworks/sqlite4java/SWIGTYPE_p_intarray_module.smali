.class Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;
.super Ljava/lang/Object;
.source "SWIGTYPE_p_intarray_module.java"


# instance fields
.field private swigCPtr:J


# direct methods
.method protected constructor <init>()V
    .locals 2

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;->swigCPtr:J

    .line 41
    return-void
.end method

.method protected constructor <init>(JZ)V
    .locals 1
    .param p1, "cPtr"    # J
    .param p3, "futureUse"    # Z

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-wide p1, p0, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;->swigCPtr:J

    .line 37
    return-void
.end method

.method protected static getCPtr(Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;)J
    .locals 2
    .param p0, "obj"    # Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;

    .prologue
    .line 44
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0

    :cond_0
    iget-wide v0, p0, Lcom/almworks/sqlite4java/SWIGTYPE_p_intarray_module;->swigCPtr:J

    goto :goto_0
.end method
