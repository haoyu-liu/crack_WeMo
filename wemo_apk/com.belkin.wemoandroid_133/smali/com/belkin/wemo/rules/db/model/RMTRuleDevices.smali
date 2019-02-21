.class public Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;
.super Ljava/lang/Object;
.source "RMTRuleDevices.java"


# static fields
.field public static final DEFAULT_LEVEL:I = -0x1

.field public static final DEFAULT_PRODUCT_NAME:Ljava/lang/String; = ""

.field public static final DEFAULT_TYPE:I = -0x1

.field public static final DEFAULT_VALUE:I = -0x1

.field public static final DEFAULT_ZB_CAPABILITY_END:Ljava/lang/String; = ""

.field public static final DEFAULT_ZB_CAPABILITY_START:Ljava/lang/String; = ""


# instance fields
.field private CountdownTime:I

.field private DayID:I

.field private DeviceID:Ljava/lang/String;

.field private EndAction:F

.field private EndTime:I

.field private GroupID:I

.field private Level:I

.field private OffModeOffset:I

.field private OnModeOffset:I

.field private RuleDuration:I

.field private RuleID:I

.field private SensorDuration:I

.field private StartAction:F

.field private StartTime:I

.field private Type:I

.field private Value:I

.field private ZBCapabilityEnd:Ljava/lang/String;

.field private ZBCapabilityStart:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->CountdownTime:I

    .line 24
    iput v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->EndTime:I

    .line 34
    invoke-direct {p0}, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->initToDefault()V

    .line 35
    return-void
.end method

.method private initToDefault()V
    .locals 3

    .prologue
    const/high16 v2, -0x40800000    # -1.0f

    const/4 v1, -0x1

    .line 38
    iput v1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->Type:I

    .line 39
    iput v1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->Value:I

    .line 40
    iput v1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->Level:I

    .line 41
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->ZBCapabilityEnd:Ljava/lang/String;

    .line 42
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->ZBCapabilityStart:Ljava/lang/String;

    .line 44
    iput v2, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->StartAction:F

    .line 45
    iput v2, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->EndAction:F

    .line 46
    iput v1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->SensorDuration:I

    .line 47
    iput v1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->StartTime:I

    .line 48
    iput v1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->EndTime:I

    .line 49
    iput v1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->RuleDuration:I

    .line 50
    return-void
.end method


# virtual methods
.method public getCountdownTime()I
    .locals 1

    .prologue
    .line 280
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->CountdownTime:I

    return v0
.end method

.method public getDayID()I
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->DayID:I

    return v0
.end method

.method public getDeviceID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->DeviceID:Ljava/lang/String;

    return-object v0
.end method

.method public getEndAction()F
    .locals 1

    .prologue
    .line 154
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->EndAction:F

    return v0
.end method

.method public getEndTime()I
    .locals 1

    .prologue
    .line 294
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->EndTime:I

    return v0
.end method

.method public getGroupID()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->GroupID:I

    return v0
.end method

.method public getLevel()I
    .locals 1

    .prologue
    .line 210
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->Level:I

    return v0
.end method

.method public getOffModeOffset()I
    .locals 1

    .prologue
    .line 266
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->OffModeOffset:I

    return v0
.end method

.method public getOnModeOffset()I
    .locals 1

    .prologue
    .line 252
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->OnModeOffset:I

    return v0
.end method

.method public getRuleDuration()I
    .locals 1

    .prologue
    .line 126
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->RuleDuration:I

    return v0
.end method

.method public getRuleID()I
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->RuleID:I

    return v0
.end method

.method public getSensorDuration()I
    .locals 1

    .prologue
    .line 168
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->SensorDuration:I

    return v0
.end method

.method public getStartAction()F
    .locals 1

    .prologue
    .line 140
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->StartAction:F

    return v0
.end method

.method public getStartTime()I
    .locals 1

    .prologue
    .line 112
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->StartTime:I

    return v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 182
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->Type:I

    return v0
.end method

.method public getValue()I
    .locals 1

    .prologue
    .line 196
    iget v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->Value:I

    return v0
.end method

.method public getZBCapabilityEnd()Ljava/lang/String;
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->ZBCapabilityEnd:Ljava/lang/String;

    return-object v0
.end method

.method public getZBCapabilityStart()Ljava/lang/String;
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->ZBCapabilityStart:Ljava/lang/String;

    return-object v0
.end method

.method public setCountdownTime(I)V
    .locals 0
    .param p1, "countdownTime"    # I

    .prologue
    .line 287
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->CountdownTime:I

    .line 288
    return-void
.end method

.method public setDayID(I)V
    .locals 0
    .param p1, "dayID"    # I

    .prologue
    .line 105
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->DayID:I

    .line 106
    return-void
.end method

.method public setDeviceID(Ljava/lang/String;)V
    .locals 0
    .param p1, "deviceID"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->DeviceID:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public setEndAction(F)V
    .locals 0
    .param p1, "endAction"    # F

    .prologue
    .line 161
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->EndAction:F

    .line 162
    return-void
.end method

.method public setEndTime(I)V
    .locals 0
    .param p1, "endTime"    # I

    .prologue
    .line 301
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->EndTime:I

    .line 302
    return-void
.end method

.method public setGroupID(I)V
    .locals 0
    .param p1, "groupID"    # I

    .prologue
    .line 91
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->GroupID:I

    .line 92
    return-void
.end method

.method public setLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 217
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->Level:I

    .line 218
    return-void
.end method

.method public setOffModeOffset(I)V
    .locals 0
    .param p1, "offModeOffset"    # I

    .prologue
    .line 273
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->OffModeOffset:I

    .line 274
    return-void
.end method

.method public setOnModeOffset(I)V
    .locals 0
    .param p1, "onModeOffset"    # I

    .prologue
    .line 259
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->OnModeOffset:I

    .line 260
    return-void
.end method

.method public setRuleDuration(I)V
    .locals 0
    .param p1, "ruleDuration"    # I

    .prologue
    .line 133
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->RuleDuration:I

    .line 134
    return-void
.end method

.method public setRuleID(I)V
    .locals 0
    .param p1, "ruleID"    # I

    .prologue
    .line 63
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->RuleID:I

    .line 64
    return-void
.end method

.method public setSensorDuration(I)V
    .locals 0
    .param p1, "sensorDuration"    # I

    .prologue
    .line 175
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->SensorDuration:I

    .line 176
    return-void
.end method

.method public setStartAction(F)V
    .locals 0
    .param p1, "startAction"    # F

    .prologue
    .line 147
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->StartAction:F

    .line 148
    return-void
.end method

.method public setStartTime(I)V
    .locals 0
    .param p1, "startTime"    # I

    .prologue
    .line 119
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->StartTime:I

    .line 120
    return-void
.end method

.method public setType(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 189
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->Type:I

    .line 190
    return-void
.end method

.method public setValue(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 203
    iput p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->Value:I

    .line 204
    return-void
.end method

.method public setZBCapabilityEnd(Ljava/lang/String;)V
    .locals 0
    .param p1, "zBCapabilityEnd"    # Ljava/lang/String;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->ZBCapabilityEnd:Ljava/lang/String;

    .line 246
    return-void
.end method

.method public setZBCapabilityStart(Ljava/lang/String;)V
    .locals 0
    .param p1, "zBCapabilityStart"    # Ljava/lang/String;

    .prologue
    .line 231
    iput-object p1, p0, Lcom/belkin/wemo/rules/db/model/RMTRuleDevices;->ZBCapabilityStart:Ljava/lang/String;

    .line 232
    return-void
.end method
