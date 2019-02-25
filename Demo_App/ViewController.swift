//
//  ViewController.swift
//  Demo App
//
//  Created by Theodore Roddy on 11/14/18.
//  Copyright © 2018 Ted Roddy. All rights reserved.
//

import UIKit
import OptimizelySDKiOS

class ViewController: UIViewController {
let appDel = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var myLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var myButtonOutlet: UIButton?
    @IBAction func myButtonAction(_ sender: Any) {
        if let experiment_status = self.appDel.optimizelyClient?.activate(self.appDel.experiment_key, userId: self.appDel.userId,attributes:appDel.new_status){
            let log_string = "Experiment With Attributes: " + experiment_status.variationKey + "" +  experiment_status.variationId
            NSLog(log_string)
            newLabel?.text = log_string
        }
        
    }
    
    @IBAction func fe_without_attributes(_ sender: Any) {
        if let feature_status = self.appDel.optimizelyClient?.isFeatureEnabled(self.appDel.experiment_key, userId: self.appDel.userId){
            let log_string = "FE With Attributes: " + feature_status.description
            NSLog(log_string)
            newLabel?.text = log_string
        }
    }
    @IBAction func activate_without_attributes(_ sender: Any) {
        if let experiment_status = self.appDel.optimizelyClient?.activate(self.appDel.experiment_key, userId: self.appDel.userId){
            let log_string = "Experiment Without Attributes: " + experiment_status.variationKey + "" +  experiment_status.variationId
            NSLog(log_string)
            newLabel?.text = log_string
        }
    }
    
}


