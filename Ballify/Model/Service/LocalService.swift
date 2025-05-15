//
//  LocalService.swift
//  Ballify
//
//  Created by Hany on 15/05/2025.
//

import Foundation
import CoreData
import UIKit
 
protocol CoreDataProtocol{
    static func addToCoreData(league: League, sportType : String)
}


class CoreDataService : CoreDataProtocol{
    let INSTANCE = CoreDataService()
    
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let context = appDelegate.persistentContainer.viewContext
    static let entity = NSEntityDescription.entity(forEntityName: "StoredLeague", in: context)
    
    private init (){}
    
    static func addToCoreData(league: League, sportType : String){
        guard let entity = self.entity else {
            print("Entity Not Found")
            return
            
        }
        
        let coreLeage = NSManagedObject(entity: entity, insertInto: context)
        
        coreLeage.setValue(league.league_key, forKey: "leagueKey")
        coreLeage.setValue(league.league_name, forKey: "leagueName")
        coreLeage.setValue(league.league_logo, forKey: "leagueLogo")
        coreLeage.setValue(sportType, forKey: "sportType")
        do{
            try context.save()
            print("Saved")
        }catch let error as NSError{
            print("Error \(error.localizedDescription)")
        }
        
    }
}
