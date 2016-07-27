//
//  ProtocolExtensions.swift
//  POScoreView
//
//  Created by admin on 16/7/27.
//  Copyright © 2016年 kimbin. All rights reserved.
//

import UIKit

//Mark: comment UIKit
extension  UIView {
    
    var x :CGFloat{
        
        set{
            var rect = self.frame as CGRect
            rect.origin.x = newValue
            self.frame = rect
            
        }
        get{
            
            return self.frame.origin.y
            
        }
    }
    var y :CGFloat {
        
        set{
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
        get{
            
            return self.frame.origin.y
            
        }
    }
    
    var width:CGFloat {
        set{
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
            
        }
        get{
            
            return self.frame.size.width
        }
    }
    
    var height:CGFloat {
        
        set{
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
        get{
            
            return self.frame.size.height
        }
    }
    
    var centerX:CGFloat {
        
        set{
            var center = self.center
            center.x = newValue
            self.center = center
        }
        
        get{
            
            return self.center.x
            
        }
    }
    var centerY:CGFloat {
        set{
            
            var center = self.center
            center.y = newValue
            self.center = center
        }
        get{
            
            return self.center.y
            
        }
    }
}



//MARK: StarScoreStyle
protocol StarScoreStyle:class {
    var starImage:UIImage? {get  set}
    var starImageHighlight:UIImage? {get set}
    var starNum:Int {get set}
    var currentIndex:Int {get set}
    var kStartSpace:Float {get set}
    var kStartWidth:Float {get set}
    
}

extension StarScoreStyle where Self:UIView
{
    
    func initStarImages(backgroundImageName normalName:String ,highlight highlightName:String){
        starImage = UIImage(named: normalName)
        starImageHighlight = UIImage(named: highlightName)
    }
    
    func touchStart(x:Float){
        if(self.currentIndex == 1) {
            self.currentIndex = Int(roundf( x / kStartWidth));
        } else {
            self.currentIndex = Int(ceilf( x / kStartWidth));
        }
    }
    
    func touchMove(x:Float){
        if(self.currentIndex == 1) {
            self.currentIndex = Int(roundf( x / kStartWidth));
        } else {
            self.currentIndex = Int(ceilf( x / kStartWidth));
        }
        self.setNeedsDisplay()
    }
    
    func touchEnd() {
        if (self.currentIndex > self.starNum) {
            self.currentIndex = self.starNum;
        }
        self.currentIndex = self.currentIndex > self.starNum ? self.starNum : self.currentIndex;
        self.setNeedsDisplay()
    }
    
    func drawWithOption(){
        
        for index in 0..<self.starNum {
            let rect = CGRect(x: CGFloat((kStartSpace + kStartWidth)) * CGFloat(index), y: (self.height - CGFloat(kStartWidth))/2, width: CGFloat(kStartWidth), height: CGFloat(kStartWidth))
            self.starImage?.drawInRect(rect)
        }
        
        for index in 0..<self.currentIndex {
            let rect = CGRect(x: CGFloat((kStartSpace + kStartWidth)) * CGFloat(index), y: (self.height - CGFloat(kStartWidth))/2, width: CGFloat(kStartWidth), height: CGFloat(kStartWidth))
            self.starImageHighlight?.drawInRect(rect)
        }
    }
}
