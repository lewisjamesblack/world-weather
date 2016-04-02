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
        }
    }
}