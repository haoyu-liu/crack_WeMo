.class Lcom/localytics/android/MarketingHandler;
.super Lcom/localytics/android/BaseHandler;
.source "MarketingHandler.java"

# interfaces
.implements Lcom/localytics/android/AnalyticsListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/MarketingHandler$25;,
        Lcom/localytics/android/MarketingHandler$MessagingListenersSet;,
        Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;
    }
.end annotation


# static fields
.field private static final AB_ATTRIBUTE:Ljava/lang/String; = "ab"

.field private static final ACTION_ATTRIBUTE:Ljava/lang/String; = "Action"

.field private static final APP_CONTEXT_ATTRIBUTE:Ljava/lang/String; = "App Context"

.field private static final AUGMENTED_BLACKOUT_TIMES_RULE:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final AUGMENTED_BLACKOUT_WEEKDAYS_RULE:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final CAMPAIGN_ID_ATTRIBUTE:Ljava/lang/String; = "Campaign ID"

.field private static final CREATIVE_DISPLAYED_ATTRIBUTE:Ljava/lang/String; = "Creative Displayed"

.field private static final CREATIVE_ID_ATTRIBUTE:Ljava/lang/String; = "Creative ID"

.field private static final CREATIVE_TYPE_ATTRIBUTE:Ljava/lang/String; = "Creative Type"

.field private static final DATE_SDF:Ljava/text/SimpleDateFormat;

.field private static final DEFAULT_FREQUENCY_CAPPING_RULE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final GLOBAL_FREQUENCY_CAPPING_RULE_CAMPAIGN_ID:I = -0x1

.field private static final GLOBAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS:[Ljava/lang/String;

.field private static final INDIVIDUAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS:[Ljava/lang/String;

.field private static final JS_STRINGS_THAT_MEAN_NULL:Ljava/util/List;

.field private static final MESSAGE_HANDLE_PUSH_RECEIVED:I = 0xcc

.field private static final MESSAGE_MARKETING_MESSAGE_TRIGGER:I = 0xc9

.field private static final MESSAGE_SET_MARKETING_MESSAGE_AS_NOT_DISPLAYED:I = 0xcd

.field private static final MESSAGE_SHOW_MARKETING_TEST:I = 0xcb

.field private static final PROJECTION_MARKETING_RULE_RECORD:[Ljava/lang/String;

.field private static final PUSH_API_URL_TEMPLATE:Ljava/lang/String; = "http://pushapi.localytics.com/push_test?platform=android&type=prod&campaign=%s&creative=%s&token=%s&install_id=%s&client_ts=%s"

.field private static final PUSH_NOTIFICATIONS_ENABLED_ATTRIBUTE:Ljava/lang/String; = "Push Notifications Enabled"

.field private static final PUSH_OPENED_EVENT:Ljava/lang/String; = "Localytics Push Opened"

.field private static final PUSH_RECEIVED_EVENT:Ljava/lang/String; = "Localytics Push Received"

.field private static final TIME_SDF:Ljava/text/SimpleDateFormat;


# instance fields
.field private lastMarketingMessagesHash:I

.field private mCampaignDisplaying:Z

.field mConfigurations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mFragmentManager:Landroid/support/v4/app/FragmentManager;

.field private sessionStartMarketingMessageShown:Z

.field private testCampaignsListAdapter:Lcom/localytics/android/MarketingRulesAdapter;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 113
    new-array v1, v3, [Ljava/lang/String;

    const-string v2, "_id"

    aput-object v2, v1, v4

    const-string v2, "version"

    aput-object v2, v1, v5

    sput-object v1, Lcom/localytics/android/MarketingHandler;->PROJECTION_MARKETING_RULE_RECORD:[Ljava/lang/String;

    .line 128
    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "undefined"

    aput-object v2, v1, v4

    const-string v2, "null"

    aput-object v2, v1, v5

    const-string v2, "nil"

    aput-object v2, v1, v3

    const-string v2, "\"\""

    aput-object v2, v1, v6

    const-string v2, "\'\'"

    aput-object v2, v1, v7

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sput-object v1, Lcom/localytics/android/MarketingHandler;->JS_STRINGS_THAT_MEAN_NULL:Ljava/util/List;

    .line 141
    new-array v1, v5, [Ljava/lang/String;

    sget-object v2, Lcom/localytics/android/Constants;->DISPLAY_FREQUENCIES_KEY:Ljava/lang/String;

    aput-object v2, v1, v4

    sput-object v1, Lcom/localytics/android/MarketingHandler;->GLOBAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS:[Ljava/lang/String;

    .line 142
    new-array v1, v3, [Ljava/lang/String;

    sget-object v2, Lcom/localytics/android/Constants;->MAX_DISPLAY_COUNT_KEY:Ljava/lang/String;

    aput-object v2, v1, v4

    sget-object v2, Lcom/localytics/android/Constants;->IGNORE_GLOBAL_KEY:Ljava/lang/String;

    aput-object v2, v1, v5

    sput-object v1, Lcom/localytics/android/MarketingHandler;->INDIVIDUAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS:[Ljava/lang/String;

    .line 146
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "HH:mm"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/localytics/android/MarketingHandler;->TIME_SDF:Ljava/text/SimpleDateFormat;

    .line 147
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/localytics/android/MarketingHandler;->DATE_SDF:Ljava/text/SimpleDateFormat;

    .line 151
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/localytics/android/MarketingHandler;->AUGMENTED_BLACKOUT_TIMES_RULE:Ljava/util/List;

    .line 152
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 153
    .local v0, "rule":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "start"

    const-string v2, "00:00"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    const-string v1, "end"

    const-string v2, "23:59"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget-object v1, Lcom/localytics/android/MarketingHandler;->AUGMENTED_BLACKOUT_TIMES_RULE:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/Integer;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v6

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v7

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sput-object v1, Lcom/localytics/android/MarketingHandler;->AUGMENTED_BLACKOUT_WEEKDAYS_RULE:Ljava/util/List;

    .line 159
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lcom/localytics/android/MarketingHandler;->DEFAULT_FREQUENCY_CAPPING_RULE:Ljava/util/Map;

    .line 160
    sget-object v1, Lcom/localytics/android/MarketingHandler;->DEFAULT_FREQUENCY_CAPPING_RULE:Ljava/util/Map;

    const-string v2, "max_display_count"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    sget-object v1, Lcom/localytics/android/MarketingHandler;->DEFAULT_FREQUENCY_CAPPING_RULE:Ljava/util/Map;

    const-string v2, "ignore_global"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    sget-object v1, Lcom/localytics/android/MarketingHandler;->TIME_SDF:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, v4}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 164
    sget-object v1, Lcom/localytics/android/MarketingHandler;->DATE_SDF:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, v4}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 165
    return-void
.end method

.method constructor <init>(Lcom/localytics/android/LocalyticsDao;Landroid/os/Looper;Landroid/content/Context;)V
    .locals 4
    .param p1, "localyticsDao"    # Lcom/localytics/android/LocalyticsDao;
    .param p2, "looper"    # Landroid/os/Looper;
    .param p3, "appContext"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 176
    invoke-direct {p0, p1, p2}, Lcom/localytics/android/BaseHandler;-><init>(Lcom/localytics/android/LocalyticsDao;Landroid/os/Looper;)V

    .line 124
    iput-boolean v2, p0, Lcom/localytics/android/MarketingHandler;->sessionStartMarketingMessageShown:Z

    .line 125
    iput-object v3, p0, Lcom/localytics/android/MarketingHandler;->testCampaignsListAdapter:Lcom/localytics/android/MarketingRulesAdapter;

    .line 126
    const/4 v0, -0x1

    iput v0, p0, Lcom/localytics/android/MarketingHandler;->lastMarketingMessagesHash:I

    .line 135
    iput-boolean v1, p0, Lcom/localytics/android/MarketingHandler;->mCampaignDisplaying:Z

    .line 177
    const-string v0, "In-app"

    iput-object v0, p0, Lcom/localytics/android/MarketingHandler;->siloName:Ljava/lang/String;

    .line 178
    new-instance v0, Lcom/localytics/android/MarketingHandler$MessagingListenersSet;

    invoke-direct {v0, p0, v3}, Lcom/localytics/android/MarketingHandler$MessagingListenersSet;-><init>(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingHandler$1;)V

    iput-object v0, p0, Lcom/localytics/android/MarketingHandler;->listeners:Lcom/localytics/android/BaseHandler$ListenersSet;

    .line 179
    iput-boolean v1, p0, Lcom/localytics/android/MarketingHandler;->doesRetry:Z

    .line 182
    invoke-direct {p0, p3}, Lcom/localytics/android/MarketingHandler;->_createLocalyticsDirectory(Landroid/content/Context;)Z

    .line 184
    invoke-virtual {p0, v2}, Lcom/localytics/android/MarketingHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/MarketingHandler;->queueMessage(Landroid/os/Message;)Z

    .line 185
    return-void
.end method

.method private __showMarketingTest()V
    .locals 8

    .prologue
    .line 2218
    iget-object v6, p0, Lcom/localytics/android/MarketingHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    if-nez v6, :cond_1

    .line 2431
    :cond_0
    :goto_0
    return-void

    .line 2223
    :cond_1
    iget-object v6, p0, Lcom/localytics/android/MarketingHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    const-string v7, "marketing_test_mode_button"

    invoke-virtual {v6, v7}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v6

    if-nez v6, :cond_0

    iget-object v6, p0, Lcom/localytics/android/MarketingHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    const-string v7, "marketing_test_mode_list"

    invoke-virtual {v6, v7}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v6

    if-nez v6, :cond_0

    .line 2228
    invoke-static {}, Lcom/localytics/android/TestModeButton;->newInstance()Lcom/localytics/android/TestModeButton;

    move-result-object v2

    .line 2229
    .local v2, "button":Lcom/localytics/android/TestModeButton;
    invoke-static {}, Lcom/localytics/android/TestModeListView;->newInstance()Lcom/localytics/android/TestModeListView;

    move-result-object v5

    .line 2230
    .local v5, "listView":Lcom/localytics/android/TestModeListView;
    iget-object v6, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v6}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v1

    .line 2231
    .local v1, "appContext":Landroid/content/Context;
    new-instance v0, Lcom/localytics/android/MarketingRulesAdapter;

    invoke-direct {v0, v1, p0}, Lcom/localytics/android/MarketingRulesAdapter;-><init>(Landroid/content/Context;Lcom/localytics/android/MarketingHandler;)V

    .line 2233
    .local v0, "adapter":Lcom/localytics/android/MarketingRulesAdapter;
    invoke-virtual {v5, v0}, Lcom/localytics/android/TestModeListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 2238
    new-instance v3, Ljava/util/TreeMap;

    invoke-direct {v3}, Ljava/util/TreeMap;-><init>()V

    .line 2240
    .local v3, "callbacksForButton":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/localytics/android/MarketingCallable;>;"
    const/16 v6, 0x9

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lcom/localytics/android/MarketingHandler$10;

    invoke-direct {v7, p0, v0, v5}, Lcom/localytics/android/MarketingHandler$10;-><init>(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingRulesAdapter;Lcom/localytics/android/TestModeListView;)V

    invoke-interface {v3, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2252
    invoke-virtual {v2, v3}, Lcom/localytics/android/TestModeButton;->setCallbacks(Ljava/util/Map;)Lcom/localytics/android/TestModeButton;

    .line 2253
    iget-object v6, p0, Lcom/localytics/android/MarketingHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    const-string v7, "marketing_test_mode_button"

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/TestModeButton;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 2259
    iget-object v6, p0, Lcom/localytics/android/MarketingHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    invoke-virtual {v6}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z

    .line 2264
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    .line 2267
    .local v4, "callbacksForList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/localytics/android/MarketingCallable;>;"
    const/16 v6, 0xa

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lcom/localytics/android/MarketingHandler$11;

    invoke-direct {v7, p0, v2}, Lcom/localytics/android/MarketingHandler$11;-><init>(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/TestModeButton;)V

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2279
    const/16 v6, 0xc

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lcom/localytics/android/MarketingHandler$12;

    invoke-direct {v7, p0, v0}, Lcom/localytics/android/MarketingHandler$12;-><init>(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingRulesAdapter;)V

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2292
    const/16 v6, 0xd

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lcom/localytics/android/MarketingHandler$13;

    invoke-direct {v7, p0, v1}, Lcom/localytics/android/MarketingHandler$13;-><init>(Lcom/localytics/android/MarketingHandler;Landroid/content/Context;)V

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2336
    const/16 v6, 0xe

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lcom/localytics/android/MarketingHandler$14;

    invoke-direct {v7, p0, v1}, Lcom/localytics/android/MarketingHandler$14;-><init>(Lcom/localytics/android/MarketingHandler;Landroid/content/Context;)V

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2367
    const/16 v6, 0xb

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v7, Lcom/localytics/android/MarketingHandler$15;

    invoke-direct {v7, p0, v1}, Lcom/localytics/android/MarketingHandler$15;-><init>(Lcom/localytics/android/MarketingHandler;Landroid/content/Context;)V

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2430
    invoke-virtual {v5, v4}, Lcom/localytics/android/TestModeListView;->setCallbacks(Ljava/util/Map;)Lcom/localytics/android/TestModeListView;

    goto/16 :goto_0
.end method

.method private _bindRuleToEvents(JLjava/util/List;)V
    .locals 11
    .param p1, "ruleId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "eventNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1739
    iget-object v3, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v4, "marketing_ruleevent"

    const-string v5, "%s = ?"

    new-array v6, v9, [Ljava/lang/Object;

    const-string v7, "rule_id_ref"

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v3, v4, v5, v6}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1742
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1744
    .local v0, "eventName":Ljava/lang/String;
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 1745
    .local v2, "values":Landroid/content/ContentValues;
    const-string v3, "event_name"

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1746
    const-string v3, "rule_id_ref"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1747
    iget-object v3, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v4, "marketing_ruleevent"

    invoke-virtual {v3, v4, v2}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_0

    .line 1749
    .end local v0    # "eventName":Ljava/lang/String;
    .end local v2    # "values":Landroid/content/ContentValues;
    :cond_0
    return-void
.end method

.method private _createLocalyticsDirectory(Landroid/content/Context;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 203
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    const-string v2, ".localytics"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 210
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private _decompressZipFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 12
    .param p1, "zipFileDir"    # Ljava/lang/String;
    .param p2, "unzipFileDir"    # Ljava/lang/String;
    .param p3, "filename"    # Ljava/lang/String;

    .prologue
    .line 3121
    const/4 v7, 0x0

    .line 3124
    .local v7, "zis":Ljava/util/zip/ZipInputStream;
    :try_start_0
    new-instance v8, Ljava/util/zip/ZipInputStream;

    new-instance v9, Ljava/io/FileInputStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v8, v9}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3128
    .end local v7    # "zis":Ljava/util/zip/ZipInputStream;
    .local v8, "zis":Ljava/util/zip/ZipInputStream;
    const/16 v9, 0x2000

    :try_start_1
    new-array v0, v9, [B

    .line 3130
    .local v0, "buffer":[B
    :cond_0
    :goto_0
    invoke-virtual {v8}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v6

    .local v6, "ze":Ljava/util/zip/ZipEntry;
    if-eqz v6, :cond_5

    .line 3133
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 3134
    .local v3, "entryName":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 3136
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 3137
    .local v5, "newFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->mkdir()Z

    move-result v9

    if-nez v9, :cond_0

    .line 3139
    const-string v9, "Could not create directory %s"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v3, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 3157
    .end local v0    # "buffer":[B
    .end local v3    # "entryName":Ljava/lang/String;
    .end local v5    # "newFile":Ljava/io/File;
    .end local v6    # "ze":Ljava/util/zip/ZipEntry;
    :catch_0
    move-exception v2

    move-object v7, v8

    .line 3159
    .end local v8    # "zis":Ljava/util/zip/ZipInputStream;
    .local v2, "e":Ljava/io/IOException;
    .restart local v7    # "zis":Ljava/util/zip/ZipInputStream;
    :goto_1
    :try_start_2
    const-string v9, "Caught IOException"

    invoke-static {v9, v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 3160
    const/4 v9, 0x0

    .line 3166
    if-eqz v7, :cond_1

    .line 3168
    :try_start_3
    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 3169
    const/4 v7, 0x0

    .line 3179
    .end local v2    # "e":Ljava/io/IOException;
    :cond_1
    :goto_2
    return v9

    .line 3144
    .end local v7    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v0    # "buffer":[B
    .restart local v3    # "entryName":Ljava/lang/String;
    .restart local v6    # "ze":Ljava/util/zip/ZipEntry;
    .restart local v8    # "zis":Ljava/util/zip/ZipInputStream;
    :cond_2
    :try_start_4
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 3147
    .local v4, "fos":Ljava/io/FileOutputStream;
    :goto_3
    const/4 v9, 0x0

    array-length v10, v0

    invoke-virtual {v8, v0, v9, v10}, Ljava/util/zip/ZipInputStream;->read([BII)I

    move-result v1

    .local v1, "byteRead":I
    if-lez v1, :cond_4

    .line 3149
    const/4 v9, 0x0

    invoke-virtual {v4, v0, v9, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3

    .line 3164
    .end local v0    # "buffer":[B
    .end local v1    # "byteRead":I
    .end local v3    # "entryName":Ljava/lang/String;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v6    # "ze":Ljava/util/zip/ZipEntry;
    :catchall_0
    move-exception v9

    move-object v7, v8

    .line 3166
    .end local v8    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v7    # "zis":Ljava/util/zip/ZipInputStream;
    :goto_4
    if-eqz v7, :cond_3

    .line 3168
    :try_start_5
    invoke-virtual {v7}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 3169
    const/4 v7, 0x0

    .line 3175
    :cond_3
    throw v9

    .line 3152
    .end local v7    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v0    # "buffer":[B
    .restart local v1    # "byteRead":I
    .restart local v3    # "entryName":Ljava/lang/String;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v6    # "ze":Ljava/util/zip/ZipEntry;
    .restart local v8    # "zis":Ljava/util/zip/ZipInputStream;
    :cond_4
    :try_start_6
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 3153
    invoke-virtual {v8}, Ljava/util/zip/ZipInputStream;->closeEntry()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_0

    .line 3166
    .end local v1    # "byteRead":I
    .end local v3    # "entryName":Ljava/lang/String;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    :cond_5
    if-eqz v8, :cond_6

    .line 3168
    :try_start_7
    invoke-virtual {v8}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    .line 3169
    const/4 v7, 0x0

    .line 3179
    .end local v8    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v7    # "zis":Ljava/util/zip/ZipInputStream;
    :goto_5
    const/4 v9, 0x1

    goto :goto_2

    .line 3172
    .end local v7    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v8    # "zis":Ljava/util/zip/ZipInputStream;
    :catch_1
    move-exception v2

    .line 3174
    .restart local v2    # "e":Ljava/io/IOException;
    const-string v9, "Caught IOException"

    invoke-static {v9, v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3175
    const/4 v9, 0x0

    move-object v7, v8

    .end local v8    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v7    # "zis":Ljava/util/zip/ZipInputStream;
    goto :goto_2

    .line 3172
    .end local v0    # "buffer":[B
    .end local v6    # "ze":Ljava/util/zip/ZipEntry;
    :catch_2
    move-exception v2

    .line 3174
    const-string v9, "Caught IOException"

    invoke-static {v9, v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3175
    const/4 v9, 0x0

    goto :goto_2

    .line 3172
    .end local v2    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v2

    .line 3174
    .restart local v2    # "e":Ljava/io/IOException;
    const-string v9, "Caught IOException"

    invoke-static {v9, v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 3175
    const/4 v9, 0x0

    goto :goto_2

    .line 3164
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v9

    goto :goto_4

    .line 3157
    :catch_4
    move-exception v2

    goto :goto_1

    .end local v7    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v0    # "buffer":[B
    .restart local v6    # "ze":Ljava/util/zip/ZipEntry;
    .restart local v8    # "zis":Ljava/util/zip/ZipInputStream;
    :cond_6
    move-object v7, v8

    .end local v8    # "zis":Ljava/util/zip/ZipInputStream;
    .restart local v7    # "zis":Ljava/util/zip/ZipInputStream;
    goto :goto_5
.end method

.method private _destroyLocalMarketingMessage(Lcom/localytics/android/MarketingMessage;)V
    .locals 23
    .param p1, "marketingMessage"    # Lcom/localytics/android/MarketingMessage;

    .prologue
    .line 1574
    :try_start_0
    const-string v17, "campaign_id"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/Integer;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 1575
    .local v6, "campaignId":I
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/localytics/android/MarketingHandler;->_getRuleIdFromCampaignId(I)I

    move-result v15

    .line 1580
    .local v15, "ruleId":I
    int-to-long v0, v15

    move-wide/from16 v18, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/MarketingHandler;->_getConditionIdFromRuleId(J)[J

    move-result-object v10

    .line 1581
    .local v10, "conditionIds":[J
    move-object v4, v10

    .local v4, "arr$":[J
    array-length v14, v4

    .local v14, "len$":I
    const/4 v13, 0x0

    .local v13, "i$":I
    :goto_0
    if-ge v13, v14, :cond_0

    aget-wide v8, v4, v13

    .line 1583
    .local v8, "conditionId":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v17, v0

    const-string v18, "marketing_condition_values"

    const-string v19, "%s = ?"

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const-string v22, "condition_id_ref"

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v22

    aput-object v22, v20, v21

    invoke-virtual/range {v17 .. v20}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1581
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 1585
    .end local v8    # "conditionId":J
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v17, v0

    const-string v18, "marketing_conditions"

    const-string v19, "%s = ?"

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const-string v22, "rule_id_ref"

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-static {v15}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v22

    aput-object v22, v20, v21

    invoke-virtual/range {v17 .. v20}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1588
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v17, v0

    const-string v18, "marketing_ruleevent"

    const-string v19, "%s = ?"

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const-string v22, "rule_id_ref"

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-static {v15}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v22

    aput-object v22, v20, v21

    invoke-virtual/range {v17 .. v20}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1591
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    move-object/from16 v17, v0

    const-string v18, "marketing_rules"

    const-string v19, "%s = ?"

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const-string v22, "_id"

    aput-object v22, v20, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-static {v15}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v22

    aput-object v22, v20, v21

    invoke-virtual/range {v17 .. v20}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1594
    const-string v17, "base_path"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1595
    .local v5, "basepath":Ljava/lang/String;
    if-eqz v5, :cond_3

    .line 1597
    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1598
    .local v11, "dir":Ljava/io/File;
    invoke-virtual {v11}, Ljava/io/File;->isDirectory()Z

    move-result v17

    if-eqz v17, :cond_1

    .line 1600
    invoke-virtual {v11}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v4

    .local v4, "arr$":[Ljava/lang/String;
    array-length v14, v4

    const/4 v13, 0x0

    :goto_1
    if-ge v13, v14, :cond_1

    aget-object v7, v4, v13

    .line 1602
    .local v7, "children":Ljava/lang/String;
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, v17

    invoke-direct {v0, v11, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    .line 1600
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 1606
    .end local v4    # "arr$":[Ljava/lang/String;
    .end local v7    # "children":Ljava/lang/String;
    :cond_1
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    move-result v17

    if-nez v17, :cond_2

    .line 1608
    const-string v17, "Delete %s failed."

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v5, v18, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 1611
    :cond_2
    new-instance v16, Ljava/io/File;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, ".zip"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1612
    .local v16, "zip":Ljava/io/File;
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->delete()Z

    move-result v17

    if-nez v17, :cond_3

    .line 1614
    const-string v17, "Delete %s failed."

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ".zip"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1622
    .end local v5    # "basepath":Ljava/lang/String;
    .end local v6    # "campaignId":I
    .end local v10    # "conditionIds":[J
    .end local v11    # "dir":Ljava/io/File;
    .end local v13    # "i$":I
    .end local v14    # "len$":I
    .end local v15    # "ruleId":I
    .end local v16    # "zip":Ljava/io/File;
    :cond_3
    :goto_2
    return-void

    .line 1618
    :catch_0
    move-exception v12

    .line 1620
    .local v12, "e":Ljava/lang/Exception;
    const-class v17, Ljava/lang/RuntimeException;

    const-string v18, "Localytics library threw an uncaught exception"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v12}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Exception;)Ljava/lang/Object;

    goto :goto_2
.end method

.method private _doesCreativeExist(IZ)Z
    .locals 6
    .param p1, "ruleId"    # I
    .param p2, "isZipped"    # Z

    .prologue
    .line 3098
    if-eqz p2, :cond_0

    .line 3100
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/localytics/android/MarketingHandler;->_getZipFileDirPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "amp_rule_%d.zip"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 3107
    .local v0, "file":Ljava/io/File;
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    return v1

    .line 3104
    .end local v0    # "file":Ljava/io/File;
    :cond_0
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, p1}, Lcom/localytics/android/MarketingHandler;->_getUnzipFileDirPath(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "index.html"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v0    # "file":Ljava/io/File;
    goto :goto_0
.end method

.method private _getCampaignIdsFromFrequencyCappingQuery(Ljava/lang/String;)Ljava/util/Set;
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1392
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/localytics/android/MarketingHandler;->_getCampaignIdsFromFrequencyCappingQuery(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method private _getCampaignIdsFromFrequencyCappingQuery(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Set;
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "inputs"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1398
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 1399
    .local v0, "campaignIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 1401
    const/4 v1, 0x0

    .line 1404
    .local v1, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    iget-object v2, v2, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 1406
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1408
    const-string v2, "campaign_id"

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1413
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_0

    .line 1415
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_0
    throw v2

    .line 1413
    :cond_1
    if-eqz v1, :cond_2

    .line 1415
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 1420
    .end local v1    # "cursor":Landroid/database/Cursor;
    :cond_2
    return-object v0
.end method

.method private _getConditionIdFromRuleId(J)[J
    .locals 11
    .param p1, "ruleId"    # J

    .prologue
    .line 1919
    const/4 v6, 0x0

    .line 1921
    .local v6, "conditionIds":[J
    const/4 v7, 0x0

    .line 1924
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "marketing_conditions"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v10, "rule_id_ref"

    aput-object v10, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1925
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    new-array v6, v0, [J

    .line 1927
    const/4 v8, 0x0

    .local v8, "i":I
    move v9, v8

    .line 1928
    .end local v8    # "i":I
    .local v9, "i":I
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1930
    add-int/lit8 v8, v9, 0x1

    .end local v9    # "i":I
    .restart local v8    # "i":I
    const-string v0, "_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    int-to-long v0, v0

    aput-wide v0, v6, v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v9, v8

    .end local v8    # "i":I
    .restart local v9    # "i":I
    goto :goto_0

    .line 1935
    :cond_0
    if-eqz v7, :cond_1

    .line 1937
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1938
    const/4 v7, 0x0

    .line 1941
    :cond_1
    return-object v6

    .line 1935
    .end local v9    # "i":I
    :catchall_0
    move-exception v0

    if-eqz v7, :cond_2

    .line 1937
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1938
    const/4 v7, 0x0

    :cond_2
    throw v0
.end method

.method private _getJavaScriptClientCallbacks(Ljava/util/Map;)Landroid/util/SparseArray;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/localytics/android/MarketingCallable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2604
    .local p1, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 2610
    .local v0, "callbacks":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/localytics/android/MarketingCallable;>;"
    const/4 v5, 0x3

    new-instance v6, Lcom/localytics/android/MarketingHandler$20;

    invoke-direct {v6, p0}, Lcom/localytics/android/MarketingHandler$20;-><init>(Lcom/localytics/android/MarketingHandler;)V

    invoke-virtual {v0, v5, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 2708
    iget-object v5, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v5}, Lcom/localytics/android/LocalyticsDao;->getIdentifiers()Ljava/util/Map;

    move-result-object v1

    .line 2709
    .local v1, "customerIDs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x5

    new-instance v6, Lcom/localytics/android/MarketingHandler$21;

    invoke-direct {v6, p0, v1}, Lcom/localytics/android/MarketingHandler$21;-><init>(Lcom/localytics/android/MarketingHandler;Ljava/util/Map;)V

    invoke-virtual {v0, v5, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 2736
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 2737
    .local v4, "jsonCustomDimensions":Lorg/json/JSONObject;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/16 v5, 0xa

    if-ge v3, v5, :cond_0

    .line 2741
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "c"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v6, v3}, Lcom/localytics/android/LocalyticsDao;->getCustomDimension(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2737
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2743
    :catch_0
    move-exception v2

    .line 2745
    .local v2, "e":Lorg/json/JSONException;
    const-string v5, "[JavaScriptClient]: Failed to get custom dimension"

    invoke-static {v5}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    goto :goto_1

    .line 2748
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_0
    const/4 v5, 0x6

    new-instance v6, Lcom/localytics/android/MarketingHandler$22;

    invoke-direct {v6, p0, v4}, Lcom/localytics/android/MarketingHandler$22;-><init>(Lcom/localytics/android/MarketingHandler;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v5, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 2758
    const/4 v5, 0x7

    new-instance v6, Lcom/localytics/android/MarketingHandler$23;

    invoke-direct {v6, p0, p1}, Lcom/localytics/android/MarketingHandler$23;-><init>(Lcom/localytics/android/MarketingHandler;Ljava/util/Map;)V

    invoke-virtual {v0, v5, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 2794
    const/16 v5, 0x8

    new-instance v6, Lcom/localytics/android/MarketingHandler$24;

    invoke-direct {v6, p0}, Lcom/localytics/android/MarketingHandler$24;-><init>(Lcom/localytics/android/MarketingHandler;)V

    invoke-virtual {v0, v5, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 2807
    return-object v0
.end method

.method private _getMarketingConditionValues(I)Ljava/util/Vector;
    .locals 11
    .param p1, "conditionId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3190
    const/4 v8, 0x0

    .line 3192
    .local v8, "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    const/4 v6, 0x0

    .line 3195
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "marketing_condition_values"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "value"

    aput-object v4, v2, v3

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v10, "condition_id_ref"

    aput-object v10, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v6

    move-object v9, v8

    .line 3196
    .end local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .local v9, "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_0
    :try_start_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3198
    const-string v0, "value"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 3200
    .local v7, "value":Ljava/lang/String;
    if-nez v9, :cond_3

    .line 3202
    new-instance v8, Ljava/util/Vector;

    invoke-direct {v8}, Ljava/util/Vector;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 3205
    .end local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :goto_1
    :try_start_2
    invoke-virtual {v8, v7}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v9, v8

    .line 3206
    .end local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    goto :goto_0

    .line 3210
    .end local v7    # "value":Ljava/lang/String;
    :cond_0
    if-eqz v6, :cond_1

    .line 3212
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 3213
    const/4 v6, 0x0

    .line 3217
    :cond_1
    return-object v9

    .line 3210
    .end local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :catchall_0
    move-exception v0

    :goto_2
    if-eqz v6, :cond_2

    .line 3212
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 3213
    const/4 v6, 0x0

    :cond_2
    throw v0

    .line 3210
    .end local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :catchall_1
    move-exception v0

    move-object v8, v9

    .end local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    goto :goto_2

    .end local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v7    # "value":Ljava/lang/String;
    .restart local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_3
    move-object v8, v9

    .end local v9    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    .restart local v8    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    goto :goto_1
.end method

.method private _getMarketingConditions(I)Ljava/util/Vector;
    .locals 15
    .param p1, "ruleId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Vector",
            "<",
            "Lcom/localytics/android/MarketingCondition;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2956
    const/4 v9, 0x0

    .line 2959
    .local v9, "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    const/4 v8, 0x0

    .line 2962
    .local v8, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "marketing_conditions"

    const/4 v2, 0x0

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v14, "rule_id_ref"

    aput-object v14, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v8

    move-object v10, v9

    .line 2963
    .end local v9    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    .local v10, "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    :goto_0
    :try_start_1
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2965
    const-string v0, "_id"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 2966
    .local v7, "conditionId":I
    const-string v0, "attribute_name"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 2967
    .local v11, "name":Ljava/lang/String;
    const-string v0, "operator"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 2968
    .local v12, "operator":Ljava/lang/String;
    invoke-direct {p0, v7}, Lcom/localytics/android/MarketingHandler;->_getMarketingConditionValues(I)Ljava/util/Vector;

    move-result-object v13

    .line 2970
    .local v13, "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    if-nez v10, :cond_3

    .line 2972
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 2975
    .end local v10    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    .restart local v9    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    :goto_1
    :try_start_2
    new-instance v6, Lcom/localytics/android/MarketingCondition;

    invoke-direct {v6, v11, v12, v13}, Lcom/localytics/android/MarketingCondition;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Vector;)V

    .line 2976
    .local v6, "condition":Lcom/localytics/android/MarketingCondition;
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Lcom/localytics/android/MarketingCondition;->setPackageName(Ljava/lang/String;)V

    .line 2977
    invoke-virtual {v9, v6}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v10, v9

    .line 2978
    .end local v9    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    .restart local v10    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    goto :goto_0

    .line 2982
    .end local v6    # "condition":Lcom/localytics/android/MarketingCondition;
    .end local v7    # "conditionId":I
    .end local v11    # "name":Ljava/lang/String;
    .end local v12    # "operator":Ljava/lang/String;
    .end local v13    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_0
    if-eqz v8, :cond_1

    .line 2984
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 2985
    const/4 v8, 0x0

    .line 2989
    :cond_1
    return-object v10

    .line 2982
    .end local v10    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    .restart local v9    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    :catchall_0
    move-exception v0

    :goto_2
    if-eqz v8, :cond_2

    .line 2984
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 2985
    const/4 v8, 0x0

    :cond_2
    throw v0

    .line 2982
    .end local v9    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    .restart local v10    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    :catchall_1
    move-exception v0

    move-object v9, v10

    .end local v10    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    .restart local v9    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    goto :goto_2

    .end local v9    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    .restart local v7    # "conditionId":I
    .restart local v10    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    .restart local v11    # "name":Ljava/lang/String;
    .restart local v12    # "operator":Ljava/lang/String;
    .restart local v13    # "values":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/lang/String;>;"
    :cond_3
    move-object v9, v10

    .end local v10    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    .restart local v9    # "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    goto :goto_1
.end method

.method private _getMarketingMessageMaps(Ljava/lang/String;)Ljava/util/List;
    .locals 10
    .param p1, "eventName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/localytics/android/MarketingMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2441
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    .line 2443
    .local v3, "marketingMessageMaps":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/localytics/android/MarketingMessage;>;"
    const/4 v0, 0x0

    .line 2446
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v6, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v6}, Lcom/localytics/android/LocalyticsDao;->getCurrentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    .line 2447
    .local v4, "now":Ljava/lang/String;
    const-string v6, "SELECT * FROM %s AS r LEFT OUTER JOIN %s AS re ON r.%s=re.%s WHERE %s > ? AND %s = ? GROUP BY r.%s;"

    const/4 v7, 0x7

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string v9, "marketing_rules"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    const-string v9, "marketing_ruleevent"

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string v9, "_id"

    aput-object v9, v7, v8

    const/4 v8, 0x3

    const-string v9, "rule_id_ref"

    aput-object v9, v7, v8

    const/4 v8, 0x4

    const-string v9, "expiration"

    aput-object v9, v7, v8

    const/4 v8, 0x5

    const-string v9, "event_name"

    aput-object v9, v7, v8

    const/4 v8, 0x6

    const-string v9, "_id"

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 2458
    .local v5, "sql":Ljava/lang/String;
    iget-object v6, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    iget-object v6, v6, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v4, v7, v8

    const/4 v8, 0x1

    aput-object p1, v7, v8

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 2460
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v6

    if-ge v1, v6, :cond_0

    .line 2462
    invoke-interface {v0, v1}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 2464
    new-instance v2, Lcom/localytics/android/MarketingMessage;

    invoke-direct {v2}, Lcom/localytics/android/MarketingMessage;-><init>()V

    .line 2466
    .local v2, "marketingMessageMap":Lcom/localytics/android/MarketingMessage;
    const-string v6, "_id"

    const-string v7, "_id"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2467
    const-string v6, "campaign_id"

    const-string v7, "campaign_id"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2468
    const-string v6, "expiration"

    const-string v7, "expiration"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2469
    const-string v6, "display_seconds"

    const-string v7, "display_seconds"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2470
    const-string v6, "display_session"

    const-string v7, "display_session"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2471
    const-string v6, "version"

    const-string v7, "version"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2472
    const-string v6, "phone_location"

    const-string v7, "phone_location"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2473
    const-string v6, "phone_size_width"

    const-string v7, "phone_size_width"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2474
    const-string v6, "phone_size_height"

    const-string v7, "phone_size_height"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2475
    const-string v6, "tablet_location"

    const-string v7, "tablet_location"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2476
    const-string v6, "tablet_size_width"

    const-string v7, "tablet_size_width"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2477
    const-string v6, "tablet_size_height"

    const-string v7, "tablet_size_height"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2478
    const-string v6, "time_to_display"

    const-string v7, "time_to_display"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2479
    const-string v6, "internet_required"

    const-string v7, "internet_required"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2480
    const-string v6, "ab_test"

    const-string v7, "ab_test"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2481
    const-string v6, "rule_name_non_unique"

    const-string v7, "rule_name_non_unique"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2482
    const-string v6, "location"

    const-string v7, "location"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2483
    const-string v6, "devices"

    const-string v7, "devices"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2484
    const-string v6, "control_group"

    const-string v7, "control_group"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2485
    const-string v6, "schema_version"

    const-string v7, "schema_version"

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2487
    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2460
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 2492
    .end local v2    # "marketingMessageMap":Lcom/localytics/android/MarketingMessage;
    :cond_0
    if-eqz v0, :cond_1

    .line 2494
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 2498
    :cond_1
    return-object v3

    .line 2492
    .end local v1    # "i":I
    .end local v4    # "now":Ljava/lang/String;
    .end local v5    # "sql":Ljava/lang/String;
    :catchall_0
    move-exception v6

    if-eqz v0, :cond_2

    .line 2494
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v6
.end method

.method private _getRemoteFileURL(Lcom/localytics/android/MarketingMessage;)Ljava/lang/String;
    .locals 3
    .param p1, "marketingMessageMap"    # Lcom/localytics/android/MarketingMessage;

    .prologue
    .line 3069
    const-string v2, "devices"

    invoke-virtual {p1, v2}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 3071
    .local v0, "devices":Ljava/lang/String;
    const-string v2, "tablet"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    .line 3073
    const-string v2, "tablet_location"

    invoke-virtual {p1, v2}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 3084
    .local v1, "url":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 3075
    .end local v1    # "url":Ljava/lang/String;
    :cond_0
    const-string v2, "both"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_1

    .line 3077
    const-string v2, "phone_location"

    invoke-virtual {p1, v2}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .restart local v1    # "url":Ljava/lang/String;
    goto :goto_0

    .line 3081
    .end local v1    # "url":Ljava/lang/String;
    :cond_1
    const-string v2, "phone_location"

    invoke-virtual {p1, v2}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .restart local v1    # "url":Ljava/lang/String;
    goto :goto_0
.end method

.method private _getRuleIdFromCampaignId(I)I
    .locals 9
    .param p1, "campaignId"    # I

    .prologue
    .line 1890
    const/4 v7, 0x0

    .line 1891
    .local v7, "ruleId":I
    const/4 v6, 0x0

    .line 1894
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "marketing_rules"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v8, "campaign_id"

    aput-object v8, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1895
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1897
    const-string v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v7

    .line 1902
    :cond_0
    if-eqz v6, :cond_1

    .line 1904
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1905
    const/4 v6, 0x0

    .line 1908
    :cond_1
    return v7

    .line 1902
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 1904
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1905
    const/4 v6, 0x0

    :cond_2
    throw v0
.end method

.method private _getUnzipFileDirPath(I)Ljava/lang/String;
    .locals 8
    .param p1, "ruleId"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 3025
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3033
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v3}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3035
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3036
    const-string v3, ".localytics"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3037
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3038
    iget-object v3, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v3}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3039
    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3040
    const-string v3, "marketing_rule_%d"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3042
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 3044
    .local v2, "path":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 3047
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_1

    .line 3049
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-nez v3, :cond_1

    .line 3051
    const-string v3, "Could not create the directory %s for saving the decompressed file."

    new-array v4, v7, [Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 3052
    const/4 v2, 0x0

    .line 3056
    .end local v2    # "path":Ljava/lang/String;
    :cond_1
    return-object v2
.end method

.method private _getZipFileDirPath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 2999
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 3007
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v1}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3009
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3010
    const-string v1, ".localytics"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3011
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3012
    iget-object v1, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v1}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3014
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private _handlePushReceived(Landroid/content/Intent;)V
    .locals 27
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 226
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v24

    const-string v25, "ll"

    invoke-virtual/range {v24 .. v25}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 227
    .local v17, "llString":Ljava/lang/String;
    if-nez v17, :cond_1

    .line 229
    const-string v24, "Ignoring message that aren\'t from Localytics."

    invoke-static/range {v24 .. v24}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 358
    :cond_0
    :goto_0
    return-void

    .line 235
    :cond_1
    const/4 v9, 0x0

    .line 238
    .local v9, "campaignId":I
    :try_start_0
    new-instance v16, Lorg/json/JSONObject;

    invoke-direct/range {v16 .. v17}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 239
    .local v16, "llObject":Lorg/json/JSONObject;
    const-string v24, "ca"

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v9

    .line 247
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v24

    const-string v25, "message"

    invoke-virtual/range {v24 .. v25}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 248
    .local v18, "message":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Lcom/localytics/android/LocalyticsDao;->isPushDisabled()Z

    move-result v20

    .line 249
    .local v20, "pushDisabled":Z
    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v24

    if-nez v24, :cond_6

    const/4 v15, 0x1

    .line 250
    .local v15, "hasMessage":Z
    :goto_1
    if-nez v20, :cond_7

    if-eqz v15, :cond_7

    const/16 v22, 0x1

    .line 253
    .local v22, "shouldDisplay":Z
    :goto_2
    :try_start_1
    const-string v24, "cr"

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 254
    .local v12, "creativeId":Ljava/lang/String;
    const-string v24, "v"

    const-string v25, "1"

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 255
    .local v21, "serverSchemaVersion":Ljava/lang/String;
    const-string v24, "t"

    const/16 v25, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 256
    .local v13, "creativeType":Ljava/lang/String;
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v24

    if-eqz v24, :cond_2

    .line 258
    if-eqz v15, :cond_8

    .line 260
    const-string v13, "Alert"

    .line 268
    :cond_2
    :goto_3
    const-string v3, "Not Available"

    .line 269
    .local v3, "appContext":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Lcom/localytics/android/LocalyticsDao;->isAutoIntegrate()Z

    move-result v24

    if-eqz v24, :cond_3

    .line 271
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Lcom/localytics/android/LocalyticsDao;->isAppInForeground()Z

    move-result v24

    if-eqz v24, :cond_9

    .line 273
    const-string v3, "Foreground"

    .line 282
    :cond_3
    :goto_4
    if-eqz v15, :cond_b

    .line 284
    if-eqz v20, :cond_a

    const-string v11, "No"

    .line 291
    .local v11, "creativeDisplayed":Ljava/lang/String;
    :goto_5
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 292
    .local v7, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v24, "Campaign ID"

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v7, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    const-string v24, "Creative ID"

    move-object/from16 v0, v24

    invoke-virtual {v7, v0, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    const-string v24, "Creative Type"

    move-object/from16 v0, v24

    invoke-virtual {v7, v0, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    const-string v24, "Creative Displayed"

    move-object/from16 v0, v24

    invoke-virtual {v7, v0, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    const-string v25, "Push Notifications Enabled"

    if-eqz v20, :cond_c

    const-string v24, "No"

    :goto_6
    move-object/from16 v0, v25

    move-object/from16 v1, v24

    invoke-virtual {v7, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    const-string v24, "App Context"

    move-object/from16 v0, v24

    invoke-virtual {v7, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    const-string v24, "Schema Version - Client"

    const/16 v25, 0x3

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v7, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    const-string v24, "Schema Version - Server"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v7, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    const-string v24, "x"

    const/16 v25, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v24

    if-nez v24, :cond_4

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    move-object/from16 v24, v0

    const-string v25, "Localytics Push Received"

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-interface {v0, v1, v7}, Lcom/localytics/android/LocalyticsDao;->tagEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 305
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Lcom/localytics/android/LocalyticsDao;->upload()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 313
    .end local v3    # "appContext":Ljava/lang/String;
    .end local v7    # "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "creativeDisplayed":Ljava/lang/String;
    .end local v12    # "creativeId":Ljava/lang/String;
    .end local v13    # "creativeType":Ljava/lang/String;
    .end local v21    # "serverSchemaVersion":Ljava/lang/String;
    :cond_4
    :goto_7
    if-nez v22, :cond_d

    .line 315
    if-eqz v20, :cond_5

    .line 317
    const-string v24, "Got push notification while push is disabled."

    invoke-static/range {v24 .. v24}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 320
    :cond_5
    if-nez v15, :cond_0

    .line 322
    const-string v24, "Got push notification without a message."

    invoke-static/range {v24 .. v24}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    goto/16 :goto_0

    .line 241
    .end local v15    # "hasMessage":Z
    .end local v16    # "llObject":Lorg/json/JSONObject;
    .end local v18    # "message":Ljava/lang/String;
    .end local v20    # "pushDisabled":Z
    .end local v22    # "shouldDisplay":Z
    :catch_0
    move-exception v14

    .line 243
    .local v14, "e":Lorg/json/JSONException;
    const-string v24, "Failed to get campaign id from payload, ignoring message"

    invoke-static/range {v24 .. v24}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    goto/16 :goto_0

    .line 249
    .end local v14    # "e":Lorg/json/JSONException;
    .restart local v16    # "llObject":Lorg/json/JSONObject;
    .restart local v18    # "message":Ljava/lang/String;
    .restart local v20    # "pushDisabled":Z
    :cond_6
    const/4 v15, 0x0

    goto/16 :goto_1

    .line 250
    .restart local v15    # "hasMessage":Z
    :cond_7
    const/16 v22, 0x0

    goto/16 :goto_2

    .line 264
    .restart local v12    # "creativeId":Ljava/lang/String;
    .restart local v13    # "creativeType":Ljava/lang/String;
    .restart local v21    # "serverSchemaVersion":Ljava/lang/String;
    .restart local v22    # "shouldDisplay":Z
    :cond_8
    :try_start_2
    const-string v13, "Silent"

    goto/16 :goto_3

    .line 277
    .restart local v3    # "appContext":Ljava/lang/String;
    :cond_9
    const-string v3, "Background"

    goto/16 :goto_4

    .line 284
    :cond_a
    const-string v11, "Yes"

    goto/16 :goto_5

    .line 288
    :cond_b
    const-string v11, "Not Applicable"

    .restart local v11    # "creativeDisplayed":Ljava/lang/String;
    goto/16 :goto_5

    .line 296
    .restart local v7    # "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_c
    const-string v24, "Yes"
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_6

    .line 308
    .end local v3    # "appContext":Ljava/lang/String;
    .end local v7    # "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "creativeDisplayed":Ljava/lang/String;
    .end local v12    # "creativeId":Ljava/lang/String;
    .end local v13    # "creativeType":Ljava/lang/String;
    .end local v21    # "serverSchemaVersion":Ljava/lang/String;
    :catch_1
    move-exception v14

    .line 310
    .restart local v14    # "e":Lorg/json/JSONException;
    const-string v24, "Failed to get campaign id or creative id from payload"

    invoke-static/range {v24 .. v24}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    goto :goto_7

    .line 328
    .end local v14    # "e":Lorg/json/JSONException;
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v3

    .line 329
    .local v3, "appContext":Landroid/content/Context;
    const-string v5, ""

    .line 330
    .local v5, "appName":Ljava/lang/CharSequence;
    invoke-static {v3}, Lcom/localytics/android/DatapointHelper;->getLocalyticsNotificationIcon(Landroid/content/Context;)I

    move-result v4

    .line 333
    .local v4, "appIcon":I
    :try_start_3
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v24

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v25

    const/16 v26, 0x0

    invoke-virtual/range {v24 .. v26}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v6

    .line 334
    .local v6, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v6}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_2

    move-result-object v5

    .line 342
    .end local v6    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    :goto_8
    new-instance v23, Landroid/content/Intent;

    const-class v24, Lcom/localytics/android/PushTrackingActivity;

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-direct {v0, v3, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 343
    .local v23, "trackingIntent":Landroid/content/Intent;
    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    .line 344
    const/16 v24, 0x0

    const/high16 v25, 0x8000000

    move/from16 v0, v24

    move-object/from16 v1, v23

    move/from16 v2, v25

    invoke-static {v3, v0, v1, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v10

    .line 346
    .local v10, "contentIntent":Landroid/app/PendingIntent;
    new-instance v24, Landroid/support/v4/app/NotificationCompat$Builder;

    move-object/from16 v0, v24

    invoke-direct {v0, v3}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v10}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v24

    const/16 v25, -0x1

    invoke-virtual/range {v24 .. v25}, Landroid/support/v4/app/NotificationCompat$Builder;->setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v24

    new-instance v25, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct/range {v25 .. v25}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v24

    const/16 v25, 0x1

    invoke-virtual/range {v24 .. v25}, Landroid/support/v4/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v8

    .line 356
    .local v8, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    const-string v24, "notification"

    move-object/from16 v0, v24

    invoke-virtual {v3, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/app/NotificationManager;

    .line 357
    .local v19, "notificationManager":Landroid/app/NotificationManager;
    invoke-virtual {v8}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v24

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v9, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    goto/16 :goto_0

    .line 336
    .end local v8    # "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    .end local v10    # "contentIntent":Landroid/app/PendingIntent;
    .end local v19    # "notificationManager":Landroid/app/NotificationManager;
    .end local v23    # "trackingIntent":Landroid/content/Intent;
    :catch_2
    move-exception v14

    .line 338
    .local v14, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v24, "Failed to get application name, icon, or launch intent"

    invoke-static/range {v24 .. v24}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    goto :goto_8
.end method

.method private _isConnectingToInternet()Z
    .locals 8

    .prologue
    .line 2817
    iget-object v6, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v6}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "connectivity"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/ConnectivityManager;

    .line 2818
    .local v2, "connectivity":Landroid/net/ConnectivityManager;
    if-eqz v2, :cond_1

    .line 2820
    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getAllNetworkInfo()[Landroid/net/NetworkInfo;

    move-result-object v4

    .line 2821
    .local v4, "info":[Landroid/net/NetworkInfo;
    if-eqz v4, :cond_1

    .line 2823
    move-object v1, v4

    .local v1, "arr$":[Landroid/net/NetworkInfo;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v5, :cond_1

    aget-object v0, v1, v3

    .line 2825
    .local v0, "anInfo":Landroid/net/NetworkInfo;
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v6

    sget-object v7, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v6, v7, :cond_0

    .line 2827
    const/4 v6, 0x1

    .line 2832
    .end local v0    # "anInfo":Landroid/net/NetworkInfo;
    .end local v1    # "arr$":[Landroid/net/NetworkInfo;
    .end local v3    # "i$":I
    .end local v4    # "info":[Landroid/net/NetworkInfo;
    .end local v5    # "len$":I
    :goto_1
    return v6

    .line 2823
    .restart local v0    # "anInfo":Landroid/net/NetworkInfo;
    .restart local v1    # "arr$":[Landroid/net/NetworkInfo;
    .restart local v3    # "i$":I
    .restart local v4    # "info":[Landroid/net/NetworkInfo;
    .restart local v5    # "len$":I
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 2832
    .end local v0    # "anInfo":Landroid/net/NetworkInfo;
    .end local v1    # "arr$":[Landroid/net/NetworkInfo;
    .end local v3    # "i$":I
    .end local v4    # "info":[Landroid/net/NetworkInfo;
    .end local v5    # "len$":I
    :cond_1
    const/4 v6, 0x0

    goto :goto_1
.end method

.method private _isMarketingMessageSatisfiedConditions(Lcom/localytics/android/MarketingMessage;Ljava/util/Map;)Z
    .locals 7
    .param p1, "marketingMessage"    # Lcom/localytics/android/MarketingMessage;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/localytics/android/MarketingMessage;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 2844
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x1

    .line 2847
    .local v5, "satisfied":Z
    const-string v6, "campaign_id"

    invoke-virtual {p1, v6}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 2848
    .local v0, "campaignId":I
    invoke-direct {p0, v0}, Lcom/localytics/android/MarketingHandler;->_getRuleIdFromCampaignId(I)I

    move-result v4

    .line 2851
    .local v4, "ruleId":I
    invoke-direct {p0, v4}, Lcom/localytics/android/MarketingHandler;->_getMarketingConditions(I)Ljava/util/Vector;

    move-result-object v3

    .line 2854
    .local v3, "marketingConditions":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingCondition;>;"
    if-eqz v3, :cond_1

    .line 2856
    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/localytics/android/MarketingCondition;

    .line 2858
    .local v1, "condition":Lcom/localytics/android/MarketingCondition;
    invoke-virtual {v1, p2}, Lcom/localytics/android/MarketingCondition;->isSatisfiedByAttributes(Ljava/util/Map;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 2860
    const/4 v5, 0x0

    .line 2866
    .end local v1    # "condition":Lcom/localytics/android/MarketingCondition;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    return v5
.end method

.method private _parseMarketingMessage(Lcom/localytics/android/MarketingMessage;)Landroid/content/ContentValues;
    .locals 8
    .param p1, "marketingMessage"    # Lcom/localytics/android/MarketingMessage;

    .prologue
    const/4 v5, 0x1

    .line 1652
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 1654
    .local v4, "values":Landroid/content/ContentValues;
    const-string v6, "campaign_id"

    const-string v7, "campaign_id"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1655
    const-string v6, "expiration"

    const-string v7, "expiration"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1656
    const-string v6, "display_seconds"

    const-string v7, "display_seconds"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1657
    const-string v6, "display_session"

    const-string v7, "display_session"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1658
    const-string v6, "version"

    const-string v7, "version"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1659
    const-string v6, "phone_location"

    const-string v7, "phone_location"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1660
    const-string v6, "phone_size"

    invoke-static {p1, v6}, Lcom/localytics/android/JsonHelper;->getSafeMapFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 1661
    .local v0, "phoneSize":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "phone_size_width"

    const-string v7, "width"

    invoke-static {v0, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1662
    const-string v6, "phone_size_height"

    const-string v7, "height"

    invoke-static {v0, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1663
    const-string v6, "tablet_size"

    invoke-static {p1, v6}, Lcom/localytics/android/JsonHelper;->getSafeMapFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    .line 1664
    .local v3, "tabletSize":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v6, "tablet_location"

    const-string v7, "tablet_location"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1665
    const-string v6, "tablet_size_width"

    const-string v7, "width"

    invoke-static {v3, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1666
    const-string v6, "tablet_size_height"

    const-string v7, "height"

    invoke-static {v3, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1667
    const-string v6, "time_to_display"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1668
    const-string v6, "internet_required"

    const-string v7, "internet_required"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeBooleanFromMap(Ljava/util/Map;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    :goto_0
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v6, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1669
    const-string v5, "ab_test"

    const-string v6, "ab"

    invoke-static {p1, v6}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1670
    const-string v5, "rule_name"

    invoke-static {p1, v5}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1671
    .local v1, "ruleName":Ljava/lang/String;
    const-string v5, "rule_name_non_unique"

    invoke-virtual {v4, v5, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1672
    const-string v5, "rule_name"

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1673
    const-string v5, "location"

    const-string v6, "location"

    invoke-static {p1, v6}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1674
    const-string v5, "devices"

    const-string v6, "devices"

    invoke-static {p1, v6}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1675
    const-string v5, "control_group"

    const-string v6, "control_group"

    invoke-static {p1, v6}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1676
    iget-object v5, p0, Lcom/localytics/android/MarketingHandler;->mConfigurations:Ljava/util/Map;

    if-eqz v5, :cond_0

    .line 1678
    iget-object v5, p0, Lcom/localytics/android/MarketingHandler;->mConfigurations:Ljava/util/Map;

    const-string v6, "schema_version"

    invoke-static {v5, v6}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v2

    .line 1679
    .local v2, "schemaVersion":I
    if-lez v2, :cond_0

    .line 1681
    const-string v5, "schema_version"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1685
    .end local v2    # "schemaVersion":I
    :cond_0
    return-object v4

    .line 1668
    .end local v1    # "ruleName":Ljava/lang/String;
    :cond_1
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private _retrieveDisplayingCandidate(Ljava/util/List;Ljava/util/Map;)Lcom/localytics/android/MarketingMessage;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/localytics/android/MarketingMessage;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/localytics/android/MarketingMessage;"
        }
    .end annotation

    .prologue
    .local p1, "marketingMessages":Ljava/util/List;, "Ljava/util/List<Lcom/localytics/android/MarketingMessage;>;"
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x1

    .line 2512
    const/4 v0, 0x0

    .line 2514
    .local v0, "candidate":Lcom/localytics/android/MarketingMessage;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/localytics/android/MarketingMessage;

    .line 2517
    .local v3, "marketingMessage":Lcom/localytics/android/MarketingMessage;
    const-string v4, "internet_required"

    invoke-virtual {v3, v4}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v4, v5, :cond_2

    move v2, v5

    .line 2518
    .local v2, "internetRequired":Z
    :goto_1
    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/localytics/android/MarketingHandler;->_isConnectingToInternet()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2524
    :cond_1
    invoke-direct {p0, v3, p2}, Lcom/localytics/android/MarketingHandler;->_isMarketingMessageSatisfiedConditions(Lcom/localytics/android/MarketingMessage;Ljava/util/Map;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2529
    move-object v0, v3

    .line 2530
    goto :goto_0

    .line 2517
    .end local v2    # "internetRequired":Z
    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    .line 2532
    .end local v3    # "marketingMessage":Lcom/localytics/android/MarketingMessage;
    :cond_3
    if-eqz v0, :cond_4

    invoke-direct {p0, v0}, Lcom/localytics/android/MarketingHandler;->_updateDisplayingCandidate(Lcom/localytics/android/MarketingMessage;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 2534
    :cond_4
    const/4 v0, 0x0

    .line 2537
    .end local v0    # "candidate":Lcom/localytics/android/MarketingMessage;
    :cond_5
    return-object v0
.end method

.method private _saveMarketingConditions(JLjava/util/List;)V
    .locals 19
    .param p1, "ruleId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1690
    .local p3, "conditions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    if-nez p3, :cond_1

    .line 1726
    :cond_0
    return-void

    .line 1696
    :cond_1
    invoke-direct/range {p0 .. p2}, Lcom/localytics/android/MarketingHandler;->_getConditionIdFromRuleId(J)[J

    move-result-object v6

    .line 1697
    .local v6, "conditionIds":[J
    move-object v2, v6

    .local v2, "arr$":[J
    array-length v9, v2

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_0
    if-ge v8, v9, :cond_2

    aget-wide v4, v2, v8

    .line 1699
    .local v4, "conditionId":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v13, "marketing_condition_values"

    const-string v14, "%s = ?"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v17, "condition_id_ref"

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-virtual {v12, v13, v14, v15}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1697
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 1701
    .end local v4    # "conditionId":J
    :cond_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v13, "marketing_conditions"

    const-string v14, "%s = ?"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v17, "rule_id_ref"

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-virtual {v12, v13, v14, v15}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1703
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .local v10, "obj":Ljava/lang/Object;
    move-object v3, v10

    .line 1706
    check-cast v3, Ljava/util/List;

    .line 1710
    .local v3, "condition":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 1711
    .local v11, "values":Landroid/content/ContentValues;
    const-string v13, "attribute_name"

    const/4 v12, 0x0

    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v11, v13, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1712
    const-string v13, "operator"

    const/4 v12, 0x1

    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v11, v13, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1713
    const-string v12, "rule_id_ref"

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1714
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v13, "marketing_conditions"

    invoke-virtual {v12, v13, v11}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    .line 1718
    .restart local v4    # "conditionId":J
    const/4 v7, 0x2

    .local v7, "i":I
    :goto_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v12

    if-ge v7, v12, :cond_3

    .line 1720
    new-instance v11, Landroid/content/ContentValues;

    .end local v11    # "values":Landroid/content/ContentValues;
    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 1721
    .restart local v11    # "values":Landroid/content/ContentValues;
    const-string v12, "value"

    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-static {v13}, Lcom/localytics/android/JsonHelper;->getSafeStringFromValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1722
    const-string v12, "condition_id_ref"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1723
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v13, "marketing_condition_values"

    invoke-virtual {v12, v13, v11}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 1718
    add-int/lit8 v7, v7, 0x1

    goto :goto_1
.end method

.method private _tagAmpActionEventForControlGroup(Lcom/localytics/android/MarketingMessage;)V
    .locals 7
    .param p1, "marketingMessage"    # Lcom/localytics/android/MarketingMessage;

    .prologue
    .line 2122
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    .line 2124
    .local v2, "impressionAttributes":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v5, "campaign_id"

    invoke-virtual {p1, v5}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2125
    .local v1, "campaignId":Ljava/lang/String;
    const-string v5, "rule_name_non_unique"

    invoke-virtual {p1, v5}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2126
    .local v3, "ruleName":Ljava/lang/String;
    const-string v5, "schema_version"

    invoke-virtual {p1, v5}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2127
    .local v4, "schemaVersion":Ljava/lang/String;
    const-string v5, "ab_test"

    invoke-virtual {p1, v5}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2128
    .local v0, "ab":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 2130
    const-string v5, "ampAB"

    invoke-virtual {v2, v5, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2133
    :cond_0
    const-string v5, "ampAction"

    const-string v6, "control"

    invoke-virtual {v2, v5, v6}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2134
    const-string v5, "type"

    const-string v6, "Control"

    invoke-virtual {v2, v5, v6}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2135
    const-string v5, "ampCampaignId"

    invoke-virtual {v2, v5, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2136
    const-string v5, "ampCampaign"

    invoke-virtual {v2, v5, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2137
    const-string v5, "Schema Version - Client"

    const/4 v6, 0x3

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2138
    const-string v5, "Schema Version - Server"

    invoke-virtual {v2, v5, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2139
    iget-object v5, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    const-string v6, "ampView"

    invoke-interface {v5, v6, v2}, Lcom/localytics/android/LocalyticsDao;->tagEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 2140
    return-void
.end method

.method private _timeStringToSeconds(Ljava/lang/String;)I
    .locals 4
    .param p1, "time"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 1226
    :try_start_0
    const-string v2, ":"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 1227
    .local v0, "components":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v2, v0, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    mul-int/lit16 v2, v2, 0xe10

    const/4 v3, 0x1

    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    mul-int/lit8 v3, v3, 0x3c

    add-int/2addr v2, v3

    .line 1231
    .end local v0    # "components":[Ljava/lang/String;
    :goto_0
    return v2

    .line 1229
    :catch_0
    move-exception v1

    .line 1231
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, -0x1

    goto :goto_0
.end method

.method private _updateDisplayingCandidate(Lcom/localytics/android/MarketingMessage;)Z
    .locals 14
    .param p1, "candidate"    # Lcom/localytics/android/MarketingMessage;

    .prologue
    .line 2874
    const/4 v5, 0x0

    .line 2875
    .local v5, "localHtmlURL":Ljava/lang/String;
    const-string v10, "_id"

    invoke-virtual {p1, v10}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 2876
    .local v7, "ruleId":I
    invoke-direct {p0}, Lcom/localytics/android/MarketingHandler;->_getZipFileDirPath()Ljava/lang/String;

    move-result-object v9

    .line 2877
    .local v9, "zipFileDirPath":Ljava/lang/String;
    invoke-direct {p0, v7}, Lcom/localytics/android/MarketingHandler;->_getUnzipFileDirPath(I)Ljava/lang/String;

    move-result-object v8

    .line 2878
    .local v8, "unzipFileDirPath":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/localytics/android/MarketingHandler;->_getRemoteFileURL(Lcom/localytics/android/MarketingMessage;)Ljava/lang/String;

    move-result-object v10

    const-string v11, ".zip"

    invoke-virtual {v10, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    .line 2881
    .local v3, "isZipped":Z
    invoke-direct {p0, v7, v3}, Lcom/localytics/android/MarketingHandler;->_doesCreativeExist(IZ)Z

    move-result v10

    if-nez v10, :cond_0

    .line 2884
    invoke-static {p1}, Lcom/localytics/android/MarketingDownloader;->getRemoteFileURL(Lcom/localytics/android/MarketingMessage;)Ljava/lang/String;

    move-result-object v6

    .line 2885
    .local v6, "remoteFileURL":Ljava/lang/String;
    int-to-long v10, v7

    iget-object v12, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v12}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v12

    iget-object v13, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v13}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v13

    invoke-static {v10, v11, v3, v12, v13}, Lcom/localytics/android/MarketingDownloader;->getLocalFileURL(JZLandroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2888
    .local v4, "localFileURL":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_0

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 2890
    const/4 v10, 0x1

    iget-object v11, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v11}, Lcom/localytics/android/LocalyticsDao;->getProxy()Ljava/net/Proxy;

    move-result-object v11

    invoke-static {v6, v4, v10, v11}, Lcom/localytics/android/MarketingDownloader;->downloadFile(Ljava/lang/String;Ljava/lang/String;ZLjava/net/Proxy;)Ljava/lang/String;

    .line 2895
    .end local v4    # "localFileURL":Ljava/lang/String;
    .end local v6    # "remoteFileURL":Ljava/lang/String;
    :cond_0
    if-eqz v3, :cond_2

    .line 2898
    const-string v10, "amp_rule_%d.zip"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v9, v8, v10}, Lcom/localytics/android/MarketingHandler;->_decompressZipFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 2901
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "file://"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "index.html"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2909
    :cond_1
    :goto_0
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 2911
    const/4 v10, 0x0

    .line 2945
    :goto_1
    return v10

    .line 2906
    :cond_2
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "file://"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "index.html"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0

    .line 2919
    :cond_3
    const-string v10, "devices"

    invoke-virtual {p1, v10}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 2921
    .local v0, "devices":Ljava/lang/String;
    const-string v10, "tablet"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 2923
    const-string v10, "tablet_size_width"

    invoke-virtual {p1, v10}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 2924
    .local v2, "displayWidth":I
    const-string v10, "tablet_size_height"

    invoke-virtual {p1, v10}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 2940
    .local v1, "displayHeight":I
    :goto_2
    const-string v10, "html_url"

    invoke-virtual {p1, v10, v5}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2941
    const-string v10, "base_path"

    invoke-virtual {p1, v10, v8}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2942
    const-string v10, "display_width"

    int-to-float v11, v2

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-virtual {p1, v10, v11}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2943
    const-string v10, "display_height"

    int-to-float v11, v1

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-virtual {p1, v10, v11}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2945
    const/4 v10, 0x1

    goto :goto_1

    .line 2926
    .end local v1    # "displayHeight":I
    .end local v2    # "displayWidth":I
    :cond_4
    const-string v10, "both"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 2928
    const-string v10, "phone_size_width"

    invoke-virtual {p1, v10}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 2929
    .restart local v2    # "displayWidth":I
    const-string v10, "phone_size_height"

    invoke-virtual {p1, v10}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .restart local v1    # "displayHeight":I
    goto :goto_2

    .line 2933
    .end local v1    # "displayHeight":I
    .end local v2    # "displayWidth":I
    :cond_5
    const-string v10, "phone_size_width"

    invoke-virtual {p1, v10}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 2934
    .restart local v2    # "displayWidth":I
    const-string v10, "phone_size_height"

    invoke-virtual {p1, v10}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .restart local v1    # "displayHeight":I
    goto :goto_2
.end method

.method static synthetic access$100(Lcom/localytics/android/MarketingHandler;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/MarketingHandler;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/localytics/android/MarketingHandler;->__showMarketingTest()V

    return-void
.end method

.method static synthetic access$1000(Lcom/localytics/android/MarketingHandler;Ljava/util/Map;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingHandler;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lcom/localytics/android/MarketingHandler;->_getJavaScriptClientCallbacks(Ljava/util/Map;)Landroid/util/SparseArray;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1100()Ljava/util/List;
    .locals 1

    .prologue
    .line 76
    sget-object v0, Lcom/localytics/android/MarketingHandler;->JS_STRINGS_THAT_MEAN_NULL:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lcom/localytics/android/MarketingHandler;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/MarketingHandler;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lcom/localytics/android/MarketingHandler;->_handlePushReceived(Landroid/content/Intent;)V

    return-void
.end method

.method static synthetic access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingHandler;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    return-object v0
.end method

.method static synthetic access$400(Lcom/localytics/android/MarketingHandler;)Z
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingHandler;

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/localytics/android/MarketingHandler;->mCampaignDisplaying:Z

    return v0
.end method

.method static synthetic access$402(Lcom/localytics/android/MarketingHandler;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/MarketingHandler;
    .param p1, "x1"    # Z

    .prologue
    .line 76
    iput-boolean p1, p0, Lcom/localytics/android/MarketingHandler;->mCampaignDisplaying:Z

    return p1
.end method

.method static synthetic access$500(Lcom/localytics/android/MarketingHandler;I)V
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/MarketingHandler;
    .param p1, "x1"    # I

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lcom/localytics/android/MarketingHandler;->setMarketingMessageAsNotDisplayed(I)V

    return-void
.end method

.method static synthetic access$602(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingRulesAdapter;)Lcom/localytics/android/MarketingRulesAdapter;
    .locals 0
    .param p0, "x0"    # Lcom/localytics/android/MarketingHandler;
    .param p1, "x1"    # Lcom/localytics/android/MarketingRulesAdapter;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler;->testCampaignsListAdapter:Lcom/localytics/android/MarketingRulesAdapter;

    return-object p1
.end method

.method static synthetic access$700(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingMessage;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingHandler;
    .param p1, "x1"    # Lcom/localytics/android/MarketingMessage;

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lcom/localytics/android/MarketingHandler;->_getRemoteFileURL(Lcom/localytics/android/MarketingMessage;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Lcom/localytics/android/MarketingHandler;IZ)Z
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingHandler;
    .param p1, "x1"    # I
    .param p2, "x2"    # Z

    .prologue
    .line 76
    invoke-direct {p0, p1, p2}, Lcom/localytics/android/MarketingHandler;->_doesCreativeExist(IZ)Z

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingMessage;)Z
    .locals 1
    .param p0, "x0"    # Lcom/localytics/android/MarketingHandler;
    .param p1, "x1"    # Lcom/localytics/android/MarketingMessage;

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lcom/localytics/android/MarketingHandler;->_updateDisplayingCandidate(Lcom/localytics/android/MarketingMessage;)Z

    move-result v0

    return v0
.end method

.method private setMarketingMessageAsNotDisplayed(I)V
    .locals 2
    .param p1, "campaignId"    # I

    .prologue
    .line 535
    const/16 v0, 0xcd

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/localytics/android/MarketingHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/MarketingHandler;->queueMessage(Landroid/os/Message;)Z

    .line 536
    return-void
.end method


# virtual methods
.method _additionalFCDatesAndTimesRulesValidation(Ljava/util/List;Ljava/text/SimpleDateFormat;)Z
    .locals 6
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "formatter"    # Ljava/text/SimpleDateFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/text/SimpleDateFormat;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 960
    .local p1, "rules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz p1, :cond_1

    .line 962
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 966
    .local v3, "rule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    sget-object v5, Lcom/localytics/android/Constants;->START_KEY:Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p2, v5}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    .line 967
    .local v4, "startTime":Ljava/util/Date;
    sget-object v5, Lcom/localytics/android/Constants;->END_KEY:Ljava/lang/String;

    invoke-interface {v3, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p2, v5}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 968
    .local v1, "endTime":Ljava/util/Date;
    invoke-virtual {v4, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 970
    new-instance v5, Ljava/lang/Exception;

    invoke-direct {v5}, Ljava/lang/Exception;-><init>()V

    throw v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 973
    .end local v1    # "endTime":Ljava/util/Date;
    .end local v4    # "startTime":Ljava/util/Date;
    :catch_0
    move-exception v0

    .line 975
    .local v0, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    .line 980
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "rule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    return v5

    :cond_1
    const/4 v5, 0x1

    goto :goto_0
.end method

.method _additionalFCDisplayFrequencyRulesValidation(Ljava/util/List;)Z
    .locals 4
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "displayFrequencyRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    const/4 v3, 0x1

    .line 944
    if-eqz p1, :cond_2

    .line 946
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 948
    .local v0, "displayFrequencyRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    sget-object v2, Lcom/localytics/android/Constants;->DAYS_KEY:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-lt v2, v3, :cond_1

    sget-object v2, Lcom/localytics/android/Constants;->COUNT_KEY:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ge v2, v3, :cond_0

    .line 950
    :cond_1
    const/4 v2, 0x0

    .line 955
    .end local v0    # "displayFrequencyRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :goto_0
    return v2

    :cond_2
    move v2, v3

    goto :goto_0
.end method

.method _additionalFCWeekdaysRulesValidation(Ljava/util/List;)Z
    .locals 5
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "weekdaysRules":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .line 985
    if-eqz p1, :cond_3

    .line 987
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x7

    if-le v3, v4, :cond_1

    .line 1003
    :cond_0
    :goto_0
    return v2

    .line 993
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 995
    .local v1, "weekday":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-ltz v3, :cond_0

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x6

    if-le v3, v4, :cond_2

    goto :goto_0

    .line 1003
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "weekday":Ljava/lang/Integer;
    :cond_3
    const/4 v2, 0x1

    goto :goto_0
.end method

.method _augmentBlackoutRule(Ljava/util/Map;)Ljava/util/Map;
    .locals 7
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1129
    .local p1, "blackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 1130
    .local v0, "augmentedRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v4, Lcom/localytics/android/Constants;->DATES_KEY:Ljava/lang/String;

    invoke-interface {p1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    .line 1131
    .local v1, "hasDates":Z
    sget-object v4, Lcom/localytics/android/Constants;->WEEKDAYS_KEY:Ljava/lang/String;

    invoke-interface {p1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    .line 1132
    .local v3, "hasWeekdays":Z
    sget-object v4, Lcom/localytics/android/Constants;->TIMES_KEY:Ljava/lang/String;

    invoke-interface {p1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    .line 1134
    .local v2, "hasTimes":Z
    if-nez v1, :cond_0

    if-eqz v3, :cond_2

    :cond_0
    if-nez v2, :cond_2

    .line 1136
    sget-object v4, Lcom/localytics/android/Constants;->TIMES_KEY:Ljava/lang/String;

    new-instance v5, Ljava/util/ArrayList;

    sget-object v6, Lcom/localytics/android/MarketingHandler;->AUGMENTED_BLACKOUT_TIMES_RULE:Ljava/util/List;

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1143
    :cond_1
    :goto_0
    return-object v0

    .line 1138
    :cond_2
    if-eqz v2, :cond_1

    if-nez v1, :cond_1

    if-nez v3, :cond_1

    .line 1140
    sget-object v4, Lcom/localytics/android/Constants;->WEEKDAYS_KEY:Ljava/lang/String;

    new-instance v5, Ljava/util/ArrayList;

    sget-object v6, Lcom/localytics/android/MarketingHandler;->AUGMENTED_BLACKOUT_WEEKDAYS_RULE:Ljava/util/List;

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method _checkFrequencyCappingRuleArray(Ljava/util/List;[Ljava/lang/String;)Z
    .locals 10
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "subKeys"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<*>;[",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "rulesList":Ljava/util/List;, "Ljava/util/List<*>;"
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 914
    if-eqz p1, :cond_3

    .line 916
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v9

    if-ge v9, v8, :cond_0

    .line 939
    :goto_0
    return v7

    .line 922
    :cond_0
    array-length v9, p2

    if-lez v9, :cond_3

    .line 924
    move-object v4, p1

    .line 925
    .local v4, "listOfMaps":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map;>;"
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    move v2, v1

    .end local v1    # "i$":I
    .local v2, "i$":I
    :goto_1
    if-ge v2, v3, :cond_3

    aget-object v6, v0, v2

    .line 927
    .local v6, "subKey":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .end local v2    # "i$":I
    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 929
    .local v5, "m":Ljava/util/Map;
    invoke-interface {v5, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    goto :goto_0

    .line 925
    .end local v5    # "m":Ljava/util/Map;
    :cond_2
    add-int/lit8 v1, v2, 0x1

    .local v1, "i$":I
    move v2, v1

    .end local v1    # "i$":I
    .restart local v2    # "i$":I
    goto :goto_1

    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "listOfMaps":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map;>;"
    .end local v6    # "subKey":Ljava/lang/String;
    :cond_3
    move v7, v8

    .line 939
    goto :goto_0
.end method

.method _deleteFrequencyCappingRule(Ljava/lang/Integer;)Z
    .locals 9
    .param p1, "campaignId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1046
    :try_start_0
    iget-object v3, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v4, "frequency_capping_rules"

    const-string v5, "%s = ?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v8, "campaign_id"

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v3, v4, v5, v6}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1051
    :goto_0
    return v1

    .line 1049
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    move v1, v2

    .line 1051
    goto :goto_0
.end method

.method protected _deleteUploadedData(I)V
    .locals 0
    .param p1, "maxRowToDelete"    # I

    .prologue
    .line 571
    return-void
.end method

.method _filterMarketingMessagesDisqualifiedByFrequencyCappingRules(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/localytics/android/MarketingMessage;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/localytics/android/MarketingMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1238
    .local p1, "candidates":Ljava/util/List;, "Ljava/util/List<Lcom/localytics/android/MarketingMessage;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 1239
    .local v1, "eligibleCampaignIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/localytics/android/MarketingMessage;

    .line 1241
    .local v3, "message":Lcom/localytics/android/MarketingMessage;
    const-string v5, "campaign_id"

    invoke-virtual {v3, v5}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-interface {v1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1244
    .end local v3    # "message":Lcom/localytics/android/MarketingMessage;
    :cond_0
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 1246
    sget-object v5, Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;->MAX_COUNT:Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;

    invoke-virtual {p0, v5, v1}, Lcom/localytics/android/MarketingHandler;->_getDisqualifiedCampaigns(Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 1248
    :cond_1
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v5

    if-lez v5, :cond_2

    .line 1250
    sget-object v5, Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;->FREQUENCY:Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;

    invoke-virtual {p0, v5, v1}, Lcom/localytics/android/MarketingHandler;->_getDisqualifiedCampaigns(Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 1252
    :cond_2
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v5

    if-lez v5, :cond_3

    .line 1254
    sget-object v5, Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;->BLACKOUT:Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;

    invoke-virtual {p0, v5, v1}, Lcom/localytics/android/MarketingHandler;->_getDisqualifiedCampaigns(Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 1256
    :cond_3
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v5

    if-lez v5, :cond_4

    .line 1258
    sget-object v5, Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;->FREQUENCY:Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;

    invoke-virtual {p0, v5, v1}, Lcom/localytics/android/MarketingHandler;->_getGloballyDisqualifiedCampaigns(Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 1260
    :cond_4
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v5

    if-lez v5, :cond_5

    .line 1262
    sget-object v5, Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;->BLACKOUT:Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;

    invoke-virtual {p0, v5, v1}, Lcom/localytics/android/MarketingHandler;->_getGloballyDisqualifiedCampaigns(Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 1265
    :cond_5
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 1267
    .local v4, "stillEligibleCandidates":Ljava/util/List;, "Ljava/util/List<Lcom/localytics/android/MarketingMessage;>;"
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v5

    if-lez v5, :cond_7

    .line 1269
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/localytics/android/MarketingMessage;

    .line 1271
    .restart local v3    # "message":Lcom/localytics/android/MarketingMessage;
    const-string v5, "campaign_id"

    invoke-virtual {v3, v5}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1272
    .local v0, "campaignId":I
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 1274
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1279
    .end local v0    # "campaignId":I
    .end local v3    # "message":Lcom/localytics/android/MarketingMessage;
    :cond_7
    return-object v4
.end method

.method protected _getDataToUpload()Ljava/util/TreeMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1953
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 1954
    .local v0, "tree":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1955
    return-object v0
.end method

.method _getDisqualifiedCampaigns(Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;Ljava/util/Set;)Ljava/util/Set;
    .locals 13
    .param p1, "filter"    # Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Set;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .local p2, "campaignIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/4 v12, 0x3

    const/4 v11, 0x7

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1298
    sget-object v4, Lcom/localytics/android/MarketingHandler$25;->$SwitchMap$com$localytics$android$MarketingHandler$FrequencyCappingFilter:[I

    invoke-virtual {p1}, Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 1386
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    :goto_0
    return-object v1

    .line 1301
    :pswitch_0
    const-string v4, "SELECT fc.%s FROM %s AS fc JOIN %s AS cd ON fc.%s=cd.%s WHERE cd.%s in (%s) GROUP BY fc.%s HAVING count(*) >= fc.%s;"

    const/16 v5, 0x9

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "campaign_id"

    aput-object v6, v5, v8

    const-string v6, "frequency_capping_rules"

    aput-object v6, v5, v9

    const-string v6, "campaigns_displayed"

    aput-object v6, v5, v10

    const-string v6, "campaign_id"

    aput-object v6, v5, v12

    const/4 v6, 0x4

    const-string v7, "campaign_id"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "campaign_id"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string v7, ","

    invoke-static {v7, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const-string v6, "campaign_id"

    aput-object v6, v5, v11

    const/16 v6, 0x8

    const-string v7, "max_display_count"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/localytics/android/MarketingHandler;->_getCampaignIdsFromFrequencyCappingQuery(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    goto :goto_0

    .line 1318
    :pswitch_1
    const-string v4, "SELECT DISTINCT fc.%s FROM %s AS fc JOIN %s AS df ON fc.%s=df.%s JOIN %s AS cd ON fc.%s=cd.%s WHERE (cd.%s BETWEEN datetime(\'%s\',\'-\'||df.%s||\' days\') AND datetime(\'%s\')) AND fc.%s in (%s) GROUP BY df.%s HAVING count(cd.%s) >= df.%s;"

    const/16 v5, 0x11

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "campaign_id"

    aput-object v6, v5, v8

    const-string v6, "frequency_capping_rules"

    aput-object v6, v5, v9

    const-string v6, "frequency_capping_display_frequencies"

    aput-object v6, v5, v10

    const-string v6, "_id"

    aput-object v6, v5, v12

    const/4 v6, 0x4

    const-string v7, "frequency_id"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "campaigns_displayed"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string v7, "campaign_id"

    aput-object v7, v5, v6

    const-string v6, "campaign_id"

    aput-object v6, v5, v11

    const/16 v6, 0x8

    const-string v7, "date"

    aput-object v7, v5, v6

    const/16 v6, 0x9

    iget-object v7, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v7}, Lcom/localytics/android/LocalyticsDao;->getTimeStringForSQLite()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const-string v7, "days"

    aput-object v7, v5, v6

    const/16 v6, 0xb

    iget-object v7, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v7}, Lcom/localytics/android/LocalyticsDao;->getTimeStringForSQLite()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0xc

    const-string v7, "campaign_id"

    aput-object v7, v5, v6

    const/16 v6, 0xd

    const-string v7, ","

    invoke-static {v7, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0xe

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/16 v6, 0xf

    const-string v7, "date"

    aput-object v7, v5, v6

    const/16 v6, 0x10

    const-string v7, "count"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/localytics/android/MarketingHandler;->_getCampaignIdsFromFrequencyCappingQuery(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    goto/16 :goto_0

    .line 1341
    :pswitch_2
    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v4}, Lcom/localytics/android/LocalyticsDao;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 1342
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0, v11}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .line 1343
    .local v3, "currentWeekday":I
    const/16 v4, 0xb

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    mul-int/lit8 v4, v4, 0x3c

    const/16 v5, 0xc

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    add-int/2addr v4, v5

    mul-int/lit8 v4, v4, 0x3c

    const/16 v5, 0xd

    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v5

    add-int v2, v4, v5

    .line 1345
    .local v2, "currentTime":I
    const-string v4, "SELECT fc.%s FROM %s AS fc, %s AS d, %s AS t WHERE ((fc.%s=t.%s) AND (fc.%s=d.%s)) AND (d.%s=t.%s) AND (datetime(\'%s\',\'localtime\') BETWEEN d.%s and d.%s) AND (? BETWEEN t.%s AND t.%s) AND fc.%s IN (%s);"

    const/16 v5, 0x11

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "campaign_id"

    aput-object v6, v5, v8

    const-string v6, "frequency_capping_rules"

    aput-object v6, v5, v9

    const-string v6, "frequency_capping_blackout_dates"

    aput-object v6, v5, v10

    const-string v6, "frequency_capping_blackout_times"

    aput-object v6, v5, v12

    const/4 v6, 0x4

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "frequency_id"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string v7, "_id"

    aput-object v7, v5, v6

    const-string v6, "frequency_id"

    aput-object v6, v5, v11

    const/16 v6, 0x8

    const-string v7, "rule_group_id"

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const-string v7, "rule_group_id"

    aput-object v7, v5, v6

    const/16 v6, 0xa

    iget-object v7, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v7}, Lcom/localytics/android/LocalyticsDao;->getTimeStringForSQLite()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0xb

    const-string v7, "start"

    aput-object v7, v5, v6

    const/16 v6, 0xc

    const-string v7, "end"

    aput-object v7, v5, v6

    const/16 v6, 0xd

    const-string v7, "start"

    aput-object v7, v5, v6

    const/16 v6, 0xe

    const-string v7, "end"

    aput-object v7, v5, v6

    const/16 v6, 0xf

    const-string v7, "campaign_id"

    aput-object v7, v5, v6

    const/16 v6, 0x10

    const-string v7, ","

    invoke-static {v7, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    new-array v5, v9, [Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-direct {p0, v4, v5}, Lcom/localytics/android/MarketingHandler;->_getCampaignIdsFromFrequencyCappingQuery(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    .line 1364
    .local v1, "campaigns":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const-string v4, "SELECT fc.%s FROM %s AS fc, %s AS w, %s AS t WHERE ((fc.%s=t.%s) AND (fc.%s=w.%s)) AND (w.%s=t.%s) AND (w.%s=?)  AND (? BETWEEN t.%s AND t.%s) AND fc.%s IN (%s);"

    const/16 v5, 0xf

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "campaign_id"

    aput-object v6, v5, v8

    const-string v6, "frequency_capping_rules"

    aput-object v6, v5, v9

    const-string v6, "frequency_capping_blackout_weekdays"

    aput-object v6, v5, v10

    const-string v6, "frequency_capping_blackout_times"

    aput-object v6, v5, v12

    const/4 v6, 0x4

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string v7, "frequency_id"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string v7, "_id"

    aput-object v7, v5, v6

    const-string v6, "frequency_id"

    aput-object v6, v5, v11

    const/16 v6, 0x8

    const-string v7, "rule_group_id"

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const-string v7, "rule_group_id"

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const-string v7, "day"

    aput-object v7, v5, v6

    const/16 v6, 0xb

    const-string v7, "start"

    aput-object v7, v5, v6

    const/16 v6, 0xc

    const-string v7, "end"

    aput-object v7, v5, v6

    const/16 v6, 0xd

    const-string v7, "campaign_id"

    aput-object v7, v5, v6

    const/16 v6, 0xe

    const-string v7, ","

    invoke-static {v7, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    new-array v5, v10, [Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-direct {p0, v4, v5}, Lcom/localytics/android/MarketingHandler;->_getCampaignIdsFromFrequencyCappingQuery(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_0

    .line 1298
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method _getGloballyDisqualifiedCampaigns(Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;Ljava/util/Set;)Ljava/util/Set;
    .locals 13
    .param p1, "filter"    # Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Set;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1426
    .local p2, "campaignIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/4 v11, -0x1

    .line 1427
    .local v11, "frequencyId":I
    const/4 v10, 0x0

    .line 1430
    .local v10, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "frequency_capping_rules"

    const/4 v2, 0x0

    const-string v3, "campaign_id = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v12, -0x1

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 1431
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1433
    const-string v0, "_id"

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v11

    .line 1438
    :cond_0
    if-eqz v10, :cond_1

    .line 1440
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1444
    :cond_1
    const/4 v0, -0x1

    if-eq v11, v0, :cond_3

    .line 1448
    :try_start_1
    sget-object v0, Lcom/localytics/android/MarketingHandler$25;->$SwitchMap$com$localytics$android$MarketingHandler$FrequencyCappingFilter:[I

    invoke-virtual {p1}, Lcom/localytics/android/MarketingHandler$FrequencyCappingFilter;->ordinal()I

    move-result v1

    aget v0, v0, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    packed-switch v0, :pswitch_data_0

    .line 1526
    :cond_2
    if-eqz v10, :cond_3

    .line 1528
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1533
    :cond_3
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    :cond_4
    :goto_0
    return-object v0

    .line 1438
    :catchall_0
    move-exception v0

    if-eqz v10, :cond_5

    .line 1440
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v0

    .line 1451
    :pswitch_0
    :try_start_2
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    iget-object v0, v0, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "SELECT df.%s FROM %s AS fc JOIN %s AS df ON fc.%s = df.%s JOIN %s AS cd WHERE cd.%s = 0 AND fc.%s = ? AND (cd.%s BETWEEN datetime(\'%s\',\'-\'||df.%s||\' days\') AND datetime(\'%s\')) GROUP BY df.%s HAVING count(cd.%s) >= df.%s;"

    const/16 v2, 0xf

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "frequency_capping_rules"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "frequency_capping_display_frequencies"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "_id"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "frequency_id"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "campaigns_displayed"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "ignore_global"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "campaign_id"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "date"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v4}, Lcom/localytics/android/LocalyticsDao;->getTimeStringForSQLite()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "days"

    aput-object v4, v2, v3

    const/16 v3, 0xb

    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v4}, Lcom/localytics/android/LocalyticsDao;->getTimeStringForSQLite()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/16 v3, 0xc

    const-string v4, "_id"

    aput-object v4, v2, v3

    const/16 v3, 0xd

    const-string v4, "date"

    aput-object v4, v2, v3

    const/16 v3, 0xe

    const-string v4, "count"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 1472
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_2

    .line 1474
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Lcom/localytics/android/MarketingHandler;->_getIgnoresGlobalCampaigns(ZLjava/util/Set;)Ljava/util/Set;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v0

    .line 1526
    if-eqz v10, :cond_4

    .line 1528
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 1479
    :pswitch_1
    :try_start_3
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0}, Lcom/localytics/android/LocalyticsDao;->getCalendar()Ljava/util/Calendar;

    move-result-object v6

    .line 1480
    .local v6, "calendar":Ljava/util/Calendar;
    const/4 v0, 0x7

    invoke-virtual {v6, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    add-int/lit8 v9, v0, -0x1

    .line 1481
    .local v9, "currentWeekday":I
    const/16 v0, 0xb

    invoke-virtual {v6, v0}, Ljava/util/Calendar;->get(I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x3c

    const/16 v1, 0xc

    invoke-virtual {v6, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x3c

    const/16 v1, 0xd

    invoke-virtual {v6, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int v8, v0, v1

    .line 1483
    .local v8, "currentTime":I
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    iget-object v0, v0, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "SELECT * FROM %s AS d, %s AS t WHERE ((d.%s=?) AND (t.%s=?)) AND (d.%s=t.%s) AND (datetime(\'%s\',\'localtime\') BETWEEN d.%s and d.%s) AND (? BETWEEN t.%s AND t.%s);"

    const/16 v2, 0xb

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "frequency_capping_blackout_dates"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "frequency_capping_blackout_times"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "frequency_id"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "frequency_id"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "rule_group_id"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "rule_group_id"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v4}, Lcom/localytics/android/LocalyticsDao;->getTimeStringForSQLite()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "start"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "end"

    aput-object v4, v2, v3

    const/16 v3, 0x9

    const-string v4, "start"

    aput-object v4, v2, v3

    const/16 v3, 0xa

    const-string v4, "end"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 1497
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v7

    .line 1498
    .local v7, "count":I
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1500
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    iget-object v0, v0, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "SELECT * FROM %s AS w, %s AS t WHERE ((w.%s=?) AND (t.%s=?)) AND (w.%s=t.%s) AND (w.%s=?) AND (? BETWEEN t.%s AND t.%s);"

    const/16 v2, 0x9

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "frequency_capping_blackout_weekdays"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "frequency_capping_blackout_times"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "frequency_id"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string v4, "frequency_id"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string v4, "rule_group_id"

    aput-object v4, v2, v3

    const/4 v3, 0x5

    const-string v4, "rule_group_id"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "day"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "start"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "end"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 1514
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v0

    add-int/2addr v7, v0

    .line 1516
    if-lez v7, :cond_2

    .line 1518
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Lcom/localytics/android/MarketingHandler;->_getIgnoresGlobalCampaigns(ZLjava/util/Set;)Ljava/util/Set;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result-object v0

    .line 1526
    if-eqz v10, :cond_4

    .line 1528
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 1526
    .end local v6    # "calendar":Ljava/util/Calendar;
    .end local v7    # "count":I
    .end local v8    # "currentTime":I
    .end local v9    # "currentWeekday":I
    :catchall_1
    move-exception v0

    if-eqz v10, :cond_6

    .line 1528
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    :cond_6
    throw v0

    .line 1448
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method _getIgnoresGlobalCampaigns(ZLjava/util/Set;)Ljava/util/Set;
    .locals 6
    .param p1, "ignoreGlobal"    # Z
    .param p2    # Ljava/util/Set;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .local p2, "campaignIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1285
    const-string v2, "SELECT %s FROM %s WHERE %s = %s AND %s in (%s);"

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "campaign_id"

    aput-object v4, v3, v1

    const-string v4, "frequency_capping_rules"

    aput-object v4, v3, v0

    const/4 v4, 0x2

    const-string v5, "ignore_global"

    aput-object v5, v3, v4

    const/4 v4, 0x3

    if-eqz p1, :cond_0

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v4

    const/4 v0, 0x4

    const-string v1, "campaign_id"

    aput-object v1, v3, v0

    const/4 v0, 0x5

    const-string v1, ","

    invoke-static {v1, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v3, v0

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/localytics/android/MarketingHandler;->_getCampaignIdsFromFrequencyCappingQuery(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    return-object v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method protected _getMaxRowToUpload()I
    .locals 1

    .prologue
    .line 1947
    const/4 v0, 0x1

    return v0
.end method

.method _getQualifiedMarketingMessageForTrigger(Ljava/lang/String;Ljava/util/Map;)Lcom/localytics/android/MarketingMessage;
    .locals 6
    .param p1, "event"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/localytics/android/MarketingMessage;"
        }
    .end annotation

    .prologue
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 2002
    invoke-static {}, Lcom/localytics/android/Constants;->isTestModeEnabled()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 2040
    :cond_0
    :goto_0
    return-object v4

    .line 2008
    :cond_1
    const-string v5, "open"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 2010
    iget-boolean v5, p0, Lcom/localytics/android/MarketingHandler;->sessionStartMarketingMessageShown:Z

    if-nez v5, :cond_0

    invoke-static {}, Lcom/localytics/android/Constants;->isTestModeEnabled()Z

    move-result v5

    if-nez v5, :cond_0

    .line 2012
    const-string v1, "AMP Loaded"

    .line 2013
    .local v1, "eventName":Ljava/lang/String;
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/localytics/android/MarketingHandler;->sessionStartMarketingMessageShown:Z

    .line 2026
    :goto_1
    invoke-direct {p0, v1}, Lcom/localytics/android/MarketingHandler;->_getMarketingMessageMaps(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 2027
    .local v3, "marketingMessages":Ljava/util/List;, "Ljava/util/List<Lcom/localytics/android/MarketingMessage;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_2

    .line 2029
    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v4}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v0

    .line 2030
    .local v0, "appContext":Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2032
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 2033
    .local v2, "eventString":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcom/localytics/android/MarketingHandler;->_getMarketingMessageMaps(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 2037
    .end local v0    # "appContext":Landroid/content/Context;
    .end local v2    # "eventString":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0, v3}, Lcom/localytics/android/MarketingHandler;->_filterMarketingMessagesDisqualifiedByFrequencyCappingRules(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    .line 2040
    invoke-direct {p0, v3, p2}, Lcom/localytics/android/MarketingHandler;->_retrieveDisplayingCandidate(Ljava/util/List;Ljava/util/Map;)Lcom/localytics/android/MarketingMessage;

    move-result-object v4

    goto :goto_0

    .line 2022
    .end local v1    # "eventName":Ljava/lang/String;
    .end local v3    # "marketingMessages":Ljava/util/List;, "Ljava/util/List<Lcom/localytics/android/MarketingMessage;>;"
    :cond_3
    move-object v1, p1

    .restart local v1    # "eventName":Ljava/lang/String;
    goto :goto_1
.end method

.method protected _init()V
    .locals 3

    .prologue
    .line 1966
    new-instance v0, Lcom/localytics/android/MarketingProvider;

    iget-object v1, p0, Lcom/localytics/android/MarketingHandler;->siloName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-direct {v0, v1, v2}, Lcom/localytics/android/MarketingProvider;-><init>(Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V

    iput-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    .line 1967
    return-void
.end method

.method _marketingTrigger(Ljava/lang/String;Ljava/util/Map;)V
    .locals 5
    .param p1, "event"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1981
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, p1, p2}, Lcom/localytics/android/MarketingHandler;->_getQualifiedMarketingMessageForTrigger(Ljava/lang/String;Ljava/util/Map;)Lcom/localytics/android/MarketingMessage;

    move-result-object v2

    .line 1983
    .local v2, "message":Lcom/localytics/android/MarketingMessage;
    if-eqz v2, :cond_0

    .line 1985
    const-string v3, "campaign_id"

    invoke-virtual {v2, v3}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 1986
    .local v0, "campaignId":Ljava/lang/Integer;
    const-string v3, "control_group"

    invoke-virtual {v2, v3}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 1987
    .local v1, "controlGroup":Ljava/lang/Integer;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 1989
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p0, v3}, Lcom/localytics/android/MarketingHandler;->_setMarketingMessageAsDisplayed(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1991
    invoke-direct {p0, v2}, Lcom/localytics/android/MarketingHandler;->_tagAmpActionEventForControlGroup(Lcom/localytics/android/MarketingMessage;)V

    .line 1997
    .end local v0    # "campaignId":Ljava/lang/Integer;
    .end local v1    # "controlGroup":Ljava/lang/Integer;
    :cond_0
    :goto_0
    return-void

    .line 1995
    .restart local v0    # "campaignId":Ljava/lang/Integer;
    .restart local v1    # "controlGroup":Ljava/lang/Integer;
    :cond_1
    invoke-virtual {p0, v2, p2}, Lcom/localytics/android/MarketingHandler;->_tryDisplayingInAppCampaign(Lcom/localytics/android/MarketingMessage;Ljava/util/Map;)V

    goto :goto_0
.end method

.method protected _onUploadCompleted(Ljava/lang/String;)V
    .locals 6
    .param p1, "responseBody"    # Ljava/lang/String;

    .prologue
    .line 576
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v3

    .line 577
    .local v3, "responseBodyHash":I
    :goto_0
    iget v4, p0, Lcom/localytics/android/MarketingHandler;->lastMarketingMessagesHash:I

    if-eq v3, v4, :cond_0

    .line 582
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/localytics/android/JsonHelper;->toMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v2

    .line 584
    .local v2, "marketingMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p0, v2}, Lcom/localytics/android/MarketingHandler;->_processConfigObject(Ljava/util/Map;)V

    .line 585
    invoke-virtual {p0, v2}, Lcom/localytics/android/MarketingHandler;->_processMarketingObject(Ljava/util/Map;)V

    .line 587
    iput v3, p0, Lcom/localytics/android/MarketingHandler;->lastMarketingMessagesHash:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 595
    .end local v2    # "marketingMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    :goto_1
    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->testCampaignsListAdapter:Lcom/localytics/android/MarketingRulesAdapter;

    if-eqz v4, :cond_2

    .line 597
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->testCampaignsListAdapter:Lcom/localytics/android/MarketingRulesAdapter;

    .line 598
    .local v0, "adapter":Lcom/localytics/android/MarketingRulesAdapter;
    new-instance v4, Lcom/localytics/android/MarketingHandler$6;

    invoke-direct {v4, p0, v0}, Lcom/localytics/android/MarketingHandler$6;-><init>(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingRulesAdapter;)V

    invoke-virtual {v4}, Lcom/localytics/android/MarketingHandler$6;->start()V

    .line 613
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/localytics/android/MarketingHandler;->testCampaignsListAdapter:Lcom/localytics/android/MarketingRulesAdapter;

    .line 619
    .end local v0    # "adapter":Lcom/localytics/android/MarketingRulesAdapter;
    :goto_2
    return-void

    .line 576
    .end local v3    # "responseBodyHash":I
    :cond_1
    iget v3, p0, Lcom/localytics/android/MarketingHandler;->lastMarketingMessagesHash:I

    goto :goto_0

    .line 589
    .restart local v3    # "responseBodyHash":I
    :catch_0
    move-exception v1

    .line 591
    .local v1, "e":Lorg/json/JSONException;
    const-string v4, "JSONException"

    invoke-static {v4, v1}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 617
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_2
    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    const-string v5, "open"

    invoke-interface {v4, v5}, Lcom/localytics/android/LocalyticsDao;->triggerInAppMessage(Ljava/lang/String;)V

    goto :goto_2
.end method

.method _processConfigObject(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 623
    .local p1, "marketingMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v0, "config"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    iput-object v0, p0, Lcom/localytics/android/MarketingHandler;->mConfigurations:Ljava/util/Map;

    .line 624
    return-void
.end method

.method _processMarketingObject(Ljava/util/Map;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 628
    .local p1, "marketingMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 630
    .local v4, "marketingMessages":Ljava/util/List;, "Ljava/util/List<Lcom/localytics/android/MarketingMessage;>;"
    const-string v6, "amp"

    invoke-interface {p1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 631
    .local v1, "inapps":Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 634
    invoke-static {v1}, Lcom/localytics/android/JsonHelper;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/json/JSONArray;

    invoke-static {v6}, Lcom/localytics/android/JsonHelper;->toList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v2

    .line 635
    .local v2, "marketingList":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map;

    .line 637
    .local v5, "obj":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v6, Lcom/localytics/android/MarketingMessage;

    invoke-direct {v6, v5}, Lcom/localytics/android/MarketingMessage;-><init>(Ljava/util/Map;)V

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 642
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "marketingList":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v5    # "obj":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    invoke-virtual {p0, v4}, Lcom/localytics/android/MarketingHandler;->_removeDeactivatedMarketingMessages(Ljava/util/List;)V

    .line 644
    const/4 v6, -0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p0, p1, v6}, Lcom/localytics/android/MarketingHandler;->_validateAndStoreFrequencyCappingRule(Ljava/util/Map;Ljava/lang/Integer;)Z

    .line 647
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/localytics/android/MarketingMessage;

    .line 649
    .local v3, "marketingMessage":Lcom/localytics/android/MarketingMessage;
    invoke-virtual {p0, v3}, Lcom/localytics/android/MarketingHandler;->_saveMarketingMessage(Lcom/localytics/android/MarketingMessage;)I

    .line 650
    sget-object v6, Lcom/localytics/android/Constants;->CAMPAIGN_ID_KEY:Ljava/lang/String;

    invoke-virtual {v3, v6}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {p0, v3, v6}, Lcom/localytics/android/MarketingHandler;->_validateAndStoreFrequencyCappingRule(Ljava/util/Map;Ljava/lang/Integer;)Z

    goto :goto_1

    .line 652
    .end local v3    # "marketingMessage":Lcom/localytics/android/MarketingMessage;
    :cond_1
    return-void
.end method

.method _removeDeactivatedMarketingMessages(Ljava/util/List;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/localytics/android/MarketingMessage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 663
    .local p1, "marketingMessages":Ljava/util/List;, "Ljava/util/List<Lcom/localytics/android/MarketingMessage;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 666
    .local v7, "campaignIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/localytics/android/MarketingMessage;

    .line 668
    .local v10, "marketingMessage":Lcom/localytics/android/MarketingMessage;
    const-string v0, "campaign_id"

    invoke-static {v10, v0}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 671
    .end local v10    # "marketingMessage":Lcom/localytics/android/MarketingMessage;
    :cond_0
    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/MarketingHandler;->_deleteFrequencyCappingRule(Ljava/lang/Integer;)Z

    .line 674
    new-instance v12, Ljava/util/Vector;

    invoke-direct {v12}, Ljava/util/Vector;-><init>()V

    .line 675
    .local v12, "marketingMessageMaps":Ljava/util/Vector;, "Ljava/util/Vector<Lcom/localytics/android/MarketingMessage;>;"
    const/4 v13, 0x0

    .line 678
    .local v13, "rulesCursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "marketing_rules"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 680
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge v8, v0, :cond_3

    .line 682
    invoke-interface {v13, v8}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 686
    const-string v0, "campaign_id"

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    .line 687
    .local v6, "campaignId":I
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v7, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 680
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 692
    :cond_1
    new-instance v11, Lcom/localytics/android/MarketingMessage;

    invoke-direct {v11}, Lcom/localytics/android/MarketingMessage;-><init>()V

    .line 694
    .local v11, "marketingMessageMap":Lcom/localytics/android/MarketingMessage;
    const-string v0, "_id"

    const-string v1, "_id"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 695
    const-string v0, "campaign_id"

    const-string v1, "campaign_id"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 696
    const-string v0, "expiration"

    const-string v1, "expiration"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 697
    const-string v0, "display_seconds"

    const-string v1, "display_seconds"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 698
    const-string v0, "display_session"

    const-string v1, "display_session"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 699
    const-string v0, "version"

    const-string v1, "version"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 700
    const-string v0, "phone_location"

    const-string v1, "phone_location"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 701
    const-string v0, "phone_size_width"

    const-string v1, "phone_size_width"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 702
    const-string v0, "phone_size_height"

    const-string v1, "phone_size_height"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 703
    const-string v0, "tablet_location"

    const-string v1, "tablet_location"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 704
    const-string v0, "tablet_size_width"

    const-string v1, "tablet_size_width"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 705
    const-string v0, "tablet_size_height"

    const-string v1, "tablet_size_height"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 706
    const-string v0, "time_to_display"

    const-string v1, "time_to_display"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 707
    const-string v0, "internet_required"

    const-string v1, "internet_required"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 708
    const-string v0, "ab_test"

    const-string v1, "ab_test"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 709
    const-string v0, "rule_name_non_unique"

    const-string v1, "rule_name_non_unique"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 710
    const-string v0, "location"

    const-string v1, "location"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 711
    const-string v0, "devices"

    const-string v1, "devices"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v0, v1}, Lcom/localytics/android/MarketingMessage;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 713
    invoke-virtual {v12, v11}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_2

    .line 718
    .end local v6    # "campaignId":I
    .end local v8    # "i":I
    .end local v11    # "marketingMessageMap":Lcom/localytics/android/MarketingMessage;
    :catchall_0
    move-exception v0

    if-eqz v13, :cond_2

    .line 720
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 721
    const/4 v13, 0x0

    :cond_2
    throw v0

    .line 718
    .restart local v8    # "i":I
    :cond_3
    if-eqz v13, :cond_4

    .line 720
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 721
    const/4 v13, 0x0

    .line 726
    :cond_4
    invoke-virtual {v12}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/localytics/android/MarketingMessage;

    .line 728
    .restart local v10    # "marketingMessage":Lcom/localytics/android/MarketingMessage;
    invoke-direct {p0, v10}, Lcom/localytics/android/MarketingHandler;->_destroyLocalMarketingMessage(Lcom/localytics/android/MarketingMessage;)V

    .line 729
    const-string v0, "campaign_id"

    invoke-virtual {v10, v0}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Lcom/localytics/android/MarketingHandler;->_deleteFrequencyCappingRule(Ljava/lang/Integer;)Z

    goto :goto_3

    .line 732
    .end local v10    # "marketingMessage":Lcom/localytics/android/MarketingMessage;
    :cond_5
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    invoke-virtual {v0}, Lcom/localytics/android/BaseProvider;->vacuumIfNecessary()V

    .line 733
    return-void
.end method

.method _saveFrequencyCappingRule(Ljava/util/Map;Ljava/lang/Integer;)Z
    .locals 8
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "campaignId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Integer;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "rule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1023
    iget-object v6, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    iget-object v6, v6, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v6}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1025
    invoke-virtual {p0, p1, p2}, Lcom/localytics/android/MarketingHandler;->_saveFrequencyCappingRuleBase(Ljava/util/Map;Ljava/lang/Integer;)J

    move-result-wide v6

    long-to-int v1, v6

    .line 1027
    .local v1, "frequencyId":I
    sget-object v6, Lcom/localytics/android/Constants;->DISPLAY_FREQUENCIES_KEY:Ljava/lang/String;

    invoke-interface {p1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 1028
    .local v2, "frequencyRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    if-lez v1, :cond_1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p0, v2, v6}, Lcom/localytics/android/MarketingHandler;->_saveFrequencyCappingRuleDisplayFrequency(Ljava/util/List;Ljava/lang/Integer;)Z

    move-result v6

    if-eqz v6, :cond_1

    move v3, v4

    .line 1030
    .local v3, "success":Z
    :goto_0
    sget-object v6, Lcom/localytics/android/Constants;->BLACKOUT_RULES_KEY:Ljava/lang/String;

    invoke-interface {p1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1031
    .local v0, "blackoutRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    if-eqz v3, :cond_2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {p0, v0, v6}, Lcom/localytics/android/MarketingHandler;->_saveFrequencyCappingRuleBlackout(Ljava/util/List;Ljava/lang/Integer;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v3, v4

    .line 1033
    :goto_1
    if-eqz v3, :cond_0

    .line 1035
    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    iget-object v4, v4, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 1037
    :cond_0
    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    iget-object v4, v4, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 1039
    return v3

    .end local v0    # "blackoutRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v3    # "success":Z
    :cond_1
    move v3, v5

    .line 1028
    goto :goto_0

    .restart local v0    # "blackoutRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .restart local v3    # "success":Z
    :cond_2
    move v3, v5

    .line 1031
    goto :goto_1
.end method

.method _saveFrequencyCappingRuleBase(Ljava/util/Map;Ljava/lang/Integer;)J
    .locals 4
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "campaignId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;",
            "Ljava/lang/Integer;",
            ")J"
        }
    .end annotation

    .prologue
    .line 1057
    .local p1, "rule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1058
    .local v0, "values":Landroid/content/ContentValues;
    const-string v1, "campaign_id"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1059
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 1061
    const-string v2, "max_display_count"

    sget-object v1, Lcom/localytics/android/Constants;->MAX_DISPLAY_COUNT_KEY:Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1062
    const-string v2, "ignore_global"

    sget-object v1, Lcom/localytics/android/Constants;->IGNORE_GLOBAL_KEY:Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1070
    :goto_0
    iget-object v1, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    iget-object v1, v1, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "frequency_capping_rules"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    return-wide v2

    .line 1066
    :cond_0
    const-string v1, "max_display_count"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 1067
    const-string v1, "ignore_global"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_0
.end method

.method _saveFrequencyCappingRuleBlackout(Ljava/util/List;Ljava/lang/Integer;)Z
    .locals 9
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "frequencyId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/lang/Integer;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "rules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v7, 0x0

    .line 1095
    if-eqz p1, :cond_2

    .line 1097
    const/4 v5, 0x0

    .line 1098
    .local v5, "groupId":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 1100
    .local v2, "blackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p0, v2}, Lcom/localytics/android/MarketingHandler;->_augmentBlackoutRule(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 1101
    .local v0, "augmentedBlackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    sget-object v8, Lcom/localytics/android/Constants;->DATES_KEY:Ljava/lang/String;

    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 1102
    .local v1, "blackoutDatesRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {p0, v1, p2, v8}, Lcom/localytics/android/MarketingHandler;->_saveFrequencyCappingRuleBlackoutDates(Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 1123
    .end local v0    # "augmentedBlackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "blackoutDatesRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v2    # "blackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v5    # "groupId":I
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_0
    :goto_1
    return v7

    .line 1107
    .restart local v0    # "augmentedBlackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v1    # "blackoutDatesRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    .restart local v2    # "blackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v5    # "groupId":I
    .restart local v6    # "i$":Ljava/util/Iterator;
    :cond_1
    sget-object v8, Lcom/localytics/android/Constants;->WEEKDAYS_KEY:Ljava/lang/String;

    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 1108
    .local v4, "blackoutWeekdaysRules":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {p0, v4, p2, v8}, Lcom/localytics/android/MarketingHandler;->_saveFrequencyCappingRuleBlackoutWeekdays(Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1113
    sget-object v8, Lcom/localytics/android/Constants;->TIMES_KEY:Ljava/lang/String;

    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 1114
    .local v3, "blackoutTimesRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {p0, v3, p2, v8}, Lcom/localytics/android/MarketingHandler;->_saveFrequencyCappingRuleBlackoutTimes(Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1119
    add-int/lit8 v5, v5, 0x1

    .line 1120
    goto :goto_0

    .line 1123
    .end local v0    # "augmentedBlackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "blackoutDatesRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v2    # "blackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "blackoutTimesRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v4    # "blackoutWeekdaysRules":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v5    # "groupId":I
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_2
    const/4 v7, 0x1

    goto :goto_1
.end method

.method _saveFrequencyCappingRuleBlackoutDates(Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;)Z
    .locals 10
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "frequencyId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "groupId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "rules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1148
    if-eqz p1, :cond_0

    .line 1150
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 1154
    .local v0, "blackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    iget-object v5, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    iget-object v5, v5, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v6, "INSERT INTO %s VALUES (?, ?, datetime(?,\'start of day\'), datetime(?,\'start of day\',\'1 day\',\'-1 second\'));"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string v9, "frequency_capping_blackout_dates"

    aput-object v9, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p2, v7, v8

    const/4 v8, 0x1

    aput-object p3, v7, v8

    const/4 v8, 0x2

    sget-object v9, Lcom/localytics/android/Constants;->START_KEY:Ljava/lang/String;

    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x3

    sget-object v9, Lcom/localytics/android/Constants;->END_KEY:Ljava/lang/String;

    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1162
    :catch_0
    move-exception v1

    .line 1169
    .end local v0    # "blackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :goto_1
    return v3

    :cond_0
    move v3, v4

    goto :goto_1
.end method

.method _saveFrequencyCappingRuleBlackoutTimes(Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;)Z
    .locals 10
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "frequencyId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "groupId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 1194
    .local p1, "rules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    if-eqz p1, :cond_3

    .line 1196
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 1198
    .local v0, "blackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v5, Lcom/localytics/android/Constants;->START_KEY:Ljava/lang/String;

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/localytics/android/MarketingHandler;->_timeStringToSeconds(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1199
    .local v3, "start":Ljava/lang/Integer;
    sget-object v5, Lcom/localytics/android/Constants;->END_KEY:Ljava/lang/String;

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {p0, v5}, Lcom/localytics/android/MarketingHandler;->_timeStringToSeconds(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 1201
    .local v1, "end":Ljava/lang/Integer;
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_2

    .line 1203
    :cond_1
    const/4 v5, 0x0

    .line 1218
    .end local v0    # "blackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "end":Ljava/lang/Integer;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "start":Ljava/lang/Integer;
    :goto_0
    return v5

    .line 1206
    .restart local v0    # "blackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v1    # "end":Ljava/lang/Integer;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "start":Ljava/lang/Integer;
    :cond_2
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 1207
    .local v4, "values":Landroid/content/ContentValues;
    const-string v5, "frequency_id"

    invoke-virtual {v4, v5, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1208
    const-string v5, "rule_group_id"

    invoke-virtual {v4, v5, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1209
    const-string v5, "start"

    invoke-virtual {v4, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1210
    const-string v5, "end"

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/lit8 v6, v6, 0x3b

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1211
    iget-object v5, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v6, "frequency_capping_blackout_times"

    invoke-virtual {v5, v6, v4}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-gtz v5, :cond_0

    .line 1213
    const/4 v5, 0x0

    goto :goto_0

    .line 1218
    .end local v0    # "blackoutRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "end":Ljava/lang/Integer;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "start":Ljava/lang/Integer;
    .end local v4    # "values":Landroid/content/ContentValues;
    :cond_3
    const/4 v5, 0x1

    goto :goto_0
.end method

.method _saveFrequencyCappingRuleBlackoutWeekdays(Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;)Z
    .locals 8
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "frequencyId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "groupId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 1174
    .local p1, "rules":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-eqz p1, :cond_1

    .line 1176
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 1178
    .local v2, "weekday":Ljava/lang/Integer;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 1179
    .local v1, "values":Landroid/content/ContentValues;
    const-string v3, "frequency_id"

    invoke-virtual {v1, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1180
    const-string v3, "rule_group_id"

    invoke-virtual {v1, v3, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1181
    const-string v3, "day"

    invoke-virtual {v1, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1182
    iget-object v3, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v4, "frequency_capping_blackout_weekdays"

    invoke-virtual {v3, v4, v1}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-gtz v3, :cond_0

    .line 1184
    const/4 v3, 0x0

    .line 1189
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "values":Landroid/content/ContentValues;
    .end local v2    # "weekday":Ljava/lang/Integer;
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x1

    goto :goto_0
.end method

.method _saveFrequencyCappingRuleDisplayFrequency(Ljava/util/List;Ljava/lang/Integer;)Z
    .locals 8
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "frequencyId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;>;",
            "Ljava/lang/Integer;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 1075
    .local p1, "rules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    if-eqz p1, :cond_1

    .line 1077
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 1079
    .local v0, "displayFrequencyRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 1080
    .local v2, "values":Landroid/content/ContentValues;
    const-string v3, "frequency_id"

    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1081
    const-string v4, "count"

    sget-object v3, Lcom/localytics/android/Constants;->COUNT_KEY:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1082
    const-string v4, "days"

    sget-object v3, Lcom/localytics/android/Constants;->DAYS_KEY:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1083
    iget-object v3, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v4, "frequency_capping_display_frequencies"

    invoke-virtual {v3, v4, v2}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-gtz v3, :cond_0

    .line 1085
    const/4 v3, 0x0

    .line 1090
    .end local v0    # "displayFrequencyRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "values":Landroid/content/ContentValues;
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x1

    goto :goto_0
.end method

.method _saveMarketingMessage(Lcom/localytics/android/MarketingMessage;)I
    .locals 18
    .param p1, "marketingMessage"    # Lcom/localytics/android/MarketingMessage;

    .prologue
    .line 745
    invoke-virtual/range {p0 .. p1}, Lcom/localytics/android/MarketingHandler;->_validateMarketingMessage(Lcom/localytics/android/MarketingMessage;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 747
    const/4 v15, 0x0

    .line 833
    :cond_0
    :goto_0
    return v15

    .line 751
    :cond_1
    const-string v2, "campaign_id"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v8

    .line 754
    .local v8, "campaignId":I
    const/4 v15, 0x0

    .local v15, "ruleId":I
    const/4 v12, 0x0

    .line 757
    .local v12, "localVersion":I
    const/4 v9, 0x0

    .line 760
    .local v9, "cursorRule":Landroid/database/Cursor;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v3, "marketing_rules"

    sget-object v4, Lcom/localytics/android/MarketingHandler;->PROJECTION_MARKETING_RULE_RECORD:[Ljava/lang/String;

    const-string v5, "%s = ?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v17, "campaign_id"

    aput-object v17, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v6, v7

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 761
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 763
    const-string v2, "_id"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    .line 764
    const-string v2, "version"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v12

    .line 769
    :cond_2
    if-eqz v9, :cond_3

    .line 771
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 776
    :cond_3
    if-lez v15, :cond_7

    .line 778
    const-string v2, "Existing in-app rule already exists for this campaign\n\t campaignID = %d\n\t ruleID = %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 780
    const-string v2, "version"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v14

    .line 781
    .local v14, "remoteVersion":I
    if-lt v12, v14, :cond_5

    .line 783
    const-string v2, "No update needed. Campaign version has not been updated\n\t version: %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    .line 784
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 769
    .end local v14    # "remoteVersion":I
    :catchall_0
    move-exception v2

    if-eqz v9, :cond_4

    .line 771
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v2

    .line 788
    .restart local v14    # "remoteVersion":I
    :cond_5
    invoke-direct/range {p0 .. p1}, Lcom/localytics/android/MarketingHandler;->_destroyLocalMarketingMessage(Lcom/localytics/android/MarketingMessage;)V

    .line 796
    .end local v14    # "remoteVersion":I
    :goto_1
    invoke-direct/range {p0 .. p1}, Lcom/localytics/android/MarketingHandler;->_parseMarketingMessage(Lcom/localytics/android/MarketingMessage;)Landroid/content/ContentValues;

    move-result-object v16

    .line 797
    .local v16, "values":Landroid/content/ContentValues;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v3, "marketing_rules"

    move-object/from16 v0, v16

    invoke-virtual {v2, v3, v0}, Lcom/localytics/android/BaseProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    long-to-int v15, v2

    .line 799
    if-lez v15, :cond_6

    .line 802
    int-to-long v2, v15

    const-string v4, "conditions"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/localytics/android/JsonHelper;->getSafeListFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v4}, Lcom/localytics/android/MarketingHandler;->_saveMarketingConditions(JLjava/util/List;)V

    .line 805
    const/4 v10, 0x0

    .line 808
    .local v10, "eventNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_1
    const-string v2, "display_events"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/JsonHelper;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONArray;

    invoke-static {v2}, Lcom/localytics/android/JsonHelper;->toList(Lorg/json/JSONArray;)Ljava/util/List;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v10

    .line 813
    :goto_2
    if-eqz v10, :cond_6

    .line 815
    int-to-long v2, v15

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v10}, Lcom/localytics/android/MarketingHandler;->_bindRuleToEvents(JLjava/util/List;)V

    .line 819
    .end local v10    # "eventNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_6
    if-lez v15, :cond_0

    invoke-static {}, Lcom/localytics/android/Constants;->isTestModeEnabled()Z

    move-result v2

    if-nez v2, :cond_0

    .line 822
    invoke-static/range {p1 .. p1}, Lcom/localytics/android/MarketingDownloader;->getRemoteFileURL(Lcom/localytics/android/MarketingMessage;)Ljava/lang/String;

    move-result-object v13

    .line 823
    .local v13, "remoteFileURL":Ljava/lang/String;
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    int-to-long v2, v15

    const-string v4, ".zip"

    invoke-virtual {v13, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v5}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v6}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v3, v4, v5, v6}, Lcom/localytics/android/MarketingDownloader;->getLocalFileURL(JZLandroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 826
    .local v11, "localFileURL":Ljava/lang/String;
    :goto_3
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 828
    const-string v2, "Saving in-app message with remoteURL = %s and localUrl = %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v13, v3, v4

    const/4 v4, 0x1

    aput-object v11, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->v(Ljava/lang/String;)I

    .line 829
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v3}, Lcom/localytics/android/LocalyticsDao;->getProxy()Ljava/net/Proxy;

    move-result-object v3

    invoke-static {v13, v11, v2, v3}, Lcom/localytics/android/MarketingDownloader;->downloadFile(Ljava/lang/String;Ljava/lang/String;ZLjava/net/Proxy;)Ljava/lang/String;

    goto/16 :goto_0

    .line 793
    .end local v11    # "localFileURL":Ljava/lang/String;
    .end local v13    # "remoteFileURL":Ljava/lang/String;
    .end local v16    # "values":Landroid/content/ContentValues;
    :cond_7
    const-string v2, "In-app campaign not found. Creating a new one."

    invoke-static {v2}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    goto/16 :goto_1

    .line 823
    .restart local v13    # "remoteFileURL":Ljava/lang/String;
    .restart local v16    # "values":Landroid/content/ContentValues;
    :cond_8
    const-string v11, ""

    goto :goto_3

    .line 810
    .end local v13    # "remoteFileURL":Ljava/lang/String;
    .restart local v10    # "eventNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v2

    goto :goto_2
.end method

.method _setMarketingMessageAsDisplayed(I)Z
    .locals 11
    .param p1, "campaignId"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 504
    const/4 v6, 0x0

    .line 507
    .local v6, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "frequency_capping_rules"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "ignore_global"

    aput-object v4, v2, v3

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v10, "campaign_id"

    aput-object v10, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 508
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 510
    const-string v0, "ignore_global"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 512
    .local v7, "ignoresGlobal":I
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    iget-object v0, v0, Lcom/localytics/android/BaseProvider;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "INSERT INTO %s VALUES (?, datetime(\'%s\'), ?);"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "campaigns_displayed"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v4}, Lcom/localytics/android/LocalyticsDao;->getTimeStringForSQLite()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Integer;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 524
    if-eqz v6, :cond_0

    .line 526
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_0
    move v0, v8

    .line 530
    .end local v7    # "ignoresGlobal":I
    :goto_0
    return v0

    .line 524
    :cond_1
    if-eqz v6, :cond_2

    .line 526
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    move v0, v9

    .line 530
    goto :goto_0

    .line 524
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_3

    .line 526
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method _setMarketingMessageAsNotDisplayed(I)Z
    .locals 14
    .param p1, "campaignId"    # I

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 540
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    .line 541
    .local v6, "campaignIdString":Ljava/lang/String;
    const/4 v7, 0x0

    .line 544
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "campaigns_displayed"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "date"

    aput-object v4, v2, v3

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v11, "campaign_id"

    aput-object v11, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v6, v4, v5

    const-string v5, "%s DESC"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const-string v13, "date"

    aput-object v13, v11, v12

    invoke-static {v5, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/BaseProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 549
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 551
    const-string v0, "date"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 552
    .local v8, "date":Ljava/lang/String;
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    const-string v1, "campaigns_displayed"

    const-string v2, "%s = ? AND %s = ?"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "campaign_id"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "date"

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v6, v3, v4

    const/4 v4, 0x1

    aput-object v8, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Lcom/localytics/android/BaseProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-lez v0, :cond_1

    move v0, v9

    .line 559
    :goto_0
    if-eqz v7, :cond_0

    .line 561
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 565
    .end local v8    # "date":Ljava/lang/String;
    :cond_0
    :goto_1
    return v0

    .restart local v8    # "date":Ljava/lang/String;
    :cond_1
    move v0, v10

    .line 552
    goto :goto_0

    .line 559
    .end local v8    # "date":Ljava/lang/String;
    :cond_2
    if-eqz v7, :cond_3

    .line 561
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_3
    move v0, v10

    .line 565
    goto :goto_1

    .line 559
    :catchall_0
    move-exception v0

    if-eqz v7, :cond_4

    .line 561
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v0
.end method

.method _tryDisplayingInAppCampaign(Lcom/localytics/android/MarketingMessage;Ljava/util/Map;)V
    .locals 3
    .param p1, "marketingMessage"    # Lcom/localytics/android/MarketingMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/localytics/android/MarketingMessage;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2046
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p2}, Lcom/localytics/android/MarketingHandler;->_getJavaScriptClientCallbacks(Ljava/util/Map;)Landroid/util/SparseArray;

    move-result-object v0

    .line 2047
    .local v0, "jsCallbacks":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/localytics/android/MarketingCallable;>;"
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/localytics/android/MarketingHandler$8;

    invoke-direct {v2, p0, p1, v0}, Lcom/localytics/android/MarketingHandler$8;-><init>(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingMessage;Landroid/util/SparseArray;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2118
    return-void
.end method

.method _validateAndStoreFrequencyCappingRule(Ljava/util/Map;Ljava/lang/Integer;)Z
    .locals 4
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "campaignId"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/Integer;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "objectWithRule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v3, -0x1

    .line 1008
    const/4 v1, 0x0

    .line 1009
    .local v1, "success":Z
    sget-object v2, Lcom/localytics/android/Constants;->FREQUENCY_CAPPING_KEY:Ljava/lang/String;

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 1010
    .local v0, "rule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz v0, :cond_2

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v3, :cond_1

    const/4 v2, 0x1

    :goto_0
    invoke-virtual {p0, v0, v2}, Lcom/localytics/android/MarketingHandler;->_validateFrequencyCappingRule(Ljava/util/Map;Z)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1012
    invoke-virtual {p0, v0, p2}, Lcom/localytics/android/MarketingHandler;->_saveFrequencyCappingRule(Ljava/util/Map;Ljava/lang/Integer;)Z

    move-result v1

    .line 1018
    :cond_0
    :goto_1
    return v1

    .line 1010
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 1014
    :cond_2
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eq v2, v3, :cond_0

    .line 1016
    new-instance v2, Ljava/util/HashMap;

    sget-object v3, Lcom/localytics/android/MarketingHandler;->DEFAULT_FREQUENCY_CAPPING_RULE:Ljava/util/Map;

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {p0, v2, p2}, Lcom/localytics/android/MarketingHandler;->_saveFrequencyCappingRule(Ljava/util/Map;Ljava/lang/Integer;)Z

    move-result v1

    goto :goto_1
.end method

.method _validateFrequencyCappingRule(Ljava/util/Map;Z)Z
    .locals 13
    .param p1    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "isGlobal"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;Z)Z"
        }
    .end annotation

    .prologue
    .line 838
    .local p1, "rule":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    if-eqz p2, :cond_0

    sget-object v0, Lcom/localytics/android/MarketingHandler;->GLOBAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    :goto_0
    array-length v8, v0

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_1
    if-ge v6, v8, :cond_2

    aget-object v7, v0, v6

    .line 840
    .local v7, "key":Ljava/lang/String;
    invoke-interface {p1, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_1

    .line 842
    const/4 v10, 0x0

    .line 909
    .end local v6    # "i$":I
    .end local v7    # "key":Ljava/lang/String;
    :goto_2
    return v10

    .line 838
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v8    # "len$":I
    :cond_0
    sget-object v0, Lcom/localytics/android/MarketingHandler;->INDIVIDUAL_FREQUENCY_CAPPING_RULE_REQUIRED_KEYS:[Ljava/lang/String;

    goto :goto_0

    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v6    # "i$":I
    .restart local v7    # "key":Ljava/lang/String;
    .restart local v8    # "len$":I
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 846
    .end local v7    # "key":Ljava/lang/String;
    :cond_2
    sget-object v10, Lcom/localytics/android/Constants;->DISPLAY_FREQUENCIES_KEY:Ljava/lang/String;

    invoke-interface {p1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 847
    .local v5, "frequencyRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    sget-object v12, Lcom/localytics/android/Constants;->DAYS_KEY:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    sget-object v12, Lcom/localytics/android/Constants;->COUNT_KEY:Ljava/lang/String;

    aput-object v12, v10, v11

    invoke-virtual {p0, v5, v10}, Lcom/localytics/android/MarketingHandler;->_checkFrequencyCappingRuleArray(Ljava/util/List;[Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 849
    const/4 v10, 0x0

    goto :goto_2

    .line 851
    :cond_3
    invoke-virtual {p0, v5}, Lcom/localytics/android/MarketingHandler;->_additionalFCDisplayFrequencyRulesValidation(Ljava/util/List;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 853
    const/4 v10, 0x0

    goto :goto_2

    .line 856
    :cond_4
    sget-object v10, Lcom/localytics/android/Constants;->BLACKOUT_RULES_KEY:Ljava/lang/String;

    invoke-interface {p1, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 857
    .local v2, "blackoutRulesList":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map;>;"
    if-eqz v2, :cond_e

    .line 859
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v10

    const/4 v11, 0x1

    if-ge v10, v11, :cond_5

    .line 861
    const/4 v10, 0x0

    goto :goto_2

    .line 865
    :cond_5
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_e

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map;

    .line 867
    .local v9, "m":Ljava/util/Map;
    sget-object v10, Lcom/localytics/android/Constants;->TIMES_KEY:Ljava/lang/String;

    invoke-interface {v9, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7

    sget-object v10, Lcom/localytics/android/Constants;->DATES_KEY:Ljava/lang/String;

    invoke-interface {v9, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7

    sget-object v10, Lcom/localytics/android/Constants;->WEEKDAYS_KEY:Ljava/lang/String;

    invoke-interface {v9, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7

    .line 871
    const/4 v10, 0x0

    goto :goto_2

    .line 875
    :cond_7
    sget-object v10, Lcom/localytics/android/Constants;->TIMES_KEY:Ljava/lang/String;

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 876
    .local v3, "blackoutTimesRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    sget-object v12, Lcom/localytics/android/Constants;->START_KEY:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    sget-object v12, Lcom/localytics/android/Constants;->END_KEY:Ljava/lang/String;

    aput-object v12, v10, v11

    invoke-virtual {p0, v3, v10}, Lcom/localytics/android/MarketingHandler;->_checkFrequencyCappingRuleArray(Ljava/util/List;[Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_8

    .line 878
    const/4 v10, 0x0

    goto/16 :goto_2

    .line 880
    :cond_8
    sget-object v10, Lcom/localytics/android/MarketingHandler;->TIME_SDF:Ljava/text/SimpleDateFormat;

    invoke-virtual {p0, v3, v10}, Lcom/localytics/android/MarketingHandler;->_additionalFCDatesAndTimesRulesValidation(Ljava/util/List;Ljava/text/SimpleDateFormat;)Z

    move-result v10

    if-nez v10, :cond_9

    .line 882
    const/4 v10, 0x0

    goto/16 :goto_2

    .line 885
    :cond_9
    sget-object v10, Lcom/localytics/android/Constants;->DATES_KEY:Ljava/lang/String;

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 886
    .local v1, "blackoutDatesRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    sget-object v12, Lcom/localytics/android/Constants;->START_KEY:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    sget-object v12, Lcom/localytics/android/Constants;->END_KEY:Ljava/lang/String;

    aput-object v12, v10, v11

    invoke-virtual {p0, v1, v10}, Lcom/localytics/android/MarketingHandler;->_checkFrequencyCappingRuleArray(Ljava/util/List;[Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_a

    .line 888
    const/4 v10, 0x0

    goto/16 :goto_2

    .line 890
    :cond_a
    sget-object v10, Lcom/localytics/android/MarketingHandler;->DATE_SDF:Ljava/text/SimpleDateFormat;

    invoke-virtual {p0, v1, v10}, Lcom/localytics/android/MarketingHandler;->_additionalFCDatesAndTimesRulesValidation(Ljava/util/List;Ljava/text/SimpleDateFormat;)Z

    move-result v10

    if-nez v10, :cond_b

    .line 892
    const/4 v10, 0x0

    goto/16 :goto_2

    .line 895
    :cond_b
    sget-object v10, Lcom/localytics/android/Constants;->WEEKDAYS_KEY:Ljava/lang/String;

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 896
    .local v4, "blackoutWeekdaysRules":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-eqz v4, :cond_d

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v10

    const/4 v11, 0x1

    if-lt v10, v11, :cond_c

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v10

    const/4 v11, 0x7

    if-le v10, v11, :cond_d

    .line 898
    :cond_c
    const/4 v10, 0x0

    goto/16 :goto_2

    .line 900
    :cond_d
    invoke-virtual {p0, v4}, Lcom/localytics/android/MarketingHandler;->_additionalFCWeekdaysRulesValidation(Ljava/util/List;)Z

    move-result v10

    if-nez v10, :cond_6

    .line 902
    const/4 v10, 0x0

    goto/16 :goto_2

    .line 909
    .end local v1    # "blackoutDatesRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v3    # "blackoutTimesRules":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v4    # "blackoutWeekdaysRules":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v9    # "m":Ljava/util/Map;
    :cond_e
    const/4 v10, 0x1

    goto/16 :goto_2
.end method

.method protected _validateMarketingMessage(Lcom/localytics/android/MarketingMessage;)Z
    .locals 12
    .param p1, "marketingMessage"    # Lcom/localytics/android/MarketingMessage;

    .prologue
    .line 1632
    const-string v7, "campaign_id"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v0

    .line 1633
    .local v0, "campaignId":I
    const-string v7, "rule_name"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1634
    .local v6, "ruleName":Ljava/lang/String;
    const-string v7, "display_events"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeListFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 1635
    .local v1, "eventNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const-string v7, "expiration"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v2

    .line 1636
    .local v2, "expiration":I
    const-string v7, "location"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1638
    .local v3, "location":Ljava/lang/String;
    iget-object v7, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v7}, Lcom/localytics/android/LocalyticsDao;->getCurrentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long v4, v8, v10

    .line 1641
    .local v4, "now":J
    if-eqz v0, :cond_1

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    if-eqz v1, :cond_1

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    int-to-long v8, v2

    cmp-long v7, v8, v4

    if-gtz v7, :cond_0

    invoke-static {}, Lcom/localytics/android/Constants;->isTestModeEnabled()Z

    move-result v7

    if-eqz v7, :cond_1

    :cond_0
    const/4 v7, 0x1

    :goto_0
    return v7

    :cond_1
    const/4 v7, 0x0

    goto :goto_0
.end method

.method dismissCurrentInAppMessage()V
    .locals 6

    .prologue
    .line 1550
    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    if-nez v4, :cond_1

    .line 1567
    :cond_0
    :goto_0
    return-void

    .line 1556
    :cond_1
    :try_start_0
    iget-object v4, p0, Lcom/localytics/android/MarketingHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    const-string v5, "marketing_dialog"

    invoke-virtual {v4, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 1557
    .local v1, "currentFragment":Landroid/support/v4/app/Fragment;
    instance-of v4, v1, Lcom/localytics/android/MarketingDialogFragment;

    if-eqz v4, :cond_0

    .line 1559
    move-object v0, v1

    check-cast v0, Lcom/localytics/android/MarketingDialogFragment;

    move-object v2, v0

    .line 1560
    .local v2, "currentMarketingFragment":Lcom/localytics/android/MarketingDialogFragment;
    invoke-virtual {v2}, Lcom/localytics/android/MarketingDialogFragment;->dismissCampaign()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1563
    .end local v1    # "currentFragment":Landroid/support/v4/app/Fragment;
    .end local v2    # "currentMarketingFragment":Lcom/localytics/android/MarketingDialogFragment;
    :catch_0
    move-exception v3

    .line 1565
    .local v3, "e":Ljava/lang/Exception;
    const-class v4, Ljava/lang/RuntimeException;

    const-string v5, "Localytics library threw an uncaught exception"

    invoke-static {v4, v5, v3}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Exception;)Ljava/lang/Object;

    goto :goto_0
.end method

.method displayMarketingMessage(Ljava/lang/String;Ljava/util/Map;Z)V
    .locals 6
    .param p1, "eventName"    # Ljava/lang/String;
    .param p3, "delay"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/16 v4, 0xc9

    const/4 v3, 0x2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1538
    const-string v2, "open"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1540
    new-array v2, v3, [Ljava/lang/Object;

    aput-object p1, v2, v1

    const/4 v3, 0x0

    aput-object v3, v2, v0

    invoke-virtual {p0, v4, v2}, Lcom/localytics/android/MarketingHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    const-wide/16 v4, 0x2710

    if-eqz p3, :cond_0

    :goto_0
    int-to-long v0, v0

    mul-long/2addr v0, v4

    invoke-virtual {p0, v2, v0, v1}, Lcom/localytics/android/MarketingHandler;->queueMessageDelayed(Landroid/os/Message;J)Z

    .line 1546
    :goto_1
    return-void

    :cond_0
    move v0, v1

    .line 1540
    goto :goto_0

    .line 1544
    :cond_1
    new-array v2, v3, [Ljava/lang/Object;

    aput-object p1, v2, v1

    aput-object p2, v2, v0

    invoke-virtual {p0, v4, v2}, Lcom/localytics/android/MarketingHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/MarketingHandler;->queueMessage(Landroid/os/Message;)Z

    goto :goto_1
.end method

.method getDialogCallbacks()Landroid/util/SparseArray;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/localytics/android/MarketingCallable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2547
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 2550
    .local v0, "callbacks":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/localytics/android/MarketingCallable;>;"
    const/4 v1, 0x1

    new-instance v2, Lcom/localytics/android/MarketingHandler$16;

    invoke-direct {v2, p0}, Lcom/localytics/android/MarketingHandler$16;-><init>(Lcom/localytics/android/MarketingHandler;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 2564
    const/4 v1, 0x2

    new-instance v2, Lcom/localytics/android/MarketingHandler$17;

    invoke-direct {v2, p0}, Lcom/localytics/android/MarketingHandler$17;-><init>(Lcom/localytics/android/MarketingHandler;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 2578
    const/16 v1, 0x10

    new-instance v2, Lcom/localytics/android/MarketingHandler$18;

    invoke-direct {v2, p0}, Lcom/localytics/android/MarketingHandler$18;-><init>(Lcom/localytics/android/MarketingHandler;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 2589
    const/16 v1, 0x11

    new-instance v2, Lcom/localytics/android/MarketingHandler$19;

    invoke-direct {v2, p0}, Lcom/localytics/android/MarketingHandler$19;-><init>(Lcom/localytics/android/MarketingHandler;)V

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 2599
    return-object v0
.end method

.method getInAppDismissButtonLocation()Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;
    .locals 1

    .prologue
    .line 2144
    invoke-static {}, Lcom/localytics/android/MarketingDialogFragment;->getInAppDismissButtonLocation()Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    move-result-object v0

    return-object v0
.end method

.method getMarketingMessages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/localytics/android/MarketingMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2154
    new-instance v0, Lcom/localytics/android/MarketingHandler$9;

    invoke-direct {v0, p0}, Lcom/localytics/android/MarketingHandler$9;-><init>(Lcom/localytics/android/MarketingHandler;)V

    invoke-virtual {p0, v0}, Lcom/localytics/android/MarketingHandler;->getList(Ljava/util/concurrent/Callable;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected getUploadThread(Ljava/util/TreeMap;Ljava/lang/String;)Lcom/localytics/android/BaseUploadThread;
    .locals 2
    .param p2, "customerId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/localytics/android/BaseUploadThread;"
        }
    .end annotation

    .prologue
    .line 1961
    .local p1, "data":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Integer;Ljava/lang/Object;>;"
    new-instance v0, Lcom/localytics/android/MarketingDownloader;

    iget-object v1, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/localytics/android/MarketingDownloader;-><init>(Lcom/localytics/android/BaseHandler;Ljava/util/TreeMap;Ljava/lang/String;Lcom/localytics/android/LocalyticsDao;)V

    return-object v0
.end method

.method protected handleMessageExtended(Landroid/os/Message;)V
    .locals 10
    .param p1, "msg"    # Landroid/os/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 409
    iget v5, p1, Landroid/os/Message;->what:I

    packed-switch v5, :pswitch_data_0

    .line 484
    :pswitch_0
    invoke-super {p0, p1}, Lcom/localytics/android/BaseHandler;->handleMessageExtended(Landroid/os/Message;)V

    .line 488
    :goto_0
    return-void

    .line 413
    :pswitch_1
    const-string v5, "In-app handler received MESSAGE_INAPP_TRIGGER"

    invoke-static {v5}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 415
    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    move-object v4, v5

    check-cast v4, [Ljava/lang/Object;

    .line 417
    .local v4, "params":[Ljava/lang/Object;
    const/4 v5, 0x0

    aget-object v2, v4, v5

    check-cast v2, Ljava/lang/String;

    .line 419
    .local v2, "event":Ljava/lang/String;
    aget-object v0, v4, v6

    check-cast v0, Ljava/util/Map;

    .line 421
    .local v0, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    new-instance v6, Lcom/localytics/android/MarketingHandler$1;

    invoke-direct {v6, p0, v2, v0}, Lcom/localytics/android/MarketingHandler$1;-><init>(Lcom/localytics/android/MarketingHandler;Ljava/lang/String;Ljava/util/Map;)V

    invoke-virtual {v5, v6}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 433
    .end local v0    # "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "event":Ljava/lang/String;
    .end local v4    # "params":[Ljava/lang/Object;
    :pswitch_2
    const-string v5, "In-app handler received MESSAGE_SHOW_INAPP_TEST"

    invoke-static {v5}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 439
    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p0, v6, v5}, Lcom/localytics/android/MarketingHandler;->_upload(ZLjava/lang/String;)V

    .line 440
    new-instance v5, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v6, Lcom/localytics/android/MarketingHandler$2;

    invoke-direct {v6, p0}, Lcom/localytics/android/MarketingHandler$2;-><init>(Lcom/localytics/android/MarketingHandler;)V

    const-wide/16 v8, 0x3e8

    invoke-virtual {v5, v6, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 452
    :pswitch_3
    const-string v5, "In-app handler received MESSAGE_HANDLE_PUSH_RECEIVED"

    invoke-static {v5}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 454
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/content/Intent;

    .line 456
    .local v3, "intent":Landroid/content/Intent;
    iget-object v5, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    new-instance v6, Lcom/localytics/android/MarketingHandler$3;

    invoke-direct {v6, p0, v3}, Lcom/localytics/android/MarketingHandler$3;-><init>(Lcom/localytics/android/MarketingHandler;Landroid/content/Intent;)V

    invoke-virtual {v5, v6}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 468
    .end local v3    # "intent":Landroid/content/Intent;
    :pswitch_4
    const-string v5, "Marketing handler received MESSAGE_SET_MARKETING_MESSAGE_AS_NOT_DISPLAYED"

    invoke-static {v5}, Lcom/localytics/android/Localytics$Log;->d(Ljava/lang/String;)I

    .line 470
    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 472
    .local v1, "campaignId":I
    iget-object v5, p0, Lcom/localytics/android/MarketingHandler;->mProvider:Lcom/localytics/android/BaseProvider;

    new-instance v6, Lcom/localytics/android/MarketingHandler$4;

    invoke-direct {v6, p0, v1}, Lcom/localytics/android/MarketingHandler$4;-><init>(Lcom/localytics/android/MarketingHandler;I)V

    invoke-virtual {v5, v6}, Lcom/localytics/android/BaseProvider;->runBatchTransaction(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 409
    :pswitch_data_0
    .packed-switch 0xc9
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method handleNotificationReceived(Landroid/content/Intent;)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1753
    const/16 v0, 0xcc

    invoke-virtual {p0, v0, p1}, Lcom/localytics/android/MarketingHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/MarketingHandler;->queueMessage(Landroid/os/Message;)Z

    .line 1754
    return-void
.end method

.method handlePushNotificationOpened(Landroid/content/Intent;)V
    .locals 10
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 362
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v8

    if-nez v8, :cond_1

    .line 404
    :cond_0
    :goto_0
    return-void

    .line 368
    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v8

    const-string v9, "ll"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 369
    .local v6, "llString":Ljava/lang/String;
    if-eqz v6, :cond_0

    .line 373
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 374
    .local v5, "llObject":Lorg/json/JSONObject;
    const-string v8, "ca"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 375
    .local v1, "campaignId":Ljava/lang/String;
    const-string v8, "cr"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 376
    .local v2, "creativeId":Ljava/lang/String;
    const-string v8, "v"

    const-string v9, "1"

    invoke-virtual {v5, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 378
    .local v7, "serverSchemaVersion":Ljava/lang/String;
    const-string v8, "t"

    const/4 v9, 0x0

    invoke-virtual {v5, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 379
    .local v3, "creativeType":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 381
    const-string v3, "Alert"

    .line 384
    :cond_2
    if-eqz v1, :cond_3

    if-eqz v2, :cond_3

    .line 386
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 387
    .local v0, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v8, "Campaign ID"

    invoke-virtual {v0, v8, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 388
    const-string v8, "Creative ID"

    invoke-virtual {v0, v8, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    const-string v8, "Creative Type"

    invoke-virtual {v0, v8, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    const-string v8, "Action"

    const-string v9, "Click"

    invoke-virtual {v0, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    const-string v8, "Schema Version - Client"

    const/4 v9, 0x3

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    const-string v8, "Schema Version - Server"

    invoke-virtual {v0, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    iget-object v8, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    const-string v9, "Localytics Push Opened"

    invoke-interface {v8, v9, v0}, Lcom/localytics/android/LocalyticsDao;->tagEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 397
    .end local v0    # "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    const-string v8, "ll"

    invoke-virtual {p1, v8}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 399
    .end local v1    # "campaignId":Ljava/lang/String;
    .end local v2    # "creativeId":Ljava/lang/String;
    .end local v3    # "creativeType":Ljava/lang/String;
    .end local v5    # "llObject":Lorg/json/JSONObject;
    .end local v7    # "serverSchemaVersion":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 401
    .local v4, "e":Lorg/json/JSONException;
    const-string v8, "Failed to get campaign id or creative id from payload"

    invoke-static {v8}, Lcom/localytics/android/Localytics$Log;->w(Ljava/lang/String;)I

    goto :goto_0
.end method

.method handleTestModeIntent(Landroid/content/Intent;)V
    .locals 13
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 1758
    if-nez p1, :cond_0

    .line 1760
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "intent cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1763
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v9

    .line 1765
    .local v9, "uri":Landroid/net/Uri;
    if-eqz v9, :cond_1

    invoke-virtual {v9}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v9}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "amp"

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v10, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v10}, Lcom/localytics/android/LocalyticsDao;->getApiKey()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1880
    :cond_1
    :goto_0
    return-void

    .line 1770
    :cond_2
    invoke-virtual {v9}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 1771
    .local v8, "path":Ljava/lang/String;
    invoke-virtual {v9}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v7

    .line 1772
    .local v7, "host":Ljava/lang/String;
    const-string v0, "[/]"

    invoke-virtual {v8, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 1774
    .local v6, "components":[Ljava/lang/String;
    if-eqz v6, :cond_1

    array-length v0, v6

    if-eqz v0, :cond_1

    .line 1779
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "testMode"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1781
    aget-object v0, v6, v11

    const-string v1, "enabled"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1783
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0, v12}, Lcom/localytics/android/LocalyticsDao;->setTestModeEnabled(Z)V

    goto :goto_0

    .line 1785
    :cond_3
    aget-object v0, v6, v11

    const-string v1, "launch"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    aget-object v0, v6, v12

    const-string v1, "push"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1787
    const/4 v0, 0x2

    aget-object v3, v6, v0

    .line 1788
    .local v3, "campaign":Ljava/lang/String;
    const/4 v0, 0x3

    aget-object v4, v6, v0

    .line 1789
    .local v4, "creative":Ljava/lang/String;
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0}, Lcom/localytics/android/LocalyticsDao;->getCustomerIdInMemory()Ljava/lang/String;

    move-result-object v5

    .line 1790
    .local v5, "customerID":Ljava/lang/String;
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0}, Lcom/localytics/android/LocalyticsDao;->getAppContext()Landroid/content/Context;

    move-result-object v2

    .line 1792
    .local v2, "appContext":Landroid/content/Context;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1794
    new-instance v0, Lcom/localytics/android/MarketingHandler$7;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/localytics/android/MarketingHandler$7;-><init>(Lcom/localytics/android/MarketingHandler;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-array v1, v11, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingHandler$7;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method public localyticsDidTagEvent(Ljava/lang/String;Ljava/util/Map;J)V
    .locals 1
    .param p1, "eventName"    # Ljava/lang/String;
    .param p3, "clv"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 3271
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0, p1, p2}, Lcom/localytics/android/LocalyticsDao;->triggerInAppMessage(Ljava/lang/String;Ljava/util/Map;)V

    .line 3272
    return-void
.end method

.method public localyticsSessionDidOpen(ZZZ)V
    .locals 4
    .param p1, "isFirstEverSession"    # Z
    .param p2, "isFirstSessionSinceUpgrade"    # Z
    .param p3, "didResumeOldSession"    # Z

    .prologue
    .line 3239
    if-nez p3, :cond_0

    .line 3241
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v0}, Lcom/localytics/android/LocalyticsDao;->getCustomerIdInMemory()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/MarketingHandler;->upload(Ljava/lang/String;)V

    .line 3244
    :cond_0
    invoke-static {}, Lcom/localytics/android/Constants;->isTestModeEnabled()Z

    move-result v0

    if-nez v0, :cond_3

    .line 3246
    if-eqz p1, :cond_1

    .line 3248
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    const-string v1, "AMP First Run"

    invoke-interface {v0, v1}, Lcom/localytics/android/LocalyticsDao;->triggerInAppMessage(Ljava/lang/String;)V

    .line 3250
    :cond_1
    if-eqz p2, :cond_2

    .line 3252
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    const-string v1, "AMP upgrade"

    invoke-interface {v0, v1}, Lcom/localytics/android/LocalyticsDao;->triggerInAppMessage(Ljava/lang/String;)V

    .line 3254
    :cond_2
    if-nez p3, :cond_3

    .line 3256
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/localytics/android/MarketingHandler;->sessionStartMarketingMessageShown:Z

    .line 3257
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    const-string v1, "open"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-interface {v0, v1, v2, v3}, Lcom/localytics/android/LocalyticsDao;->triggerInAppMessage(Ljava/lang/String;Ljava/util/Map;Z)V

    .line 3260
    :cond_3
    return-void
.end method

.method public localyticsSessionWillClose()V
    .locals 0

    .prologue
    .line 3266
    return-void
.end method

.method public localyticsSessionWillOpen(ZZZ)V
    .locals 0
    .param p1, "isFirstEverSession"    # Z
    .param p2, "isFirstSessionSinceUpgrade"    # Z
    .param p3, "willResumeOldSession"    # Z

    .prologue
    .line 3234
    return-void
.end method

.method setDismissButtonImage(Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "image"    # Landroid/graphics/Bitmap;

    .prologue
    .line 3227
    invoke-static {p1}, Lcom/localytics/android/MarketingDialogFragment;->setDismissButtonImage(Landroid/graphics/Bitmap;)V

    .line 3228
    return-void
.end method

.method setFragmentManager(Landroid/support/v4/app/FragmentManager;)V
    .locals 0
    .param p1, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;

    .prologue
    .line 220
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler;->mFragmentManager:Landroid/support/v4/app/FragmentManager;

    .line 221
    return-void
.end method

.method setInAppDismissButtonLocation(Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;)V
    .locals 0
    .param p1, "buttonLocation"    # Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;

    .prologue
    .line 2149
    invoke-static {p1}, Lcom/localytics/android/MarketingDialogFragment;->setInAppDismissButtonLocation(Lcom/localytics/android/Localytics$InAppMessageDismissButtonLocation;)V

    .line 2150
    return-void
.end method

.method setMarketingMessageAsDisplayed(I)Z
    .locals 1
    .param p1, "campaignId"    # I

    .prologue
    .line 492
    new-instance v0, Lcom/localytics/android/MarketingHandler$5;

    invoke-direct {v0, p0, p1}, Lcom/localytics/android/MarketingHandler$5;-><init>(Lcom/localytics/android/MarketingHandler;I)V

    invoke-virtual {p0, v0}, Lcom/localytics/android/MarketingHandler;->getBool(Ljava/util/concurrent/Callable;)Z

    move-result v0

    return v0
.end method

.method showMarketingTest()V
    .locals 2

    .prologue
    .line 3222
    const/16 v0, 0xcb

    iget-object v1, p0, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v1}, Lcom/localytics/android/LocalyticsDao;->getCustomerIdInMemory()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/localytics/android/MarketingHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/localytics/android/MarketingHandler;->queueMessage(Landroid/os/Message;)Z

    .line 3223
    return-void
.end method
