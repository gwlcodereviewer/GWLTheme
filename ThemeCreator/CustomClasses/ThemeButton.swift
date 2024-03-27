//
//  ThemeButton.swift
//  BizTalk
//
//  Created by Sumit Jagdev on 14/10/19.
//  Copyright © 2019 GalaxyWeblinks. All rights reserved.
//

import UIKit

@IBDesignable class ThemeButton: UIButton {
    @IBInspectable var isRounded: Bool = true {
        didSet {
            self.updateUI()
        }
    }
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }

    func setTheme() {
        self.titleLabel?.textColor = AppTheme.current.primaryTextColor
        self.tintColor = AppTheme.current.primaryTextColor
    }

    func updateUI() {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.masksToBounds = true
    }

    func borderColorAnimation(fromColor: CGColor, toColor: CGColor, duration: CFTimeInterval) {
        // Create shape layer and add the path to it
        let path = UIBezierPath.init(ovalIn: CGRect(x: 5, y: 5, width: 20, height: 20))
        let layer = CAShapeLayer()
        layer.path = path.cgPath

        // Set up the appearance of the shape layer
        layer.strokeEnd = 0
        layer.lineWidth = 1
        layer.strokeColor = UIColor.black.cgColor
        layer.fillColor = UIColor.clear.cgColor

        // Create view and set its appearance
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        view.backgroundColor = .white

        // Add the shape layer to view
        view.layer.addSublayer(layer)

        // Create the animation for the shape view
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2 // seconds
        animation.autoreverses = false
        animation.repeatCount = .infinity

        // And finally add the linear animation to the shape!
        layer.add(animation, forKey: "line")

        self.addSubview(view)
    }

    func showLoader() {
//        let fromColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
//        let toColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1).cgColor
//        self.borderColorAnimation(from: fromColor, to: toColor, duration: 5)
    }

    func hideLoader() {
//        self.layer.removeAnimation(forKey: "borderColor")
    }
//    override func setTitle(_ title: String?, for state: UIControl.State) {
//        print("Set button title: ", title)
//    }
    override func draw(_ rect: CGRect) {
        if let title = self.title(for: .normal) {
            self.setTitle(title.localized, for: .normal)
        }
        if let title = self.attributedTitle(for: .normal) {
            let newTitle = NSMutableAttributedString(attributedString: title)
            let str = newTitle.string.localized
            newTitle.mutableString.setString(str)
            self.setAttributedTitle(newTitle, for: .normal)
        }
        if let title = self.title(for: .selected) {
            self.setTitle(title.localized, for: .selected)
        }
//        print("Set button title: ", self.title(for: .normal))
    }
}

@IBDesignable class PrimaryBorderedButton: ThemeButton {
    override func updateUI() {
        super.updateUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if isRounded == true {
            self.layer.cornerRadius = self.frame.size.height / 2
        } else {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    override func setTheme() {
        super.setTheme()
        self.borderColor = AppTheme.current.borderColor
        self.backgroundColor = AppTheme.current.primaryButtonBGColor
        self.setTitleColor(AppTheme.current.whiteTextColor, for: .normal)
        self.setTitleColor(AppTheme.current.whiteTextColor, for: .selected)
    }
}

@IBDesignable class SecondaryBorderedButton: ThemeButton {
    override func updateUI() {
        super.updateUI()
    }
    override func setTheme() {
        super.setTheme()

    }
}

@IBDesignable class PrimaryTextButton: ThemeButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }
    override func setTheme() {
        self.setTitleColor(AppTheme.current.primaryTextColor, for: .normal)
        self.setTitleColor(AppTheme.current.primaryTextColor, for: .selected)
        self.tintColor = AppTheme.current.primaryTextColor
    }
    override func updateUI() {
    }
}

@IBDesignable class SecondaryTextButton: ThemeButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }
    override func setTheme() {
        self.setTitleColor(AppTheme.current.secondaryTextColor, for: .normal)
        self.setTitleColor(AppTheme.current.secondaryTextColor, for: .selected)
        self.tintColor = AppTheme.current.secondaryTextColor
    }
    override func updateUI() {
    }
}

@IBDesignable class BlueTextButton: ThemeButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }
    override func setTheme() {
        self.titleLabel?.textColor = AppTheme.current.whiteTextColor
    }
    override func updateUI() {
    }
}

@IBDesignable class MessageTextButton: ThemeButton {
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
    override func setTheme() {
        var themeColor = AppTheme.current.incomingMsgTextColor
        if !isIncoming {
            themeColor = AppTheme.current.outgoingMsgTextColor
        }
        self.setTitleColor(themeColor, for: .normal)
        self.setTitleColor(themeColor, for: .selected)
        self.tintColor = themeColor
    }
    override func updateUI() {
    }

}
