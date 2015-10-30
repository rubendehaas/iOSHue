//
//  TableViewController.swift
//  iOSHue
//
//  Created by Ruben de Haas on 29/10/15.
//  Copyright © 2015 Ruben de Haas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    
    var lights = [LightModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(.GET, "http://192.168.1.179/api/626b39467d5a4f110a85bc2f0843b7/lights/")
            .responseJSON { response in
                
                if let response = response.result.value {
                    
                    let json = JSON(response)
                    
                    
                    for (key,subJson):(String, JSON) in json {
                        
                        let bla = LightModel(key: Int(key)!, name: subJson["name"].stringValue, stateOn: subJson["state"]["on"].boolValue, stateBrightness: subJson["state"]["bri"].intValue, stateSaturation: subJson["state"]["sat"].intValue, stateHue: subJson["state"]["hue"].intValue)
                        self.lights.append(bla)
                    }
                    dispatch_async(dispatch_get_main_queue()) { () -> Void in
                        self.tableView.reloadData()
                    }
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lights.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("lightCell", forIndexPath: indexPath) as! CustomLightCell

        // Configure the cell...
        let row = indexPath.row
        cell.lightName.text = lights[row].name        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "lightDetailSegue"{
            if let destination = segue.destinationViewController as? LightViewController{
                if let indexPath = self.tableView.indexPathForSelectedRow{
                    let light = lights[indexPath.row]
                    
                    destination.light = light
                }
            }
        }
    }
    

}
