//
//  ViewController.swift
//  Coin Catalogue
//
//  Created by Jay on 16/08/20.
//  Copyright © 2020 Jay Kaushal. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{


    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var coin = [Coin]()
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredData: [Coin]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        coin = DBHelper.sharedInstance.getData()
        filteredData = coin
        searchBar.delegate = self
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoinTableViewCell
        
        let coincell = filteredData[indexPath.row]
        
        cell.nameLbl.text = coincell.name
        cell.yearLbl.text = coincell.year
        cell.countryLbl.text = coincell.country
        cell.currencyLbl.text = coincell.currency
        
        if let fontImgData = coincell.frontimg {
            cell.frontImg.image = UIImage(data: fontImgData as Data)
        }
        if let backImgData = coincell.backimg {
            cell.backImg.image = UIImage(data: backImgData as Data)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CoinDetailViewController") as! CoinDetailViewController
        let coincell = filteredData[indexPath.row]
        
        vc.cointitle = coincell.name!
        vc.yearofissue = coincell.year!
        vc.coincountry = coincell.country!
        vc.coincurrency = coincell.currency!
        vc.coinmint = coincell.mint!
        vc.facevalue = coincell.facevalue!
        vc.purchasecoin = coincell.purchasedate!
        vc.coincomposition = coincell.composition!
        vc.coinsize = coincell.size!
        vc.coinweight = coincell.weight!
        vc.event = coincell.event!
        if let fontImgData = coincell.frontimg {
            vc.frontImg = UIImage(data: fontImgData as Data)!
        }
        if let backImgData = coincell.backimg {
            vc.backImg = UIImage(data: backImgData as Data)!
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            filteredData = DBHelper.sharedInstance.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == ""{
            filteredData = coin
        }
        else{
        for coindata in coin
        {
            if coindata.name!.contains(searchText.lowercased()){
                filteredData.append(coindata)
            }
        }
      }

        self.tableView.reloadData()
    }


}

