
//
//  WalkthroughContentViewController.swift
//  Food Pin
//
//  Created by Chawan Saeed on 11/20/20.
//  Copyright © 2020 Chawan Saeed. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    
    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var contentImageView: UIImageView!
    @IBOutlet var forwardButton: UIButton!
    @IBAction func nextButtonTapped(sender: UIButton) {
    
        switch index {
        case 0...1:
            let pageViewController = parentViewController as! WalkthroughPageViewController
                pageViewController.forward(index)
            
        case 2:
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "hasViewedWalkthrough")
        dismissViewControllerAnimated(true, completion: nil)
            
        default: break
        }
    }
    
    var index = 0
    var heading = ""
    var imageFile = ""
    var content = ""
    
override func viewDidLoad() {
    headingLabel.text = heading
    contentLabel.text = content
    contentImageView.image = UIImage(named: imageFile)
    
    switch index {
    case 0...1 : forwardButton.setTitle("NEXT", forState: .Normal)
        
    case 2: forwardButton.setTitle("DONE", forState: .Normal)
    default: break
    
    }
    }

    
    
    
    
    
    
    
    
    
    
}
