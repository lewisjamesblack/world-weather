//
//  PlaceVC.swift
//  world-weather
//
//  Created by Lewis Black on 01/04/2016.
//  Copyright © 2016 Lewis Black. All rights reserved.
//

import UIKit
import Alamofire

class PlaceVC: UIViewController {
    
    @IBOutlet weak var thingName: UILabel!
    
    var dataObject: AnyObject?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        thingName.text = "\(index)"
        
        
    }
    
    
    




}
