//
//  ViewController.swift
//  world-weather
//
//  Created by Lewis Black on 01/04/2016.
//  Copyright © 2016 Lewis Black. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        // have a look what this does? Does it just mean keyboard disappears on return?
        searchBar.returnKeyType = UIReturnKeyType.Done


    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let place = searchBar.text!.uppercaseString
        performSegueWithIdentifier("PlaceVC", sender: place)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PlaceVC"{
            if let PlaceVC = segue.destinationViewController as? PlaceVC {
                if let place = sender as? String {
                    PlaceVC.place = place
                }
            }
        }
    }
}

