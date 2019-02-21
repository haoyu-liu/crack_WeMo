.class public Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "StoreDeviceRulesNoStoreSupportRunnable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$SetRulesDBVersionActionCallback;,
        Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;,
        Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;,
        Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$StoreDeviceRuleActionCallback;
    }
.end annotation


# static fields
.field public static final EDIT_WEEKLY_CALENDAR_LENGTH:I = 0x2


# instance fields
.field private callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

.field private dbVersionToSet:Ljava/lang/String;

.field private device:Lorg/cybergarage/upnp/Device;

.field private localZippedDBFilePath:Ljava/lang/String;

.field private processDBState:I

.field private weeklyRecordArray:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;Lorg/cybergarage/upnp/Device;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)V
    .locals 0
    .param p1, "callback"    # Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;
    .param p2, "device"    # Lorg/cybergarage/upnp/Device;
    .param p3, "dbVersionToSet"    # Ljava/lang/String;
    .param p4, "localZippedDBFilePath"    # Ljava/lang/String;
    .param p5, "processDBState"    # I
    .param p6, "weeklyRecordArray"    # [Ljava/lang/String;

    .prologue
    .line 96
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 99
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    .line 101
    iput-object p3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->dbVersionToSet:Ljava/lang/String;

    .line 102
    iput-object p4, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->localZippedDBFilePath:Ljava/lang/String;

    .line 103
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    .line 104
    iput p5, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->processDBState:I

    .line 107
    iput-object p6, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->weeklyRecordArray:[Ljava/lang/String;

    .line 108
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->writeDBFileToDevice()V

    return-void
.end method

.method static synthetic access$1000(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->parseRulesDBPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->localZippedDBFilePath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$700(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .prologue
    .line 68
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->setRulesDBVersionOnDevice()V

    return-void
.end method

.method static synthetic access$800(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private editWeeklyCalenderString()V
    .locals 4

    .prologue
    .line 211
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    const-string v3, "EditWeeklycalendar"

    invoke-virtual {v2, v3}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 213
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 214
    .local v1, "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v2, Lcom/belkin/wemo/cache/utils/Constants;->SET_EDIT_WEEKLY_CALENDER_ARGS:[Ljava/lang/String;

    const/4 v3, 0x0

    aget-object v2, v2, v3

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->postWeeklyCalendarAction(Lorg/cybergarage/upnp/Action;Ljava/util/HashMap;)V

    .line 217
    return-void
.end method

.method private onInvalidWeeklyRecordError()V
    .locals 3

    .prologue
    .line 139
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Store Rules: Old FW or Smart Device: Update Weekly calender Array NULL but process DB requested: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->callback:Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;

    new-instance v1, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    .line 143
    :cond_0
    return-void
.end method

.method private parseRulesDBPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "actionResponse"    # Ljava/lang/String;

    .prologue
    .line 172
    new-instance v0, Lcom/belkin/upnp/parser/Parser;

    invoke-direct {v0}, Lcom/belkin/upnp/parser/Parser;-><init>()V

    .line 173
    .local v0, "parseResponse":Lcom/belkin/upnp/parser/Parser;
    new-instance v1, Lcom/belkin/rules/beans/RulesDBPathResponseBean;

    invoke-direct {v1}, Lcom/belkin/rules/beans/RulesDBPathResponseBean;-><init>()V

    .line 175
    .local v1, "respObject":Lcom/belkin/rules/beans/RulesDBPathResponseBean;
    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2, p1}, Lcom/belkin/upnp/parser/Parser;->uPnPResponseParser(Ljava/lang/Object;ILjava/lang/String;)V

    .line 176
    invoke-virtual {v1}, Lcom/belkin/rules/beans/RulesDBPathResponseBean;->getStrRulesDBPath()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private postWeeklyCalendarAction(Lorg/cybergarage/upnp/Action;Ljava/util/HashMap;)V
    .locals 7
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/cybergarage/upnp/Action;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 200
    .local p2, "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v4, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;

    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, p0, v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)V

    .line 202
    .local v4, "callback":Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$WeeklyCalendarActionCallback;
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v0

    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    move-object v1, p1

    move-object v5, v4

    move-object v6, p2

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;Ljava/util/HashMap;)V

    .line 208
    return-void
.end method

.method private setRulesDBVersionOnDevice()V
    .locals 7

    .prologue
    .line 147
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    const-string v2, "SetRulesDBVersion"

    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 148
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 149
    .local v6, "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "RulesDBVersion"

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->dbVersionToSet:Ljava/lang/String;

    invoke-virtual {v6, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    new-instance v4, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$SetRulesDBVersionActionCallback;

    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, p0, v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$SetRulesDBVersionActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)V

    .line 152
    .local v4, "callback":Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$SetRulesDBVersionActionCallback;
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v0

    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    move-object v5, v4

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;Ljava/util/HashMap;)V

    .line 158
    return-void
.end method

.method private updateWeeklyCalenderLinkDevice()V
    .locals 5

    .prologue
    .line 220
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->weeklyRecordArray:[Ljava/lang/String;

    array-length v3, v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    .line 221
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->editWeeklyCalenderString()V

    .line 224
    :cond_0
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    const-string v4, "UpdateWeeklyCalendar"

    invoke-virtual {v3, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 226
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 228
    .local v1, "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->weeklyRecordArray:[Ljava/lang/String;

    invoke-static {v3}, Lcom/belkin/wemo/utils/WeMoUtils;->createWeeklyCalendarListString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 229
    .local v2, "weeklyListString":Ljava/lang/String;
    sget-object v3, Lcom/belkin/wemo/cache/utils/Constants;->SET_UPDATE_WEEKLY_CALENDER_LED_ARGS:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-virtual {v1, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 231
    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->postWeeklyCalendarAction(Lorg/cybergarage/upnp/Action;Ljava/util/HashMap;)V

    .line 232
    return-void
.end method

.method private updateWeeklyCalenderNonLinkDevice()V
    .locals 6

    .prologue
    .line 180
    iget-object v4, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->weeklyRecordArray:[Ljava/lang/String;

    array-length v4, v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    .line 181
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->editWeeklyCalenderString()V

    .line 184
    :cond_0
    iget-object v4, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    const-string v5, "UpdateWeeklyCalendar"

    invoke-virtual {v4, v5}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 186
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 189
    .local v1, "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/4 v4, 0x7

    if-ge v3, v4, :cond_1

    .line 190
    :try_start_0
    sget-object v4, Lcom/belkin/wemo/cache/utils/Constants;->SET_UPDATE_WEEKLY_CALENDER_ARGS:[Ljava/lang/String;

    aget-object v4, v4, v3

    iget-object v5, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->weeklyRecordArray:[Ljava/lang/String;

    aget-object v5, v5, v3

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 192
    :catch_0
    move-exception v2

    .line 193
    .local v2, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->TAG:Ljava/lang/String;

    const-string v5, "; Exception: "

    invoke-static {v4, v5, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 196
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-direct {p0, v0, v1}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->postWeeklyCalendarAction(Lorg/cybergarage/upnp/Action;Ljava/util/HashMap;)V

    .line 197
    return-void
.end method

.method private writeDBFileToDevice()V
    .locals 6

    .prologue
    .line 162
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    const-string v2, "GetRulesDBPath"

    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 163
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    new-instance v4, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;

    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, p0, v0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;-><init>(Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;Ljava/lang/String;)V

    .line 164
    .local v4, "callback":Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable$GetRulesDBPathActionCallback;
    invoke-static {}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->newInstance()Lcom/belkin/cybergarage/wrapper/ControlActionHandler;

    move-result-object v0

    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Lcom/belkin/cybergarage/wrapper/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionErrorCallback;Lcom/belkin/cybergarage/wrapper/ControlActionHandler$ControlActionSuccessCallback;)V

    .line 169
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 115
    iget v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->processDBState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 116
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->weeklyRecordArray:[Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 118
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->updateWeeklyCalenderLinkDevice()V

    .line 135
    :goto_0
    return-void

    .line 121
    :cond_0
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->onInvalidWeeklyRecordError()V

    goto :goto_0

    .line 123
    :cond_1
    iget v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->processDBState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 124
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->weeklyRecordArray:[Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 126
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->updateWeeklyCalenderNonLinkDevice()V

    goto :goto_0

    .line 129
    :cond_2
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->onInvalidWeeklyRecordError()V

    goto :goto_0

    .line 133
    :cond_3
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;->writeDBFileToDevice()V

    goto :goto_0
.end method
