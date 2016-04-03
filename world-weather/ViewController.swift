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
        performSegueWithIdentifier(FIRST_SEGUE, sender: place)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == FIRST_SEGUE{
            if let PageVC = segue.destinationViewController as? PageVC {
                if let place = sender as? String {
                    PageVC.placeName = place
                }
            }
        }
    }
}

