//
//  DBHelper.swift
//  Coin Catalogue
//
//  Created by Jay on 16/08/20.
//  Copyright © 2020 Jay Kaushal. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DBHelper {
    
    static var sharedInstance = DBHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func getData() -> [Coin]{
        
        var coin = [Coin]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Coin")
        do{
            coin = try context?.fetch(fetchRequest) as! [Coin]
        }catch{
            print("Data did not received.")
        }
        return coin
    }
    
    func deleteData(index: Int) -> [Coin]{
        var coin = getData()
        context?.delete(coin[index])
        coin.remove(at: index)
        do{
            try context?.save()
        }
        catch{
            print("Cannot delete data")
        }
        return coin
    }
    
}
