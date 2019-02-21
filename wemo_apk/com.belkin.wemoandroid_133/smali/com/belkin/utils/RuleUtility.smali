.class public Lcom/belkin/utils/RuleUtility;
.super Ljava/lang/Object;
.source "RuleUtility.java"


# static fields
.field public static final RULE_DB_SIZE_FOR_VACUUM:I = 0x19000

.field public static final TAG:Ljava/lang/String; = "RuleUtility"

.field private static lock:Ljava/lang/Object;


# instance fields
.field private calculator:Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;

.field private context:Landroid/content/Context;

.field private dbMigration:Z

.field private firmWareNumber:[Ljava/lang/String;

.field private firmwareVer:I

.field private gps:Lcom/belkin/utils/GPSTracker;

.field private latitude:D

.field private location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

.field private longitude:D

.field private networkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private sunriseSunsetTime:Lorg/json/JSONArray;

.field private unZipLocation:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 106
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/belkin/utils/RuleUtility;->lock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v2, 0x0

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/utils/RuleUtility;->dbMigration:Z

    .line 95
    iput-wide v2, p0, Lcom/belkin/utils/RuleUtility;->latitude:D

    .line 96
    iput-wide v2, p0, Lcom/belkin/utils/RuleUtility;->longitude:D

    .line 109
    iput-object p1, p0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    .line 110
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/utils/RuleUtility;->networkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 111
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/utils/RuleUtility;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 112
    return-void
.end method

.method public static copyDBFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p0, "sourcePathStr"    # Ljava/lang/String;
    .param p1, "targetPathStr"    # Ljava/lang/String;

    .prologue
    .line 900
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 901
    .local v1, "f":Ljava/io/File;
    const/4 v2, 0x0

    .line 902
    .local v2, "fis":Ljava/io/FileInputStream;
    const/4 v4, 0x0

    .line 904
    .local v4, "fos":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 905
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .local v3, "fis":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 906
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .local v5, "fos":Ljava/io/FileOutputStream;
    :try_start_2
    invoke-static {v3, v5}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 907
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 912
    if-eqz v5, :cond_0

    .line 913
    :try_start_3
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 916
    :cond_0
    if-eqz v3, :cond_1

    .line 917
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 920
    :cond_1
    const-string v7, "RuleUtility"

    const-string v8, "Copied successfully"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .line 925
    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :goto_0
    return-void

    .line 921
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v6

    .line 922
    .local v6, "ioe":Ljava/io/IOException;
    const-string v7, "RuleUtility"

    const-string v8, "IO exception while closing file output stream: "

    invoke-static {v7, v8, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .line 924
    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_0

    .line 908
    .end local v6    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 909
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_4
    const-string v7, "RuleUtility"

    const-string v8, "Exception while copying DB: "

    invoke-static {v7, v8, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 912
    if-eqz v4, :cond_2

    .line 913
    :try_start_5
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 916
    :cond_2
    if-eqz v2, :cond_3

    .line 917
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 920
    :cond_3
    const-string v7, "RuleUtility"

    const-string v8, "Copied successfully"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_0

    .line 921
    :catch_2
    move-exception v6

    .line 922
    .restart local v6    # "ioe":Ljava/io/IOException;
    const-string v7, "RuleUtility"

    const-string v8, "IO exception while closing file output stream: "

    invoke-static {v7, v8, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 911
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v6    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    .line 912
    :goto_2
    if-eqz v4, :cond_4

    .line 913
    :try_start_6
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 916
    :cond_4
    if-eqz v2, :cond_5

    .line 917
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 920
    :cond_5
    const-string v8, "RuleUtility"

    const-string v9, "Copied successfully"

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 923
    :goto_3
    throw v7

    .line 921
    :catch_3
    move-exception v6

    .line 922
    .restart local v6    # "ioe":Ljava/io/IOException;
    const-string v8, "RuleUtility"

    const-string v9, "IO exception while closing file output stream: "

    invoke-static {v8, v9, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .line 911
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v6    # "ioe":Ljava/io/IOException;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v7

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_2

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catchall_2
    move-exception v7

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_2

    .line 908
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :catch_4
    move-exception v0

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_1

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catch_5
    move-exception v0

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_1
.end method

.method private dirChecker(Ljava/lang/String;)V
    .locals 3
    .param p1, "dir"    # Ljava/lang/String;

    .prologue
    .line 200
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/belkin/utils/RuleUtility;->unZipLocation:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 201
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    .line 202
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 204
    :cond_0
    return-void
.end method

.method public static final doesRulesDBFileExist()Z
    .locals 5

    .prologue
    .line 891
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 893
    .local v1, "ruleDBFileWithPath":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    .line 894
    .local v0, "existence":Z
    const-string v2, "RuleUtility"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RULE DB FILE at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": Existence = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 895
    return v0
.end method

.method public static getLocalDBName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 813
    const-string v0, "pluginrules2.db"

    .line 815
    .local v0, "cordovaDBName":Ljava/lang/String;
    return-object v0
.end method

.method public static getLocalDBPath()Ljava/lang/String;
    .locals 3

    .prologue
    .line 318
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/unzipped/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 319
    .local v0, "dbPath":Ljava/lang/String;
    return-object v0
.end method

.method public static getStoragePath()Ljava/io/File;
    .locals 3

    .prologue
    .line 323
    const/4 v1, 0x0

    .line 325
    .local v1, "file":Ljava/io/File;
    sget-object v2, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v2}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 326
    .local v0, "context":Landroid/content/Context;
    invoke-static {}, Lcom/belkin/utils/LogUtils;->isDebug()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 327
    const-string v2, "Wemo"

    invoke-virtual {v0, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 333
    :goto_0
    return-object v1

    .line 329
    :cond_0
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    goto :goto_0
.end method

.method private getWeeklySRSSTime(ILjava/util/Calendar;Ljava/lang/String;)V
    .locals 28
    .param p1, "i"    # I
    .param p2, "calendar"    # Ljava/util/Calendar;
    .param p3, "day"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 428
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/utils/RuleUtility;->calculator:Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->getOfficialSunriseForDate(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v17

    .line 429
    .local v17, "sunriseTime":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/utils/RuleUtility;->calculator:Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;->getOfficialSunsetForDate(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v22

    .line 430
    .local v22, "sunsetTime":Ljava/lang/String;
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Sunrise time is : "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Sunrset time is : "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v23

    .line 434
    .local v23, "tz":Ljava/util/TimeZone;
    const-string v24, ":"

    move-object/from16 v0, v17

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 435
    .local v9, "splitSunRise":[Ljava/lang/String;
    const-string v24, ":"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 437
    .local v10, "splitSunSet":[Ljava/lang/String;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v4

    .line 438
    .local v4, "midnightCalendar":Ljava/util/Calendar;
    const/16 v24, 0x1

    const/16 v25, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v4, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 439
    const/16 v24, 0x2

    const/16 v25, 0x2

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v4, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 440
    const/16 v24, 0x5

    const/16 v25, 0x5

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v4, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 441
    const/16 v24, 0xb

    const/16 v25, 0x0

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v4, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 442
    const/16 v24, 0xc

    const/16 v25, 0x0

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v4, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 443
    const-string v24, "GMT+00:00"

    invoke-static/range {v24 .. v24}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 444
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "midnightCalendar is : "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v4}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v11

    .line 447
    .local v11, "sunRiseCalendar":Ljava/util/Calendar;
    const/16 v24, 0x1

    const/16 v25, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v11, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 448
    const/16 v24, 0x2

    const/16 v25, 0x2

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v11, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 449
    const/16 v24, 0x5

    const/16 v25, 0x5

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v11, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 450
    const/16 v24, 0xb

    const/16 v25, 0x0

    aget-object v25, v9, v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v11, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 451
    const/16 v24, 0xc

    const/16 v25, 0x1

    aget-object v25, v9, v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    invoke-virtual {v11, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 452
    const-string v24, "GMT+00:00"

    invoke-static/range {v24 .. v24}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v11, v0}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 453
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sunRiseCalendar is : "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v11}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 456
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v16

    .line 457
    .local v16, "sunSetCalendar":Ljava/util/Calendar;
    const-string v24, "GMT+00:00"

    invoke-static/range {v24 .. v24}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v24

    move-object/from16 v0, v16

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 458
    const/16 v24, 0xc

    const/16 v25, 0x1

    aget-object v25, v10, v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v25

    move-object/from16 v0, v16

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 459
    const/16 v24, 0xb

    const/16 v25, 0x0

    aget-object v25, v10, v25

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v25

    move-object/from16 v0, v16

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 460
    const/16 v24, 0x5

    const/16 v25, 0x5

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v25

    move-object/from16 v0, v16

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 461
    const/16 v24, 0x2

    const/16 v25, 0x2

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v25

    move-object/from16 v0, v16

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 462
    const/16 v24, 0x1

    const/16 v25, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v25

    move-object/from16 v0, v16

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 463
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sunSetCalendar is : "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v16 .. v16}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 465
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v5

    .line 466
    .local v5, "offsetCalendar":Ljava/util/Calendar;
    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 467
    invoke-virtual {v5}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v24

    invoke-virtual/range {v23 .. v25}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v8

    .line 469
    .local v8, "offsetValue":I
    invoke-virtual {v4}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v6

    .line 470
    .local v6, "midnightCalenderInSec":J
    invoke-virtual {v11}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v24

    sub-long v24, v24, v6

    int-to-long v0, v8

    move-wide/from16 v26, v0

    add-long v24, v24, v26

    const-wide/16 v26, 0x3e8

    div-long v12, v24, v26

    .line 471
    .local v12, "sunRiseTimeInSec":J
    invoke-virtual/range {v16 .. v16}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v24

    sub-long v24, v24, v6

    int-to-long v0, v8

    move-wide/from16 v26, v0

    add-long v24, v24, v26

    const-wide/16 v26, 0x3e8

    div-long v18, v24, v26

    .line 472
    .local v18, "sunSetTimeInSec":J
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sunRiseTimeInSec before: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sunSetTimeInSec before: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 475
    sget v24, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    cmp-long v24, v12, v24

    if-lez v24, :cond_0

    .line 477
    sget v24, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    sub-long v12, v12, v24

    .line 479
    :cond_0
    sget v24, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    cmp-long v24, v18, v24

    if-lez v24, :cond_1

    .line 481
    sget v24, Lcom/belkin/rules/utils/RulesConstants;->MAX_HOUR:I

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    sub-long v18, v18, v24

    .line 483
    :cond_1
    cmp-long v24, v12, v18

    if-lez v24, :cond_2

    .line 484
    const-wide/32 v24, 0x15180

    add-long v18, v18, v24

    .line 487
    :cond_2
    const-wide/16 v24, 0xa

    rem-long v14, v12, v24

    .line 488
    .local v14, "sunRiseTimeInSecNew":J
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sunRiseTimeInSec : "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 489
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sunRiseTimeInSecNew : "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 490
    sub-long/2addr v12, v14

    .line 492
    const-wide/16 v24, 0xa

    rem-long v20, v18, v24

    .line 493
    .local v20, "sunSetTimeInSecNew":J
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sunSetTimeInSec : "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 494
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sunSetTimeInSecNew : "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 495
    sub-long v18, v18, v20

    .line 497
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sunRiseTimeInSec is : "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 498
    const-string v24, "RuleUtility"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sunSetTimeInSec is : "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/utils/RuleUtility;->sunriseSunsetTime:Lorg/json/JSONArray;

    move-object/from16 v24, v0

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "|"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ":"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-static/range {v18 .. v19}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move/from16 v1, p1

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 515
    return-void
.end method

.method private migrateDB(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 294
    new-instance v1, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/databases/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "pluginrules2.db"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 295
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 297
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 298
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 299
    .local v2, "fous":Ljava/io/FileOutputStream;
    new-instance v3, Ljava/io/FileInputStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "pluginrules2.db"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 300
    .local v3, "istream":Ljava/io/FileInputStream;
    if-eqz v3, :cond_0

    .line 301
    invoke-static {v3, v2}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 302
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 303
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 309
    .end local v2    # "fous":Ljava/io/FileOutputStream;
    .end local v3    # "istream":Ljava/io/FileInputStream;
    :cond_0
    :goto_0
    return-void

    .line 305
    :catch_0
    move-exception v0

    .line 306
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public DownloadFromUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 20
    .param p1, "DownloadUrl"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .line 214
    const-string v9, ""

    .line 216
    .local v9, "pragmaUserVersion":Ljava/lang/String;
    :try_start_0
    new-instance v5, Ljava/io/File;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "/databases/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v5, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 217
    .local v5, "f":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_0

    .line 218
    invoke-virtual {v5}, Ljava/io/File;->mkdir()Z

    .line 219
    :cond_0
    new-instance v13, Ljava/net/URL;

    move-object/from16 v0, p1

    invoke-direct {v13, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 220
    .local v13, "url":Ljava/net/URL;
    new-instance v6, Ljava/io/File;

    move-object/from16 v0, p2

    invoke-direct {v6, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 221
    .local v6, "file":Ljava/io/File;
    if-eqz v6, :cond_1

    .line 222
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 223
    .local v10, "startTime":J
    const-string v14, "RuleUtility"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "download begining download url:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " downloadedfilename:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    invoke-virtual {v13}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v12

    .line 226
    .local v12, "ucon":Ljava/net/URLConnection;
    invoke-virtual {v12}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    .line 227
    .local v8, "is":Ljava/io/InputStream;
    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-direct {v2, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 228
    .local v2, "bis":Ljava/io/BufferedInputStream;
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 229
    .local v7, "fos":Ljava/io/FileOutputStream;
    invoke-static {v2, v7}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 230
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->flush()V

    .line 231
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->close()V

    .line 232
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V

    .line 234
    const-string v14, "RuleUtility"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "download ready in "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    sub-long v16, v16, v10

    const-wide/16 v18, 0x3e8

    div-long v16, v16, v18

    invoke-virtual/range {v15 .. v17}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " sec"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "/databases/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "pluginrulesCompressed.zip"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/belkin/utils/RuleUtility;->unzip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 246
    .end local v2    # "bis":Ljava/io/BufferedInputStream;
    .end local v5    # "f":Ljava/io/File;
    .end local v6    # "file":Ljava/io/File;
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "is":Ljava/io/InputStream;
    .end local v10    # "startTime":J
    .end local v12    # "ucon":Ljava/net/URLConnection;
    .end local v13    # "url":Ljava/net/URL;
    :cond_1
    :goto_0
    return-object v9

    .line 238
    :catch_0
    move-exception v3

    .line 239
    .local v3, "e":Ljava/lang/Exception;
    const-string v14, "RuleUtility"

    const-string v15, "DownloadFromURL() Exception: "

    invoke-static {v14, v15, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 241
    :try_start_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v14

    const-string v15, "pluginrules2.db"

    invoke-virtual {v14, v15}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v14

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/belkin/utils/RuleUtility;->copyRawDB(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 242
    :catch_1
    move-exception v4

    .line 243
    .local v4, "e1":Ljava/io/IOException;
    const-string v14, "RuleUtility"

    const-string v15, "DownloadFromURL() IOException: "

    invoke-static {v14, v15, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public checkCopyRawDBStatus()Ljava/lang/String;
    .locals 8

    .prologue
    .line 623
    const-string v2, ""

    .line 625
    .local v2, "statusCheck":Ljava/lang/String;
    :try_start_0
    new-instance v1, Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v4, p0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    invoke-direct {v1, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 626
    .local v1, "sharePreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getAppUsedCount()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    .line 627
    const-string v4, "RuleUtility"

    const-string v5, "...First time launch..."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 629
    new-instance v0, Lcom/belkin/utils/RuleUtility;

    iget-object v4, p0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    invoke-direct {v0, v4}, Lcom/belkin/utils/RuleUtility;-><init>(Landroid/content/Context;)V

    .line 630
    .local v0, "ruleUtility":Lcom/belkin/utils/RuleUtility;
    iget-object v4, p0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    const-string v5, "pluginrules2.db"

    invoke-virtual {v4, v5}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lcom/belkin/utils/RuleUtility;->copyRawDB(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 631
    const-wide/16 v4, 0x1

    invoke-virtual {v1, v4, v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setAppUsedCount(J)V

    .line 632
    const-string v2, "true"

    .end local v0    # "ruleUtility":Lcom/belkin/utils/RuleUtility;
    :goto_0
    move-object v3, v2

    .line 643
    .end local v1    # "sharePreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    .end local v2    # "statusCheck":Ljava/lang/String;
    .local v3, "statusCheck":Ljava/lang/String;
    :goto_1
    return-object v3

    .line 635
    .end local v3    # "statusCheck":Ljava/lang/String;
    .restart local v1    # "sharePreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    .restart local v2    # "statusCheck":Ljava/lang/String;
    :cond_0
    const-string v4, "RuleUtility"

    const-string v5, "...AppUsedCount is 1 - Do nothing..."

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 636
    const-string v2, "false"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 640
    .end local v1    # "sharePreference":Lcom/belkin/wemo/cache/utils/SharePreferences;
    :catch_0
    move-exception v4

    move-object v3, v2

    .line 643
    .end local v2    # "statusCheck":Ljava/lang/String;
    .restart local v3    # "statusCheck":Ljava/lang/String;
    goto :goto_1
.end method

.method public checkHomeNetworkStatus()Ljava/lang/String;
    .locals 12

    .prologue
    .line 680
    const-string v3, ""

    .line 681
    .local v3, "connectionStatus":Ljava/lang/String;
    iget-object v9, p0, Lcom/belkin/utils/RuleUtility;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getRuleHomeSSID()Ljava/lang/String;

    move-result-object v1

    .line 682
    .local v1, "RuleHomeSSID":Ljava/lang/String;
    iget-object v9, p0, Lcom/belkin/utils/RuleUtility;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeSSIDs()Ljava/util/Set;

    move-result-object v7

    .line 683
    .local v7, "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v9, p0, Lcom/belkin/utils/RuleUtility;->networkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v0

    .line 684
    .local v0, "ConnectedHomeSSID":Ljava/lang/String;
    const-string v2, ""

    .line 686
    .local v2, "StoredHomeSSID":Ljava/lang/String;
    const/4 v5, 0x0

    .line 687
    .local v5, "isResetDbversion":Z
    :try_start_0
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 688
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 689
    .local v8, "string":Ljava/lang/String;
    const-string v9, ""

    invoke-virtual {v2, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 690
    move-object v2, v8

    .line 691
    :cond_1
    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 693
    const/4 v5, 0x1

    goto :goto_0

    .line 696
    .end local v8    # "string":Ljava/lang/String;
    :cond_2
    const-string v9, ""

    invoke-virtual {v1, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 697
    const-string v9, ""

    invoke-virtual {v2, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 698
    iget-object v9, p0, Lcom/belkin/utils/RuleUtility;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRuleHomeSSID(Ljava/lang/String;)Z

    .line 703
    :cond_3
    :goto_1
    if-eqz v5, :cond_5

    .line 705
    iget-object v9, p0, Lcom/belkin/utils/RuleUtility;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v10, "0"

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 706
    const-string v9, "RuleUtility"

    const-string v10, " ConnectedHomeSSID is :  StoredHomeSSID"

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 719
    .end local v6    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_2
    return-object v3

    .line 700
    .restart local v6    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_4
    iget-object v9, p0, Lcom/belkin/utils/RuleUtility;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9, v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRuleHomeSSID(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 716
    .end local v6    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catch_0
    move-exception v4

    .line 717
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 708
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v6    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_5
    :try_start_1
    iget-object v9, p0, Lcom/belkin/utils/RuleUtility;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 710
    const-string v9, "RuleUtility"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, " RemoteEnabled is : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/utils/RuleUtility;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v11}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 712
    :cond_6
    iget-object v9, p0, Lcom/belkin/utils/RuleUtility;->sharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    const-string v10, "-1"

    invoke-virtual {v9, v10}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 713
    const-string v9, "RuleUtility"

    const-string v10, " DB Cleaned Version set to -1"

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method public convertHHMMtoGMT(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "time"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 533
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v7

    .line 534
    .local v7, "tz":Ljava/util/TimeZone;
    invoke-virtual {v7, v11, v11}, Ljava/util/TimeZone;->getDisplayName(ZI)Ljava/lang/String;

    move-result-object v3

    .line 536
    .local v3, "currentTimeZone":Ljava/lang/String;
    const-string v8, "RuleUtility"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "current timezone name is : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v7}, Ljava/util/TimeZone;->getDisplayName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 537
    const-string v8, "RuleUtility"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "current timezone id is : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v7}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 539
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string v8, "hhh:mm"

    invoke-direct {v6, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 540
    .local v6, "format":Ljava/text/SimpleDateFormat;
    new-instance v8, Ljava/util/SimpleTimeZone;

    invoke-direct {v8, v11, v3}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-static {v8}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 541
    .local v0, "cal":Ljava/util/Calendar;
    invoke-virtual {v6, v0}, Ljava/text/SimpleDateFormat;->setCalendar(Ljava/util/Calendar;)V

    .line 542
    move-object v5, p1

    .line 543
    .local v5, "dateTime":Ljava/lang/String;
    invoke-virtual {v6, v5}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    .line 544
    .local v4, "date":Ljava/util/Date;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 545
    .local v1, "calendar":Ljava/util/Calendar;
    invoke-virtual {v1, v4}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 546
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v9, 0xb

    invoke-virtual {v1, v9}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0xc

    invoke-virtual {v1, v9}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 547
    .local v2, "convertedDate":Ljava/lang/String;
    return-object v2
.end method

.method public copyDataBase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "storedPath"    # Ljava/lang/String;
    .param p2, "copiedPath"    # Ljava/lang/String;
    .param p3, "pragmaCheck"    # Ljava/lang/String;

    .prologue
    .line 256
    const-string v7, ""

    .line 258
    .local v7, "pragmaUserVersion":Ljava/lang/String;
    :try_start_0
    const-string v9, "RuleUtility"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "copyDataBase storedPath: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " copiedPath: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " pragmaCheck: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 260
    .local v1, "f":Ljava/io/File;
    const/4 v2, 0x0

    .line 261
    .local v2, "fis":Ljava/io/FileInputStream;
    const/4 v4, 0x0

    .line 263
    .local v4, "fos":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 264
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .local v3, "fis":Ljava/io/FileInputStream;
    :try_start_2
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 265
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .local v5, "fos":Ljava/io/FileOutputStream;
    :try_start_3
    invoke-static {v3, v5}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 266
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_6
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 271
    :try_start_4
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    .line 272
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 273
    const-string v9, "RuleUtility"

    const-string v10, "Copied successfully"

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    const-string v9, "true"

    invoke-virtual {p3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 275
    invoke-virtual {p0}, Lcom/belkin/utils/RuleUtility;->getPragmaVersion()Ljava/lang/String;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    move-result-object v7

    :cond_0
    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :cond_1
    :goto_0
    move-object v8, v7

    .line 285
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "pragmaUserVersion":Ljava/lang/String;
    .local v8, "pragmaUserVersion":Ljava/lang/String;
    :goto_1
    return-object v8

    .line 277
    .end local v8    # "pragmaUserVersion":Ljava/lang/String;
    .restart local v1    # "f":Ljava/io/File;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "pragmaUserVersion":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 278
    .local v6, "ioe":Ljava/io/IOException;
    :try_start_5
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .line 280
    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_0

    .line 267
    .end local v6    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 268
    .local v0, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 271
    :try_start_7
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 272
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 273
    const-string v9, "RuleUtility"

    const-string v10, "Copied successfully"

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    const-string v9, "true"

    invoke-virtual {p3, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 275
    invoke-virtual {p0}, Lcom/belkin/utils/RuleUtility;->getPragmaVersion()Ljava/lang/String;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    move-result-object v7

    goto :goto_0

    .line 277
    :catch_2
    move-exception v6

    .line 278
    .restart local v6    # "ioe":Ljava/io/IOException;
    :try_start_8
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    goto :goto_0

    .line 282
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v6    # "ioe":Ljava/io/IOException;
    :catch_3
    move-exception v0

    .line 283
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v8, v7

    .line 285
    .end local v7    # "pragmaUserVersion":Ljava/lang/String;
    .restart local v8    # "pragmaUserVersion":Ljava/lang/String;
    goto :goto_1

    .line 270
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v8    # "pragmaUserVersion":Ljava/lang/String;
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "pragmaUserVersion":Ljava/lang/String;
    :catchall_0
    move-exception v9

    .line 271
    :goto_3
    :try_start_9
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 272
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 273
    const-string v10, "RuleUtility"

    const-string v11, "Copied successfully"

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    const-string v10, "true"

    invoke-virtual {p3, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 275
    invoke-virtual {p0}, Lcom/belkin/utils/RuleUtility;->getPragmaVersion()Ljava/lang/String;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_4
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    move-result-object v7

    .line 279
    :cond_2
    :goto_4
    :try_start_a
    throw v9

    .line 277
    :catch_4
    move-exception v6

    .line 278
    .restart local v6    # "ioe":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_3

    goto :goto_4

    .line 270
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v6    # "ioe":Ljava/io/IOException;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v9

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_3

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catchall_2
    move-exception v9

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_3

    .line 267
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    :catch_5
    move-exception v0

    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_2

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catch_6
    move-exception v0

    move-object v4, v5

    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    move-object v2, v3

    .end local v3    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    goto :goto_2
.end method

.method public copyRawDB(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 10
    .param p1, "dBIStream"    # Ljava/io/InputStream;
    .param p2, "copiedPath"    # Ljava/lang/String;

    .prologue
    .line 558
    :try_start_0
    const-string v7, "RuleUtility"

    const-string v8, "Inside Raw DB copyDataBase"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 559
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 560
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_0

    .line 561
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 563
    :cond_0
    const/4 v2, 0x0

    .line 564
    .local v2, "fis":Ljava/io/InputStream;
    const/4 v3, 0x0

    .line 566
    .local v3, "fos":Ljava/io/FileOutputStream;
    move-object v2, p1

    .line 567
    :try_start_1
    new-instance v4, Ljava/io/FileOutputStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "pluginrules2.db"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 569
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .local v4, "fos":Ljava/io/FileOutputStream;
    :goto_0
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v5

    .line 570
    .local v5, "i":I
    const/4 v7, -0x1

    if-eq v5, v7, :cond_1

    .line 571
    invoke-virtual {v4, v5}, Ljava/io/FileOutputStream;->write(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    .line 577
    .end local v5    # "i":I
    :catch_0
    move-exception v0

    move-object v3, v4

    .line 578
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v3    # "fos":Ljava/io/FileOutputStream;
    :goto_1
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 582
    :try_start_4
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 583
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 584
    const-string v7, "RuleUtility"

    const-string v8, "RAW DB Copied sucssefully"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 593
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fis":Ljava/io/InputStream;
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    :goto_2
    return-void

    .line 575
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "fis":Ljava/io/InputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "i":I
    :cond_1
    :try_start_5
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->flush()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 582
    :try_start_6
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 583
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 584
    const-string v7, "RuleUtility"

    const-string v8, "RAW DB Copied sucssefully"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    move-object v3, v4

    .line 588
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fos":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 586
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v6

    .line 587
    .local v6, "ioe":Ljava/io/IOException;
    :try_start_7
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    move-object v3, v4

    .line 589
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fos":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 586
    .end local v5    # "i":I
    .end local v6    # "ioe":Ljava/io/IOException;
    .restart local v0    # "e":Ljava/lang/Exception;
    :catch_2
    move-exception v6

    .line 587
    .restart local v6    # "ioe":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_2

    .line 590
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fis":Ljava/io/InputStream;
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .end local v6    # "ioe":Ljava/io/IOException;
    :catch_3
    move-exception v7

    goto :goto_2

    .line 581
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "fis":Ljava/io/InputStream;
    .restart local v3    # "fos":Ljava/io/FileOutputStream;
    :catchall_0
    move-exception v7

    .line 582
    :goto_3
    :try_start_8
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 583
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 584
    const-string v8, "RuleUtility"

    const-string v9, "RAW DB Copied sucssefully"

    invoke-static {v8, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3

    .line 588
    :goto_4
    :try_start_9
    throw v7

    .line 586
    :catch_4
    move-exception v6

    .line 587
    .restart local v6    # "ioe":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    goto :goto_4

    .line 581
    .end local v3    # "fos":Ljava/io/FileOutputStream;
    .end local v6    # "ioe":Ljava/io/IOException;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v7

    move-object v3, v4

    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "fos":Ljava/io/FileOutputStream;
    goto :goto_3

    .line 577
    :catch_5
    move-exception v0

    goto :goto_1
.end method

.method public createLocalZippedDBFilePath()Ljava/lang/String;
    .locals 7

    .prologue
    .line 848
    sget-object v4, Lcom/belkin/utils/RuleUtility;->lock:Ljava/lang/Object;

    monitor-enter v4

    .line 849
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 851
    .local v1, "rulesDBFileNameWithPath":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/belkin/utils/RuleUtility;->filesizeInByte(Ljava/lang/String;)I

    move-result v3

    const v5, 0x19000

    if-lt v3, v5, :cond_0

    .line 853
    invoke-virtual {p0, v1}, Lcom/belkin/utils/RuleUtility;->reduceRulesDBFileSize(Ljava/lang/String;)V

    .line 857
    :cond_0
    const-string v3, "RuleUtility"

    const-string v5, "Local DB ZIP file requested: Creating new ZIP file for local DB."

    invoke-static {v3, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 859
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "/"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "temppluginRules.db"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v5, "false"

    invoke-virtual {p0, v1, v3, v5}, Lcom/belkin/utils/RuleUtility;->copyDataBase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 860
    const/4 v3, 0x1

    new-array v0, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "temppluginRules.db"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v3

    .line 861
    .local v0, "filesToBeZipped":[Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "/"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "pluginrulesCompressed.zip"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v3}, Lcom/belkin/utils/RuleUtility;->zip([Ljava/lang/String;Ljava/lang/String;)V

    .line 862
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "/"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "pluginrulesCompressed.zip"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 864
    .local v2, "strLocalZiDBFiplePath":Ljava/lang/String;
    monitor-exit v4

    return-object v2

    .line 865
    .end local v0    # "filesToBeZipped":[Ljava/lang/String;
    .end local v1    # "rulesDBFileNameWithPath":Ljava/lang/String;
    .end local v2    # "strLocalZiDBFiplePath":Ljava/lang/String;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public filesizeInByte(Ljava/lang/String;)I
    .locals 5
    .param p1, "fileWithPath"    # Ljava/lang/String;

    .prologue
    .line 941
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 942
    .local v0, "filenew":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 943
    .local v1, "filesize":I
    const-string v2, "RuleUtility"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FILE = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; SIZE = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 944
    return v1
.end method

.method public firmwareSupportMakerRule(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p1, "firmware"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 757
    const-string v1, "\\."

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/utils/RuleUtility;->firmWareNumber:[Ljava/lang/String;

    .line 758
    iget-object v1, p0, Lcom/belkin/utils/RuleUtility;->firmWareNumber:[Ljava/lang/String;

    const/4 v2, 0x2

    aget-object v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    .line 759
    const-string v1, "RuleUtility"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "firmwareSupportMakerRule():: firmwareVer--> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 761
    const-string v1, "urn:Belkin:device:Maker:1"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 763
    iget v1, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    const/16 v2, 0x1a02

    if-ge v1, v2, :cond_1

    .line 764
    const-string v1, "RuleUtility"

    const-string v2, "Maker firmware is not supported"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 771
    :cond_0
    :goto_0
    return v0

    .line 767
    :cond_1
    const-string v0, "RuleUtility"

    const-string v1, "Maker firmware is supported"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 768
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public frimwareSupportSRSS(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p1, "firmware"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0xe19

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 728
    const-string v2, "\\."

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/belkin/utils/RuleUtility;->firmWareNumber:[Ljava/lang/String;

    .line 729
    iget-object v2, p0, Lcom/belkin/utils/RuleUtility;->firmWareNumber:[Ljava/lang/String;

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    iput v2, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    .line 731
    const-string v2, "urn:Belkin:device:NetCamSensor:1"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 733
    iget v2, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    if-ge v2, v4, :cond_0

    .line 734
    const-string v1, "RuleUtility"

    const-string v2, "NetCam firmware is not supported"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 746
    :goto_0
    return v0

    .line 737
    :cond_0
    const-string v0, "RuleUtility"

    const-string v2, "NetCam firmware is supported"

    invoke-static {v0, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v1

    .line 738
    goto :goto_0

    .line 741
    :cond_1
    iget v2, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    if-ge v2, v4, :cond_2

    .line 742
    const-string v1, "RuleUtility"

    const-string v2, "firmware is not supported"

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 745
    :cond_2
    const-string v0, "RuleUtility"

    const-string v2, "firmware is supported"

    invoke-static {v0, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    move v0, v1

    .line 746
    goto :goto_0
.end method

.method public getDBInBase64Encoding()Ljava/lang/String;
    .locals 8

    .prologue
    .line 869
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1}, Ljava/lang/String;-><init>()V

    .line 871
    .local v1, "dbInBase64":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/utils/RuleUtility;->createLocalZippedDBFilePath()Ljava/lang/String;

    move-result-object v4

    .line 873
    .local v4, "localZippedDBFilePath":Ljava/lang/String;
    invoke-static {v4}, Lcom/belkin/utils/UploadFileUtil;->readFile(Ljava/lang/String;)[B

    move-result-object v0

    .line 874
    .local v0, "dbByteArray":[B
    if-eqz v0, :cond_0

    .line 876
    new-instance v5, Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {v0, v6}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const-string v6, "\n"

    const-string v7, ""

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "\\n"

    const-string v7, ""

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "\n\r"

    const-string v7, ""

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 879
    .local v3, "encodedDB":Ljava/lang/String;
    const-string v5, "RuleUtility"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Store Rules: Encoded DB length"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 881
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<![CDATA["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]]>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 887
    .end local v0    # "dbByteArray":[B
    .end local v3    # "encodedDB":Ljava/lang/String;
    .end local v4    # "localZippedDBFilePath":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 883
    .restart local v0    # "dbByteArray":[B
    .restart local v4    # "localZippedDBFilePath":Ljava/lang/String;
    :cond_0
    const-string v5, "RuleUtility"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error: Unable to read DB file at "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 886
    .end local v0    # "dbByteArray":[B
    .end local v4    # "localZippedDBFilePath":Ljava/lang/String;
    :catch_0
    move-exception v2

    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public getLocalZippedDBFilePath(I)Ljava/lang/String;
    .locals 6
    .param p1, "dbVersionForFW"    # I

    .prologue
    .line 823
    sget-object v3, Lcom/belkin/utils/RuleUtility;->lock:Ljava/lang/Object;

    monitor-enter v3

    .line 826
    :try_start_0
    iget-object v2, p0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getRuleDBZipPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 827
    .local v0, "cachedRuleDBZipPath":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getRuleDBZipVersion(Landroid/content/Context;)I

    move-result v1

    .line 829
    .local v1, "cachedRuleDBZipVersion":I
    const-string v2, "RuleUtility"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Local DB ZIP file requested. \nCurrent DB ZIP file path: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\nDB version of that ZIP file to send to FW: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\nDB version to send to FW: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 834
    if-ltz v1, :cond_0

    if-gt p1, v1, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 836
    :cond_0
    invoke-virtual {p0}, Lcom/belkin/utils/RuleUtility;->createLocalZippedDBFilePath()Ljava/lang/String;

    move-result-object v0

    .line 837
    iget-object v2, p0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    invoke-static {v2, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRuleDBZipPath(Landroid/content/Context;Ljava/lang/String;)V

    .line 839
    iget-object v2, p0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v2, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRuleDBZipVersion(Landroid/content/Context;I)V

    .line 842
    :cond_1
    monitor-exit v3

    return-object v0

    .line 843
    .end local v0    # "cachedRuleDBZipPath":Ljava/lang/String;
    .end local v1    # "cachedRuleDBZipVersion":I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public getLocationDetails(Landroid/content/Context;)Lorg/json/JSONArray;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 343
    new-instance v8, Lorg/json/JSONArray;

    invoke-direct {v8}, Lorg/json/JSONArray;-><init>()V

    .line 345
    .local v8, "locationDetails":Lorg/json/JSONArray;
    :try_start_0
    new-instance v1, Landroid/location/Geocoder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    .line 346
    .local v1, "coder":Landroid/location/Geocoder;
    const/4 v0, 0x0

    .line 347
    .local v0, "address":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    const/4 v6, 0x2

    .line 348
    .local v6, "maxResult":I
    new-instance v2, Lcom/belkin/utils/GPSTracker;

    invoke-direct {v2, p1}, Lcom/belkin/utils/GPSTracker;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/belkin/utils/RuleUtility;->gps:Lcom/belkin/utils/GPSTracker;

    .line 350
    iget-object v2, p0, Lcom/belkin/utils/RuleUtility;->gps:Lcom/belkin/utils/GPSTracker;

    invoke-virtual {v2}, Lcom/belkin/utils/GPSTracker;->canGetLocation()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 351
    iget-object v2, p0, Lcom/belkin/utils/RuleUtility;->gps:Lcom/belkin/utils/GPSTracker;

    invoke-virtual {v2}, Lcom/belkin/utils/GPSTracker;->getLatitude()D

    move-result-wide v2

    iput-wide v2, p0, Lcom/belkin/utils/RuleUtility;->latitude:D

    .line 352
    iget-object v2, p0, Lcom/belkin/utils/RuleUtility;->gps:Lcom/belkin/utils/GPSTracker;

    invoke-virtual {v2}, Lcom/belkin/utils/GPSTracker;->getLongitude()D

    move-result-wide v2

    iput-wide v2, p0, Lcom/belkin/utils/RuleUtility;->longitude:D
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 355
    :try_start_1
    iget-wide v2, p0, Lcom/belkin/utils/RuleUtility;->latitude:D

    iget-wide v4, p0, Lcom/belkin/utils/RuleUtility;->longitude:D

    invoke-virtual/range {v1 .. v6}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    .line 370
    :goto_0
    if-eqz v0, :cond_0

    :try_start_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 371
    const-string v2, "RuleUtility"

    const-string v3, "address is not null"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/Address;

    invoke-virtual {v2}, Landroid/location/Address;->getLocality()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/Address;

    invoke-virtual {v2}, Landroid/location/Address;->getLocality()Ljava/lang/String;

    move-result-object v2

    :goto_1
    invoke-virtual {v8, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 373
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/Address;

    invoke-virtual {v2}, Landroid/location/Address;->getCountryName()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/Address;

    invoke-virtual {v2}, Landroid/location/Address;->getCountryName()Ljava/lang/String;

    move-result-object v2

    :goto_2
    invoke-virtual {v8, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 374
    iget-wide v2, p0, Lcom/belkin/utils/RuleUtility;->latitude:D

    invoke-virtual {v8, v2, v3}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 375
    iget-wide v2, p0, Lcom/belkin/utils/RuleUtility;->longitude:D

    invoke-virtual {v8, v2, v3}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 376
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/Address;

    invoke-virtual {v2}, Landroid/location/Address;->getCountryCode()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/Address;

    invoke-virtual {v2}, Landroid/location/Address;->getCountryCode()Ljava/lang/String;

    move-result-object v2

    :goto_3
    invoke-virtual {v8, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 377
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/Address;

    invoke-virtual {v2}, Landroid/location/Address;->getAdminArea()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_5

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/Address;

    invoke-virtual {v2}, Landroid/location/Address;->getAdminArea()Ljava/lang/String;

    move-result-object v2

    :goto_4
    invoke-virtual {v8, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 383
    .end local v0    # "address":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    .end local v1    # "coder":Landroid/location/Geocoder;
    .end local v6    # "maxResult":I
    :cond_0
    :goto_5
    return-object v8

    .line 356
    .restart local v0    # "address":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    .restart local v1    # "coder":Landroid/location/Geocoder;
    .restart local v6    # "maxResult":I
    :catch_0
    move-exception v7

    .line 357
    .local v7, "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    .line 358
    const-string v2, ""

    invoke-virtual {v8, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 359
    const-string v2, ""

    invoke-virtual {v8, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 360
    iget-wide v2, p0, Lcom/belkin/utils/RuleUtility;->latitude:D

    invoke-virtual {v8, v2, v3}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 361
    iget-wide v2, p0, Lcom/belkin/utils/RuleUtility;->longitude:D

    invoke-virtual {v8, v2, v3}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 362
    const-string v2, ""

    invoke-virtual {v8, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 363
    const-string v2, ""

    invoke-virtual {v8, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_5

    .line 380
    .end local v0    # "address":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    .end local v1    # "coder":Landroid/location/Geocoder;
    .end local v6    # "maxResult":I
    .end local v7    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v7

    .line 381
    .restart local v7    # "e":Ljava/lang/Exception;
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5

    .line 368
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v0    # "address":Ljava/util/List;, "Ljava/util/List<Landroid/location/Address;>;"
    .restart local v1    # "coder":Landroid/location/Geocoder;
    .restart local v6    # "maxResult":I
    :cond_1
    :try_start_3
    iget-object v2, p0, Lcom/belkin/utils/RuleUtility;->gps:Lcom/belkin/utils/GPSTracker;

    invoke-virtual {v2}, Lcom/belkin/utils/GPSTracker;->showSettingsAlert()V

    goto/16 :goto_0

    .line 372
    :cond_2
    const-string v2, ""

    goto/16 :goto_1

    .line 373
    :cond_3
    const-string v2, ""

    goto :goto_2

    .line 376
    :cond_4
    const-string v2, ""

    goto :goto_3

    .line 377
    :cond_5
    const-string v2, ""
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_4
.end method

.method public getPragmaVersion()Ljava/lang/String;
    .locals 6

    .prologue
    .line 652
    const-string v2, ""

    .line 653
    .local v2, "pragmaVersion":Ljava/lang/String;
    const/4 v0, 0x0

    .line 655
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "pluginrules2.db"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/16 v5, 0x10

    invoke-static {v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 656
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v3

    if-nez v3, :cond_0

    .line 657
    const-string v3, "RuleUtility"

    const-string v4, "got DBVersion equal to 0"

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 658
    const/16 v3, 0x9

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->setVersion(I)V

    .line 660
    :cond_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 661
    const-string v3, "RuleUtility"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getPragmaVersion Pragma version is : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 666
    if-eqz v0, :cond_1

    .line 667
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 670
    :cond_1
    :goto_0
    return-object v2

    .line 663
    :catch_0
    move-exception v1

    .line 664
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    const-string v3, "RuleUtility"

    const-string v4, "Exception during openOrCreateDB: "

    invoke-static {v3, v4, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 666
    if-eqz v0, :cond_1

    .line 667
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_0

    .line 666
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    if-eqz v0, :cond_2

    .line 667
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :cond_2
    throw v3
.end method

.method public getSunriseSunsetTime(DD)Lorg/json/JSONArray;
    .locals 11
    .param p1, "lat"    # D
    .param p3, "lng"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 394
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    iput-object v7, p0, Lcom/belkin/utils/RuleUtility;->sunriseSunsetTime:Lorg/json/JSONArray;

    .line 395
    new-instance v7, Lcom/luckycatlabs/sunrisesunset/dto/Location;

    invoke-direct {v7, p1, p2, p3, p4}, Lcom/luckycatlabs/sunrisesunset/dto/Location;-><init>(DD)V

    iput-object v7, p0, Lcom/belkin/utils/RuleUtility;->location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

    .line 396
    new-instance v7, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;

    iget-object v8, p0, Lcom/belkin/utils/RuleUtility;->location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

    const-string v9, "+0000"

    invoke-direct {v7, v8, v9}, Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;-><init>(Lcom/luckycatlabs/sunrisesunset/dto/Location;Ljava/lang/String;)V

    iput-object v7, p0, Lcom/belkin/utils/RuleUtility;->calculator:Lcom/luckycatlabs/sunrisesunset/SunriseSunsetCalculator;

    .line 397
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v7, "MM/dd/yyyy"

    invoke-direct {v4, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 399
    .local v4, "format":Ljava/text/SimpleDateFormat;
    new-instance v6, Ljava/text/SimpleDateFormat;

    const-string v7, "EEE"

    invoke-direct {v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 400
    .local v6, "sdf":Ljava/text/SimpleDateFormat;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 401
    .local v0, "calendar":Ljava/util/Calendar;
    const/16 v7, 0xb

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Ljava/util/Calendar;->set(II)V

    .line 402
    const/16 v7, 0xc

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Ljava/util/Calendar;->set(II)V

    .line 403
    const-string v7, "GMT+00:00"

    invoke-static {v7}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 404
    const/4 v7, 0x7

    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 405
    .local v1, "dayId":I
    sget-object v7, Lcom/belkin/wemo/cache/utils/Constants;->DAYS_OF_THE_WEEK:[Ljava/lang/String;

    aget-object v2, v7, v1

    .line 406
    .local v2, "dayOfTheWeek":Ljava/lang/String;
    const-string v7, "RuleUtility"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " incremented day is : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    const/4 v7, 0x0

    invoke-direct {p0, v7, v0, v2}, Lcom/belkin/utils/RuleUtility;->getWeeklySRSSTime(ILjava/util/Calendar;Ljava/lang/String;)V

    .line 408
    const/4 v7, 0x7

    new-array v3, v7, [Ljava/lang/String;

    .line 409
    .local v3, "days":[Ljava/lang/String;
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_0
    const/4 v7, 0x7

    if-ge v5, v7, :cond_0

    .line 410
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v5

    .line 411
    const/4 v7, 0x5

    const/4 v8, 0x1

    invoke-virtual {v0, v7, v8}, Ljava/util/Calendar;->add(II)V

    .line 412
    const/4 v7, 0x7

    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 413
    sget-object v7, Lcom/belkin/wemo/cache/utils/Constants;->DAYS_OF_THE_WEEK:[Ljava/lang/String;

    aget-object v2, v7, v1

    .line 414
    const-string v7, "RuleUtility"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " incremented date is : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/4 v9, 0x7

    invoke-virtual {v0, v9}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 415
    const-string v7, "RuleUtility"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " incremented day is : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 416
    invoke-direct {p0, v5, v0, v2}, Lcom/belkin/utils/RuleUtility;->getWeeklySRSSTime(ILjava/util/Calendar;Ljava/lang/String;)V

    .line 409
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 418
    :cond_0
    iget-object v7, p0, Lcom/belkin/utils/RuleUtility;->sunriseSunsetTime:Lorg/json/JSONArray;

    return-object v7
.end method

.method public isFirmwareValidForCountdownRule(Ljava/lang/String;)Z
    .locals 3
    .param p1, "firmware"    # Ljava/lang/String;

    .prologue
    .line 801
    const-string v0, "\\."

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/utils/RuleUtility;->firmWareNumber:[Ljava/lang/String;

    .line 802
    iget-object v0, p0, Lcom/belkin/utils/RuleUtility;->firmWareNumber:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    .line 803
    const-string v0, "isFirmwareValidForCountdown Rule"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "firmware version:::: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 804
    iget v0, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    const/16 v1, 0x1d31

    if-lt v0, v1, :cond_0

    .line 805
    const-string v0, "RuleUtility"

    const-string v1, " firmware is supported for Countdown Rule"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 806
    const/4 v0, 0x1

    .line 809
    :goto_0
    return v0

    .line 808
    :cond_0
    const-string v0, "RuleUtility"

    const-string v1, " firmware is not supported for Countdown Rule"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 809
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFirmwareValidForMotionNotify(Ljava/lang/String;)Z
    .locals 3
    .param p1, "firmware"    # Ljava/lang/String;

    .prologue
    .line 788
    const-string v0, "\\."

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/utils/RuleUtility;->firmWareNumber:[Ljava/lang/String;

    .line 789
    iget-object v0, p0, Lcom/belkin/utils/RuleUtility;->firmWareNumber:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    .line 790
    const-string v0, "isFirmwareValidForSO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "firmware version:::: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 791
    iget v0, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    const/16 v1, 0xf6d

    if-lt v0, v1, :cond_0

    .line 792
    const-string v0, "RuleUtility"

    const-string v1, " firmware is supported for Motion Notify"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 793
    const/4 v0, 0x1

    .line 796
    :goto_0
    return v0

    .line 795
    :cond_0
    const-string v0, "RuleUtility"

    const-string v1, " firmware is not supported for Motion Notify"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 796
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFirmwareValidForSO(Ljava/lang/String;)Z
    .locals 3
    .param p1, "firmware"    # Ljava/lang/String;

    .prologue
    .line 775
    const-string v0, "\\."

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/utils/RuleUtility;->firmWareNumber:[Ljava/lang/String;

    .line 776
    iget-object v0, p0, Lcom/belkin/utils/RuleUtility;->firmWareNumber:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    .line 777
    const-string v0, "isFirmwareValidForSO"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "firmware version:::: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 778
    iget v0, p0, Lcom/belkin/utils/RuleUtility;->firmwareVer:I

    const/16 v1, 0xfa3

    if-lt v0, v1, :cond_0

    .line 779
    const-string v0, "RuleUtility"

    const-string v1, " firmware is supported for SO"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 780
    const/4 v0, 0x1

    .line 783
    :goto_0
    return v0

    .line 782
    :cond_0
    const-string v0, "RuleUtility"

    const-string v1, " firmware is not supported for SO"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 783
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public javaUnZip(Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p1, "zipFileAbsolutePath"    # Ljava/lang/String;
    .param p2, "unZippedFileAbsolutePath"    # Ljava/lang/String;

    .prologue
    .line 116
    :try_start_0
    new-instance v9, Ljava/util/zip/ZipFile;

    invoke-direct {v9, p1}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

    .line 117
    .local v9, "zipfile":Ljava/util/zip/ZipFile;
    invoke-virtual {v9}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v5

    .line 119
    .local v5, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    const/16 v0, 0x400

    .line 120
    .local v0, "BUFFER":I
    :goto_0
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 121
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/zip/ZipEntry;

    .line 122
    .local v6, "entry":Ljava/util/zip/ZipEntry;
    new-instance v8, Ljava/io/BufferedInputStream;

    invoke-virtual {v9, v6}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v10

    invoke-direct {v8, v10}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 123
    .local v8, "is":Ljava/io/InputStream;
    new-array v2, v0, [B

    .line 124
    .local v2, "data":[B
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 126
    .local v7, "fos":Ljava/io/FileOutputStream;
    new-instance v3, Ljava/io/BufferedOutputStream;

    invoke-direct {v3, v7, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 128
    .local v3, "dest":Ljava/io/BufferedOutputStream;
    :goto_1
    const/4 v10, 0x0

    invoke-virtual {v8, v2, v10, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .local v1, "count":I
    const/4 v10, -0x1

    if-eq v1, v10, :cond_1

    .line 129
    const/4 v10, 0x0

    invoke-virtual {v3, v2, v10, v1}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 136
    .end local v0    # "BUFFER":I
    .end local v1    # "count":I
    .end local v2    # "data":[B
    .end local v3    # "dest":Ljava/io/BufferedOutputStream;
    .end local v5    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .end local v6    # "entry":Ljava/util/zip/ZipEntry;
    .end local v7    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "is":Ljava/io/InputStream;
    .end local v9    # "zipfile":Ljava/util/zip/ZipFile;
    :catch_0
    move-exception v4

    .line 137
    .local v4, "e":Ljava/lang/Exception;
    const-string v10, "RuleUtility"

    const-string v11, "Exception in javaUnZip: "

    invoke-static {v10, v11, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 140
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_0
    return-void

    .line 131
    .restart local v0    # "BUFFER":I
    .restart local v1    # "count":I
    .restart local v2    # "data":[B
    .restart local v3    # "dest":Ljava/io/BufferedOutputStream;
    .restart local v5    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<+Ljava/util/zip/ZipEntry;>;"
    .restart local v6    # "entry":Ljava/util/zip/ZipEntry;
    .restart local v7    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "is":Ljava/io/InputStream;
    .restart local v9    # "zipfile":Ljava/util/zip/ZipFile;
    :cond_1
    :try_start_1
    invoke-virtual {v3}, Ljava/io/BufferedOutputStream;->flush()V

    .line 132
    invoke-virtual {v3}, Ljava/io/BufferedOutputStream;->close()V

    .line 133
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    .line 134
    invoke-virtual {v9}, Ljava/util/zip/ZipFile;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public reduceRulesDBFileSize(Ljava/lang/String;)V
    .locals 5
    .param p1, "filenameWithPath"    # Ljava/lang/String;

    .prologue
    .line 928
    iget-object v2, p0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, p1, v3, v4}, Landroid/content/Context;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 929
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    if-eqz v0, :cond_0

    .line 931
    :try_start_0
    const-string v2, "VACUUM"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 932
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catch Landroid/database/SQLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 933
    const/4 v0, 0x0

    .line 938
    :cond_0
    :goto_0
    return-void

    .line 934
    :catch_0
    move-exception v1

    .line 935
    .local v1, "e":Landroid/database/SQLException;
    const-string v2, "RuleUtility"

    const-string v3, "SQL Exception while executing VACUUM on rules DB: "

    invoke-static {v2, v3, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public setPragmaVersion(I)Ljava/lang/String;
    .locals 7
    .param p1, "version"    # I

    .prologue
    .line 602
    const-string v2, ""

    .line 604
    .local v2, "pragmaVersion":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/Context;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 605
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "RuleUtility"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setPragmaVersion Before Pragma version is : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 606
    invoke-virtual {v0, p1}, Landroid/database/sqlite/SQLiteDatabase;->setVersion(I)V

    .line 607
    const-string v3, "RuleUtility"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setPragmaVersion After Pragma version is : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 608
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 613
    .end local v0    # "db":Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    return-object v2

    .line 610
    :catch_0
    move-exception v1

    .line 611
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public unzip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "fileToUnzip"    # Ljava/lang/String;
    .param p2, "unzipLocation"    # Ljava/lang/String;

    .prologue
    .line 145
    const-string v1, ""

    .line 146
    .local v1, "pragmaUserVersion":Ljava/lang/String;
    iput-object p2, p0, Lcom/belkin/utils/RuleUtility;->unZipLocation:Ljava/lang/String;

    .line 147
    const-string v3, ""

    invoke-direct {p0, v3}, Lcom/belkin/utils/RuleUtility;->dirChecker(Ljava/lang/String;)V

    .line 148
    const-string v3, "RuleUtility"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Rules: Unzip: File to unZip: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    const-string v3, "RuleUtility"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Rules: Unzip: Temp file location: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    const-string v3, "RuleUtility"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Rules: Unzip: Final unZip location: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/utils/RuleUtility;->unZipLocation:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getStoragePath()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/databases/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/belkin/utils/RuleUtility;->getLocalDBName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 156
    .local v2, "tempPath":Ljava/lang/String;
    invoke-static {p1, v2}, Lcom/belkin/utils/ZIPUtility;->unzip(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lcom/belkin/utils/RuleUtility;->unZipLocation:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 159
    iget-object v3, p0, Lcom/belkin/utils/RuleUtility;->unZipLocation:Ljava/lang/String;

    const-string v4, "false"

    invoke-virtual {p0, v2, v3, v4}, Lcom/belkin/utils/RuleUtility;->copyDataBase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 161
    const-string v3, "RuleUtility"

    const-string v4, "Rules: Unzipped"

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    invoke-virtual {p0}, Lcom/belkin/utils/RuleUtility;->getPragmaVersion()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 168
    .end local v2    # "tempPath":Ljava/lang/String;
    :goto_0
    const-string v3, "RuleUtility"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Rules: ########### Value of migration : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/belkin/utils/RuleUtility;->dbMigration:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    iget-boolean v3, p0, Lcom/belkin/utils/RuleUtility;->dbMigration:Z

    if-eqz v3, :cond_0

    .line 170
    const-string v3, "RuleUtility"

    const-string v4, "....Inside...."

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    iget-object v3, p0, Lcom/belkin/utils/RuleUtility;->context:Landroid/content/Context;

    invoke-direct {p0, v3}, Lcom/belkin/utils/RuleUtility;->migrateDB(Landroid/content/Context;)V

    .line 173
    :cond_0
    return-object v1

    .line 164
    :catch_0
    move-exception v0

    .line 165
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "RuleUtility"

    const-string v4, "Rules: Exception while unzipping: "

    invoke-static {v3, v4, v0}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public zip([Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "zipFiles"    # [Ljava/lang/String;
    .param p2, "zipLocation"    # Ljava/lang/String;

    .prologue
    .line 180
    const-string v4, "RuleUtility"

    const-string v5, "inside zip"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    :try_start_0
    const-string v4, "RuleUtility"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " zipLocation : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v2

    .line 185
    .local v2, "status":Z
    const-string v4, "RuleUtility"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " Deleting Preview/old file at "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; STATUS = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    new-instance v3, Lnet/lingala/zip4j/core/ZipFile;

    invoke-direct {v3, p2}, Lnet/lingala/zip4j/core/ZipFile;-><init>(Ljava/lang/String;)V

    .line 188
    .local v3, "zipFile":Lnet/lingala/zip4j/core/ZipFile;
    new-instance v1, Lnet/lingala/zip4j/model/ZipParameters;

    invoke-direct {v1}, Lnet/lingala/zip4j/model/ZipParameters;-><init>()V

    .line 189
    .local v1, "parameters":Lnet/lingala/zip4j/model/ZipParameters;
    const/16 v4, 0x8

    invoke-virtual {v1, v4}, Lnet/lingala/zip4j/model/ZipParameters;->setCompressionMethod(I)V

    .line 190
    const/4 v4, 0x5

    invoke-virtual {v1, v4}, Lnet/lingala/zip4j/model/ZipParameters;->setCompressionLevel(I)V

    .line 191
    new-instance v4, Ljava/io/File;

    const/4 v5, 0x0

    aget-object v5, p1, v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4, v1}, Lnet/lingala/zip4j/core/ZipFile;->addFile(Ljava/io/File;Lnet/lingala/zip4j/model/ZipParameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    .end local v1    # "parameters":Lnet/lingala/zip4j/model/ZipParameters;
    .end local v2    # "status":Z
    .end local v3    # "zipFile":Lnet/lingala/zip4j/core/ZipFile;
    :goto_0
    return-void

    .line 194
    :catch_0
    move-exception v0

    .line 195
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "RuleUtility"

    const-string v5, "Exception during zip: "

    invoke-static {v4, v5, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
