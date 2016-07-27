//
//  POScoreView.swift
//  POScoreView
//
//  Created by admin on 16/7/27.
//  Copyright © 2016年 kimbin. All rights reserved.
//

import UIKit

class POScoreView: UIView,StarScoreStyle {
    var starImage: UIImage? = UIImage(named: "comment_star_empty")
    var starImageHighlight:UIImage? = UIImage(named: "comment_star_full")
    var starNum: Int = 6
    var currentIndex: Int = 2
    var kStartSpace: Float =  10
    var kStartWidth: Float = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch:UITouch = touches.first {
            let location =  touch.locationInView(self)
            self.touchStart(Float(location.x))
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch:UITouch = touches.first {
            let location =  touch.locationInView(self)
            if location.x <= 0{
                self.touchMove(Float(0))
            }else {
                self.touchMove(Float(location.x))
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.touchEnd()
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        drawWithOption()
    }
    
    func updateStarScore(currentScore:Int){
        if currentScore > self.starNum {
            self.currentIndex = self.starNum
        }else if currentScore < 0 {
            self.currentIndex = 0
        }else {
            self.currentIndex = currentScore
        }
        drawWithOption()
    }

}
