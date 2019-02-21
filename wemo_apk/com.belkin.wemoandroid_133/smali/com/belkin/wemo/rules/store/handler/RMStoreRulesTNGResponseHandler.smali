.class public Lcom/belkin/wemo/rules/store/handler/RMStoreRulesTNGResponseHandler;
.super Ljava/lang/Object;
.source "RMStoreRulesTNGResponseHandler.java"

# interfaces
.implements Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;
.implements Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;


# instance fields
.field private callbackCount:I

.field private errorCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;

.field private noRuleTypeFailed:Z

.field private successCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;)V
    .locals 1
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesTNGResponseHandler;->successCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;

    .line 21
    iput-object p2, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesTNGResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;

    .line 22
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesTNGResponseHandler;->noRuleTypeFailed:Z

    .line 23
    return-void
.end method


# virtual methods
.method public onSingleTypeRulesStoreError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V
    .locals 0
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    .prologue
    .line 35
    return-void
.end method

.method public onSingleTypeStoreFailed(ILjava/util/List;)V
    .locals 0
    .param p1, "RulesType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p2, "storeErrorUDNList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method

.method public onSingleTypeStoreSuccess(ILjava/util/List;)V
    .locals 0
    .param p1, "RulesType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p2, "storeErrorUDNList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    return-void
.end method
