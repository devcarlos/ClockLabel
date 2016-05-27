//
//  FontUtils.swift
//  ClockLabel
//
//  Created by Carlos Alcala on 5/26/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import Foundation

public enum ClockFontName:String {
    case AdvancedPixelLCD7 = "Advanced Pixel LCD-7"
    case Digital7 = "Digital-7"
    case DigitalDismay = "Digital Dismay"
}

enum ClockFontFilename:String {
    case AdvancedPixelLCD7 = "advanced_pixel_lcd-7.ttf"
    case Digital7 = "digital-7_italic.ttf"
    case DigitalDismay = "digitaldismay.otf"
}

public struct ClockFontHandler {
    public init(name: ClockFontName, size: CGFloat){
        self.name = name
        self.size = size
    }
    public var name:ClockFontName = .Digital7
    public var size:CGFloat = 150
    public var filename:String {
        get{
            switch name {
            case .AdvancedPixelLCD7: return ClockFontFilename.AdvancedPixelLCD7.rawValue
            case .Digital7: return ClockFontFilename.Digital7.rawValue
            case .DigitalDismay: return ClockFontFilename.DigitalDismay.rawValue
            }
        }
    }
}

let kClockBundle:String = "ClockBundle"

extension UIFont {
    
    @nonobjc static var loadAllFontsDO: dispatch_once_t = 0
    
    class func clockFont(clockFont: ClockFontHandler) -> UIFont {
        loadAllFonts()
        if let retval = UIFont(name: clockFont.name.rawValue, size: clockFont.size) {
            return retval;
        } else {
            return UIFont.systemFontOfSize(clockFont.size)
        }
    }
    
    class func loadAllFonts() {
        dispatch_once(&loadAllFontsDO) { () -> Void in
            //load clock font from bundle
            registerFontWithFilenameString(ClockFontFilename.AdvancedPixelLCD7.rawValue, bundleIdentifierString: kClockBundle)
            registerFontWithFilenameString(ClockFontFilename.Digital7.rawValue, bundleIdentifierString: kClockBundle)
            registerFontWithFilenameString(ClockFontFilename.DigitalDismay.rawValue, bundleIdentifierString: kClockBundle)
            
        }
    }
    
    static func registerFontWithFilenameString(filenameString: String, bundleIdentifierString: String){
        
        let frameworkBundle = NSBundle(forClass: ClockLabel.self)
        let resourceBundleURL = frameworkBundle.URLForResource(bundleIdentifierString, withExtension: "bundle")
        if let bundle = NSBundle(URL: resourceBundleURL!) {
            if let path = bundle.pathForResource(filenameString, ofType: nil) {
                
                let fontData = NSData(contentsOfFile: path)
                let dataProvider = CGDataProviderCreateWithCFData(fontData)
                let fontRef = CGFontCreateWithDataProvider(dataProvider)
                var errorRef: Unmanaged<CFError>? = nil
                
                if (CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) == false) {
                    NSLog("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
                }
            } else {
                NSLog("FilePath Not Found.")
            }
        } else {
            NSLog("Failed to register font - bundle identifier invalid.")
        }
    }
}
