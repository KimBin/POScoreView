//
//  ViewController.swift
//  POScoreView
//
//  Created by admin on 16/7/27.
//  Copyright © 2016年 kimbin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var starScoreView:POScoreView!  //打分的view
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        starScoreView = POScoreView(frame: CGRect(x: 0, y: 100, width: 300, height: 60))
        starScoreView.centerX = self.view.centerX
        self.view.addSubview(starScoreView)
        
        self.view.backgroundColor = UIColor.grayColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

