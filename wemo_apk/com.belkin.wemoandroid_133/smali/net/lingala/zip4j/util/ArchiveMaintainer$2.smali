.class Lnet/lingala/zip4j/util/ArchiveMaintainer$2;
.super Ljava/lang/Thread;
.source "ArchiveMaintainer.java"


# instance fields
.field final this$0:Lnet/lingala/zip4j/util/ArchiveMaintainer;

.field private final val$outputZipFile:Ljava/io/File;

.field private final val$progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

.field private final val$zipModel:Lnet/lingala/zip4j/model/ZipModel;


# direct methods
.method constructor <init>(Lnet/lingala/zip4j/util/ArchiveMaintainer;Ljava/lang/String;Lnet/lingala/zip4j/model/ZipModel;Ljava/io/File;Lnet/lingala/zip4j/progress/ProgressMonitor;)V
    .locals 0
    .param p2, "$anonymous0"    # Ljava/lang/String;

    .prologue
    .line 326
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 1
    iput-object p1, p0, Lnet/lingala/zip4j/util/ArchiveMaintainer$2;->this$0:Lnet/lingala/zip4j/util/ArchiveMaintainer;

    iput-object p3, p0, Lnet/lingala/zip4j/util/ArchiveMaintainer$2;->val$zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iput-object p4, p0, Lnet/lingala/zip4j/util/ArchiveMaintainer$2;->val$outputZipFile:Ljava/io/File;

    iput-object p5, p0, Lnet/lingala/zip4j/util/ArchiveMaintainer$2;->val$progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 329
    :try_start_0
    iget-object v0, p0, Lnet/lingala/zip4j/util/ArchiveMaintainer$2;->this$0:Lnet/lingala/zip4j/util/ArchiveMaintainer;

    iget-object v1, p0, Lnet/lingala/zip4j/util/ArchiveMaintainer$2;->val$zipModel:Lnet/lingala/zip4j/model/ZipModel;

    iget-object v2, p0, Lnet/lingala/zip4j/util/ArchiveMaintainer$2;->val$outputZipFile:Ljava/io/File;

    iget-object v3, p0, Lnet/lingala/zip4j/util/ArchiveMaintainer$2;->val$progressMonitor:Lnet/lingala/zip4j/progress/ProgressMonitor;

    invoke-static {v0, v1, v2, v3}, Lnet/lingala/zip4j/util/ArchiveMaintainer;->access$0(Lnet/lingala/zip4j/util/ArchiveMaintainer;Lnet/lingala/zip4j/model/ZipModel;Ljava/io/File;Lnet/lingala/zip4j/progress/ProgressMonitor;)V
    :try_end_0
    .catch Lnet/lingala/zip4j/exception/ZipException; {:try_start_0 .. :try_end_0} :catch_0

    .line 332
    :goto_0
    return-void

    .line 330
    :catch_0
    move-exception v0

    goto :goto_0
.end method
