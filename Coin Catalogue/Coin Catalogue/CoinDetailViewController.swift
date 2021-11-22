//
//  CoinDetailViewController.swift
//  Coin Catalogue
//
//  Created by Jay on 17/08/20.
//  Copyright © 2020 Jay Kaushal. All rights reserved.
//

import UIKit

class CoinDetailViewController: UIViewController {
    
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var currencyLbl: UILabel!
    @IBOutlet weak var compositionLbl: UILabel!
    @IBOutlet weak var faceValueLBL: UILabel!
    @IBOutlet weak var mintLbl: UILabel!
    @IBOutlet weak var purchaseLbl: UILabel!
    @IBOutlet weak var sizeLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var eventLbl: UILabel!
    
    var coin = [Coin]()
    
    var frontImg = UIImage()
    var backImg = UIImage()
    var cointitle = ""
    var coinweight = ""
    var coinsize = ""
    var coincomposition = ""
    var yearofissue = ""
    var coinmint = ""
    var coincurrency = ""
    var facevalue = ""
    var purchasecoin = ""
    var coincountry = ""
    var event = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        coin = DBHelper.sharedInstance.getData()
        
        frontImage.image = frontImg
        backImage.image = backImg
        coinName.text = "\(cointitle), "
        weightLbl.text = coinweight
        sizeLbl.text = coinsize
        compositionLbl.text = coincomposition
        yearLbl.text = yearofissue
        mintLbl.text = coinmint
        currencyLbl.text = coincurrency
        faceValueLBL.text = facevalue
        purchaseLbl.text = purchasecoin
        countryLbl.text = coincountry
        eventLbl.text = event
    }
    

}
