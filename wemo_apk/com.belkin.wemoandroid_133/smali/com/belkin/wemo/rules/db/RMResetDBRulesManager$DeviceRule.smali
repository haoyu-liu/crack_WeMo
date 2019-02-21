.class Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;
.super Ljava/lang/Object;
.source "RMResetDBRulesManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeviceRule"
.end annotation


# instance fields
.field private deviceCount:I

.field private ruleId:I

.field private ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

.field final synthetic this$0:Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;ILcom/belkin/wemo/rules/data/RMDBRuleType;I)V
    .locals 0
    .param p2, "ruleId"    # I
    .param p3, "ruleType"    # Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .param p4, "deviceCount"    # I

    .prologue
    .line 147
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->this$0:Lcom/belkin/wemo/rules/db/RMResetDBRulesManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    iput p2, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->ruleId:I

    .line 149
    iput-object p3, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 150
    iput p4, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->deviceCount:I

    .line 151
    return-void
.end method


# virtual methods
.method public getDeviceCount()I
    .locals 1

    .prologue
    .line 157
    iget v0, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->deviceCount:I

    return v0
.end method

.method public getRuleId()I
    .locals 1

    .prologue
    .line 171
    iget v0, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->ruleId:I

    return v0
.end method

.method public getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    return-object v0
.end method

.method public setDeviceCount(I)V
    .locals 0
    .param p1, "deviceCount"    # I

    .prologue
    .line 164
    iput p1, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->deviceCount:I

    .line 165
    return-void
.end method

.method public setRuleId(I)V
    .locals 0
    .param p1, "ruleId"    # I

    .prologue
    .line 177
    iput p1, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->ruleId:I

    .line 178
    return-void
.end method

.method public setRuleType(Lcom/belkin/wemo/rules/data/RMDBRuleType;)V
    .locals 0
    .param p1, "ruleType"    # Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/RMResetDBRulesManager$DeviceRule;->ruleType:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    .line 190
    return-void
.end method
