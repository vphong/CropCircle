//
//  ViewController.swift
//  CropCircle
//
//  Created by Vanna Phong on 07/08/2019.
//  Copyright © 2019 vphong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
    
}

