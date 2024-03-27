//
//  ThemeLabel.swift
//  BizTalk
//
//  Created by Sumit Jagdev on 14/10/19.
//  Copyright © 2019 GalaxyWeblinks. All rights reserved.
//

import UIKit

extension UILabel {
    static func setTheme() {
        PrimaryLabel.appearance().textColor = AppTheme.current.primaryTextColor
        SecondaryLabel.appearance().textColor = AppTheme.current.secondaryTextColor
    }
}
@IBDesignable class ThemeLabel: UILabel {
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable public var borderColor: UIColor = AppTheme.current.borderColor {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable public var isRounded: Bool = false {
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
    override func drawText(in rect: CGRect) {
        self.text = text?.localized
        super.drawText(in: rect)
    }
}

@IBDesignable class PrimaryLabel: ThemeLabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
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

@IBDesignable class SecondaryLabel: ThemeLabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
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

@IBDesignable class WhiteTextLabel: ThemeLabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }
    func setTheme() {
        self.textColor = AppTheme.current.whiteTextColor
        self.backgroundColor = AppTheme.current.outgoingMsgBGColor
    }
}

@IBDesignable class MessageTextLabel: ThemeTextView {
    var isIncoming: Bool = false {
        didSet {
            self.setTheme()
        }
    }
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.setTheme()
    }
   /* override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTheme()
    }*/
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }
    func setTheme() {
        self.textColor = AppTheme.current.incomingMsgTextColor
        if !isIncoming {
            self.textColor = AppTheme.current.outgoingMsgTextColor
        }
        self.isScrollEnabled  = false
        self.isEditable = false
        self.isSelectable = true
        self.dataDetectorTypes = .link
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    func setup() {
        textContainerInset = UIEdgeInsets.zero
        textContainer.lineFragmentPadding = 0
    }
    func highlightingText(searchString:String){
        guard let targetString = self.attributedText, targetString.string.localizedCaseInsensitiveContains(searchString) else {
            return
        }
        
        if let highlightedText = self.generateAttributedString(with: searchString, targetString: targetString) {
            self.attributedText = highlightedText
        }
    }
   func generateAttributedString(with searchTerm: String, targetString: NSAttributedString) -> NSAttributedString? {

       let attributedString = NSMutableAttributedString(attributedString: targetString)
       do {

           let regex = try NSRegularExpression(pattern:  NSRegularExpression.escapedPattern(for: searchTerm).trimmingCharacters(in: .whitespacesAndNewlines).folding(options: .regularExpression, locale: .current), options: .caseInsensitive)
        let range = NSRange(location: 0, length: targetString.string.utf16.count)
        attributedString.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.clear, range: range)
        

        for match in regex.matches(in: targetString.string.folding(options: .regularExpression, locale: .current), options: .withTransparentBounds, range: range) {
            attributedString.addAttribute(NSAttributedString.Key.backgroundColor, value: AppTheme.current.highlightTextColor, range: match.range)
           }
           return attributedString
       } catch {
           NSLog("Error creating regular expresion: \(error)")
           return nil
       }
   }


}

@IBDesignable class MessageIconImageView: UIImageView {
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
