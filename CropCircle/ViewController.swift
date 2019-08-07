//
//  ViewController.swift
//  CropCircle
//
//  Created by Vanna Phong on 07/08/2019.
//  Copyright © 2019 vphong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var croppedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func onGalleryButton(_ sender: Any) {
        
        // create image picker controller
        let picker = UIImagePickerController()
        picker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    // after picking image from gallery
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as! UIImage
        
        let cropViewController =
        // send image to crop screen
        
        croppedImageView.image = image
        
        dismiss(animated: true, completion: nil)
    }
}

