//
//  AddRestaurantController.swift
//  Food Pin
//
//  Created by Chawan Saeed on 11/15/20.
//  Copyright © 2020 Chawan Saeed. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var restaurant: Restaurant!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var typeTextField:UITextField!
    @IBOutlet var locationTextField:UITextField!
    @IBOutlet var yesButton:UIButton!
    @IBOutlet var noButton:UIButton!
    
    
    @IBAction func save() {
    if nameTextField.text  == "" {
        
    let alertController = UIAlertController(title: "Oopps!", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil ))
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    else if nameTextField.text != "" {
        print("Name: \(nameTextField.text)")
        }
        
    if typeTextField.text == "" {
        let alertController = UIAlertController(title: "Oopps!", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil ))
            presentViewController(alertController, animated: true, completion: nil)
            
        }
            
    else if typeTextField.text != "" {
                print("Type: \(typeTextField.text)")
        }
            
    if locationTextField.text == "" {
        let alertController = UIAlertController(title: "Oopps!", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil ))
                    
        presentViewController(alertController, animated: true, completion: nil) }
        
        else if locationTextField.text != "" {
            print("Location: \(locationTextField.text)")
        }
     }
    
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
            imagePicker.delegate = self
   }
  }
 }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoImageView.image = selectedImage
            photoImageView.contentMode = .ScaleAspectFill
            photoImageView.clipsToBounds = true
            }
            
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func toggleBeenHereButton(sender: UIButton) {
            if sender == yesButton {
            restaurant.isVisited = true
            yesButton.backgroundColor = UIColor.greenColor()
                }
        else if sender == noButton {
             restaurant.isVisited = false
             noButton.backgroundColor = UIColor.redColor()
        }
    }
    
    
    override func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
        
    
}
}