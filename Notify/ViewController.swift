//
//  ViewController.swift
//  Notify
//
//  Created by Higher Visibility on 02/01/2018.
//  Copyright © 2018 Higher Visibility. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func notificationtriger(_ sender: UIButton) {
        
      let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.trigerNotification()
    }
    
}

