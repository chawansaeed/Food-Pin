
//
//  RestaurantDetailViewController.swift
//  Food Pin
//
//  Created by Chawan Saeed on 11/9/20.
//  Copyright © 2020 Chawan Saeed. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var restaurantImageView:UIImageView!
//    @IBOutlet var restaurantNameLabel: UILabel!
//    @IBOutlet var restaurantTypeLabel: UILabel!
//    @IBOutlet var restaurantLocationLabel: UILabel!
    
    var restaurant: Restaurant!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var tableView:UITableView!
    @IBAction func close(segue:UIStoryboardSegue) {
    }
    
    @IBAction func ratingButtonTapped(segue: UIStoryboardSegue) {
        
        if let rating = segue.identifier {
        restaurant.isVisited = true
            
        switch rating {
               case "great":
                restaurant.rating = "Absolutely love it! Must try. "
                case "good":
                restaurant.rating = "Pretty good."
                case "dislike":
                restaurant.rating = "I don't like it."
            default:
                restaurant.rating = ""
                
            }
        }
        tableView.reloadData()
    }
    
override func viewDidLoad() {
    super.viewDidLoad()

    mapView.showsCompass = true
    mapView.showsScale = true
    mapView.showsTraffic = true
    mapView.showsUserLocation = true
    mapView.showsBuildings = true
    mapView.zoomEnabled = true
    
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(showMap()))
        mapView.addGestureRecognizer(tapGestureRecognizer)
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks, error in
        if let error = error {
        print(error)
            return
        }
        if let placemarks = placemarks {
        let placemark = placemarks[0]
            
        let annotation = MKPointAnnotation()
            
            if let location = placemark.location {
                annotation.coordinate = location.coordinate
                self.mapView.addAnnotation(annotation)
                
                let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                self.mapView.setRegion(region, animated: false)
                
            }
        }
    })
    
    restaurantImageView.image = UIImage(named: restaurant.image)

    tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
    title = restaurant.name
    
    navigationController?.hidesBarsOnSwipe = false
    
    tableView.estimatedRowHeight = 36.0
    tableView.rowHeight = UITableViewAutomaticDimension
    
    }
    
    
    func showMap() {
        performSegueWithIdentifier("showMap", sender: self)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCellWithIdentifier("Cell1", forIndexPath: indexPath) as! RestaurantDetailTableViewCell
            
    switch indexPath.row {
        
    case 0:
        cell.fieldLabel.text = NSLocalizedString("Name", comment: "Name Field")
        cell.valueLabel.text = restaurant.name
        
    case 1:
        cell.fieldLabel.text = NSLocalizedString("Type", comment: "Type Field")
        cell.valueLabel.text = restaurant.type
    
    case 2:
        cell.fieldLabel.text = NSLocalizedString("Location", comment:
            "Location/Address Field")
        cell.valueLabel.text = restaurant.location
        
    case 3:
        cell.fieldLabel.text = NSLocalizedString("Phone", comment: "Phone Field")
        cell.valueLabel.text = restaurant.phone
        
    case 4:
        cell.fieldLabel.text = NSLocalizedString("Been here", comment: "Have you been here Field")
        cell.valueLabel.text = (restaurant.isVisited) ? NSLocalizedString("Yes, I've been here before. \(restaurant.rating)", comment: "Yes, I've been here before") : NSLocalizedString("No", comment: "No, I haven't been here")
    default:
        cell.fieldLabel.text = ""
        cell.valueLabel.text = ""
        
            }
         return cell
    }
    
    
    
override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
       navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
    }
    
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showReview" {
        let destinationController = segue.destinationViewController as! ReviewViewController
    } else if segue.identifier == "showMap"{
        let destinationController = segue.destinationViewController as! MapViewController
        destinationController.restaurant = restaurant
    
 }
}
   
    
    
    
    
    
    
}
