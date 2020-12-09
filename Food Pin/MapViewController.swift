//
//  MapViewController.swift
//  Food Pin
//
//  Created by Chawan Saeed on 11/12/20.
//  Copyright © 2020 Chawan Saeed. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       mapView.delegate = self
    
        mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        mapView.showsUserLocation = true
        mapView.showsBuildings = true
        mapView.zoomEnabled = true
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: {
            placemarks, error in
            if let error = error {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                // Get the first placemark
                let placemark = placemarks[0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    // Display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
            
        })
    }
    
func mapView(mapView: MKMapView, viewFor annotation: MKAnnotation) ->
        MKAnnotationView? {
    let identifier = "MyPin"
    if annotation.isKindOfClass(MKUserLocation.self) {
        return nil
        }
        // Reuse the annotation if possible
    var annotationView:MKPinAnnotationView? =
    mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as?
        MKPinAnnotationView
        if annotationView == nil {
        annotationView = MKPinAnnotationView(annotation: annotation,
        reuseIdentifier: identifier)
        annotationView?.canShowCallout = true
        }
        let leftIconView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 53,
        height: 53))
        leftIconView.image = UIImage(named: restaurant.image)
         annotationView?.leftCalloutAccessoryView = leftIconView
        return annotationView
    }
}
