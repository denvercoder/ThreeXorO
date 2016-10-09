//
//  ViewController.swift
//  ThreeXorO
//
//  Created by Timothy Myers on 10/8/16.
//  Copyright © 2016 Denver Coder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelWhoFirst: UILabel!
    
    @IBAction func whoGoesThere(_ sender: AnyObject) {
        let firstMove = Int(arc4random_uniform(2))
        
        if (firstMove == 0){
            labelWhoFirst.text = "X goes first"
        }else {
            labelWhoFirst.text = "O goes first"
        }
    }
    
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

