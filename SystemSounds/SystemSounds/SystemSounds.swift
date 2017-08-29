//
//  SystemSounds.swift
//  SystemSounds
//
//  Created by Meniny on 21/04/2015.
//  Copyright (c) 2015 Meniny. All rights reserved.
//

import Foundation
import AudioToolbox
#if os(iOS)
    import UIKit
#endif

@objc open class SystemSounds: NSObject {
    
    public static var UserDefaultsKey: String = "kSystemSoundsUserDefaultsKey"
    public static let mainBundle = Bundle.main
    
    public typealias CompletionClosure = (() -> Void)
    
    open var bundle: Bundle //Bundle(for: self.classForCoder())
    
    fileprivate(set) open var isOn: Bool = true
    
    /* Those parameters are set to private for XCTest access */
    internal var sounds = [String: Data]()
    internal var completionClosures: [Data: SystemSounds.CompletionClosure] = [:]
    
    // MARK: - Init
    
    open static let shared: SystemSounds = SystemSounds()
    
    override init() {
        self.bundle = Bundle.main
        super.init()
        self.addObserver()
    }
    
    init(bundle: Bundle = Bundle.main) {
        self.bundle = bundle
        super.init()
        self.addObserver()
    }
    
    private func addObserver() {
        #if os(iOS)
            let sel = #selector(SystemSounds.didReceiveMemoryWarningNotification(_:))
            NotificationCenter.default.addObserver(
                self,
                selector: sel,
                name: .UIApplicationDidReceiveMemoryWarning,
                object: nil
            )
        #endif
    }
    
    deinit {
        #if os(iOS)
            NotificationCenter.default.removeObserver(self)
        #endif
        self.unloadSoundIDs()
    }
    
    // MARK: - Public API
    
    @objc open func toggleSoundPlayer(on: Bool) {
        self.isOn = on;
        UserDefaults.standard.set(on, forKey: SystemSounds.UserDefaultsKey)
        UserDefaults.standard.synchronize()
        
        if !on { self.stopAll() }
    }
    
    #if os(iOS)
    @objc open func vibrate() {
        if self.isOn { AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate)) }
    }
    
    @objc open class func vibrate() {
        SystemSounds.shared.vibrate()
    }
    #endif
    
    @objc open func stopAll() { self.unloadSoundIDs() }
    
    @objc open func stop(sound filename: String) {
        if let soundID = self.soundID(forFilename: filename) {
            let data = self.data(withSoundID: soundID)
            self.unload(soundID: filename)
            self.sounds.removeValue(forKey: filename)
            self.completionClosures.removeValue(forKey: data)
        }
    }
    
    @objc open func preload(sound filename: String, withExtension ext: String) {
        if let _ = self.sounds[filename] { return }
        self.addSoundID(forAudioFile: filename, withExtension: ext)
    }
    
    // MARK: - Playing sounds
    
    @objc open class func play(sound filename: String,
                   withExtension ext: String? = nil,
                   bundle: Bundle = Bundle.main,
                   isAlert: Bool = false,
                   completion: SystemSounds.CompletionClosure? = nil) {
        SystemSounds.shared.play(sound: filename, withExtension: ext, bundle: bundle, isAlert: isAlert, completion: completion)
    }
    
    @objc open func play(sound filename: String,
                        withExtension ext: String? = nil,
                        bundle: Bundle = Bundle.main,
                        isAlert: Bool = false,
                        completion: SystemSounds.CompletionClosure? = nil
        ) {
        
        if !self.isOn { return }
        
        if self.sounds[filename] == nil {
            self.addSoundID(forAudioFile: filename, withExtension: ext)
        }
        
        if let soundID: SystemSoundID = self.soundID(forFilename: filename) {
            self.play(soundID: soundID, isAlert: isAlert, completion: completion)
        }
    }
  
    open class func play(sound: SystemSounds.IDs, isAlert: Bool = false, completion: SystemSounds.CompletionClosure? = nil) {
        SystemSounds.shared.play(soundID: sound.rawValue, isAlert: isAlert, completion: completion)
    }
  
    @objc open class func play(soundID: SystemSoundID, isAlert: Bool = false, completion: SystemSounds.CompletionClosure? = nil) {
        SystemSounds.shared.play(soundID: soundID, isAlert: isAlert, completion: completion)
    }
    
    @objc open func play(soundID: SystemSoundID, isAlert: Bool = false, completion: SystemSounds.CompletionClosure? = nil) {
        if let completion = completion {
            let error: OSStatus = AudioServicesAddSystemSoundCompletion(soundID, nil, nil, { (soundID, userData) -> Void in
                if let block = SystemSounds.shared.completionClosure(forSoundID: soundID) {
                    block()
                    SystemSounds.shared.removeCompletionClosure(forSoundID: soundID)
                }
            }, nil)
            
            if error != kAudioServicesNoError {
                self.logError(error, withMessage: "Warning! Completion block could not be added to SystemSoundID.")
            } else {
                self.addCompletionClosure(completion, toSoundID: soundID)
            }
        }
        
        if isAlert { AudioServicesPlayAlertSound(soundID) } else { AudioServicesPlaySystemSound(soundID) }
    }
    
    fileprivate func readSoundPlayerOnFromUserDefaults() -> Bool {
        if let settings = UserDefaults.standard.object(forKey: SystemSounds.UserDefaultsKey) as? NSNumber {
            return settings.boolValue
        }
        
        self.toggleSoundPlayer(on: true)
        return true
    }
    
    // MARK: - Sound data
    
    func data(withSoundID: SystemSoundID) -> Data {
        var soundID = withSoundID
        return Data(bytes: &soundID, count: MemoryLayout<SystemSoundID>.size)
    }
    
    func soundID(forData data: Data) -> SystemSoundID? {
        var soundID: SystemSoundID = 0
        (data as NSData).getBytes(&soundID, length: MemoryLayout<SystemSoundID>.size)
        return soundID
    }
    
    // MARK: - Sound files
    
    func soundID(forFilename filename: String) -> SystemSoundID? {
        if let data = self.sounds[filename] {
            return self.soundID(forData: data)
        }
        return nil
    }
    
    func addSoundID(forAudioFile filename: String, withExtension ext: String? = nil) {
        if let soundID = self.createSoundID(fromFile: filename, withExtension: ext) {
            let data = self.data(withSoundID: soundID)
            self.sounds.updateValue(data, forKey: filename)
        }
    }
    
    // MARK: - Sound completion blocks
    
    private func completionClosure(forSoundID soundID: SystemSoundID) -> SystemSounds.CompletionClosure? {
        let data = self.data(withSoundID: soundID)
        return self.completionClosures[data]
    }
    
    private func addCompletionClosure(_ completion: @escaping SystemSounds.CompletionClosure, toSoundID soundID: SystemSoundID) {
        let data = self.data(withSoundID: soundID)
        self.completionClosures.updateValue(completion, forKey: data)
    }
    
    private func removeCompletionClosure(forSoundID soundID: SystemSoundID) {
        let key = self.data(withSoundID: soundID)
        self.completionClosures.removeValue(forKey: key)
        AudioServicesRemoveSystemSoundCompletion(soundID)
    }
    
    // MARK: - Managing sound
    
    private func createSoundID(fromFile filename: String, withExtension ext: String? = nil) -> SystemSoundID? {
        if let fileURL = self.bundle.url(forResource: filename, withExtension: ext) {
            if FileManager.default.fileExists(atPath: fileURL.path) {
                var soundID: SystemSoundID = 0
                let error: OSStatus = AudioServicesCreateSystemSoundID(fileURL as CFURL, &soundID)
                if error != kAudioServicesNoError {
                    self.logError(error, withMessage: "Warning! SystemSoundID could not be created.")
                    return nil;
                }
                
                return soundID
            }
            
            print("[\(self)] Error: audio file not found at URL: \(fileURL)")
            return nil
        }
        
        print("[\(self)] Error: audio file not found: \(filename)")
        return nil
    }
    
    private func unloadSoundIDs() {
        for filename in self.sounds.keys {
            self.unload(soundID: filename)
        }
        
        self.sounds.removeAll()
        self.completionClosures.removeAll()
    }
    
    private func unload(soundID filename: String) {
        if let soundID = self.soundID(forFilename: filename) {
            AudioServicesRemoveSystemSoundCompletion(soundID)
            let error: OSStatus = AudioServicesDisposeSystemSoundID(soundID)
            if error != kAudioServicesNoError {
                self.logError(error, withMessage: "Warning! SystemSoundID could not be disposed.")
            }
        }
    }
    
    private func logError(_ error: OSStatus, withMessage message: String) {
        #if DEBUG
            let errorMessage: String
            switch error {
            case kAudioServicesUnsupportedPropertyError:
                errorMessage = "The property is not supported."
            case kAudioServicesBadPropertySizeError:
                errorMessage = "The size of the property data was not correct."
            case kAudioServicesBadSpecifierSizeError:
                errorMessage = "The size of the specifier data was not correct."
            case kAudioServicesSystemSoundUnspecifiedError:
                errorMessage = "An unspecified error has occurred."
            case kAudioServicesSystemSoundClientTimedOutError:
                errorMessage = "System sound client message timed out."
            default:
                errorMessage = "Unkown error"
            }
            
            print("[\(self)] \(message) Error: (code \(error)) \(errorMessage)")
        #endif
    }
    
    // MARK: - Notifications
    
    @objc internal func didReceiveMemoryWarningNotification(_ notification: Notification) {
        self.unloadSoundIDs()
    }
}
