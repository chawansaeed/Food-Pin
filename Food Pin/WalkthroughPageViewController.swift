



//
//  WalkthroughPageViewController.swift
//  Food Pin
//
//  Created by Chawan Saeed on 11/20/20.
//  Copyright © 2020 Chawan Saeed. All rights reserved.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pageHeadings = ["Personalize", "Locate", "Discover"]
    
    var pageImages = ["foodpin-intro-1", "foodpin-intro-2", "foodpin-intro-3"]
    
    var pageContent = ["Pin your favorite restaurants and create your own food guide",
    "Search and locate your favourite restaurant on Maps", "Find restaurants pinned by your friends and other foodies around the world"]
    
override func viewDidLoad() {
        dataSource = self
        
    if let startingViewController = contentViewController(at: 0) {
        setViewControllers([startingViewController], direction: .Forward, animated: true, completion: nil)
    
        }
        
    }
    
    
func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        

    return contentViewController(at: index)
        
    }
    
func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            
        var index = (viewController as! WalkthroughContentViewController).index
            index += 1
            
    return contentViewController(at: index)
            
    }
    
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController?
    {
    
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        if let pageContentViewController = storyboard?.instantiateViewControllerWithIdentifier("WalkthroughContentViewController") as? WalkthroughContentViewController {
        pageContentViewController.imageFile = pageImages[index]
        pageContentViewController.heading = pageHeadings[index]
        pageContentViewController.content = pageContent[index]
        pageContentViewController.index = index
        
        return pageContentViewController
        
        }
    return nil
    }
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return pageHeadings.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
            if let pageContentViewController = storyboard?.instantiateViewControllerWithIdentifier("WalkthroughContentViewController") as? WalkthroughContentViewController {
            return pageContentViewController.index
            
            }
            
            return 0
    }
    
    func forward(index: Int) {
        if let nextViewController = contentViewController(at: index + 1) {
            setViewControllers([nextViewController], direction: .Forward, animated: true, completion: nil)
        }
    }

}
