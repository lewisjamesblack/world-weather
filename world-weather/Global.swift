//
//  Global.swift
//  world-weather
//
//  Created by Lewis Black on 02/04/2016.
//  Copyright © 2016 Lewis Black. All rights reserved.
//

import Foundation

class Main {
    var timeCount: Int
    
    init(time:Int){
        self.timeCount = time
    }
}

var mainInstance = Main(time: 0)
