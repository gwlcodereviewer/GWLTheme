//
//  ThemeTextView.swift
//  BizTalk
//
//  Created by Sumit Jagdev on 14/10/19.
//  Copyright © 2019 GalaxyWeblinks. All rights reserved.
//

import UIKit
extension UITextView {
    static func setTheme() {
        PrimaryTextView.appearance().textColor = AppTheme.current.primaryTextColor
        SecondaryTextView.appearance().textColor = AppTheme.current.secondaryTextColor
    }
}
@IBDesignable class ThemeTextView: UITextView {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable var borderColor: UIColor = AppTheme.current.borderColor {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable var isRounded: Bool = false {
        didSet {
            self.updateUI()
        }
    }
    func updateUI() {
        var radius = self.cornerRadius
        if isRounded {
            radius = self.frame.size.height / 2
        }
        self.layer.cornerRadius = radius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.masksToBounds = true
    }
    override var text: String? {
        didSet {
            super.text = text?.localized
        }
    }
    override var attributedText: NSAttributedString? {
        didSet{
        }
    }
    
    /*override func drawText(in rect: CGRect) {
        self.text = text?.localized
        super.drawText(in: rect)
    }*/
    override func draw(_ rect: CGRect) {
//        self.text = text?.localized
        super.draw(rect)
    }
    override func becomeFirstResponder() -> Bool {
        return false
    }
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {

        guard let pos = closestPosition(to: point) else { return false }

        guard let range = tokenizer.rangeEnclosingPosition(pos, with: .character, inDirection: .layout(.left)) else { return false }

        let startIndex = offset(from: beginningOfDocument, to: range.start)

        return attributedText!.attribute(.link, at: startIndex, effectiveRange: nil) != nil
    }


}
@IBDesignable class PrimaryTextView: ThemeTextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }
    func setTheme() {
        self.textColor = AppTheme.current.primaryTextColor
    }
}
@IBDesignable class SecondaryTextView: ThemeTextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }
    func setTheme() {
        self.textColor = AppTheme.current.secondaryTextColor
    }
}

@IBDesignable class WhiteTextTextView: ThemeTextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }
    func setTheme() {
        self.textColor = AppTheme.current.whiteTextColor
        self.backgroundColor = AppTheme.current.secondaryTextColor
    }
}

@IBDesignable class MessageTextTextView: ThemeTextView {
    var isIncoming: Bool = false {
        didSet {
            self.setTheme()
        }
    }
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }
    func setTheme() {
        self.textColor = AppTheme.current.incomingMsgTextColor
        if !isIncoming {
            self.textColor = AppTheme.current.outgoingMsgTextColor
        }
    }
}

/*@IBDesignable class MessageIconImageView: UIImageView {
    var isIncoming: Bool = false {
        didSet {
            self.setTheme()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }
    func setTheme() {
        self.tintColor = AppTheme.current.incomingMsgTextColor
        if !isIncoming {
            self.tintColor = AppTheme.current.outgoingMsgTextColor
        }
    }
}
*/
