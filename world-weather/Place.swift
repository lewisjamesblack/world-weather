//
//  Place.swift
//  world-weather
//
//  Created by Lewis Black on 01/04/2016.
//  Copyright © 2016 Lewis Black. All rights reserved.
//

import Foundation
import Alamofire

class Place {
    
    private var _placeName: String!
    private var _placeUrl: String!
    
    var placeName: String {
        return _placeName
    }
    
    var placeUrl:String {
        return _placeUrl
    }
    
    var time = mainInstance.timeCount
    
    init(name: String){
        self._placeName = name
        _placeUrl = "\(URL_BASE)\(placeName.uppercaseString)\(URL_ID)"
    }
    
    func downloadWeatherDetails() {
        // why do I have to do this below
        let url = NSURL(string: _placeUrl)!
        Alamofire.request(.GET, url).responseJSON { response in
//            if response == "" {
//                print ("shit")
//            } else {
             print(response)
            //  }
            // add this bit in, if there's an error send it back to start page or something
            //{
            //"cod": "404",
            //"message": "Error: Not found city"
            //}
        
        
            //let result = response.result
        
            if let dict = response.result.value as? Dictionary<String, AnyObject>{
                print("yest")
                let temp = dict["list"]?[0]?["main"]?!["temp"] as! Double
                print (temp)
                let dt = dict["list"]![self.time]["dt"] as! Double
                print ("laaaaa")
                print (dt)
                let many = dict["list"]!.count
                print(many)
                
            } else {
                
                print ("shit")
            }
        }
    }
}