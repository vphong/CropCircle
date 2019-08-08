//
//  ViewController.swift
//  CropCircle
//
//  Created by Vanna Phong on 07/08/2019.
//  Copyright © 2019 vphong. All rights reserved.
//

import UIKit
import CropViewController

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CropViewControllerDelegate {

    @IBOutlet weak var croppedImageView: UIImageView!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // initialize image picker controller delegate
        picker.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        
        // round corners of display image
        croppedImageView.layer.cornerRadius = croppedImageView.frame.size.width / 2;
        croppedImageView.clipsToBounds = true
    }

    
    @IBAction func onCameraButton(_ sender: Any) {
        
        // to avoid crashing simulator, make sure camera is available
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func onGalleryButton(_ sender: Any) {
        
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    // after picking image from gallery or taking new photo from camera
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let chosenImage = info[.originalImage] as! UIImage
        
        let cropViewController = CropViewController(croppingStyle: .circular, image: chosenImage)
        cropViewController.delegate = self
        self.navigationController?.pushViewController(cropViewController, animated: true)
        
        // dismiss image picker
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: -- CropViewController Delegate Protocols
    func cropViewController(_ cropViewController: CropViewController, didCropToCircularImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        
        croppedImageView.image = image
        self.navigationController?.popViewController(animated: true)
    }
    
}

