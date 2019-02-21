.class public Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PushMessageDialogBroadcastReceiver.java"


# static fields
.field public static final ACTION_DISPLAY_PUSH_MESSAGE:Ljava/lang/String; = "com.belkin.wemo.intent.ACTION_DISPLAY_PUSH_MESSAGE"

.field public static final KEY_EVENT_CODE:Ljava/lang/String; = "event_code"

.field public static final KEY_NOTIFY_ID:Ljava/lang/String; = "notify_id"

.field public static final KEY_PUSH_MESSAGE_TEXT:Ljava/lang/String; = "push_message"

.field public static final PUSH_DIALOG_MSG_PADDING_BOTTOM:I = 0x19

.field public static final PUSH_DIALOG_MSG_PADDING_TOP:I = 0x19

.field public static final PUSH_DIALOG_MSG_SIZE:I = 0x11

.field public static final PUSH_DIALOG_TITLE_BAR_HEIGHT:I = 0x2

.field public static final PUSH_DIALOG_TITLE_PADDING_BOTTOM:I = 0xf

.field public static final PUSH_DIALOG_TITLE_PADDING_LEFT:I = 0xf

.field public static final PUSH_DIALOG_TITLE_PADDING_RIGHT:I = 0xf

.field public static final PUSH_DIALOG_TITLE_PADDING_TOP:I = 0xf

.field public static final PUSH_DIALOG_TITLE_SIZE:I = 0x14

.field public static final TAG:Ljava/lang/String; = "PushMessageDialogBroadcastReceiver"


# instance fields
.field private resources:Landroid/content/res/Resources;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 55
    return-void
.end method

.method private getPushDialogButton(Landroid/content/Context;)Landroid/widget/Button;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v4, 0xf

    .line 146
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 147
    .local v0, "neutralBtn":Landroid/widget/Button;
    const v1, 0x7f070009

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 149
    invoke-static {v4, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v1

    invoke-static {v4, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v2

    invoke-static {v4, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v3

    invoke-static {v4, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/Button;->setPadding(IIII)V

    .line 154
    iget-object v1, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->resources:Landroid/content/res/Resources;

    const v2, 0x7f050004

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 155
    const/high16 v1, 0x41880000    # 17.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 156
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundColor(I)V

    .line 158
    return-object v0
.end method

.method private getPushDialogCustomView(Landroid/content/Context;[Landroid/view/View;)Landroid/view/View;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "childViewsArray"    # [Landroid/view/View;

    .prologue
    .line 163
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 164
    .local v1, "dialogLayout":Landroid/widget/LinearLayout;
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 165
    const/4 v5, -0x1

    invoke-virtual {v1, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 167
    move-object v0, p2

    .local v0, "arr$":[Landroid/view/View;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v4, v0, v2

    .line 168
    .local v4, "view":Landroid/view/View;
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 167
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 171
    .end local v4    # "view":Landroid/view/View;
    :cond_0
    return-object v1
.end method

.method private getPushDialogMessageView(Landroid/content/Context;)Landroid/view/View;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 136
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 137
    .local v0, "messageView":Landroid/view/View;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f050005

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 138
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, 0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 140
    return-object v0
.end method

.method private getPushDialogMsgText(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x19

    const/16 v3, 0xf

    .line 113
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 115
    .local v0, "message":Landroid/widget/TextView;
    iget-object v1, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->resources:Landroid/content/res/Resources;

    const v2, 0x7f070005

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 116
    const v1, 0x7f07000c

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 123
    :goto_0
    invoke-static {v3, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v1

    invoke-static {v4, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v2

    invoke-static {v3, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v3

    invoke-static {v4, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 128
    iget-object v1, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->resources:Landroid/content/res/Resources;

    const v2, 0x7f050004

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 129
    const/high16 v1, 0x41880000    # 17.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 131
    return-object v0

    .line 117
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->resources:Landroid/content/res/Resources;

    const v2, 0x7f070006

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 118
    const v1, 0x7f07000f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 120
    :cond_1
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private getPushDialogTitleBarView(Landroid/content/Context;)Landroid/view/View;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 105
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 106
    .local v0, "titleBarView":Landroid/view/View;
    iget-object v1, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->resources:Landroid/content/res/Resources;

    const v2, 0x7f050006

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 107
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, 0x2

    invoke-static {v3, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    return-object v0
.end method

.method private getPushDialogTitleText(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "pushMsgRec"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0xf

    .line 81
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 83
    .local v0, "titleTextView":Landroid/widget/TextView;
    iget-object v1, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->resources:Landroid/content/res/Resources;

    const v2, 0x7f070005

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 84
    const v1, 0x7f07000b

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 91
    :goto_0
    invoke-static {v4, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v1

    invoke-static {v4, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v2

    invoke-static {v4, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v3

    invoke-static {v4, p1}, Lcom/belkin/wemo/utils/WeMoUtils;->convertDpToPixels(ILandroid/content/Context;)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 96
    iget-object v1, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->resources:Landroid/content/res/Resources;

    const v2, 0x7f050006

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 97
    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 99
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 101
    return-object v0

    .line 85
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->resources:Landroid/content/res/Resources;

    const v2, 0x7f070006

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 86
    const v1, 0x7f07000d

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 88
    :cond_1
    const v1, 0x7f070008

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method

.method private showMessage(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "notifyId"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 176
    if-eqz p1, :cond_0

    .line 177
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iput-object v4, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->resources:Landroid/content/res/Resources;

    .line 179
    iget-object v4, p0, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->resources:Landroid/content/res/Resources;

    if-eqz v4, :cond_0

    .line 180
    new-instance v1, Landroid/app/Dialog;

    invoke-direct {v1, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 182
    .local v1, "dialog":Landroid/app/Dialog;
    invoke-virtual {v1, v6}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 183
    invoke-virtual {v1, v5}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 184
    invoke-virtual {v1, v5}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 186
    invoke-direct {p0, p1}, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->getPushDialogButton(Landroid/content/Context;)Landroid/widget/Button;

    move-result-object v2

    .line 187
    .local v2, "okButton":Landroid/widget/Button;
    new-instance v4, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;

    invoke-direct {v4, p0, p3, p1, v1}, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver$1;-><init>(Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;ILandroid/content/Context;Landroid/app/Dialog;)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 203
    const/4 v4, 0x5

    new-array v0, v4, [Landroid/view/View;

    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->getPushDialogTitleText(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v4

    aput-object v4, v0, v5

    invoke-direct {p0, p1}, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->getPushDialogTitleBarView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v4

    aput-object v4, v0, v6

    const/4 v4, 0x2

    invoke-direct {p0, p1, p2}, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->getPushDialogMsgText(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v5

    aput-object v5, v0, v4

    const/4 v4, 0x3

    invoke-direct {p0, p1}, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->getPushDialogMessageView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v5

    aput-object v5, v0, v4

    const/4 v4, 0x4

    aput-object v2, v0, v4

    .line 209
    .local v0, "childViewsArray":[Landroid/view/View;
    invoke-direct {p0, p1, v0}, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->getPushDialogCustomView(Landroid/content/Context;[Landroid/view/View;)Landroid/view/View;

    move-result-object v3

    .line 211
    .local v3, "pushDialogCustomView":Landroid/view/View;
    invoke-virtual {v1, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    .line 213
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 216
    .end local v0    # "childViewsArray":[Landroid/view/View;
    .end local v1    # "dialog":Landroid/app/Dialog;
    .end local v2    # "okButton":Landroid/widget/Button;
    .end local v3    # "pushDialogCustomView":Landroid/view/View;
    :cond_0
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 59
    if-eqz p2, :cond_0

    .line 60
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 61
    .local v0, "action":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 62
    const-string v4, "PushMessageDialogBroadcastReceiver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Push Notification: Broadcast received to display push message on screen. Action: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    const-string v4, "com.belkin.wemo.intent.ACTION_DISPLAY_PUSH_MESSAGE"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 66
    const-string v4, "push_message"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 67
    .local v2, "message":Ljava/lang/String;
    const-string v4, "notify_id"

    const/4 v5, -0x1

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 68
    .local v3, "notifyId":I
    const-string v4, "event_code"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "eventCode":Ljava/lang/String;
    const-string v4, "PushMessageDialogBroadcastReceiver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Push Notification: Push Msg to display on screen: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", notify ID: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", eventCode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const-string v4, "overtempon"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 71
    if-eqz v2, :cond_0

    .line 72
    invoke-direct {p0, p1, v2, v3}, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;->showMessage(Landroid/content/Context;Ljava/lang/String;I)V

    .line 78
    .end local v0    # "action":Ljava/lang/String;
    .end local v1    # "eventCode":Ljava/lang/String;
    .end local v2    # "message":Ljava/lang/String;
    .end local v3    # "notifyId":I
    :cond_0
    return-void
.end method
