# ClockLabel ![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/ClockLabel/badge.png) [![Platform](https://img.shields.io/cocoapods/p/ClockLabel.svg)](http://cocoadocs.org/docsets/ClockLabel/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/devcarlos/ClockLabel.svg)](https://travis-ci.org/devcarlos/ClockLabel) [![license MIT](https://img.shields.io/cocoapods/l/ClockLabel.svg)](http://opensource.org/licenses/MIT)

Custom Clock Fonts based Label with Glow Effect

## Features

* Swift 2+
* Support Fonts [Digital-7](http://www.1001fonts.com/digital-7-font.html), [Digital Dismay](http://www.1001fonts.com/digital-dismay-font.html), [Advanced Pixel LCD-7](http://www.1001fonts.com/advanced-pixel-lcd-7-font.html)
* Replacement for `UILabel` to use in Clock Apps
* Easy installation and customization

## Usage

```swift
import ClockLabel

let clock1 = ClockLabel()
let clock2 = ClockLabel()
let clock3 = ClockLabel()

self.clock1.customize { label in
    label.backgroundColor = UIColor.blackColor()
    label.textAlignment = NSTextAlignment.Center
    label.textColor = UIColor(red: 0.2, green: 0.7, blue: 1.0, alpha: 1.0)
    label.fontHandler = ClockFontHandler(name: .Digital7, size: 150)
    label.glowColor = label.textColor
    label.glowOffset = CGSize(width: 2.0, height: 2.0)
    label.glowAmount = 15.0
    label.text = "8:00"
}

self.clock2.customize { label in
    label.backgroundColor = UIColor.blackColor()
    label.textAlignment = NSTextAlignment.Center
    label.textColor = UIColor.yellowColor()
    label.fontHandler = ClockFontHandler(name: .DigitalDismay, size: 150)
    label.glowColor = label.textColor
    label.glowOffset = CGSize(width: 3.0, height: 0.0)
    label.glowAmount = 20.0
    label.text = "9:00"
}

self.clock3.customize { label in
    label.backgroundColor = UIColor.blackColor()
    label.textAlignment = NSTextAlignment.Center
    label.textColor = UIColor.greenColor()
    label.fontHandler = ClockFontHandler(name: .AdvancedPixelLCD7, size: 50)
    label.glowColor = label.textColor
    label.glowOffset = CGSize(width: 2.0, height: 2.0)
    label.glowAmount = 20.0
    label.text = "10:00"
}

self.clock1.frame = CGRect(x: 50, y: 40, width: view.frame.width - 100, height: 200)
self.view.addSubview(clock1)

self.clock2.frame = CGRect(x: 50, y: 260, width: view.frame.width - 100, height: 200)
self.view.addSubview(clock2)

self.clock3.frame = CGRect(x: 50, y: 480, width: view.frame.width - 100, height: 200)
self.view.addSubview(clock3)

```

## Install (iOS 8+)

### Carthage

Add the following to your `Cartfile` and follow [these instructions](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application)

```
github "devcarlos/ClockLabel"
```

### CocoaPods

To integrate ClockLabel into your project add the following to your `Podfile`:

```ruby
platform :ios, '8.0'
use_frameworks!

pod 'ClockLabel'
```

## License

`ClockLabel` is available under the MIT license. See the LICENSE file for more info.
