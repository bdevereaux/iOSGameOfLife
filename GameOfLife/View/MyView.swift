//
//  MyView.swift
//  GameOfLife
//
//  Created by Brandon Devereaux on 4/27/18.
//  Copyright © 2018 Brandon Devereaux. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    var myArray = Array<Array<Bool>>()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    
    

}
