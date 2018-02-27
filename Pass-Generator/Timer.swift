//
//  Timer.swift
//  Pass-Generator
//
//  Created by Ehsan on 27/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import Foundation
import GameKit

class TimerFeature {
    static var waitTime: Int = 0
    static var staticDelayTime = 5
    static var isSwipeAllowed = false
    
    static func startTimer() {
        _  = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(checkTimer), userInfo: nil, repeats: false)
    }
    
    @objc static func checkTimer() {
        if waitTime < staticDelayTime {
            print("if branch", isSwipeAllowed, waitTime)
            waitTime += 1
            isSwipeAllowed = false
        } else {
            isSwipeAllowed = true
            print("swipe is allowed again")
        }
        
    }

}


