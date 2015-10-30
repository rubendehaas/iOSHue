//
//  LightModel.swift
//  iOSHue
//
//  Created by Ruben de Haas on 29/10/15.
//  Copyright © 2015 Ruben de Haas. All rights reserved.
//

import Foundation

class LightModel{
    var key: Int
    var name: String
    var stateOn: Bool
    var stateBrightness: Int
    var stateSaturation: Int
    var stateHue: Int
    
    init(key: Int, name: String, stateOn: Bool, stateBrightness: Int, stateSaturation: Int, stateHue: Int) {
        self.key = key
        self.name = name
        self.stateOn = stateOn
        self.stateBrightness = stateBrightness
        self.stateSaturation = stateBrightness
        self.stateHue = stateHue
        
    }
    

}