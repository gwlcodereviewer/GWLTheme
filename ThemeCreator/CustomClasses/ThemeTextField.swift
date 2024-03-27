//
//  ThemeTextField.swift
//  BizTalk
//
//  Created by Sumit Jagdev on 14/10/19.
//  Copyright © 2019 GalaxyWeblinks. All rights reserved.
//

import UIKit

@IBDesignable class ThemeTextField: UITextField {
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable var leftImage: UIImage? {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable var rightImage: UIImage? {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable var leftInset: CGFloat = 0.0 {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable var rightInset: CGFloat = 0.0 {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable var enableLine: Bool = true {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable var leftViewPadding: CGFloat = 0.0 {
        didSet {
            self.updateUI()
        }
    }
    @IBInspectable var rightViewPadding: CGFloat = 0.0 {
        didSet {
            self.updateUI()
        }
    }
    private var oldLeftView: UIView?
    var insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.updateUI()
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.updateUI()
        self.setTheme()
    }

    func setTheme() {
        self.textColor = AppTheme.current.primaryTextColor
        //self.borderColor = AppTheme.current.primaryTextColor
        
    }
    func updateUI() {
        
        self.borderStyle = .none
        insets.left = self.leftInset
        insets.right = self.rightInset

        if let img = self.leftImage {
            self.leftViewMode = .always
            let rect = self.leftView?.frame ??  CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height)
            let imgView = UIImageView(frame: rect)
            imgView.image = img
            imgView.contentMode = .scaleAspectFit
            imgView.tintColor = self.textColor
            self.leftView = imgView
        } else {
            self.leftViewMode = .never
        }
        if let img = self.rightImage {
            self.rightViewMode = .always
            let rect = self.rightView?.frame ?? CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height)
            let imgView = UIImageView(frame: rect)
            imgView.image = img
            imgView.contentMode = .scaleAspectFit
            imgView.tintColor = self.textColor
            self.rightView = imgView
        } else {
            self.rightViewMode = .never
        }
    }
    private func setInsets(forBounds bounds: CGRect) -> CGRect {

        var totalInsets = insets //property in you subClass

        if let leftView = leftView { totalInsets.left += leftView.frame.size.width + totalInsets.left }
        if let rightView = rightView { totalInsets.right += rightView.bounds.size.width }

        return bounds.inset(by: totalInsets)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return setInsets(forBounds: rect)
    }
    override func drawPlaceholder(in rect: CGRect) {
        self.placeholder = self.placeholder?.localized
        super.drawPlaceholder(in: rect)
    }
}

@IBDesignable class PrimaryTextField: ThemeTextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }

    override func setTheme() {
        self.borderColor = AppTheme.current.primaryTextColor
        self.textColor = AppTheme.current.primaryTextColor
    }
}
@IBDesignable class SecondaryTextField: ThemeTextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTheme()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTheme()
    }

    override func setTheme() {
        self.borderColor = AppTheme.current.secondaryTextColor
        self.textColor = AppTheme.current.secondaryTextColor
    }
}
