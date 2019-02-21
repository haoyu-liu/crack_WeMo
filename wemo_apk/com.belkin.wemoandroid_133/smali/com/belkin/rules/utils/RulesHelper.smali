.class public Lcom/belkin/rules/utils/RulesHelper;
.super Ljava/lang/Object;
.source "RulesHelper.java"


# instance fields
.field mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/belkin/rules/utils/RulesHelper;->mContext:Landroid/content/Context;

    .line 17
    return-void
.end method


# virtual methods
.method public generatingWeeklySchStr(Ljava/lang/String;)[Ljava/lang/String;
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 26
    const/16 v1, 0x8

    new-array v0, v1, [Ljava/lang/String;

    .line 28
    .local v0, "weeklyRecord":[Ljava/lang/String;
    const/4 v1, 0x0

    const-string v2, ""

    aput-object v2, v0, v1

    .line 29
    const/4 v1, 0x1

    const-string v2, ""

    aput-object v2, v0, v1

    .line 30
    const/4 v1, 0x2

    const-string v2, ""

    aput-object v2, v0, v1

    .line 31
    const/4 v1, 0x3

    const-string v2, ""

    aput-object v2, v0, v1

    .line 32
    const/4 v1, 0x4

    const-string v2, ""

    aput-object v2, v0, v1

    .line 33
    const/4 v1, 0x5

    const-string v2, ""

    aput-object v2, v0, v1

    .line 34
    const/4 v1, 0x6

    const-string v2, ""

    aput-object v2, v0, v1

    .line 35
    const/4 v1, 0x7

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 38
    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 46
    const-string v0, "RulesHelper"

    iget-object v1, p0, Lcom/belkin/rules/utils/RulesHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    iget-object v0, p0, Lcom/belkin/rules/utils/RulesHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
