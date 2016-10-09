//
//  ViewController.swift
//  ThreeXorO
//
//  Created by Timothy Myers on 10/8/16.
//  Copyright © 2016 Denver Coder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        print(sender.tag)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

