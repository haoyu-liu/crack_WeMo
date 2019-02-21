.class public Lcom/belkin/wemo/rules/util/CloudRulesDBVersion;
.super Ljava/lang/Object;
.source "CloudRulesDBVersion.java"


# instance fields
.field private dbVersion:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/wemo/rules/util/CloudRulesDBVersion;->dbVersion:I

    return-void
.end method


# virtual methods
.method public getDBVersion()I
    .locals 1

    .prologue
    .line 25
    iget v0, p0, Lcom/belkin/wemo/rules/util/CloudRulesDBVersion;->dbVersion:I

    return v0
.end method

.method public setDBVersion(I)V
    .locals 0
    .param p1, "dbVersion"    # I

    .prologue
    .line 14
    iput p1, p0, Lcom/belkin/wemo/rules/util/CloudRulesDBVersion;->dbVersion:I

    .line 15
    return-void
.end method
