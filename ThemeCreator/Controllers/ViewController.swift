//
//  ViewController.swift
//  ThemeCreator
//
//  Created by gwl on 24/04/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("Shaken!")
    }

    @IBAction func segmentAction(_ sender: Any) {
        if self.segment.selectedSegmentIndex == 0 {
            AppTheme.type = .theme0
        } else {
            AppTheme.type = .theme1
        }
        AppTheme.current.reloadViews()
       // AppTheme.init()
        //AppTheme.current.changesApply(for: UIApplication.shared)
    }
    
}

