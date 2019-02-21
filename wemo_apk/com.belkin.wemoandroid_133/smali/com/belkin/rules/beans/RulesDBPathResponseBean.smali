.class public Lcom/belkin/rules/beans/RulesDBPathResponseBean;
.super Ljava/lang/Object;
.source "RulesDBPathResponseBean.java"


# instance fields
.field private mStrRulesDBPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    iput-object v0, p0, Lcom/belkin/rules/beans/RulesDBPathResponseBean;->mStrRulesDBPath:Ljava/lang/String;

    .line 9
    return-void
.end method


# virtual methods
.method public getStrRulesDBPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/belkin/rules/beans/RulesDBPathResponseBean;->mStrRulesDBPath:Ljava/lang/String;

    return-object v0
.end method

.method public setStrRulesDBPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "strRulesDBPath"    # Ljava/lang/String;

    .prologue
    .line 16
    iput-object p1, p0, Lcom/belkin/rules/beans/RulesDBPathResponseBean;->mStrRulesDBPath:Ljava/lang/String;

    .line 17
    return-void
.end method
