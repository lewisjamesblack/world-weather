//
//  PageViewController.swift
//  world-weather
//
//  Created by Lewis Black on 02/04/2016.
//  Copyright © 2016 Lewis Black. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDataSource {
    
    var placeName: String!
    var pageController: UIPageViewController?
    var pageContent = NSArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let location = Place(name: placeName)
        location.downloadWeatherDetails()
        
        dataSource = self
    
    }
    
    func createContentPages() {
        var pageStrings = [String]()
        
        for i in 1...11
        {
            let contentString = "<html><head></head><body><br><h1>Chapter \(i)</h1><p>This is the page \(i) of content displayed using UIPageViewController in iOS 8.</p></body></html>"
            pageStrings.append(contentString)
        }
        pageContent = pageStrings
    }
    
    func viewControllerAtIndex(index: Int) -> PlaceVC? {
        
        if (pageContent.count == 0) ||
            (index >= pageContent.count) {
            return nil
        }
        
        let storyBoard = UIStoryboard(name: "Main",
                                      bundle: NSBundle.mainBundle())
        let dataViewController = storyBoard.instantiateViewControllerWithIdentifier("PlaceVC") as! PlaceVC
        
        dataViewController.dataObject = pageContent[index]
        return dataViewController
    }
    
    func indexOfViewController(viewController: PlaceVC) -> Int {
        
        if let dataObject: AnyObject = viewController.dataObject {
            return pageContent.indexOfObject(dataObject)
        } else {
            return NSNotFound
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index = indexOfViewController(viewController
            as! PlaceVC)
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        mainInstance.timeCount = mainInstance.timeCount - 1
        
        index = index - 1
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var index = indexOfViewController(viewController
            as! PlaceVC)
        
        if index == NSNotFound {
            return nil
        }
        
        index = index + 1
        if index == pageContent.count {
            return nil
        }
        mainInstance.timeCount = mainInstance.timeCount + 1

        return viewControllerAtIndex(index)
    }
    

    
    //add in the dictionary.count for ammount of vc's

    
    
//    just stuff for little circles
    
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return 40
//    }
//    
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return 1
//    }


    
    private var myViewController: UIViewController {
        return self.newViewController()
    }

    private func newViewController() -> UIViewController {
            return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PlaceVC")
        }
    
}
