//
//  ReviewViewController.swift
//  Food Pin
//
//  Created by Chawan Saeed on 11/11/20.
//  Copyright © 2020 Chawan Saeed. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    
    
    override func viewDidLoad() {
        let blurEffect = UIBlurEffect(style:.Light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect )
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
