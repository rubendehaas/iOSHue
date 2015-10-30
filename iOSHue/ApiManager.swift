//
//  ApiManager.swift
//  iOSHue
//
//  Created by Ruben de Haas on 29/10/15.
//  Copyright © 2015 Ruben de Haas. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class ApiManager {
    
    
    let baseUrl = "http://192.168.1.179/api/626b39467d5a4f110a85bc2f0843b7/lights/"
    
    static let sharedInstance = ApiManager()
    
    func putLightState(light: LightModel){
        
        let key = String(light.key)
        
        let state = [
            "on": light.stateOn,
            "bri": light.stateBrightness,
            "sat": light.stateSaturation,
            "hue": light.stateHue
        ]
        
        Alamofire.request(.PUT, baseUrl+key+"/state", parameters: state as? [String : AnyObject], encoding: .JSON)
    }
}