//
//  CreateMemeViewController.swift
//  MemeMe
//
//  Created by Neel Bommisetty on 31/01/16.
//  Copyright © 2016 NeelBommisetty. All rights reserved.
//

import UIKit

class CreateMemeViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate
{

    @IBOutlet weak var pickedImage: UIImageView!
    
    @IBOutlet weak var topText: UITextField!
    
    @IBOutlet weak var bottomText: UITextField!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    var imagePickerController = UIImagePickerController()
    
    let memeTextAttributes = [
        NSStrokeColorAttributeName : UIColor.blackColor(),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : 3.0
    ]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.topText.text = "Top"
//        self.topText.layer.zPosition=10
        self.topText.textAlignment =  NSTextAlignment.Center
        self.topText.defaultTextAttributes = self.memeTextAttributes
        self.topText.delegate = self
        
        self.bottomText.text = "Bottom"
//        self.bottomText.layer.zPosition=10
        self.bottomText.textAlignment =  NSTextAlignment.Center
        self.bottomText.defaultTextAttributes = self.memeTextAttributes
        self.bottomText.delegate = self
    }
    
    func textFieldDidBeginEditing(textField: UITextField){
        if(textField.text ==  "top" || textField.text == "bottom"){
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(textField:UITextField) ->Bool{
        textField.resignFirstResponder()
        return true
    }
    
    func imagePickerController(_ : UIImagePickerController,  didFinishPickingMediaWithInfo info: [String : AnyObject]){
    
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.pickedImage.image = image
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ :UIImagePickerController){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func pickImageFromAlbum(sender: UIBarButtonItem) {
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePickerController, animated: true, completion: nil)
        
    }

    @IBAction func pickImageFromCamera(sender: AnyObject) {
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
}

