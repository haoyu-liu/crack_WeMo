.class public Lcom/belkin/devices/ResetDevice;
.super Ljava/lang/Object;
.source "ResetDevice.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

.field private rDB:Lcom/belkin/rules/db/RulesDb;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    :try_start_0
    iput-object p1, p0, Lcom/belkin/devices/ResetDevice;->mContext:Landroid/content/Context;

    .line 24
    iget-object v1, p0, Lcom/belkin/devices/ResetDevice;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/rules/db/RulesDb;->getRulesDatabase(Landroid/content/Context;)Lcom/belkin/rules/db/RulesDb;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/devices/ResetDevice;->rDB:Lcom/belkin/rules/db/RulesDb;

    .line 25
    iget-object v1, p0, Lcom/belkin/devices/ResetDevice;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->getInstance(Landroid/content/Context;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/devices/ResetDevice;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :goto_0
    return-void

    .line 26
    :catch_0
    move-exception v0

    .line 27
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public resetByUDN(Ljava/lang/String;)Z
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 103
    :try_start_0
    new-instance v1, Lcom/belkin/devices/ScheduleDevices;

    iget-object v2, p0, Lcom/belkin/devices/ResetDevice;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/belkin/devices/ScheduleDevices;-><init>(Landroid/content/Context;)V

    .line 105
    .local v1, "schdDev":Lcom/belkin/devices/ScheduleDevices;
    iget-object v2, p0, Lcom/belkin/devices/ResetDevice;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v2, p1}, Lcom/belkin/rules/db/RulesDb;->removeRulesByUDN(Ljava/lang/String;)V

    .line 106
    invoke-virtual {v1, p1}, Lcom/belkin/devices/ScheduleDevices;->updateDeviceSchedule(Ljava/lang/String;)V

    .line 107
    iget-object v2, p0, Lcom/belkin/devices/ResetDevice;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    iget-object v3, p0, Lcom/belkin/devices/ResetDevice;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->sendDBDataToPlugin(Landroid/content/Context;)Ljava/lang/String;

    .line 109
    iget-object v2, p0, Lcom/belkin/devices/ResetDevice;->mUpnpDeviceList:Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    invoke-virtual {v2, p1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->clearNameIconRule(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 113
    .end local v1    # "schdDev":Lcom/belkin/devices/ScheduleDevices;
    :goto_0
    return v2

    .line 110
    :catch_0
    move-exception v0

    .line 111
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 113
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public resetRemote(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "mac"    # Ljava/lang/String;
    .param p2, "pluginID"    # Ljava/lang/String;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "authHeader"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 33
    :try_start_0
    new-instance v0, Lcom/belkin/cloud/CloudServices;

    iget-object v7, p0, Lcom/belkin/devices/ResetDevice;->mContext:Landroid/content/Context;

    invoke-direct {v0, v7}, Lcom/belkin/cloud/CloudServices;-><init>(Landroid/content/Context;)V

    .line 34
    .local v0, "cs":Lcom/belkin/cloud/CloudServices;
    invoke-virtual {v0, p1, p2, p4}, Lcom/belkin/cloud/CloudServices;->resetNameIconRules(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 35
    iget-object v7, p0, Lcom/belkin/devices/ResetDevice;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v7, p3}, Lcom/belkin/rules/db/RulesDb;->removeRulesByUDN(Ljava/lang/String;)V

    .line 37
    const/4 v7, 0x3

    new-array v4, v7, [Ljava/lang/String;

    .line 38
    .local v4, "param":[Ljava/lang/String;
    const/4 v7, 0x0

    const/16 v8, 0x1390

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v7

    .line 39
    const/4 v7, 0x1

    aput-object p4, v4, v7

    .line 40
    const/4 v7, 0x2

    aput-object p1, v4, v7

    .line 42
    new-instance v3, Lcom/belkin/remoteservice/RestfulWebservice;

    iget-object v7, p0, Lcom/belkin/devices/ResetDevice;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4, v7}, Lcom/belkin/remoteservice/RestfulWebservice;-><init>([Ljava/lang/String;Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 44
    .local v3, "objHttpConnection":Lcom/belkin/remoteservice/RestfulWebservice;
    const/4 v7, 0x0

    :try_start_1
    new-array v7, v7, [Ljava/lang/Void;

    invoke-virtual {v3, v7}, Lcom/belkin/remoteservice/RestfulWebservice;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v7

    invoke-virtual {v7}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 53
    :goto_0
    :try_start_2
    invoke-virtual {v3}, Lcom/belkin/remoteservice/RestfulWebservice;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v7

    sget-object v8, Landroid/os/AsyncTask$Status;->RUNNING:Landroid/os/AsyncTask$Status;

    invoke-virtual {v7, v8}, Landroid/os/AsyncTask$Status;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result v7

    if-eqz v7, :cond_0

    .line 55
    const-wide/16 v8, 0x3e8

    :try_start_3
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 56
    :catch_0
    move-exception v1

    .line 58
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_4
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 62
    .end local v0    # "cs":Lcom/belkin/cloud/CloudServices;
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .end local v3    # "objHttpConnection":Lcom/belkin/remoteservice/RestfulWebservice;
    .end local v4    # "param":[Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 63
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    move v5, v6

    .line 65
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    return v5

    .line 45
    .restart local v0    # "cs":Lcom/belkin/cloud/CloudServices;
    .restart local v3    # "objHttpConnection":Lcom/belkin/remoteservice/RestfulWebservice;
    .restart local v4    # "param":[Ljava/lang/String;
    :catch_2
    move-exception v2

    .line 47
    .local v2, "e1":Ljava/lang/InterruptedException;
    :try_start_5
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 48
    .end local v2    # "e1":Ljava/lang/InterruptedException;
    :catch_3
    move-exception v2

    .line 50
    .local v2, "e1":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v2}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_0
.end method

.method public resetRemoteByUDN(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "mac"    # Ljava/lang/String;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "authHeader"    # Ljava/lang/String;

    .prologue
    .line 70
    :try_start_0
    iget-object v4, p0, Lcom/belkin/devices/ResetDevice;->rDB:Lcom/belkin/rules/db/RulesDb;

    invoke-virtual {v4, p2}, Lcom/belkin/rules/db/RulesDb;->removeRulesByUDN(Ljava/lang/String;)V

    .line 72
    const/4 v4, 0x3

    new-array v3, v4, [Ljava/lang/String;

    .line 73
    .local v3, "param":[Ljava/lang/String;
    const/4 v4, 0x0

    const/16 v5, 0x1390

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 74
    const/4 v4, 0x1

    aput-object p3, v3, v4

    .line 75
    const/4 v4, 0x2

    aput-object p1, v3, v4

    .line 77
    new-instance v2, Lcom/belkin/remoteservice/RestfulWebservice;

    iget-object v4, p0, Lcom/belkin/devices/ResetDevice;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3, v4}, Lcom/belkin/remoteservice/RestfulWebservice;-><init>([Ljava/lang/String;Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 79
    .local v2, "objHttpConnection":Lcom/belkin/remoteservice/RestfulWebservice;
    const/4 v4, 0x0

    :try_start_1
    new-array v4, v4, [Ljava/lang/Void;

    invoke-virtual {v2, v4}, Lcom/belkin/remoteservice/RestfulWebservice;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 88
    :goto_0
    :try_start_2
    invoke-virtual {v2}, Lcom/belkin/remoteservice/RestfulWebservice;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v4

    sget-object v5, Landroid/os/AsyncTask$Status;->RUNNING:Landroid/os/AsyncTask$Status;

    invoke-virtual {v4, v5}, Landroid/os/AsyncTask$Status;->equals(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result v4

    if-eqz v4, :cond_0

    .line 90
    const-wide/16 v4, 0x3e8

    :try_start_3
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 91
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 96
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v2    # "objHttpConnection":Lcom/belkin/remoteservice/RestfulWebservice;
    .end local v3    # "param":[Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 97
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 99
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return-void

    .line 80
    .restart local v2    # "objHttpConnection":Lcom/belkin/remoteservice/RestfulWebservice;
    .restart local v3    # "param":[Ljava/lang/String;
    :catch_2
    move-exception v1

    .line 82
    .local v1, "e1":Ljava/lang/InterruptedException;
    :try_start_5
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 83
    .end local v1    # "e1":Ljava/lang/InterruptedException;
    :catch_3
    move-exception v1

    .line 85
    .local v1, "e1":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_0
.end method
