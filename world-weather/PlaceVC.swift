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

    @IBOutlet weak var placeNameTxt: UILabel!
    
    var place: String!
    
    
    override func viewDidLoad() {
        
        let location = Place(name: place)
        
        super.viewDidLoad()
        
        //placeNameTxt.text = "\(location.placeUrl)"
        
        print("\(location.placeUrl)")
        
        location.downloadWeatherDetails()
    }




}
