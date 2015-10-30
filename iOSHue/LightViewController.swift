//
//  LightViewController.swift
//  iOSHue
//
//  Created by Ruben de Haas on 29/10/15.
//  Copyright © 2015 Ruben de Haas. All rights reserved.
//

import UIKit

class LightViewController: UIViewController {
    
    @IBOutlet weak var lighStateOn: UISwitch!
    @IBOutlet weak var lightStateBrightness: UISlider!
    @IBOutlet weak var lightStateSaturation: UISlider!
    @IBOutlet weak var lightStateHue: UISlider!
    
    var light: LightModel!
    let apiManagerInstance = ApiManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lighStateOn.setOn(light.stateOn, animated: true)
        lightStateBrightness.setValue(Float(light.stateBrightness), animated: true)
        
        if(light.stateSaturation != 0 && light.stateHue != 0){
            
            lightStateSaturation.hidden = false
            lightStateHue.hidden = false
            lightStateSaturation.setValue(Float(light.stateSaturation), animated: true)
            lightStateHue.setValue(Float(light.stateHue), animated: true)
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lightStateOnAction(sender: AnyObject) {
        light.stateOn = lighStateOn.on
        apiManagerInstance.putLightState(light)
    }

    @IBAction func lightStateBrightnessAction(sender: AnyObject) {
        light.stateBrightness = Int(lightStateBrightness.value)
        apiManagerInstance.putLightState(light)
    }
    @IBAction func lightStateSaturationAction(sender: AnyObject) {
        light.stateSaturation = Int(lightStateSaturation.value)
        apiManagerInstance.putLightState(light)
    }
    @IBAction func lightStateHueAction(sender: AnyObject) {
        light.stateHue = Int(lightStateHue.value)
        apiManagerInstance.putLightState(light)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
