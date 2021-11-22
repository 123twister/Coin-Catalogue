//
//  AddCoinViewController.swift
//  Coin Catalogue
//
//  Created by Jay on 16/08/20.
//  Copyright © 2020 Jay Kaushal. All rights reserved.
//

import UIKit
import CoreData

class AddCoinViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var yearTxt: UITextField!
    @IBOutlet weak var countryTxt: UITextField!
    @IBOutlet weak var currencyTxt: UITextField!
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var sizeTxt: UITextField!
    @IBOutlet weak var compositionTxt: UITextField!
    @IBOutlet weak var mintTxt: UITextField!
    @IBOutlet weak var faceTxt: UITextField!
    @IBOutlet weak var purchaseDateTxt: UITextField!
    @IBOutlet weak var eventTxt: UITextView!
    @IBOutlet weak var submitBTN: UIButton!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     weak var activeImageView: UIImageView? = nil
    
    var isChecked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        nameTxt.delegate = self
         yearTxt.delegate = self
         countryTxt.delegate = self
         currencyTxt.delegate = self
         weightTxt.delegate = self
         sizeTxt.delegate = self
         compositionTxt.delegate = self
         mintTxt.delegate = self
         faceTxt.delegate = self
         purchaseDateTxt.delegate = self
         eventTxt.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSelect(sender:)))
        frontImage.addGestureRecognizer(tapGesture)
        frontImage.isUserInteractionEnabled = true
        
        let backTapGesture = UITapGestureRecognizer(target:self,action:#selector(handleSelect(sender:)))
        backImage.addGestureRecognizer(backTapGesture)
        backImage.isUserInteractionEnabled = true
        
        self.eventTxt.addDoneButton(title: "Done", target: self, selector: #selector(tapped(sender:)))
        
        hideKeyboard()
        
    }
    
 
    @IBAction func submitBtn(_ sender: UIButton) {
        
    saveData()
    }
    
    func saveData()
    {
        if nameTxt.text == "" && yearTxt.text == "" && countryTxt.text == "" && currencyTxt.text == "" && weightTxt.text == "" && sizeTxt.text == "" && compositionTxt.text == "" && mintTxt.text == "" && faceTxt.text == "" && purchaseDateTxt.text == "" && eventTxt.text == "" {
            let alertController = UIAlertController(title: "Alert!!!", message: "Please enter the full details.", preferredStyle: .alert)
            let alert = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
            alertController.addAction(alert)
            present(alertController, animated: true, completion: nil)
        }
        else
        {
            let newCoin = NSEntityDescription.insertNewObject(forEntityName: "Coin", into: context)
            newCoin.setValue(self.nameTxt.text, forKey: "name")
            newCoin.setValue(self.yearTxt.text, forKey: "year")
            newCoin.setValue(self.countryTxt.text, forKey: "country")
            newCoin.setValue(self.currencyTxt.text, forKey: "currency")
            newCoin.setValue(self.weightTxt.text, forKey: "weight")
            newCoin.setValue(self.sizeTxt.text, forKey: "size")
            newCoin.setValue(self.compositionTxt.text, forKey: "composition")
            newCoin.setValue(self.mintTxt.text, forKey: "mint")
            newCoin.setValue(self.faceTxt.text, forKey: "facevalue")
            newCoin.setValue(self.purchaseDateTxt.text, forKey: "purchasedate")
            newCoin.setValue(self.eventTxt.text, forKey: "event")
            newCoin.setValue(self.frontImage.image?.pngData(), forKey: "frontimg")
            newCoin.setValue(self.backImage.image?.pngData(), forKey: "backimg")
            
            do{
                try context.save()
                let alertController = UIAlertController(title: "Success!!!", message: "Data saved successfully.", preferredStyle: .alert)
                let alert = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertController.addAction(alert)
                present(alertController, animated: true, completion: nil)
                self.nameTxt.text = ""
                self.yearTxt.text = ""
                self.countryTxt.text = ""
                self.currencyTxt.text = ""
                self.weightTxt.text = ""
                self.sizeTxt.text = ""
                self.compositionTxt.text = ""
                self.mintTxt.text = ""
                self.faceTxt.text = ""
                self.purchaseDateTxt.text = ""
                self.eventTxt.text = ""
                self.frontImage.image = UIImage(named: "gallery.png")
                self.backImage.image = UIImage(named: "gallery.png")
                
            }
            catch{
                print("Error")
            }
        }

        
    }
    
    @objc func handleSelect(sender: UITapGestureRecognizer){
        guard let imageView = sender.view as? UIImageView else {
            print("not received")
            return
        }
        activeImageView = imageView
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            activeImageView?.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func hideKeyboard(){
        nameTxt.resignFirstResponder()
        yearTxt.resignFirstResponder()
        countryTxt.resignFirstResponder()
        currencyTxt.resignFirstResponder()
        weightTxt.resignFirstResponder()
        sizeTxt.resignFirstResponder()
        compositionTxt.resignFirstResponder()
        mintTxt.resignFirstResponder()
        faceTxt.resignFirstResponder()
        purchaseDateTxt.resignFirstResponder()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    @objc func tapped(sender: Any) {
        self.view.endEditing(true)
    }
    
    

}
