# SystemSounds

An iOS System Sounds Player Framework.

## Requirements

* iOS 8.0+
* macOS 10.9+
* Xcode 8 with Swift 3

## Installnation

#### CocoaPods

```ruby
pod 'SystemSounds'
```
## Usage

```swift
import SystemSounds

let id = SystemSounds.IDs.SMSReceivedSelectionSMSReceived1
SystemSounds.play(soundID: id.rawValue)
```
