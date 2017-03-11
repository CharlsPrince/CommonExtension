//
//  ViewController.swift
//  CommonExtension_Swift
//
//  Created by charls on 16/9/7.
//  Copyright © 2016年 Charls. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let frame = CGRectMake(10, 200, UIScreen.mainScreen().bounds.width - 20, 50)
        let label = UILabel(frame: frame)
        label.textColor = UIColor.grayColor()
        label.textAlignment = .Center
        label.text = "我是swift版 常用延展"
        self.view.addSubview(label)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

