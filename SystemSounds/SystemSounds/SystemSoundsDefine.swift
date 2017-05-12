//
//  SystemSoundsDefine.swift
//  Pods
//
//  Created by Meniny on 2017-05-13.
//
//

import Foundation
import AudioToolbox

public extension SystemSounds {
    public enum Format: String {
        case caf = "caf"
        case aif = "aif"
        case aiff = "aiff"
        case wav = "wav"
    }
    
    public enum IDs: SystemSoundID {
        case newMail = 1000 // new-mail.caf // new-mail.caf // MailReceived
        case mailSent = 1001 // mail-sent.caf // mail-sent.caf // MailSent
        case voicemailReceived = 1002 // Voicemail.caf // Voicemail.caf // VoicemailReceived
        case receivedMessage = 1003 // ReceivedMessage.caf // ReceivedMessage.caf // SMSReceived
        case sentMessage = 1004 // SentMessage.caf // SentMessage.caf // SMSSent
        case alarm = 1005 // alarm.caf // sq_alarm.caf // CalendarAlert
        case lowPower = 1006 // low_power.caf // low_power.caf // LowPower
        case SMSReceived1 = 1007 // SMS-received1.caf // SMS-received1.caf // SMSReceived_Alert
        case SMSReceived2 = 1008 // SMS-received2.caf // SMS-received2.caf // SMSReceived_Alert
        case SMSReceived3 = 1009 // SMS-received3.caf // SMS-received3.caf // SMSReceived_Alert
        case SMSReceived4 = 1010 // SMS-received4.caf // SMS-received4.caf // SMSReceived_Alert
        case SMSReceivedVibrate = 1011 // - // - // SMSReceived_Vibrate
        case SMSReceived01 = 1012 // SMS-received1.caf // SMS-received1.caf // SMSReceived_Alert
        case SMSReceived5 = 1013 // SMS-received5.caf // SMS-received5.caf // SMSReceived_Alert
        case SMSReceived6 = 1014 // SMS-received6.caf // SMS-received6.caf // SMSReceived_Alert
        case voiceMail = 1015 // NS_AVAILABLE_IOS(2.1) // Voicemail.caf // Voicemail.caf // - // Available since 2.1
        case tweetSent = 1016 // tweet_sent.caf // tweet_sent.caf // SMSSent // Available since 5.0
        case anticipate = 1020 // Anticipate.caf // Anticipate.caf // SMSReceived_Alert // Available since 4.2
        case bloom = 1021 // Bloom.caf // Bloom.caf // SMSReceived_Alert // Available since 4.2
        case calypso = 1022 // Calypso.caf // Calypso.caf // SMSReceived_Alert // Available since 4.2
        case chooChoo = 1023 // Choo_Choo.caf // Choo_Choo.caf // SMSReceived_Alert // Available since 4.2
        case descent = 1024 // Descent.caf // Descent.caf // SMSReceived_Alert // Available since 4.2
        case fanfare = 1025 // Fanfare.caf // Fanfare.caf // SMSReceived_Alert // Available since 4.2
        case ladder = 1026 // Ladder.caf // Ladder.caf // SMSReceived_Alert // Available since 4.2
        case minuet = 1027 // Minuet.caf // Minuet.caf // SMSReceived_Alert // Available since 4.2
        case newsFlash = 1028 // News_Flash.caf // News_Flash.caf // SMSReceived_Alert // Available since 4.2
        case noir = 1029 // Noir.caf // Noir.caf // SMSReceived_Alert // Available since 4.2
        case sherwood = 1030 // Sherwood_Forest.caf // Sherwood_Forest.caf // SMSReceived_Alert // Available since 4.2
        case spell = 1031 // Spell.caf // Spell.caf // SMSReceived_Alert // Available since 4.2
        case suspense = 1032 // Suspense.caf // Suspense.caf // SMSReceived_Alert // Available since 4.2
        case telegraph = 1033 // Telegraph.caf // Telegraph.caf // SMSReceived_Alert // Available since 4.2
        case tiptoes = 1034 // Tiptoes.caf // Tiptoes.caf // SMSReceived_Alert // Available since 4.2
        case typewriters = 1035 // Typewriters.caf // Typewriters.caf // SMSReceived_Alert // Available since 4.2
        case update = 1036 // Update.caf // Update.caf // SMSReceived_Alert // Available since 4.2
        case USSD = 1050 // ussd.caf // ussd.caf // USSDAlert
        case SIMToolkitCallDropped = 1051 // SIMToolkitCallDropped.caf // SIMToolkitCallDropped.caf // SIMToolkitTone
        case SIMToolkitGeneralBeep = 1052 // SIMToolkitGeneralBeep.caf // SIMToolkitGeneralBeep.caf // SIMToolkitTone
        case SIMToolkitNegativeACK = 1053 // SIMToolkitNegativeACK.caf // SIMToolkitNegativeACK.caf // SIMToolkitTone
        case SIMToolkitPositiveACK = 1054 // SIMToolkitPositiveACK.caf // SIMToolkitPositiveACK.caf // SIMToolkitTone
        case SIMToolkitSMS = 1055 // SIMToolkitSMS.caf // SIMToolkitSMS.caf // SIMToolkitTone
        case PINKeyPressedTink = 1057 // Tink.caf // Tink.caf // PINKeyPressed
        case ctBusy = 1070 // ct-busy.caf // ct-busy.caf // AudioToneBusy // There was no category for this sound before 4.0.
        case ctCongestion = 1071 // ct-congestion.caf // ct-congestion.caf // AudioToneCongestion // There was no category for this sound before 4.0.
        case ctPathAck = 1072 // ct-path-ack.caf // ct-path-ack.caf // AudioTonePathAcknowledge // There was no category for this sound before 4.0.
        case ctError = 1073 // ct-error.caf // ct-error.caf // AudioToneError // There was no category for this sound before 4.0.
        case ctCallWaiting = 1074 // ct-call-waiting.caf // ct-call-waiting.caf // AudioToneCallWaiting // There was no category for this sound before 4.0.
        case ctKeytone2 = 1075 // ct-keytone2.caf // ct-keytone2.caf // AudioToneKey2 // There was no category for this sound before 4.0.
        case screenLocked = 1100 // lock.caf // sq_lock.caf // ScreenLocked
        case screenUnlocked = 1101 // unlock.caf // sq_lock.caf // ScreenUnlocked
        case failedUnlock = 1102 // - // - // FailedUnlock
        case keyPressedTink = 1103 // Tink.caf // sq_tock.caf // KeyPressed
        case keyPressedTock1 = 1104 // Tock.caf // sq_tock.caf // KeyPressed
        case keyPressedTock2 = 1105 // Tock.caf // sq_tock.caf // KeyPressed
        case connectedToPowerBeepBeep = 1106 // beep-beep.caf // sq_beep-beep.caf // ConnectedToPower
        case ringerSwitchIndication = 1107 // RingerChanged.caf // RingerChanged.caf // RingerSwitchIndication
        case cameraShutter = 1108 // photoShutter.caf // photoShutter.caf // CameraShutter
        case shake = 1109 // shake.caf // shake.caf // ShakeToShuffle // Available since 3.0
        case JBLBegin = 1110 // jbl_begin.caf // jbl_begin.caf // JBL_Begin // Available since 3.0
        case JBLConfirm = 1111 // jbl_confirm.caf // jbl_confirm.caf // JBL_Confirm // Available since 3.0
        case JBLCancel = 1112 // jbl_cancel.caf // jbl_cancel.caf // JBL_Cancel // Available since 3.0
        case beginRecord = 1113 // begin_record.caf // begin_record.caf // BeginRecording // Available since 3.0
        case endRecord = 1114 // end_record.caf // end_record.caf // EndRecording // Available since 3.0
        case JBLAmbiguous = 1115 // jbl_ambiguous.caf // jbl_ambiguous.caf // JBL_Ambiguous // Available since 3.0
        case JBLNoMath = 1116 // jbl_no_match.caf // jbl_no_match.caf // JBL_NoMatch // Available since 3.0
        case beginVideoRecord = 1117 // begin_video_record.caf // begin_video_record.caf // BeginVideoRecording // Available since 3.0
        case endVideoRecord = 1118 // end_video_record.caf // end_video_record.caf // EndVideoRecording // Available since 3.0
        case VCInvitationAccepted = 1150 // vc~invitation-accepted.caf // vc~invitation-accepted.caf // VCInvitationAccepted // Available since 4.0
        case VCRinging = 1151 // vc~ringing.caf // vc~ringing.caf // VCRinging // Available since 4.0
        case VCEnded = 1152 // vc~ended.caf // vc~ended.caf // VCEnded // Available since 4.0
        case VCCallWaiting = 1153 // ct-call-waiting.caf // ct-call-waiting.caf // VCCallWaiting // Available since 4.1
        case VCCallUpgrade = 1154 // vc~ringing.caf // vc~ringing.caf // VCCallUpgrade // Available since 4.1
        case touchToneDTMF0 = 1200 // dtmf-0.caf // dtmf-0.caf // TouchTone
        case touchToneDTMF1 = 1201 // dtmf-1.caf // dtmf-1.caf // TouchTone
        case touchToneDTMF2 = 1202 // dtmf-2.caf // dtmf-2.caf // TouchTone
        case touchToneDTMF3 = 1203 // dtmf-3.caf // dtmf-3.caf // TouchTone
        case touchToneDTMF4 = 1204 // dtmf-4.caf // dtmf-4.caf // TouchTone
        case touchToneDTMF5 = 1205 // dtmf-5.caf // dtmf-5.caf // TouchTone
        case touchToneDTMF6 = 1206 // dtmf-6.caf // dtmf-6.caf // TouchTone
        case touchToneDTMF7 = 1207 // dtmf-7.caf // dtmf-7.caf // TouchTone
        case touchToneDTMF8 = 1208 // dtmf-8.caf // dtmf-8.caf // TouchTone
        case touchToneDTMF9 = 1209 // dtmf-9.caf // dtmf-9.caf // TouchTone
        case touchToneDTMFStar = 1210 // dtmf-star.caf // dtmf-star.caf // TouchTone
        case touchToneDTMFPound = 1211 // dtmf-pound.caf // dtmf-pound.caf // TouchTone
        case headsetStartCall = 1254 // long_low_short_high.caf // long_low_short_high.caf // Headset_StartCall
        case headsetRedial = 1255 // short_double_high.caf // short_double_high.caf // Headset_Redial
        case headsetAnswerCall = 1256 // short_low_high.caf // short_low_high.caf // Headset_AnswerCall
        case headsetEndCall = 1257 // short_double_low.caf // short_double_low.caf // Headset_EndCall
        case headsetCallWaitingActions = 1258 // short_double_low.caf // short_double_low.caf // Headset_CallWaitingActions
        case headsetTransitionEnd = 1259 // middle_9_short_double_low.caf // middle_9_short_double_low.caf // Headset_TransitionEnd
        case systemSoundPreviewVoicemail = 1300 // Voicemail.caf // Voicemail.caf // SystemSoundPreview
        case systemSoundPreviewReceivedMessage = 1301 // ReceivedMessage.caf // ReceivedMessage.caf // SystemSoundPreview
        case systemSoundPreviewNewMail = 1302 // new-mail.caf // new-mail.caf // SystemSoundPreview
        case systemSoundPreviewMailSent = 1303 // mail-sent.caf // mail-sent.caf // SystemSoundPreview
        case systemSoundPreviewAlarm = 1304 // alarm.caf // sq_alarm.caf // SystemSoundPreview
        case systemSoundPreviewLock = 1305 // lock.caf // sq_lock.caf // SystemSoundPreview
        case keyPressClickPreviewTock = 1306 // Tock.caf // sq_tock.caf // KeyPressClickPreview // The category was SystemSoundPreview before 3.2.
        case SMSReceivedSelectionSMSReceived1 = 1307 // SMS-received1.caf // SMS-received1.caf // SMSReceived_Selection
        case SMSReceivedSelectionSMSReceived2 = 1308 // SMS-received2.caf // SMS-received2.caf // SMSReceived_Selection
        case SMSReceivedSelectionSMSReceived3 = 1309 // SMS-received3.caf // SMS-received3.caf // SMSReceived_Selection
        case SMSReceivedSelectionSMSReceived4 = 1310 // SMS-received4.caf // SMS-received4.caf // SMSReceived_Selection
        case SMSReceivedSelectionSMSReceivedVibrate = 1311 // - // - // SMSReceived_Vibrate
        case SMSReceivedSelectionSMSReceived01 = 1312 // SMS-received1.caf // SMS-received1.caf // SMSReceived_Selection
        case SMSReceivedSelectionSMSReceived5 = 1313 // SMS-received5.caf // SMS-received5.caf // SMSReceived_Selection
        case SMSReceivedSelectionSMSReceived6 = 1314 // SMS-received6.caf // SMS-received6.caf // SMSReceived_Selection
        case systemSoundPreviewVoicemail2 = 1315 // Voicemail.caf // Voicemail.caf // SystemSoundPreview // Available since 2.1
        case SMSReceivedSelectionAnticipate = 1320 // Anticipate.caf // Anticipate.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionBloom = 1321 // Bloom.caf // Bloom.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionCalypso = 1322 // Calypso.caf // Calypso.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionChooChoo = 1323 // Choo_Choo.caf // Choo_Choo.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionDescent = 1324 // Descent.caf // Descent.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionFanfare = 1325 // Fanfare.caf // Fanfare.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionLadder = 1326 // Ladder.caf // Ladder.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionMinuet = 1327 // Minuet.caf // Minuet.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionNewsFlash = 1328 // News_Flash.caf // News_Flash.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionNoir = 1329 // Noir.caf // Noir.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionSherwood = 1330 // Sherwood_Forest.caf // Sherwood_Forest.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionSpell = 1331 // Spell.caf // Spell.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionSuspense = 1332 // Suspense.caf // Suspense.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionTelegraph = 1333 // Telegraph.caf // Telegraph.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionTiptoes = 1334 // Tiptoes.caf // Tiptoes.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionTypewriters = 1335 // Typewriters.caf // Typewriters.caf // SMSReceived_Selection // Available since 4.2
        case SMSReceivedSelectionUpdate = 1336 // Update.caf // Update.caf // SMSReceived_Selection // Available since 4.2
        case ringerVibeChanged = 1350 // - // - // RingerVibeChanged
        case silentVibeChanged = 1351 // - // - // SilentVibeChanged
        case vibrate = 4095 // - // - // Vibrate
    }
}
