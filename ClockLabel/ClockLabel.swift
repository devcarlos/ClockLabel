//
//  ClockLabel.swift
//  ClockLabel
//
//  Created by Carlos Alcala on 5/26/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import Foundation


@IBDesignable public class ClockLabel: UILabel {
    
    // MARK: properties
    @IBInspectable public var glowColor: UIColor = .clearColor() {
        didSet { updateLabel() }
    }
    @IBInspectable public var glowOffset: CGSize = CGSize(width: 0, height:0) {
        didSet { updateLabel() }
    }
    @IBInspectable public var glowAmount: CGFloat = 20 {
        didSet { updateLabel() }
    }
    @IBInspectable public var glowAlpha: CGFloat = 0.7 {
        didSet { updateLabel() }
    }
    @IBInspectable public var size: CGFloat = 40 {
        willSet{
            if size > 0 {
                self.fontHandler.size = size
                self.font = UIFont.clockFont(self.fontHandler)
            }
        }
        didSet { updateLabel() }
    }
    
    
    public var fontHandler:ClockFontHandler = ClockFontHandler(name: .Digital7, size: 150) {
        didSet{
            self.font = UIFont.clockFont(self.fontHandler)
        }
    }
    
    override public var font: UIFont! {
        didSet { updateLabel() }
    }
    
    // MARK: - override UILabel properties
    override public var text: String? {
        didSet { updateLabel() }
    }
    
    override public var attributedText: NSAttributedString? {
        didSet { updateLabel() }
    }
    
    override public var textColor: UIColor! {
        didSet { updateLabel() }
    }
    
    override public var textAlignment: NSTextAlignment {
        didSet { updateLabel()}
    }
    
    // MARK: - init functions
    override public init(frame: CGRect) {
        super.init(frame: frame)
        _customizing = false
        setupLabel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _customizing = false
        setupLabel()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        updateLabel()
    }
    
    private func setupLabel() {
        //default clock font and size
        self.font = UIFont.clockFont(self.fontHandler)
    }
    
    
    public override func drawTextInRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        
        CGContextSetShadow(context, self.glowOffset, self.glowAmount)
        CGContextSetAlpha(context, self.glowAlpha)
        CGContextSetShadowWithColor(context, CGSizeZero, self.glowAmount, self.glowColor.CGColor)
        
        super.drawTextInRect(rect)
        
        CGContextRestoreGState(context);
        
    }
    
    // MARK: - customization
    public func customize(block: (label: ClockLabel) -> ()) -> ClockLabel{
        _customizing = true
        block(label: self)
        _customizing = false
        updateLabel()
        return self
    }
    
    private func updateLabel() {
        if _customizing { return }
        self.setNeedsDisplay()
    }
    
    // MARK: - private properties
    private var _customizing: Bool = true
    private var colorSpaceRef: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()!
    
}
