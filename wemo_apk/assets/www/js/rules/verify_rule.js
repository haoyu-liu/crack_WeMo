var ruleConflict = (function(){
    var RuleConflict = function(){
    }

    RuleConflict.prototype.deCodeDays = function (arg) {
        console.log("Inside De-Code Days:  " + arg);
        switch (arg) {
            case "Daily" :
                return 0;
                break;
            case "Sun" :
                return 1;
                break;
            case "Mon" :
                return 2;
                break;
            case "Tue" :
                return 3;
                break;
            case "Wed" :
                return 4;
                break;
            case "Thu" :
                return 5;
                break;
            case "Fri" :
                return 6;
                break;
            case "Sat" :
                return 7;
                break;
            case "Weekdays" :
                return 8;
                break;
            case "Weekends" :
                return 9;
                break;
            case "Mon-Tue-Wed-Thu-Fri" :
                return 8;
                break;
            case "Sat-Sun" :
                return 9;
                break;
            case "Mon-Tue-Wed-Thu-Fri-Sat-Sun" :
                return 0;
                break;
            default :
                console.log("Inside default");
                break;
        }
    }
    RuleConflict.prototype.getDays = function (arrDays) {
        var Days = [];
        trace("arrDays.length " + arrDays.length);
        if (arrDays.length == 1) {
            var deCodeDaysValue = this.deCodeDays(arrDays[0]);
            switch ( deCodeDaysValue ) {
                case 0:
                    Days = [1, 2, 3, 4, 5, 6, 7];
                    break;
                case 8:
                    Days = [2, 3, 4, 5, 6];
                    break;
                case 9:
                    Days = [7, 1];
                    break;
                default:
                    Days = [ deCodeDaysValue ]; //one day
            }
        } else {
            for (var daysCount1 = 0; daysCount1 < arrDays.length; daysCount1++) {
                Days.push(this.deCodeDays(arrDays[daysCount1]));
            }
        }

        return Days;
    }
    RuleConflict.prototype.isWholeDay = function (rule) {
        return (rule.StartTime == 0 && rule.RuleDuration == timestamp.MAX_HOUR);
    }
    RuleConflict.prototype.checkDayOverlap = function (rule1, rule2) {
        var arrDays = rule1.SelectedDayOrRange.split("-");
        var Days = this.getDays(arrDays);
        for (var i = 0; i < Days.length; i++) {
            if (Days[i] == rule2.DayID) {
                return true;
            }
        }

        return false;
    }
    RuleConflict.prototype.ruleConflicts = function (rule2, rule1) {
        var arrDeviceID = rule1.DeviceID.split(":");
        // targetDeviceID will be at the end of rule1.DeviceID
        var targetDeviceID = arrDeviceID[arrDeviceID.length-1];
        
        if (!this.deviceUsed(rule2, targetDeviceID)) {
            return false;
        }

        if (this.checkDayOverlap(rule2, rule1)) {
            //We don't check next day overlap to be consistent with iOS code
            //See RuleUtility.m:1771

            var rule1End = parseInt(rule1.StartTime) + parseInt(rule1.RuleDuration);

            //Case for Simple Timer Rule
            if (rule1.StartTime == rule2.When.StartTime && rule1.StartAction != rule2.Devices[targetDeviceID].StartAction) {
                return true;
            }

            //Case 1
            //New rule interval is inside existing interval
            if (rule1.StartTime < rule2.When.StartTime && rule1End > rule2.When.EndTime) {
                return true;
            }

            //Case 2
            //New rule interval partialy overlaps with existing
            if (rule2.When.StartTime <= rule1.StartTime && (rule2.When.EndTime <= rule1End && rule2.When.EndTime >= rule1.StartTime)) {
                return true;
            }
            if (rule2.When.EndTime >= rule1.EndTime && (rule2.When.StartTime >= rule1.StartTime && rule2.When.StartTime <= rule1End)) {
                return true;
            }

            //Case 3
            //Existing rule interval is inside new rule interval
            if (rule2.When.StartTime < rule1.StartTime && rule2.When.EndTime > rule1End) {
                return true;
            }

        }

        return false;
    }
    RuleConflict.prototype.deviceUsed = function (rule, devid) {
            if (Object.keys(rule.Devices).length > 0) {
                for (device in rule.Devices) {
                    if (device == devid) {
                        return true;
                    }
                }
            }
            return false;
    }


    // SaveMotionRule.js
    var motionRuleConflict = Object.create(RuleConflict.prototype);

    motionRuleConflict.verifyRuleDuplicatesAndConflicts = function (rule, ruleRow) {
        //Check rule for duplication
        console.log("Check for rule for dupilacation...");
        console.log("New rule name: " + rule.RuleName);
        console.log(JSON.stringify(rule));
        console.log(JSON.stringify(ruleRow));

        var arrSensRow = [];
        var arrSensCurRule = rule.SelectedSensors.split(",");
        for (var i = 0; i < ruleRow.length; i++) {
            var tmpRule = ruleRow.item(i);
            var targetDeviceID = tmpRule.DeviceID; 

            //for link/bridge devices
            if(targetDeviceID.toLowerCase().indexOf(sessionStore.BRIDGE) != -1){
                var arrDeviceID = targetDeviceID.split(":");
                // targetDeviceID will be at the end of rule2.DeviceID
                targetDeviceID = arrDeviceID[arrDeviceID.length-1];
            }else{
                if(targetDeviceID.indexOf(sessionStore.UUID) == -1){
                    targetDeviceID = sessionStore.UUID+':'+targetDeviceID;
                }
            }

            if (tmpRule != undefined) {
                if (tmpRule.Type == sessionStore.MOTION_CONTROLLED && (tmpRule.DayID).toString() == "-1") {
                    if (!arrSensRow[tmpRule.RuleID]) arrSensRow[tmpRule.RuleID] = [];
                    arrSensRow[tmpRule.RuleID].push(targetDeviceID);
                }
            }
        }

        for (var i = 0; i < ruleRow.length; i++) {
            var tmpRule = ruleRow.item(i);
            var targetDeviceID = tmpRule.DeviceID; 

            //for link/bridge devices
            if(targetDeviceID.toLowerCase().indexOf(sessionStore.BRIDGE) != -1){
                var arrDeviceID = targetDeviceID.split(":");
                // targetDeviceID will be at the end of rule2.DeviceID
                targetDeviceID = arrDeviceID[arrDeviceID.length-1];
            }else{
                if(targetDeviceID.indexOf(sessionStore.UUID) == -1){
                    targetDeviceID = sessionStore.UUID+':'+targetDeviceID;
                }
            }

            console.log(JSON.stringify(tmpRule));
            if (tmpRule != undefined) {
                if (wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(tmpRule.Type)) {
                   // if (tmpRule.Type == "Insight Rule") {
                        if (this.sensorUsed(arrSensRow[tmpRule.RuleID], arrSensCurRule )) {
                            console.log("Sensor devices are used in another existing rule");
                            var tmpRuleName = tmpRule.RuleName;
                            if (tmpRule.State == '1' && this.rulesEquals(rule, tmpRule)) {
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                console.log(JSON.stringify(tmpRule));
                                console.log("Found new rule duplication with: " + tmpRuleName);
                                this.showConflictDuplicateMessage(tmpRule.Name, "duplicate_rule", targetDeviceID, null, null, null, null);
                                return true;
                            }

                            if (tmpRule.State == '1' && this.ruleConflicts(rule, tmpRule)) {
                                if (this.isWholeDay(rule)) {
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                    console.log(JSON.stringify(tmpRule));
                                    console.log("Found new rule whole-day conflict with: " + tmpRuleName);
                                    this.showConflictDuplicateMessage(tmpRule.Name, "conflict_day__rule", targetDeviceID, null, null, null, null);
                                    return true;
                                }
                                else {
                                    console.log("Found new rule tmpRule with: " +JSON.stringify(tmpRule));
                                    console.log("Found new rule conflict with: " + tmpRuleName);
                                   
                                    var ruleStartAct = tmpRule.StartAction == 1 ? wemo.items["RuleDetailsSwitchTurnsOn"] : wemo.items["RuleDetailsSwitchTurnsOff"];
                                    switch (tmpRule.Type) {
                                        case sessionStore.SIMPLE_SWITCH:
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                            this.showConflictDuplicateMessage(tmpRule.Name, "conflict_rule", targetDeviceID, wemoUtil.convertMillisecondsToAMPM(tmpRule.StartTime), null, tmpRule.Type, ruleStartAct);
                                            break;
                                        case sessionStore.TIME_INTERVAL:
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                            this.showConflictDuplicateMessage(tmpRule.Name, "conflict_rule", targetDeviceID, wemoUtil.convertMillisecondsToAMPM(tmpRule.StartTime), wemoUtil.convertMillisecondsToAMPM(parseInt(tmpRule.StartTime) + parseInt(tmpRule.RuleDuration)), tmpRule.Type, null);
                                            break;
                                        case sessionStore.MOTION_CONTROLLED:
                                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                            this.showConflictDuplicateMessage(tmpRule.Name, "conflict_rule", rule.Devices[targetDeviceID].FName, wemoUtil.convertMillisecondsToAMPM(tmpRule.StartTime), wemoUtil.convertMillisecondsToAMPM(parseInt(tmpRule.StartTime) + parseInt(tmpRule.RuleDuration)), tmpRule.Type, ruleStartAct);
                                            break;
                                    }
                                    return true;
                                }
                            }
                        }
                    //}
                }
            }
        }
        return false;
    }
    motionRuleConflict.sensorUsed = function (arrSensRow, arrSensCurRule) {
        for (var i = 0; i < arrSensCurRule.length; i++) {
            if (arrSensRow.indexOf(arrSensCurRule[i]) != -1) return true;
        }
        console.log("Sensor devices sre not used in another existing rule");
        return false;
    }
    motionRuleConflict.ruleConflicts = function (rule2, rule1) {
            var targetDeviceID = rule1.DeviceID;

            //for link/bridge devices 
            if(targetDeviceID.toLowerCase().indexOf(sessionStore.BRIDGE) != -1){
                wemoUtil.infoLog(wemoUtil.TAG, 'target device is link device');
                var arrDeviceID = targetDeviceID.split(":");
                // targetDeviceID will be at the end of rule2.DeviceID
                targetDeviceID = arrDeviceID[arrDeviceID.length-1];
            }else{
                if(targetDeviceID.indexOf(sessionStore.UUID) == -1){
                    targetDeviceID = sessionStore.UUID+':'+targetDeviceID;
                }
            }
            
            if (!this.deviceUsed(rule2, targetDeviceID)) {
                return false;
            }

            if (this.checkDayOverlap(rule2, rule1)) {
                //We don't check next day overlap to be consistent with iOS code
                //See RuleUtility.m:1771

                var rule1End = parseInt(rule1.StartTime) + parseInt(rule1.RuleDuration);

                //Case for Simple Timer Rule
                if (rule1.StartTime == rule2.When.StartTime && rule1.StartAction != rule2.Devices[targetDeviceID].StartAction) {
                    return true;
                }

                //Case 1
                //New rule interval is inside existing interval
                if (rule1.StartTime < rule2.When.StartTime && rule1End > rule2.When.EndTime) {
                    return true;
                }

                //Case 2
                //New rule interval partialy overlaps with existing
                if (rule2.When.StartTime < rule1.StartTime && (rule2.When.EndTime < rule1End && rule2.When.EndTime > rule1.StartTime)) {
                    return true;
                }
                if (rule2.When.EndTime > rule1.EndTime && (rule2.When.StartTime > rule1.StartTime && rule2.When.StartTime < rule1End)) {
                    return true;
                }

                //Case 3
                //Existing rule interval is inside new rule interval
                if (rule2.When.StartTime < rule1.StartTime && rule2.When.StartTime > rule1End) {
                    return true;
                }

            }

            return false;
    }
    motionRuleConflict.rulesEquals = function (rule1, rule2) {
            console.log(JSON.stringify(rule1));
            console.log(JSON.stringify(rule2));

            var targetDeviceID = rule2.DeviceID; 

            //for link/bridge devices
            if(targetDeviceID.toLowerCase().indexOf(sessionStore.BRIDGE) != -1){
                var arrDeviceID = targetDeviceID.split(":");
                // targetDeviceID will be at the end of rule2.DeviceID
                targetDeviceID = arrDeviceID[arrDeviceID.length-1];
            }else{
                if(targetDeviceID.indexOf(sessionStore.UUID) == -1){
                    targetDeviceID = sessionStore.UUID+':'+targetDeviceID;
                }
            }
            
            if (!this.deviceUsed(rule1, targetDeviceID)) {
                return false;
            }

            if ((rule1.When.StartTime == rule2.StartTime) &&
                (rule1.When.RuleDuration == rule2.RuleDuration) && 
                (rule1.Devices[targetDeviceID].StartAction == rule2.StartAction)
                ) {
                if (rule1.SelectedDayOrRange == "Daily") {
                    return true;
                }
                else {
                    if (this.checkDayOverlap(rule1, rule2)) {
                        return true;
                    }
                }
            }

            return false;
    }
    motionRuleConflict.showConflictDuplicateMessage = function (ruleName, msgType, device, ruleStart, ruleEnd, ruleType, ruleStartAct) {
        var RuleconflictHeader = wemo.items['RuleConflict'];
        var RuleDuplicationHeader = wemo.items['RuleDuplicate'];
        var msgText = "";

        if (msgType == "duplicate_name" || msgType == "duplicate_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleDuplicateText'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            msgText = temparr[0] + " " + ruleName + " " + temparr[1];

            setTimeout(
                function () {
                    $("#ruleInfoHeader").text(RuleDuplicationHeader);
                    $("#RuleDuplicateText").text(msgText);
                    $("#rule_duplicate").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }else if (msgType == "conflict_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictSimpleAndTimer'];
            var temparr = ruleConflictLocalizedmsg.split("%@");

            switch ( ruleType ) {
                case sessionStore.SIMPLE_SWITCH:
                    var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleStartAct + " " + device + " " + temparr[3] + " " + ruleStart  + temparr[4];
                    break;
                case sessionStore.TIME_INTERVAL:
                    var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + wemo.items["RuleDetailsSwitchTurnsOn"] + " " + device + " " + temparr[3] + " " + ruleStart  + wemo.items["And"] + wemo.items["RuleDetailsSwitchTurnsOff"] + temparr[3] + " " + ruleEnd + temparr[4];
                    break;
                case sessionStore.AWAY_MODE:
                    var msgText = wemo.items["AwayModeConflict"];
                    break;
                case sessionStore.MOTION_CONTROLLED:
                    ruleConflictLocalizedmsg = wemo.items['RuleConflictSensorRuleWithMotionON'];
                    temparr = ruleConflictLocalizedmsg.split("%@");
                    var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " +ruleStartAct  + " " +  device + " " + temparr[2] + temparr[3] + ruleStart  +  temparr[4] + ruleEnd + temparr[5];
                    break;
            }

            setTimeout(
                function () {
                    $("#ruleInfoHeader").text(RuleconflictHeader);
                    $("#RuleConflictSimpleAndTimer").text(msgText);
                    $("#rule_conflict").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }
    }


    // SaveInsightRule
    var notificationRuleConflict = Object.create(RuleConflict.prototype);

    notificationRuleConflict.verifyRuleDuplicatesAndConflicts = function (rule, ruleRow) {
        //Check rule for duplication
        console.log("Check for rule for duplication...");
        console.log("New rule name: " + rule.RuleName);
        console.log(JSON.stringify(rule));
        console.log(JSON.stringify(ruleRow));

        var ruleRowDevicesLev = {};
        var devID;

        for (var i = 0; i < ruleRow.length; i++) {
            if (ruleRow.item(i) != undefined) {
                if ("" + ruleRow.item(i).StartTime == "-1") {
                    devID = ruleRow.item(i).DeviceID;
                    ruleRowDevicesLev[devID] = {};
                    ruleRowDevicesLev[devID].Level = ruleRow.item(i).Level;
                }
            }
        }

        for (var i = 0; i < ruleRow.length; i++) {
            var tmpRule = ruleRow.item(i);
            var targetDeviceID = tmpRule.DeviceID; 

            //for link/bridge devices
            if(targetDeviceID.toLowerCase().indexOf(sessionStore.BRIDGE) != -1){
                var arrDeviceID = targetDeviceID.split(":");
                // targetDeviceID will be at the end of rule2.DeviceID
                targetDeviceID = arrDeviceID[arrDeviceID.length-1];
            }else{
                if(targetDeviceID.indexOf(sessionStore.UUID) == -1){
                    targetDeviceID = sessionStore.UUID+':'+targetDeviceID;
                }
            }
            if (tmpRule != undefined) {
                if (wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(tmpRule.Type)) {
                    if(rule.id == tmpRule.RuleID){
                        return false;
                    }
                    console.log("tmpRule Type::"+tmpRule.Type);
            if(tmpRule.Type == "Insight Rule" || tmpRule.Type == sessionStore.NOTIFY_MAKER_MOTION_RULE_TYPE || tmpRule.Type == "Notify Me") {
                        var tmpRuleName = tmpRule.RuleName;
                        if (this.rulesEquals(rule, tmpRule, ruleRowDevicesLev)) {
                            console.log(JSON.stringify(tmpRule));
                            console.log("Found new rule duplication with: " + tmpRuleName);
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            this.showConflictDuplicateMessage(tmpRule.Name, "duplicate_rule", targetDeviceID, null, null);
                            return true;
                        }

                        if (this.ruleConflicts(rule, tmpRule, ruleRowDevicesLev)) {
                            if (this.isWholeDay(rule)) {
                                console.log(JSON.stringify(tmpRule));
                                console.log("Found new rule whole-day conflict with: " + tmpRuleName);
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                this.showConflictDuplicateMessage(tmpRule.Name, "conflict_day__rule", targetDeviceID, null, null);
                                return true;
                            }
                            else {
                                console.log(JSON.stringify(tmpRule));
                                console.log("Found new rule conflict with: " + tmpRuleName);
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                this.showConflictDuplicateMessage(tmpRule.Name, "conflict_rule", targetDeviceID, wemoUtil.convertMillisecondsToAMPM(tmpRule.StartTime), wemoUtil.convertMillisecondsToAMPM(tmpRule.StartTime + tmpRule.RuleDuration));
                                return true;
                            }
                        }
                    }
                }
            }
        }

        return false;
    }
    notificationRuleConflict.ruleConflicts = function (rule2, rule1, ruleRowDevicesLev) {
        if (!this.deviceUsed(rule2, rule1.DeviceID)) {
            return false;
        }

        if (this.checkDayOverlap(rule2, rule1) && rule2.State == rule1.State) {
            //We don't check next day overlap to be consistent with iOS code
            //See RuleUtility.m:1771

            var rule1End = parseInt(rule1.StartTime) + parseInt(rule1.RuleDuration);
            var devID = rule1.DeviceID;
            //Case 1
            //New rule interval is inside existing interval
            if (rule1.StartTime < rule2.When.StartTime && rule1End > rule2.When.EndTime) {
                return true;
            }

            //Case 2
            //New rule interval partialy overlaps with existing
            if (rule2.When.StartTime < rule1.StartTime && (rule2.When.EndTime < rule1End && rule2.When.EndTime > rule1.StartTime)) {
                return true;
            }
            if (rule2.When.EndTime > rule1.EndTime && (rule2.When.StartTime > rule1.StartTime && rule2.When.StartTime < rule1End)) {
                return true;
            }

            //Case 3
            //Existing rule interval is inside new rule interval
            if (rule2.When.StartTime < rule1.StartTime && rule2.When.StartTime > rule1End) {
                return true;
            }

            if (!wemoUtil.isMakerDevice(devID)) {
                if ((rule2.When.StartTime == rule1.StartTime) &&
                    (rule2.When.RuleDuration == rule1.RuleDuration) &&
                    (rule2.Devices[devID].Level == ruleRowDevicesLev[devID].Level)
                ) {
                    return true;
                }
            }
            else {
                var changedUdn = wemoUtil.getOriginalMakerUDN(devID);
                var level;
                if(rule2.Devices[devID] != undefined){
                    level = rule2.Devices[devID].Level;
                }
                else if(rule2.Devices[changedUdn] != undefined){
                    level = rule2.Devices[changedUdn].Level;
                }
                if ((rule2.When.StartTime == rule1.StartTime) &&
                    (rule2.When.RuleDuration == rule1.RuleDuration) &&
                    (level == rule1.StartAction)
                ) {
                    return true;
                }
            }
        }

        return false;
    }
    notificationRuleConflict.rulesEquals = function (rule1, rule2, ruleRowDevicesLev) {
        console.log("rulesEquals()--> rule1--> " + JSON.stringify(rule1));
        console.log("rulesEquals()--> rule2--> " + JSON.stringify(rule2));

        if (!this.deviceUsed(rule1, rule2.DeviceID)) {
            return false;
        }
        var devID = rule2.DeviceID;
        console.log("devID "+devID);

        if(!wemoUtil.isMakerDevice(devID)){
            if(devID.indexOf("uuid:Sensor")!=-1)
                {
                if ((rule1.When.StartTime == rule2.StartTime) &&
                    (rule1.When.RuleDuration == rule2.RuleDuration)
                ) {
                    if (rule1.SelectedDayOrRange == "Daily" || rule1.SelectedDayOrRange == sessionStore.DAILY_VAL) {
                        console.log("rulesEquals --> Motion daily");
                        return true;
                    }
                    else {
                        if (this.checkDayOverlap(rule1, rule2)) {
                            console.log("rulesEquals --> Motion Overlap Condition");
                            return true;
                        }
                    }
                }
            }
            else if ((rule1.When.StartTime == rule2.StartTime) &&
                (rule1.When.RuleDuration == rule2.RuleDuration) &&
                (rule1.Devices[devID].Level == ruleRowDevicesLev[devID].Level) &&
                (rule1.NotifyMessage == (rule2.Message ? rule2.Message : rule2.NotificationMessage))
            ) {
                if (rule1.SelectedDayOrRange == "Daily" || rule1.SelectedDayOrRange == sessionStore.DAILY_VAL) {
                    return true;
                }
                else {
                    if (this.checkDayOverlap(rule1, rule2)) {
                        return true;
                    }
                }
            }
        }
        else {
            var changedUdn = wemoUtil.getOriginalMakerUDN(devID);
            var level;
            if(rule1.Devices[devID] != undefined){
                level = rule1.Devices[devID].Level;
            }
            else if(rule1.Devices[changedUdn] != undefined){
                level = rule1.Devices[changedUdn].Level;
            }
            if ((rule1.When.StartTime == rule2.StartTime) &&
                (rule1.When.RuleDuration == rule2.RuleDuration) &&
                (level == rule2.StartAction) &&
                (rule1.NotifyMessage == (rule2.Message ? rule2.Message : rule2.NotificationMessage))
            ) {
                console.log("rulesEquals --> 111");
                if (rule1.SelectedDayOrRange == "Daily" || rule1.SelectedDayOrRange == sessionStore.DAILY_VAL) {
                    console.log("rulesEquals --> 222");
                    return true;
                }
                else {
                    if (this.checkDayOverlap(rule1, rule2)) {
                        console.log("rulesEquals --> 333");
                        return true;
                    }
                }
            }
        }

        return false;
    }
    notificationRuleConflict.deviceUsed = function (rule, devid) {
        if (Object.keys(rule.Devices).length > 0) {
            for (device in rule.Devices) {
                console.log("deviceUsed() :: device--> " + device + "  && devid--> " + devid);
                if (wemoUtil.isMakerDevice(device))
                    device = wemoUtil.getMakerSensorUDN(device);
                if (device == devid) {
                    return true;
                }
            }
        }

        return false;
    }
    notificationRuleConflict.showConflictDuplicateMessage = function (ruleName, msgType, device, ruleStart, ruleEnd) {
        var RuleconflictHeader = wemo.items['RuleConflict'];
        var RuleduplicateHeader = wemo.items['RuleDuplicate'];
        var headerText = RuleconflictHeader;
        var msgText  = "";

        if (msgType == "duplicate_name" || msgType == "duplicate_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleDuplicateText'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            msgText = temparr[0] + " " + ruleName + " " + temparr[1];

            headerText = RuleduplicateHeader;
        }else if (msgType == "conflict_day_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictNotifyRuleAllDay'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            msgText = temparr[0] + " " + ruleName + " " + temparr[1];
        }else if (msgType == "conflict_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictNotifyRule'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleStart + " " + temparr[2] + " " + ruleEnd + " " + temparr[3];
        }

        $("#ruleInfoHeader").text(headerText);
        $("#RuleDuplicateText").text(msgText);
        $("#rule_duplicate").popup("open");
    }

    // SaveCountdownRule
    var countdownRuleConflict = Object.create(RuleConflict.prototype);

    countdownRuleConflict.verifyRuleDuplicatesAndConflicts = function (rule, ruleRow) {
        console.log("New rule name: " + rule.RuleName);
        console.log("verifyRuleDuplicatesAndConflicts() rule--> " + JSON.stringify(rule));
        var countDownRulesInfo = {};
        for (var i = 0; i < ruleRow.length; i++) {
            var tmpRule = ruleRow.item(i);
            console.log("verifyRuleDuplicatesAndConflicts() tmpRule--> " + JSON.stringify(tmpRule));
            if (tmpRule != undefined) {
                if (wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(tmpRule.Type)) {
                    var tmpRuleName = tmpRule.Name;
                    if (tmpRule.State == '1' && this.rulesEquals(rule, tmpRule)) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        console.log("Found new rule duplication with: " + tmpRuleName);
                        this.showConflictDuplicateMessage(tmpRule.Name, "duplicate_rule");
                        return true;
                    }
                    if (tmpRule.State == '1' && this.ruleConflicts(rule, tmpRule)) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        console.log("Found new rule whole-day conflict with: " + tmpRuleName);
                        this.showConflictDuplicateMessage(tmpRule.Name, "conflict_day_rule");
                        return true;
                    }
                } else if(tmpRule.Type == sessionStore.TIME_INTERVAL){
                    var tmpRuleName = tmpRule.Name;
                    if (this.ruleConflicts(rule, tmpRule)) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        this.showConflictDuplicateMessage(tmpRule.Name, "conflict_rule_other");
                        return true;
                    }
                }
            }
        }
        return false;
    }
    countdownRuleConflict.rulesEquals = function (rule1, rule2) {
        console.log(JSON.stringify(rule1));
        console.log(JSON.stringify(rule2));

        if (!this.deviceUsed(rule1, rule2.DeviceID)) {
            return false;
        }

        if ((rule1.When.StartTime == rule2.StartTime) &&
            (rule1.When.RuleDuration == rule2.RuleDuration) &&
            (rule1.Devices[rule2.DeviceID].StartAction == rule2.StartAction)
        ) {
            if (rule1.SelectedDayOrRange == "Mon-Tue-Wed-Thu-Fri-Sat-Sun") {
                return true;
            }
            else {
                if (this.checkDayOverlap(rule1, rule2)) {
                    return true;
                }
            }
        }

        return false;
    }
    countdownRuleConflict.showConflictDuplicateMessage = function (ruleName, msgType) {
        var RuleconflictHeader = wemo.items['RuleConflict'];
        var RuleDuplicationHeader = wemo.items['RuleDuplicate'];

        if (msgType == "duplicate_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleDuplicateText'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + " " + temparr[1];

            setTimeout(
                function () {
                    $("#ruleInfoHeader").text(RuleDuplicationHeader);
                    $("#RuleDuplicateText").text(msgText);
                    $("#rule_duplicate").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }

        if (msgType == "conflict_day_rule") {
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictSimpleAndTimer'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            var msgText = temparr[0] + " " + ruleName + temparr[4];

            setTimeout(
                function () {
                    $("#ruleInfoHeader").text(RuleconflictHeader);
                    $("#RuleConflictSimpleAndTimer").text(msgText);
                    $("#rule_conflict").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }
        
        if (msgType == "conflict_rule_other") {
            setTimeout(
                function() {
                    $("#ruleInfoHeader").text(RuleconflictHeader);
                    $("#RuleConflictSimpleAndTimerOther").text(wemo.items['SaveConflictRuleDisabled']);
                    $("#rule_conflict_other").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }
    }

    // SaveMakerMotion
    var makerMotionRuleConflict = Object.create(RuleConflict.prototype);

    makerMotionRuleConflict.deviceUsed = function (rule, devid) {
        if (Object.keys(rule.Devices).length > 0) {
            for (device in rule.Devices) {
                console.log("deviceUsed() :: device--> "+ device + "  && devid--> "+ devid);
                if(wemoUtil.isMakerDevice(device)){
                    device = wemoUtil.getOriginalMakerUDN(device);
                    if(wemoUtil.isMakerDevice(devid))
                        devid = wemoUtil.getOriginalMakerUDN(devid);
                }
                if (device == devid) {
                    return true;
                }
            }
        }
        return false;
    }
    makerMotionRuleConflict.rulesEquals = function (rule1, rule2) {
        if (!this.deviceUsed(rule1, rule2.DeviceID)) {
            return false;
        }
        var StartAction ='';
        
      console.log("rulesEquals():: rule1--> "+ JSON.stringify(rule1));
      console.log("rulesEquals():: rule2--> "+ JSON.stringify(rule2));
      
      if(wemoUtil.isMakerDevice(rule2.DeviceID)){
          var tempUdn = wemoUtil.getOriginalMakerUDN(rule2.DeviceID);
          if(rule1.Devices[tempUdn] != undefined){
              StartAction = rule1.Devices[tempUdn].StartAction;
          }
      }
        if ((rule1.When.StartTime == rule2.StartTime) &&
            (rule1.When.RuleDuration == rule2.RuleDuration) &&
            (StartAction == rule2.StartAction)
            ) {
            if (rule1.SelectedDayOrRange == "Daily") {
                return true;
            }
            else {
                if (this.checkDayOverlap(rule1, rule2)) {
                    return true;
                }
            }
        }
        return false;
    }
    makerMotionRuleConflict.ruleConflicts = function (rule2, rule1) {
          console.log("this.ruleConflicts():: rule1--> "+ JSON.stringify(rule1));
          console.log("this.ruleConflicts():: rule2--> "+ JSON.stringify(rule2));
            if (!this.deviceUsed(rule2, rule1.DeviceID)) {
                return false;
            }
            if (this.checkDayOverlap(rule2, rule1)) {
                //We don't check next day overlap to be consistent with iOS code
                //See RuleUtility.m:1771
                var rule1End = parseInt(rule1.StartTime) + parseInt(rule1.RuleDuration);
                var tempUdn;
                //Case for Simple Timer Rule
                if(wemoUtil.isMakerDevice(rule1.DeviceID)){
                    tempUdn = wemoUtil.getOriginalMakerUDN(rule1.DeviceID);
                }
                else{
                    tempUdn = rule1.DeviceID; 
                }
                
                if (rule1.StartTime == rule2.When.StartTime && rule1.StartAction != rule2.Devices[tempUdn].StartAction) {
                    return true;
                }
                //Case 1
                //New rule interval is inside existing interval
                if (rule1.StartTime < rule2.When.StartTime && rule1End > rule2.When.EndTime) {
                    return true;
                }
                else if(rule1.StartTime < rule2.When.StartTime && rule2.When.StartTime < rule1End){
                    return true;
                }
                //Case 2
                //New rule interval partialy overlaps with existing
                if (rule2.When.StartTime < rule1.StartTime && (rule2.When.EndTime < rule1End && rule2.When.EndTime > rule1.StartTime)) {
                    return true;
                }
                if (rule2.When.EndTime > rule1.EndTime && (rule2.When.StartTime > rule1.StartTime && rule2.When.StartTime < rule1End)) {
                    return true;
                }
                //Case 3
                //Existing rule interval is inside new rule interval
                if (rule2.When.StartTime < rule1.StartTime && rule2.When.StartTime > rule1End) {
                    return true;
                }
            }
            return false;
    }
    makerMotionRuleConflict.showConflictDuplicateMessage = function (ruleName, msgType, device, ruleStart, ruleEnd, ruleType, ruleStartAct) {
            var RuleconflictHeader = wemo.items['RuleConflict'];
            var RuleDuplicationHeader = wemo.items['RuleDuplicate'];

            if (msgType == "duplicate_name" || msgType == "duplicate_rule") {
                var ruleConflictLocalizedmsg = wemo.items['RuleDuplicateText'];
                var temparr = ruleConflictLocalizedmsg.split("%@");
                var msgText = temparr[0] + " " + ruleName + " " + temparr[1];
                setTimeout(
                    function () {
                        $("#ruleInfoHeader").text(RuleDuplicationHeader);
                        $("#RuleDuplicateText").text(msgText);
                        $("#rule_duplicate").popup("open");
                    },
                    timeout.POPUP_DISPLAY_DELAY
                );
            }
            if (msgType == "conflict_rule" || msgType == "conflict_day__rule") {
                var ruleConflictLocalizedmsg = wemo.items['RuleConflictSimpleAndTimer'];
                var temparr = ruleConflictLocalizedmsg.split("%@");
                switch ( ruleType ) {
                    case sessionStore.SIMPLE_SWITCH:
                        var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleStartAct + " " + device + " " + temparr[3] + " " + ruleStart  + temparr[4];
                        break;
                    case sessionStore.TIME_INTERVAL:
                        var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + wemo.items["RuleDetailsSwitchTurnsOn"] + " " + device + " " + temparr[3] + " " + ruleStart  + wemo.items["And"] + wemo.items["RuleDetailsSwitchTurnsOff"] + temparr[3] + " " + ruleEnd + temparr[4];
                        break;
                    case sessionStore.AWAY_MODE:
                        var msgText = wemo.items["AwayModeConflict"];
                        break;
                    case sessionStore.MOTION_CONTROLLED:
                        ruleConflictLocalizedmsg = wemo.items['RuleConflictSensorRuleWithMotionON'];
                        temparr = ruleConflictLocalizedmsg.split("%@");
                        var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " +ruleStartAct  + " " +  device + " " + temparr[2] + temparr[3] + ruleStart  +  temparr[4] + ruleEnd + temparr[5];
                    case sessionStore.MAKER_MOTION_CONTROLLED:
                        ruleConflictLocalizedmsg = wemo.items['RuleConflictSensorRuleWithMotionON'];
                        temparr = ruleConflictLocalizedmsg.split("%@");
                        var msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " +ruleStartAct  + " " +  device + " " + temparr[2] + temparr[3] + ruleStart  +  temparr[4] + ruleEnd + temparr[5];
                        break;
                }
                setTimeout(
                    function () {
                        $("#ruleInfoHeader").text(RuleconflictHeader);
                        $("#RuleConflictSimpleAndTimer").text(msgText);
                        $("#rule_conflict").popup("open");
                    },
                    timeout.POPUP_DISPLAY_DELAY
                );
            }
    }
    makerMotionRuleConflict.verifyRuleDuplicatesAndConflicts = function (rule, ruleRow) {
        //Check rule for duplication
        console.log("Check for rule for duplication...");
        console.log("New rule name: " + rule.RuleName);
        console.log("verifyRuleDuplicatesAndConflicts() rule--> "+JSON.stringify(rule));
        console.log("verifyRuleDuplicatesAndConflicts() ruleRow--> "+JSON.stringify(ruleRow) + "  "+ ruleRow);
        var makerSensorRulesInfo ={};
        // checking for maker sensor udn
        for(var index = 0; index < ruleRow.length; index++){
            var tmpRuleRow = ruleRow.item(index);
            if(tmpRuleRow.DayID == -1){
                if (Object.keys(rule.Sensors).length > 0) {
                    for (makerSensor in rule.Sensors) {
                        if(wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(tmpRuleRow.Type) && tmpRuleRow.DeviceID == wemoUtil.getMakerSensorUDN(makerSensor)){
                            if(tmpRuleRow.StartAction == rule.Sensors[makerSensor].state){
                                makerSensorRulesInfo[tmpRuleRow.RuleID] = true ;
                            }
                        }
                    }
                }
            }
        }
        for (var i = 0; i < ruleRow.length; i++) {
            var tmpRule = ruleRow.item(i);
            var targetDeviceID = tmpRule.DeviceID; 

            //for link/bridge devices
            if(targetDeviceID.toLowerCase().indexOf(sessionStore.BRIDGE) != -1){
                var arrDeviceID = targetDeviceID.split(":");
                // targetDeviceID will be at the end of rule2.DeviceID
                targetDeviceID = arrDeviceID[arrDeviceID.length-1];
            }else{
                if(targetDeviceID.indexOf(sessionStore.UUID) == -1){
                    targetDeviceID = sessionStore.UUID+':'+targetDeviceID;
                }
            }
            console.log("verifyRuleDuplicatesAndConflicts() tmpRule--> "+JSON.stringify(tmpRule));
            if (tmpRule != undefined) {
                if (wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(tmpRule.Type)) {
                        var tmpRuleName = tmpRule.RuleName;
                        var udn = targetDeviceID, fname = '';
                        if(wemoUtil.isMakerDevice(udn)){
                            if(rule.Devices[targetDeviceID] != undefined){
                                fname = rule.Devices[targetDeviceID].FName;
                            }
                            else if(rule.Devices[wemoUtil.getOriginalMakerUDN(targetDeviceID)] != undefined){
                                fname = rule.Devices[wemoUtil.getOriginalMakerUDN(targetDeviceID)].FName;
                            }
                        }
                        else{
                            fname = rule.Devices[targetDeviceID].FName;
                        }
                        if (this.rulesEquals(rule, tmpRule) && makerSensorRulesInfo[tmpRule.RuleID] == true) {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            console.log(JSON.stringify(tmpRule));
                            console.log("Found new rule duplication with: " + tmpRuleName);
                            this.showConflictDuplicateMessage(tmpRule.Name, "duplicate_rule", fname, null, null, null, null);
                            return true;
                        }
                        if (this.ruleConflicts(rule, tmpRule) && makerSensorRulesInfo[tmpRule.RuleID] == true) {
                            if (this.isWholeDay(rule)) {
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                console.log(JSON.stringify(tmpRule));
                                console.log("Found new rule whole-day conflict with: " + tmpRuleName);
                                this.showConflictDuplicateMessage(tmpRule.Name, "conflict_day__rule", fname, null, null, null, null);
                                return true;
                            }
                            else {
                                console.log(JSON.stringify(tmpRule));
                                console.log("Found new rule conflict with: " + tmpRuleName);
                                var ruleStartAct = tmpRule.StartAction == 1 ? wemo.items["RuleDetailsSwitchTurnsOn"] : wemo.items["RuleDetailsSwitchTurnsOff"];
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                this.showConflictDuplicateMessage(tmpRule.Name, "conflict_rule", fname, wemoUtil.convertMillisecondsToAMPM(tmpRule.StartTime), wemoUtil.convertMillisecondsToAMPM(parseInt(tmpRule.StartTime) + parseInt(tmpRule.RuleDuration)), tmpRule.Type, ruleStartAct);
                                return true;
                            }
                        }
                }
            }
        }
        return false;
    }


    //SaveRule_TimerInterval
    var timeIntervalRuleConflict = Object.create(RuleConflict.prototype);

    timeIntervalRuleConflict.verifyConflictsDuplicates = function (device, ruleRow, rule, days, sensorValue, deviceName, sensorDeviceName) {
        
        var strDays = rule.SelectedDayOrRange;
        var arrDays = strDays.split("-");
        var ruleDays = [];
        for (var i = 0; i < arrDays.length; i++) {
            ruleDays.push(this.deCodeDays(arrDays[i]));
        }
        ruleDays = ruleDays.join("-");
        for (var j = 0; j < ruleRow.length; j++) {
            wemoUtil.infoLog(TAG, "j " + j + " arrDays[j] " + arrDays[j]);
            if (wemoUtil.getRuleClass(rule.RuleType) == wemoUtil.getRuleClass(ruleRow[j].rowType)) {
                if (arrDays[j] != undefined) {
                    if (rule.When.StartSRSS != undefined) {
                        if (rule.When.StartSRSS === "Sunrise") rule.When.StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][this.deCodeDays(arrDays[j])]["timeSR"];
                        else rule.When.StartTime = rule[sessionStore.SRSS_SELECTED_DAYS][this.deCodeDays(arrDays[j])]["timeSS"];

                        rule.When.RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][this.deCodeDays(arrDays[j])]["RuleDuration"];
                    } else if (rule.When.StartSRSS == undefined && rule.When.EndSRSS != undefined) {
                        rule.When.RuleDuration = rule[sessionStore.SRSS_SELECTED_DAYS][this.deCodeDays(arrDays[j])]["RuleDuration"];
                    }
                }
                rule.When.EndTime = parseInt(rule.When.StartTime) + parseInt(rule.When.RuleDuration);
                var dayID = ( arrDays[j] != undefined ) ? this.deCodeDays(arrDays[j]) : ruleRow[j].rowDayID;
                var ruleParamsByDay = this.getST_RDfromDBbyDayId(ruleRow, dayID);
                var sTime;
                var eTime;
                var startAction;

                if (ruleParamsByDay.length == 0) {
                    sTime = "" + ruleRow[j].rowStartTime;
                    eTime = "" + ruleRow[j].rowRuleDuration;
                    startAction = "" + ruleRow[j].rowStartAction;
                } else {
                    sTime = "" + ruleParamsByDay[0];
                    wemoUtil.infoLog(TAG, "DB:  sTime:               " + sTime);
                    wemoUtil.infoLog(TAG, "Rule:    rule.When.StartTime: " + rule.When.StartTime);

                    eTime = "" + ruleParamsByDay[1];
                    wemoUtil.infoLog(TAG, "DB:  eTime:                    " + eTime);
                    wemoUtil.infoLog(TAG, "Rule:    rule.When.RuleDuration: : " + rule.When.RuleDuration);

                    startAction = ruleParamsByDay[2];
                }
                var endTime = parseInt(sTime) + parseInt(eTime);
                wemoUtil.infoLog(TAG, "sTime+eTime: " + endTime);
                
                var rowDeviceIDDB = ruleRow[j].rowDeviceID;
                var searchType = rowDeviceIDDB.search("Bridge");

                if(searchType != -1 || searchType == true)
                {
                    wemoUtil.infoLog(TAG, "entering in if");
                    
                    if(rowDeviceIDDB.indexOf("^")!=-1)
                    {
                        var rowDeviceIDArr = rowDeviceIDDB.split("^");
                        rowDeviceIDDB = rowDeviceIDArr[1];   
                    }
                    else
                    {
                        var rowDeviceIDArr = rowDeviceIDDB.split(":");
                        rowDeviceIDDB = rowDeviceIDArr[2];   
                    }  
                    
                }

                wemoUtil.infoLog(TAG, "rule_dev " + device + " db dev: " + rowDeviceIDDB);
                var conRuleStartAct = device + '' + rule.When.StartTime + '' + rule.Devices[device].StartAction + '' + ruleDays;
                var conRowStartAct = rowDeviceIDDB + '' + sTime + '' + ruleRow[j].rowStartAction + '' + days;
                var conRuleEndAct = device + '' + rule.When.EndTime + '' + rule.Devices[device].EndAction + '' + ruleDays;
                var conRowEndAct = rowDeviceIDDB + '' + endTime + '' + ruleRow[j].rowEndAction + '' + days;
                var conRowStartEndAct = rowDeviceIDDB + '' + endTime + '' + ruleRow[j].rowEndAction + '' + days;

                var startActAllDay = rowDeviceIDDB + '' + sTime + '' + eTime + '' + ruleRow[j].rowStartAction + '' + sensorValue;
                var dupStartActAllDay = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + rule.Devices[device].StartAction + '' + rule.SelectedSensorsValue;

                var endActSimple = rowDeviceIDDB + '' + endTime + '' + ruleRow[j].rowStartAction;
                var startActSimple = rowDeviceIDDB + '' + sTime + '' + ruleRow[j].rowStartAction;
                var dupStartActSimple = device + '' + rule.When.StartTime + '' + rule.Devices[device].StartAction;

                //Sensor Rule, Timer Rule & Simple Rule Duplication & Start Action Conflict
                var startAct = rowDeviceIDDB + '' + sTime + '' + eTime + '' + startAction + '' + days + '' + sensorValue;
                var dupStartAct = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + rule.Devices[device].StartAction + '' + ruleDays + '' + rule.SelectedSensorsValue;
                var conStartAct = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + rule.Devices[device].StartAction + '' + ruleDays + '' + rule.SelectedSensorsValue;
                var result = this.ruleConflicts(rule, ruleRow[j]);
                wemoUtil.infoLog(TAG, "startAct " + startAct + " dupStartAct " + dupStartAct);
                wemoUtil.infoLog(TAG, "conflict Rule :: " + conRuleStartAct + "  Current Rule :: " + conRowEndAct + " Rule ID :: " + ruleRow[j].rowRuleID + " result: " + result);
                if ((!this.checkDayOverlap(rule, ruleRow[j])) || (!this.deviceUsed(rule, rowDeviceIDDB)) || (ruleRow[j].rowState != '1')) continue;

                
                if (result) {
                    if (rule.RuleType == sessionStore.AWAY_MODE) {
                        if (ruleRow[j].rowType == sessionStore.AWAY_MODE) {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                            return true;
                        }
                        else {
                            window.sessionStorage.setItem("away_conflict", "1");
                        }
                    }
                    else {
                        if (ruleRow[j].rowType == sessionStore.AWAY_MODE) {
                            window.sessionStorage.setItem("away_conflict", "1");
                        }
                        else {
                            if (endActSimple == dupStartActSimple || startActSimple == dupStartActSimple) {
                                if (days == "0" && ruleDays != 0) {
                                    if (ruleRow[j].rowStartAction != rule.Devices[device].StartAction) {
                                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                        this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                                        return true;
                                    } else {
                                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                        this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                                        return true;
                                    }
                                }
                            } else if (startAct == dupStartAct) {
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                                return true;
                            } 
                            //Fix for WEMO-21093 Rule conflict popup appears in case of Duplicate SRSS rule
                            /**
                            else {
                                this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                                return true;
                            }**/
                        }
                    }
                }
                else {
                    var conflict = false;
                    var duplicate = false;
                    
                    if (rule.When.StartTime == rule.When.EndTime) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        this.showConflictDuplicateMessage("", "", "identical", "", "", "", "", "", "");
                        return true;
                    }
                    else if (rule.RuleType == sessionStore.AWAY_MODE && ruleRow[j].rowType == sessionStore.AWAY_MODE) {
                        if (rule.When.StartTime == ruleRow[j].rowStartTime && rule.When.EndTime == endTime) {
                            duplicate = true;
                        }
                        else if (rule.When.StartTime == ruleRow[j].rowStartTime || rule.When.StartTime == endTime || rule.When.EndTime == ruleRow[j].rowStartTime || rule.When.EndTime == endTime) {
                            conflict = true;
                        }
                        else if (rule.When.StartTime <= ruleRow[j].rowStartTime && rule.When.EndTime >= (ruleRow[j].rowStartTime + ruleRow[j].rowRuleDuration)) {
                            conflict = true;
                        }
                    }
                    else if (rule.RuleType != sessionStore.AWAY_MODE || ruleRow[j].rowType != sessionStore.AWAY_MODE) {
                        if (rule.When.StartTime == ruleRow[j].rowStartTime || rule.When.StartTime == endTime || rule.When.EndTime == ruleRow[j].rowStartTime || rule.When.EndTime == endTime) {
                            if (startAct == dupStartAct) {
                                
                                // Away mode rule has highest priority, so dont do duplicate check here
                                if (ruleRow[j].rowType != sessionStore.AWAY_MODE && rule.RuleType != sessionStore.AWAY_MODE){
                                    duplicate = true;
                                }
                                else if (ruleRow[j].rowType == sessionStore.AWAY_MODE && rule.RuleType == sessionStore.AWAY_MODE){
                                    duplicate = true;
                                }
                                else { 
                                    window.sessionStorage.setItem("away_conflict", "1"); 
                                }
                                    
                                
                            } else {
                                if (ruleRow[j].rowType == sessionStore.SIMPLE_SWITCH) {
                                   
                                    if (rule.RuleType == sessionStore.AWAY_MODE || ruleRow[j].rowType == sessionStore.AWAY_MODE){
                                        window.sessionStorage.setItem("away_conflict", "1"); 
                                    }else{  
                                        if (rule.When.EndTime == ruleRow[j].rowStartTime && rule.Devices[device].EndAction == ruleRow[j].rowEndAction)
                                            continue;
                                        else if (rule.When.StartTime == ruleRow[j].rowStartTime && rule.Devices[device].StartAction == ruleRow[j].rowStartAction)
                                            continue;
                                        else
                                            conflict=true;
                                    }
                                }
                                else { 
                                    conflict=true;
                                }
                            }

                        }
                        else if (rule.When.StartTime <= ruleRow[j].rowStartTime && rule.When.EndTime >= (ruleRow[j].rowStartTime + ruleRow[j].rowRuleDuration)) {
                            conflict=true;
                        }
                    }

                    if (conflict) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    }
                    if (duplicate) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    }


                    if (startAct == dupStartAct) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    } else if (startAct == conStartAct || conRuleStartAct == conRowStartAct || conRuleStartAct == conRowStartEndAct) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    }

                    if (rule.RuleType == "Time Interval" || rule.RuleType == "Away Mode") {
                        if (conRuleStartAct == conRowEndAct) {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                            return true;
                        } else if (endActSimple == dupStartActSimple || startActSimple == dupStartActSimple) {
                            if (days == "0" && ruleDays != 0) {
                                if (ruleRow[j].rowStartAction != rule.Devices[device].StartAction) {
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                    this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                                    return true;
                                } else {
                                    nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                    this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                                    return true;
                                }
                            }

                        }
                    }
                }
            } else if(wemoUtil.getRuleClass(ruleRow[j].rowType) == rulesClasses.COUNTDOWN_TIMER_CLASS){
                var tmpRuleName = ruleRow[j].rowRuleName;
                if (this.ruleConflicts(rule, ruleRow[j])) {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        wemoUtil.setJSONObjectToSessionStorage(sessionStore.COUNTDOWN_RULE_DATA, ruleRow[0]);
                        this.showConflictDuplicateMessage(ruleRow[j].rowType,tmpRuleName, "conflict_rule_other", null, null, null, null);
                        return true;
                    }
                }
        }
        return false;
    }

    timeIntervalRuleConflict.showConflictDuplicateMessage = function (ruleType, ruleName, msgType, ruleAction, device, sTime, eTime, sensorDeviceName, subRuleType){
        var RuleconflictHeader = wemo.items['RuleConflict'];
        var msgText = '';

        if (ruleAction == "Turns On") {
            ruleAction = wemo.items['SwitchActionTurnOn'];
        }
        else if (ruleAction == "Turns Off") {
            ruleAction = wemo.items['SwitchActionTurnOff'];
        }
        else if (ruleAction == "Does Nothing") {
            ruleAction = wemo.items['SwitchActionNothing'];
        }

        /*******Rule Name ************/

        var rulenameObj = ruleName;
        var searchRule = rulenameObj.search("Rule");

        if (searchRule != -1 || searchRule == false) {
            var rulenamepart1 = wemo.items['Rule'];
            ruleName = rulenameObj.replace("Rule", rulenamepart1);
        }
        else {
            ruleName = rulenameObj;
        }
        if (msgType == "identical") {
            setTimeout(
                function () {
                    $("#ruleInfoHeader").html(wemo.items['IdenticalTimeHeader']);
                    $("#RuleDuplicateText").html(wemo.items['IdenticalTimeNotification']);
                    $("#rule_duplicate").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }else if (msgType == "conflict_rule_other") {
            setTimeout(
                function() {
                    $("#ruleInfoHeader").text(RuleconflictHeader);
                    $("#RuleConflictSimpleAndTimerOther").text(wemo.items['SaveConflictRuleDisabled']);
                    $("#rule_conflict_other").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }else if (msgType == "conflict") {
            window.sessionStorage.removeItem("away_conflict");
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictSimpleAndTimer'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[3] + " " + sTime + temparr[4];
            RuleconflictHeader = wemo.items['RuleConflict'];

            wemoUtil.infoLog(TAG, msgText);

            if(ruleType == sessionStore.MOTION_CONTROLLED){
                if (subRuleType == "AllDay") {
                    ruleConflictLocalizedMotionmsg = wemo.items['RuleConflictSensorRuleWithMotionAllDayON'];
                    temparr = ruleConflictLocalizedMotionmsg.split("%@");
                    msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[2] + " " + sensorDeviceName + " " + temparr[3];
                } else {
                    ruleConflictLocalizedMotionmsg = wemo.items['RuleConflictSensorRuleWithMotionON'];
                    temparr = ruleConflictLocalizedMotionmsg.split("%@");
                    msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[2] + " " + sensorDeviceName + " " + temparr[3] + " " + sTime + " " + temparr[4] + " " + eTime + "" + temparr[5];
                }
            }

            setTimeout(
                function () {
                    $("#ruleInfoHeader").html(RuleconflictHeader);
                    $("#RuleDuplicateText").html(msgText);
                    $("#rule_duplicate").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }else {

            var ruleDuplicateLocalizedmsg = wemo.items['RuleDuplicateText'];
            var temparr = ruleDuplicateLocalizedmsg.split("%@");
            msgText = temparr[0] + " " + ruleName + " " + temparr[1];
            var RuleDuplicationHeader = wemo.items['RuleDuplicate'];

            setTimeout(
                function () {
                    $("#ruleInfoHeader").html(RuleDuplicationHeader);
                    $("#RuleDuplicateText").html(msgText);
                    $("#rule_duplicate").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }
    }

    timeIntervalRuleConflict.ruleConflicts = function (rule2, rule1) {

        if (!this.deviceUsed(rule2, rule1.rowDeviceID)) {
            return false;
        }

       /*if (wemoUtil.getRuleClass(rule1.rowType) != wemoUtil.getRuleClass(rule2.RuleType)) {
            return false;
        }*/

        if (this.checkDayOverlap(rule2, rule1)) {
            //We don't check next day overlap to be consistent with iOS code
            //See RuleUtility.m:1771

            var rule1End = parseInt(rule1.rowStartTime) + parseInt(rule1.rowRuleDuration);
            //Case 1
            //New rule interval is inside existing interval
            if (parseInt(rule1.rowStartTime) < rule2.When.StartTime && rule1End > rule2.When.EndTime) {
                return true;
            }
            //Case 1 //Removing as discussed with team
            //New rule End time check onflict with start time of existing interval
            /*if (rule2.When.EndTime <rule1.rowStartTime ) {
             return true;
             }*/

            //Case 2
            //New rule interval partialy overlaps with existing
            if (rule2.When.StartTime < parseInt(rule1.rowStartTime) && (rule2.When.EndTime < rule1End && rule2.When.EndTime > parseInt(rule1.rowStartTime))) {
                return true;
            }
            if (rule2.When.EndTime > rule1End && (rule2.When.StartTime > parseInt(rule1.rowStartTime) && rule2.When.StartTime < rule1End)) {
                return true;
            }

            //Case 3
            //Existing rule interval is inside new rule interval
            if (rule2.When.StartTime < parseInt(rule1.rowStartTime) && rule2.When.EndTime > rule1End) {
                return true;
            }

        }

        return false;
    }

    timeIntervalRuleConflict.getST_RDfromDBbyDayId = function (ruleRow, curDayID) {
        var ruleParamsByDay = [];
        for (var i = 0; i < ruleRow.length; i++) {
            wemoUtil.infoLog(TAG, "ruleRow[i].rowDayID: " + ruleRow[i].rowDayID);
            wemoUtil.infoLog(TAG, "curDayID: " + curDayID);
            if (ruleRow[i].rowDayID == curDayID) {
                ruleParamsByDay.push(ruleRow[i].rowStartTime);
                ruleParamsByDay.push(ruleRow[i].rowRuleDuration);
                ruleParamsByDay.push(ruleRow[i].rowStartAction);
                return ruleParamsByDay;
            }
        }
        return ruleParamsByDay;
    }

    timeIntervalRuleConflict.checkDayOverlap = function (rule1, rule2) {
        var arrDays = rule1.SelectedDayOrRange.split("-");
        var Days = this.getDays(arrDays);
        for (var i = 0; i < Days.length; i++) {
            if (Days[i] == rule2.rowDayID) {
                return true;
            }
        }

        return false;
    }


    //SaveNewRule
    var simpleRuleConflict = Object.create(RuleConflict.prototype);
    simpleRuleConflict.verifyConflictsDuplicates = function (device, ruleRow, rule, days, sensorValue, deviceName, sensorDeviceName) {
            //alert("   validate :: "+JSON.stringify(ruleRow)+ '   Length = '+ruleRow.length);
            var strDays = rule.SelectedDayOrRange;
            var arrDays = strDays.split("-");
            var ruleDays = [];
            for (var i = 0; i < arrDays.length; i++) {
                ruleDays.push(this.deCodeDays(arrDays[i]));
            }
            ruleDays = ruleDays.join("-");
            // var rulesensorValue="";
            for (var j = 0; j < ruleRow.length; j++) {
                
                if (ruleRow[j].rowType == sessionStore.MOTION_CONTROLLED || ruleRow[j].rowType == sessionStore.MAKER_MOTION_CONTROLLED || ruleRow[j].rowType == sessionStore.INSIGHT_RULE) {
                    continue ;
                }
                var tempStartTime = "" + ruleRow[j].rowStartTime;
                if (tempStartTime.slice(-1) == "1") {
                    sTime = parseInt(ruleRow[j].rowStartTime) - 1;
                } else {
                    sTime = tempStartTime;
                }

                var tempEndTime = "" + ruleRow[j].rowRuleDuration;
                if (tempEndTime.slice(-1) == "1") {
                    eTime = parseInt(ruleRow[j].rowRuleDuration) - 2;
                } else {
                    eTime = tempEndTime;
                }
                /*if (ruleRow[j].rowStartTime.slice(-1)=="1"){
                 ruleRow[j].rowStartTime=parseInt(ruleRow[j].rowStartTime)-1;
                 }
                 if (ruleRow[j].rowRuleDuration.slice(-1)=="2"){
                 ruleRow[j].rowRuleDuration=parseInt(ruleRow[j].rowRuleDuration)-2;
                 }*/
                //alert(" Rule ID :: "+ruleRow[j].rowRuleID+"  Sensor Value = "+ruleRow[j].rowRuleValue+'  '+sensorValue+'   Device = '+ruleRow[j].rowDeviceID+'   Sensor Duration  '+ruleRow[j].rowSDuration);
                var endTime = parseInt(sTime) + parseInt(eTime);

                // cross Rule Conflict
                /*var conRuleStartAct   = device+''+rule.When.StartTime+''+complementAction(rule.Devices[device].StartAction);
                 var conRowStartAct    = ruleRow[j].rowDeviceID+''+sTime+''+ruleRow[j].rowStartAction;
                 var conRuleEndAct     = device+''+rule.When.EndTime+''+rule.Devices[device].StartAction;
                 var conRowEndAct      = ruleRow[j].rowDeviceID+''+endTime+''+ruleRow[j].rowEndAction;*/

                var rowDeviceIDDB = ruleRow[j].rowDeviceID;
                var searchType = rowDeviceIDDB.search("Bridge");

                if(searchType != -1 || searchType == true)
                {

                    if(rowDeviceIDDB.indexOf("^")!=-1)
                    {
                        var rowDeviceIDArr = rowDeviceIDDB.split("^");
                        rowDeviceIDDB = rowDeviceIDArr[1];   
                    }
                    else
                    {
                        var rowDeviceIDArr = rowDeviceIDDB.split(":");
                        rowDeviceIDDB = rowDeviceIDArr[2];   
                    }  
                    
                }
                
                var conRuleStartAct = device + '' + rule.When.StartTime + '' + complementAction(rule.Devices[device].StartAction) + '' + ruleDays;
                var conRowStartAct = rowDeviceIDDB + '' + sTime + '' + ruleRow[j].rowStartAction + '' + days;
                var conRowStartComplAct = rowDeviceIDDB + '' + sTime + '' + complementAction(ruleRow[j].rowStartAction) + '' + days;

                var conRuleEndAct = device + '' + rule.When.EndTime + '' + rule.Devices[device].EndAction + '' + ruleDays;
                var conRowEndAct = rowDeviceIDDB+ '' + endTime + '' + complementAction(ruleRow[j].rowEndAction) + '' + days;

                var conRowStartEndAct = rowDeviceIDDB+ '' + endTime + '' + ruleRow[j].rowEndAction + '' + days;

                var startActAllDay = rowDeviceIDDB+ '' + sTime + '' + eTime + '' + ruleRow[j].rowStartAction + '' + sensorValue;
                var dupStartActAllDay = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + complementAction(rule.Devices[device].StartAction) + '' + rule.SelectedSensorsValue;

                var endActSimple = rowDeviceIDDB + '' + endTime + '' + ruleRow[j].rowStartAction;
                var startActSimple = rowDeviceIDDB + '' + sTime + '' + ruleRow[j].rowStartAction;
                var dupStartActSimple = device + '' + rule.When.StartTime + '' + complementAction(rule.Devices[device].StartAction);

                //Sensor Rule, Timer Rule & Simple Rule Duplication & Start Action Conflict
                var startAct = rowDeviceIDDB + '' + sTime + '' + eTime + '' + ruleRow[j].rowStartAction + '' + days + '' + sensorValue;
                var dupStartAct = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + rule.Devices[device].StartAction + '' + ruleDays + '' + rule.SelectedSensorsValue;
                var conStartAct = device + '' + rule.When.StartTime + '' + rule.When.RuleDuration + '' + complementAction(rule.Devices[device].StartAction) + '' + ruleDays + '' + rule.SelectedSensorsValue;

                var startActSimpleRule = rowDeviceIDDB + '' + sTime + '' + ruleRow[j].rowStartAction;
                var dupStartActSimpleRule = device + '' + rule.When.StartTime + '' + rule.Devices[device].StartAction;
                             
                /*******Logic for Away Mode Rule**************/
                var result = this.ruleConflicts(rule, ruleRow[j], endTime);
                
                 if (result) {
                    if (rule.RuleType == sessionStore.AWAY_MODE) {
                        if (ruleRow[j].rowType == sessionStore.AWAY_MODE) {
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                            return true;
                        }
                        else {
                            window.sessionStorage.setItem("away_conflict", "1");
                        }
                    }
                    else {
                        if (ruleRow[j].rowType == sessionStore.AWAY_MODE && ruleRow[j].rowState != "0") {
                            window.sessionStorage.setItem("away_conflict", "1");
                        }
                    }
                }
                
               /*******Logic for Away Mode Rule**************/

                if (rule.RuleType == sessionStore.SIMPLE_SWITCH) {
                    if ((!this.checkDayOverlap(rule, ruleRow[j]))||(!this.deviceUsed(rule, ruleRow[j].rowDeviceID))||(ruleRow[j].rowState != '1')) continue;
                    var conflict=false;
                    var duplicate = false;
                    if(rule.When.StartTime==endTime&&ruleRow[j].rowEndAction != rule.Devices[device].StartAction && ruleRow[j].rowType != sessionStore.AWAY_MODE){

                        var date=new Date();
                        var today = parseInt(date.getUTCDay()) + 1;

                        if (rule.When.StartSRSS === "Sunrise"){
                            //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSR"];
                            var currTime = wemo.items['SR'];
                        }
                        else if(rule.When.StartSRSS === "Sunset")
                            //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSS"];
                            var currTime = wemo.items['SS'];
                        else{
                            var currTime = wemoUtil.convertMillisecondsToAMPM(sTime);
                        }

                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, currTime, wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    }
                    // Fix for WEMO-24650
                    else if (rule.When.StartTime == ruleRow[j].rowStartTime && ruleRow[j].rowStartAction != rule.Devices[device].StartAction && ruleRow[j].rowType != sessionStore.AWAY_MODE) {

                        var date=new Date();
                        var today = parseInt(date.getUTCDay()) + 1;

                        if (rule.When.StartSRSS === "Sunrise"){
                            //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSR"];
                            var currTime = wemo.items['SR'];
                        }
                        else if(rule.When.StartSRSS === "Sunset"){
                            var currTime = wemo.items['SS'];
                            //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSS"];
                        }
                        else{
                            var currTime = wemoUtil.convertMillisecondsToAMPM(sTime);
                        }
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, currTime, wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    }
                    else if (startActSimpleRule == dupStartActSimpleRule) {
                        // Away mode rule has highest priority, so dont do duplicate check here 
                        if (ruleRow[j].rowType != sessionStore.AWAY_MODE && rule.RuleType != sessionStore.AWAY_MODE) {
                             duplicate=true;
                         }
                    }
                    else if (conRuleStartAct == conRowEndAct) {
                        return false;
                    
                    } else if (endActSimple == dupStartActSimple || startActSimple == dupStartActSimple) {
                        if (days == "0" && ruleDays != 0) {
                            if (ruleRow[j].rowStartAction != rule.Devices[device].StartAction) {
                                conflict=true;
                            } else {
                                duplicate = true;
                            }
                        }
                        else 
                        {
                            if(rule.When.StartTime == ruleRow[j].rowStartTime && ruleRow[j].rowStartAction != rule.Devices[device].StartAction ){
                                conflict=true;
                            }
                            else if(rule.When.StartTime==endTime&&ruleRow[j].rowEndAction != rule.Devices[device].StartAction){
                                conflict=true;
                            }
                            
                        }
                    }
                    
                    if(conflict && ruleRow[j].rowType == sessionStore.AWAY_MODE){
                        return false;
                    }
                    if(conflict)
                    {

                        var date=new Date();
                        var today = parseInt(date.getUTCDay()) + 1;

                        if (rule.When.StartSRSS === "Sunrise"){
                            //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSR"];
                            var currTime = wemo.items['SR'];
                        }
                        else if(rule.When.StartSRSS === "Sunset"){
                            //var currTime = rule[sessionStore.SRSS_SELECTED_DAYS][today]["timeSS"];
                            var currTime = wemo.items['SS'];
                        }
                        else{
                            //var currTime = sTime;
                            var currTime = wemoUtil.convertMillisecondsToAMPM(sTime);
                        }

                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, currTime, wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    }
                    else if(duplicate)
                    {
                        nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                        this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                        return true;
                    }
                   
                } else if (rule.RuleType == sessionStore.TIME_INTERVAL) {
                    if (conRowStartAct == conRuleEndAct) {
                        if (ruleRow[j].rowState == '1') {
                            //showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict");
                            nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                            this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                            return true;
                        } else {
                            // alert("No Conflict Data...");
                            return false;
                        }

                    }
                } else if (rule.RuleType == sessionStore.MOTION_CONTROLLED) {
                    if (startActAllDay == dupStartActAllDay) {
                        if (days == "0" && ruleDays != 0) {
                            if (ruleRow[j].rowStartAction != rule.Devices[device].StartAction) {
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "conflict", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "AllDay");
                                return true;
                            } else {
                                nativeUtilPlugin.execute(null, null, actions.HIDE_SPLASH_ON_LOADING, []);
                                this.showConflictDuplicateMessage(ruleRow[j].rowType, ruleRow[j].rowRuleName, "duplicate", wemoUtil.returnSwitchStatus(ruleRow[j].rowStartAction), deviceName, wemoUtil.convertMillisecondsToAMPM(sTime), wemoUtil.convertMillisecondsToAMPM(parseInt(sTime) + parseInt(eTime)), sensorDeviceName, "");
                                return true;
                            }
                        }
                    }
                }

            }
            return false;
        }

    simpleRuleConflict.showConflictDuplicateMessage = function (ruleType, ruleName, msgType, ruleAction, device, sTime, eTime, sensorDeviceName, subRuleType) {
        var RuleconflictHeader = wemo.items['RuleConflict'];
        var msgText = '';

        if (ruleAction == "Turns On") {
            ruleAction = wemo.items['SwitchActionTurnOn'];
        }
        else if (ruleAction == "Turns Off") {
            ruleAction = wemo.items['SwitchActionTurnOff'];
        }
        else if (ruleAction == "Does Nothing") {
            ruleAction = wemo.items['SwitchActionNothing'];
        }

        /*******Rule Name ************/

        var rulenameObj = ruleName;
        var searchRule = rulenameObj.search("Rule");

        if (searchRule != -1 || searchRule == false) {
            var rulenamepart1 = wemo.items['Rule'];
            ruleName = rulenameObj.replace("Rule", rulenamepart1);
        }
        else {
            ruleName = rulenameObj;
        }

        if (msgType == "conflict") {
            
            /*******Logic for Away Mode Rule**************/
            
            window.sessionStorage.removeItem("away_conflict");
            
            /*******Logic for Away Mode Rule**************/
            var ruleConflictLocalizedmsg = wemo.items['RuleConflictSimpleAndTimer'];
            var temparr = ruleConflictLocalizedmsg.split("%@");
            msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[3] + " " + sTime + temparr[4];
            RuleconflictHeader = wemo.items['RuleConflict'];

            if(ruleType == sessionStore.AWAY_MODE){
                msgText = wemo.items['AwayModeConflict'];
            }else if(ruleType == sessionStore.MOTION_CONTROLLED){
                if (subRuleType == "AllDay") {
                    var ruleConflictLocalizedMotionmsg = wemo.items['RuleConflictSensorRuleWithMotionAllDayON'];
                    var temparr = ruleConflictLocalizedMotionmsg.split("%@");
                    msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[2] + " " + sensorDeviceName + " " + temparr[3];
                } else {
                    var ruleConflictLocalizedMotionmsg = wemo.items['RuleConflictSensorRuleWithMotionON'];
                    var temparr = ruleConflictLocalizedMotionmsg.split("%@");
                    msgText = temparr[0] + " " + ruleName + " " + temparr[1] + " " + ruleAction + " " + device + " " + temparr[2] + " " + sensorDeviceName + " " + temparr[3] + " " + sTime + " " + temparr[4] + " " + eTime + "" + temparr[5];
                }
            }

            setTimeout(
                function(){
                    $("#ruleInfoHeader").html(RuleconflictHeader);
                    $("#RuleDuplicateText").html(msgText);
                    $("#rule_duplicate").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        } else {
            var ruleDuplicateLocalizedmsg = wemo.items['RuleDuplicateText'];
            var temparr = ruleDuplicateLocalizedmsg.split("%@");
            msgText = temparr[0] + " " + ruleName + " " + temparr[1];
            RuleDuplicationHeader = wemo.items['RuleDuplicate'];

            setTimeout(
                function(){
                    $("#ruleInfoHeader").html(RuleDuplicationHeader);
                    $("#RuleDuplicateText").html(msgText);
                    $("#rule_duplicate").popup("open");
                },
                timeout.POPUP_DISPLAY_DELAY
            );
        }
    }

    simpleRuleConflict.ruleConflicts = function (rule2, rule1, endTime) {

        if (!this.deviceUsed(rule2, rule1.rowDeviceID)) {
            return false;
        }        
        if (this.checkDayOverlap(rule2, rule1)) {
            //We don't check next day overlap to be consistent with iOS code
            //See RuleUtility.m:1771

            var rule1End = parseInt(rule1.rowStartTime) + parseInt(rule1.rowRuleDuration);
            
            if(parseInt(rule1.rowStartTime) == rule2.When.StartTime || rule1End == rule2.When.StartTime){
                return true;
            }
            //Case 1
            //New rule interval is inside existing interval
            if (parseInt(rule1.rowStartTime) < rule2.When.StartTime && rule1End > rule2.When.EndTime) {
                return true;
            }
            //Case 1 //Removing as discussed with team
            //New rule End time check onflict with start time of existing interval
            /*if (rule2.When.EndTime <rule1.rowStartTime ) {
             return true;
             }*/

            //Case 2
            //New rule interval partialy overlaps with existing
            if (rule2.When.StartTime < parseInt(rule1.rowStartTime) && (rule2.When.EndTime < rule1End && rule2.When.EndTime > parseInt(rule1.rowStartTime))) {
                return true;
            }
            if (rule2.When.EndTime > endTime && (rule2.When.StartTime > parseInt(rule1.rowStartTime) && rule2.When.StartTime < rule1End)) {
                return true;
            }

            //Case 3
            //Existing rule interval is inside new rule interval
            if (rule2.When.StartTime < parseInt(rule1.rowStartTime) && rule2.When.EndTime > rule1End) {
                return true;
            }

        }
    }

    simpleRuleConflict.checkDayOverlap = function (rule1, rule2) {
        var arrDays = rule1.SelectedDayOrRange.split("-");
        var Days = this.getDays(arrDays);
        for (var i = 0; i < Days.length; i++) {
            if (Days[i] == rule2.rowDayID) {
                return true;
            }
        }

        return false;
    }

    return {
        COUNTDOWN_TIMER: countdownRuleConflict,
        MOTION_CONTROLLED: motionRuleConflict,
        MAKER_MOTION_CONTROLLED: makerMotionRuleConflict,
        NOTIFY_ME: notificationRuleConflict,
        TIME_INTERVAL: {
            SIMPLE: simpleRuleConflict,
            INTERVAL: timeIntervalRuleConflict
        }
    }
})(window, undefined);

var verify_rule = {
    ruleConflict : ruleConflict
}