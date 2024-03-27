//
//  AppTheme.swift
//  BizTalk
//
//  Created by Sumit Jagdev on 20/09/19.
//  Copyright © 2019 GalaxyWeblinks. All rights reserved.
//

import UIKit

enum ThemeType: String {
    case theme0 = "Theme0"
    case theme1 = "Theme1"
    func colorPath(name: String) -> String {
        return self.rawValue + "/" + name
    }
}

extension UIColor {
    convenience init?(themeColor named: String) {
        let colorName = AppTheme.type.colorPath(name: named)
        self.init(named: colorName)
    }
}

final class AppTheme: NSObject {
    static let current: AppTheme = AppTheme()
    static weak var window: UIWindow?
    var primaryButtonBGColor: UIColor = .blue
    var primaryTextColor: UIColor = .blue
    var secondaryTextColor: UIColor = .blue
    var backgroundColor: UIColor = .white
    var borderColor: UIColor = .red
    var whiteTextColor: UIColor = .black
    var incomingMsgTextColor: UIColor = .black
    var outgoingMsgTextColor: UIColor = .black
    var tabBarColor: UIColor = .white
    var tabBarItemColor: UIColor = .gray
    var tabBarItemSelectedColor: UIColor = .darkGray
    var offlineStatusColor: UIColor = .gray
    var onlineStatusColor: UIColor = .green
    var navigationBGColor: UIColor = .white
    var navigationTintColor: UIColor = .darkGray
    var navigationTitleColor: UIColor = .gray

    var incomingMsgBGColor: UIColor = .darkGray
    var outgoingMsgBGColor: UIColor = .gray

    var msgInputBGColor: UIColor = .gray
    var msgInputTextColor: UIColor = .white
    var highlightTextColor: UIColor = .black

    static var type: ThemeType = .theme1
    public override init() {
        super.init()
        AppTheme.type = .theme0
        self.loadTheme()
    }
    func loadTheme() {
        if let color = UIColor.init(themeColor: "primaryTextColor") {
            primaryTextColor = color
        }
        if let color = UIColor.init(themeColor: "secondaryTextColor") {
            secondaryTextColor = color
        }
        if let color = UIColor.init(themeColor: "backgroundColor") {
            backgroundColor = color
        }
        if let color = UIColor.init(themeColor: "borderColor") {
            borderColor = color
        }
        if let color = UIColor.init(themeColor: "primaryButtonBGColor") {
            primaryButtonBGColor = color
        }
        if let color = UIColor.init(themeColor: "primaryButtonBGColor") {
            primaryButtonBGColor = color
        }
        if let color = UIColor.init(themeColor: "whiteTextColor") {
            whiteTextColor = color
        }

        self.loadStatusColors()
        self.loadTabBarColors()
        self.loadNavigationColors()
        self.loadMessageUIColors()
    }
    func loadTabBarColors() {
        if let color = UIColor.init(themeColor: "tabBarColor") {
            tabBarColor = color
        }
        if let color = UIColor.init(themeColor: "tabBarItemColor") {
            tabBarItemColor = color
        }
        if let color = UIColor.init(themeColor: "tabBarItemSelectedColor") {
            tabBarItemSelectedColor = color
        }
    }
    func loadStatusColors() {
        if let color = UIColor.init(themeColor: "onlineStatusColor") {
            onlineStatusColor = color
        }
        if let color = UIColor.init(themeColor: "offlineStatusColor") {
            offlineStatusColor = color
        }
    }
    func loadNavigationColors() {
        if let color = UIColor.init(themeColor: "navigationBGColor") {
            navigationBGColor = color
        }
        if let color = UIColor.init(themeColor: "navigationTintColor") {
            navigationTintColor = color
        }
        if let color = UIColor.init(themeColor: "navigationTitleColor") {
            navigationTitleColor = color
        }
    }
    func loadMessageUIColors() {
        if let color = UIColor.init(themeColor: "incomingMsgBGColor") {
            incomingMsgBGColor = color
        }
        if let color = UIColor.init(themeColor: "outgoingMsgBGColor") {
            outgoingMsgBGColor = color
        }

        if let color = UIColor.init(themeColor: "incomingMsgTextColor") {
            incomingMsgTextColor = color
        }
        if let color = UIColor.init(themeColor: "outgoingMsgTextColor") {
            outgoingMsgTextColor = color
        }

        if let color = UIColor.init(themeColor: "msgInputBGColor") {
            msgInputBGColor = color
        }
        if let color = UIColor.init(themeColor: "msgInputTextColor") {
            msgInputTextColor = color
        }
        if let color = UIColor.init(themeColor: "highlightTextColor") {
            highlightTextColor = color
        }
    }
    func reloadViews() {
//        self.loadTheme()
//
//        let windows = UIApplication.shared.windows as [UIWindow]
//        for window in windows {
//            window.subviews.forEach {
//                $0.removeFromSuperview()
//                window.addSubview($0)
//            }
//        }
        self.loadTheme()
        
//        let windows = UIApplication.shared.windows
//        for window in windows {
//            for view in window.subviews {
//                view.removeFromSuperview()
//                window.addSubview(view)
//            }
//        }
        
        UIApplication.shared.windows.forEach {
            $0.subviews.forEach {
                $0.removeFromSuperview()
                UIApplication.shared.windows.first!.addSubview($0)
            }
        }

        
    }
    func changesApply(for application: UIApplication) {
        self.loadTheme()
        application.windows.reload()
    }
   
    func setColors(themeType: ThemeType) {
        AppTheme.type = themeType
        print(themeType)
        self.loadTheme()
        if let window = AppTheme.window {
            window.subviews.forEach({ (view: UIView) in
                view.removeFromSuperview()
                window.addSubview(view)
            })
        }
    }
}
public extension UIWindow {
    
    /// Unload all views and add back.
    /// Useful for applying `UIAppearance` changes to existing views.
    func reload() {
        subviews.forEach { view in
            view.removeFromSuperview()
            addSubview(view)
        }
    }
}

public extension Array where Element == UIWindow {
    
    /// Unload all views for each `UIWindow` and add back.
    /// Useful for applying `UIAppearance` changes to existing views.
    func reload() {
        forEach { $0.reload() }
    }
}
