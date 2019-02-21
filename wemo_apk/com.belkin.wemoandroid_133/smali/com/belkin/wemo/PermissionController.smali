.class public Lcom/belkin/wemo/PermissionController;
.super Ljava/lang/Object;
.source "PermissionController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/PermissionController$PermissionListener;
    }
.end annotation


# static fields
.field private static final CAMERA_REQUEST_CODE:I = 0x1

.field private static final LOCATION_REQUEST_CODE:I = 0x2

.field private static final PHONE_REQUEST_CODE:I = 0x3

.field public static final REQUEST_PERMISSION_SETTING:I = 0xa

.field private static final STORAGE_REQUEST_CODE:I = 0x4

.field private static permissionController:Lcom/belkin/wemo/PermissionController;


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mContext:Landroid/content/Context;

.field private mPermissionListeners:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/belkin/wemo/PermissionController$PermissionListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/belkin/wemo/PermissionController;->mActivity:Landroid/app/Activity;

    .line 48
    iput-object p1, p0, Lcom/belkin/wemo/PermissionController;->mContext:Landroid/content/Context;

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/PermissionController;->mPermissionListeners:Ljava/util/HashMap;

    .line 50
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/belkin/wemo/PermissionController;->mContext:Landroid/content/Context;

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/PermissionController;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/PermissionController;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/PermissionController;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/PermissionController;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/PermissionController;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/PermissionController;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method private askPermission(Ljava/lang/String;ILcom/belkin/wemo/PermissionController$PermissionListener;)V
    .locals 3
    .param p1, "permission"    # Ljava/lang/String;
    .param p2, "requestCode"    # I
    .param p3, "permissionListener"    # Lcom/belkin/wemo/PermissionController$PermissionListener;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/belkin/wemo/PermissionController;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/belkin/wemo/PermissionController;->mPermissionListeners:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    iget-object v0, p0, Lcom/belkin/wemo/PermissionController;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1, p2}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 65
    :cond_0
    return-void
.end method

.method public static getContextInstance(Landroid/content/Context;)Lcom/belkin/wemo/PermissionController;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    sget-object v0, Lcom/belkin/wemo/PermissionController;->permissionController:Lcom/belkin/wemo/PermissionController;

    if-nez v0, :cond_0

    .line 41
    new-instance v0, Lcom/belkin/wemo/PermissionController;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/PermissionController;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/wemo/PermissionController;->permissionController:Lcom/belkin/wemo/PermissionController;

    .line 43
    :cond_0
    sget-object v0, Lcom/belkin/wemo/PermissionController;->permissionController:Lcom/belkin/wemo/PermissionController;

    return-object v0
.end method

.method public static getInstance(Landroid/app/Activity;)Lcom/belkin/wemo/PermissionController;
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 36
    new-instance v0, Lcom/belkin/wemo/PermissionController;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/PermissionController;-><init>(Landroid/app/Activity;)V

    return-object v0
.end method

.method private hasPermission(Ljava/lang/String;)Z
    .locals 1
    .param p1, "perm"    # Ljava/lang/String;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/belkin/wemo/PermissionController;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public askCameraPermission(Lcom/belkin/wemo/PermissionController$PermissionListener;)V
    .locals 2
    .param p1, "permissionListener"    # Lcom/belkin/wemo/PermissionController$PermissionListener;

    .prologue
    .line 93
    const-string v0, "android.permission.CAMERA"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, p1}, Lcom/belkin/wemo/PermissionController;->askPermission(Ljava/lang/String;ILcom/belkin/wemo/PermissionController$PermissionListener;)V

    .line 94
    return-void
.end method

.method public askLocPermission()V
    .locals 4

    .prologue
    .line 105
    iget-object v0, p0, Lcom/belkin/wemo/PermissionController;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "android.permission.ACCESS_FINE_LOCATION"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Landroid/support/v4/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 106
    return-void
.end method

.method public askLocationPermission(Lcom/belkin/wemo/PermissionController$PermissionListener;)V
    .locals 2
    .param p1, "permissionListener"    # Lcom/belkin/wemo/PermissionController$PermissionListener;

    .prologue
    .line 101
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1, p1}, Lcom/belkin/wemo/PermissionController;->askPermission(Ljava/lang/String;ILcom/belkin/wemo/PermissionController$PermissionListener;)V

    .line 102
    return-void
.end method

.method public askPhonePermission(Lcom/belkin/wemo/PermissionController$PermissionListener;)V
    .locals 2
    .param p1, "permissionListener"    # Lcom/belkin/wemo/PermissionController$PermissionListener;

    .prologue
    .line 113
    const-string v0, "android.permission.READ_PHONE_STATE"

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1, p1}, Lcom/belkin/wemo/PermissionController;->askPermission(Ljava/lang/String;ILcom/belkin/wemo/PermissionController$PermissionListener;)V

    .line 114
    return-void
.end method

.method public askStoragePermission(Lcom/belkin/wemo/PermissionController$PermissionListener;)V
    .locals 2
    .param p1, "permissionListener"    # Lcom/belkin/wemo/PermissionController$PermissionListener;

    .prologue
    .line 121
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    const/4 v1, 0x4

    invoke-direct {p0, v0, v1, p1}, Lcom/belkin/wemo/PermissionController;->askPermission(Ljava/lang/String;ILcom/belkin/wemo/PermissionController$PermissionListener;)V

    .line 122
    return-void
.end method

.method public canAccessCamera()Z
    .locals 1

    .prologue
    .line 89
    const-string v0, "android.permission.CAMERA"

    invoke-direct {p0, v0}, Lcom/belkin/wemo/PermissionController;->hasPermission(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public canAccessLocation()Z
    .locals 1

    .prologue
    .line 97
    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-direct {p0, v0}, Lcom/belkin/wemo/PermissionController;->hasPermission(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public canAccessPhone()Z
    .locals 1

    .prologue
    .line 109
    const-string v0, "android.permission.READ_PHONE_STATE"

    invoke-direct {p0, v0}, Lcom/belkin/wemo/PermissionController;->hasPermission(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public canAccessStorage()Z
    .locals 1

    .prologue
    .line 117
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-direct {p0, v0}, Lcom/belkin/wemo/PermissionController;->hasPermission(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .prologue
    const/4 v4, 0x0

    .line 125
    iget-object v2, p0, Lcom/belkin/wemo/PermissionController;->mPermissionListeners:Ljava/util/HashMap;

    if-eqz v2, :cond_0

    .line 127
    iget-object v2, p0, Lcom/belkin/wemo/PermissionController;->mPermissionListeners:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/PermissionController$PermissionListener;

    .line 128
    .local v0, "permissionListener":Lcom/belkin/wemo/PermissionController$PermissionListener;
    iget-object v2, p0, Lcom/belkin/wemo/PermissionController;->mActivity:Landroid/app/Activity;

    aget-object v3, p2, v4

    invoke-static {v2, v3}, Landroid/support/v4/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v1

    .line 129
    .local v1, "showRationale":Z
    if-eqz v0, :cond_0

    .line 130
    aget v2, p3, v4

    if-nez v2, :cond_1

    .line 131
    const/4 v2, 0x1

    invoke-interface {v0, v2}, Lcom/belkin/wemo/PermissionController$PermissionListener;->permissionResult(Z)V

    .line 143
    .end local v0    # "permissionListener":Lcom/belkin/wemo/PermissionController$PermissionListener;
    .end local v1    # "showRationale":Z
    :cond_0
    :goto_0
    return-void

    .line 133
    .restart local v0    # "permissionListener":Lcom/belkin/wemo/PermissionController$PermissionListener;
    .restart local v1    # "showRationale":Z
    :cond_1
    if-nez v1, :cond_2

    .line 134
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/belkin/wemo/PermissionController;->showSettingsAlert(Ljava/lang/Integer;)V

    .line 135
    invoke-interface {v0, v4}, Lcom/belkin/wemo/PermissionController$PermissionListener;->permissionResult(Z)V

    goto :goto_0

    .line 137
    :cond_2
    invoke-interface {v0, v4}, Lcom/belkin/wemo/PermissionController$PermissionListener;->permissionResult(Z)V

    goto :goto_0
.end method

.method public showSettingsAlert(Ljava/lang/Integer;)V
    .locals 4
    .param p1, "requestCode"    # Ljava/lang/Integer;

    .prologue
    .line 68
    const/4 v2, 0x5

    new-array v1, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "Contacts"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "Camera"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "Location"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "Phone"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "Storage"

    aput-object v3, v1, v2

    .line 69
    .local v1, "permission":[Ljava/lang/String;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/belkin/wemo/PermissionController;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 70
    .local v0, "alertDialog":Landroid/app/AlertDialog$Builder;
    const-string v2, "Grant Access"

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Wemo will need permission to use your "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aget-object v3, v1, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". Go to your device\u2019s app settings to grant access."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 72
    const-string v2, "Settings"

    new-instance v3, Lcom/belkin/wemo/PermissionController$1;

    invoke-direct {v3, p0}, Lcom/belkin/wemo/PermissionController$1;-><init>(Lcom/belkin/wemo/PermissionController;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 80
    const-string v2, "Cancel"

    new-instance v3, Lcom/belkin/wemo/PermissionController$2;

    invoke-direct {v3, p0}, Lcom/belkin/wemo/PermissionController$2;-><init>(Lcom/belkin/wemo/PermissionController;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 85
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 86
    return-void
.end method
