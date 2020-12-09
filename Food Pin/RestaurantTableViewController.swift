//
//  RestaurantTableViewController.swift
//  Food Pin
//
//  Created by Chawan Saeed on 11/8/20.
//  Copyright © 2020 Chawan Saeed. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController, UISearchControllerDelegate, UISearchResultsUpdating {
    
    
var restaurants:[Restaurant ] = [
    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Ramada by Wyndham Sulaymaniyah Salim Street", phone: "232-923423", image: "cafedeadend.jpg", isVisited: false),
    Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phone: "348-233423", image: "homei.jpg", isVisited: false),
    Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "354-243523", image: "teakha.jpg", isVisited: false),
    Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "453- 333423", image: "cafeloisl.jpg", isVisited: false),
    Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phone: "983-284334", image: "petiteoyster.jpg", isVisited: false),
    Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop J- K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", phone: "232-434222", image: "forkeerestaurant.jpg", isVisited: false),
    Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", phone: "234-834322", image: "posatelier.jpg", isVisited: false),
    Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", phone: "982-434343", image: "bourkestreetbakery.jpg", isVisited: false),
    Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", phone: "734-232323", image: "haighschocolate.jpg", isVisited: false),
    Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", phone: "872-734343", image: "palominoespresso.jpg", isVisited: false),
    Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", phone: "343-233221", image: "upstate.jpg", isVisited: false),
    Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", phone: "985-723623", image: "traif.jpg", isVisited: false),
    Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", phone: "455-232345", image: "grahamavenuemeats.jpg", isVisited: false),
    Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", phone: "434-232322", image: "wafflewolf.jpg", isVisited: false),
    Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", phone: "343-234553", image: "fiveleaves.jpg", isVisited: false),
    Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phone: "342-455433", image:  "cafelore.jpg", isVisited: false),
    Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", phone: "542-343434", image: "barrafina.jpg", isVisited: false),
    Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", phone: "722-232323", image: "donostia.jpg", isVisited: false),
    Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", phone: "343-988834", image:     "royaloak.jpg", isVisited: false),
    Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", phone: "432-344050", image: "caskpubkitchen.jpg", isVisited: false) ]

    var sectionTitles = [" ", " ", " "]
    
    var searchController:  UISearchController!
    var searchResults: [Restaurant] = []
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search restaurants..."
        searchController.searchBar.tintColor = UIColor.whiteColor()
        searchController.searchBar.barTintColor = UIColor(red: 216.0/255.0, green:
            74.0/255.0, blue: 32.0/255.0, alpha: 1.0)
        
        
        // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationController?.hidesBarsOnSwipe = true
            
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.reloadData()

    }
 

override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
    }
    
override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searchController.active {
        return searchResults.count
    } else {
        return restaurants.count
    
    }
}
    
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    let cellIdentifier = "Cell"
    let cell = tableView.dequeueReusableCellWithIdentifier( cellIdentifier, forIndexPath: indexPath ) as! RestaurantTableViewCell
    
    let restaurant = (searchController.active) ? searchResults[indexPath.row] : restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.thumbnailImageView.image = UIImage(named:
        restaurant.image)
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        
        cell.thumbnailImageView.clipsToBounds = true
        cell.thumbnailImageView.layer.cornerRadius = 30.0
                
        return cell
    }
    
    
  func filterContent(searchText: String) {
     searchResults = restaurants.filter({ (restaurant) -> Bool in
        let name = restaurant.name
        let location = restaurant.location
        let isMatch = name.localizedCaseInsensitiveContainsString(searchText) || location.localizedCaseInsensitiveContainsString(searchText)
        return isMatch
        })
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(searchText)
            tableView.reloadData()
        }
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if searchController.active {
           return false
        } else {
            return true
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    if editingStyle == .Delete {
        
        restaurants.removeAtIndex(indexPath.row)

            
        }
   tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
  }
    
override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
    
    // Social sharing action
    
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (ACTION, indexPath) -> Void in
        let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
            
        let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
        self.presentViewController(activityController, animated: true, completion: nil)

            }
       })
// Delete button
    let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: { (ACTION,indexPath) -> Void in
        
            // Delete the row from the data source
            self.restaurants.removeAtIndex(indexPath.row)
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    })
    
    
    shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0,
        blue: 99.0/255.0, alpha: 1.0)
    deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0,
        blue: 203.0/255.0, alpha: 1.0)
    return [deleteAction, shareAction]

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
            
            let destinationController = segue.destinationViewController as! RestaurantDetailViewController
                
                destinationController.restaurant = (searchController.active) ? searchResults[indexPath.row] : restaurants[indexPath.row]
                }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
                super.viewWillAppear(animated)
                navigationController?.hidesBarsOnSwipe = true
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
    }
    
    override func viewDidAppear(animated: Bool) {
        
      if NSUserDefaults.standardUserDefaults().boolForKey("hasViewedWalkthrough") {
            return
        }
        if let pageViewController = storyboard?.instantiateViewControllerWithIdentifier("WalkthroughController") as? WalkthroughPageViewController {
        
            presentViewController(pageViewController, animated: true, completion: nil)
        
        
        }
    }
}

