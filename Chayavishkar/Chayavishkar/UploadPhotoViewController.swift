//
//  UploadPhotoViewController.swift
//  Chayavishkar
//
//  Created by Nalin on 17/02/18.
//  Copyright © 2018 Nalin. All rights reserved.
//

import UIKit

class UploadPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var ivUploadImage: UIImageView!
    @IBOutlet var tfImageName: UITextField!
    @IBOutlet var btSelectPhoto: UIButton!
    @IBOutlet var btUploadPhoto: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btSelectPhoto.layer.cornerRadius = 15
        btSelectPhoto.layer.borderWidth = 1
        btSelectPhoto.layer.borderColor = UIColor.black.cgColor
        
        btUploadPhoto.layer.cornerRadius = 15
        btUploadPhoto.layer.borderWidth = 1
        btUploadPhoto.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectPhoto(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        ivUploadImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadPhoto(_ sender: UIButton) {
    }
    
}
