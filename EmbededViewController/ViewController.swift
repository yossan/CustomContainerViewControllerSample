//
//  ViewController.swift
//  EmbededViewController
//
//  Created by yoshi-kou on 2017/03/05.
//  Copyright © 2017 ysn551. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func onSwitchingBt(_ sender: Any) {
        switch self.title {
        case .some("A"):
            AppDelegate.shared.changeB()
        case .some("B"):
            AppDelegate.shared.changeA()
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("\(#function)")
    }
    override func viewWillAppear(_ animated: Bool) {
        NSLog("\(self.title!) \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NSLog("\(self.title!) \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NSLog("\(self.title!) \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NSLog("\(self.title!) \(#function)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

