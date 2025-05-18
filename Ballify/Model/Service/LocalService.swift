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
    static func getLeaguesFromCoreData(sportType:String, compilationHandler: @escaping ([League]?) -> Void)
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
    
    static func getLeaguesFromCoreData(sportType: String, compilationHandler: @escaping ([League]?) -> Void) {
        var leagues: [League] = []

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StoredLeague")
//        fetchRequest.predicate = NSPredicate(format: "sportType == %@", sportType)

        do {
            let result = try context.fetch(fetchRequest)
            for data in result {
                let leagueKey = data.value(forKey: "leagueKey") as? Int ?? 0
                let leagueName = data.value(forKey: "leagueName") as? String ?? ""
                let leagueLogo = data.value(forKey: "leagueLogo") as? String ?? ""
                let leagueSportType = data.value(forKey: "sportType") as? String ?? ""

                let league = League(league_key: leagueKey, league_name: leagueName, league_logo: leagueLogo, sportType: leagueSportType)
                leagues.append(league)
            }
            compilationHandler(leagues)
        } catch let error as NSError {
            print("Failed to fetch: \(error.localizedDescription)")
            compilationHandler(nil)
        }
    }
    
    
    static func deleteLeagueFromCoreData(leagueKey: Int) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "StoredLeague")
        fetchRequest.predicate = NSPredicate(format: "leagueKey == %d", leagueKey)

        do {
            let leaguesToDelete = try context.fetch(fetchRequest)
            for league in leaguesToDelete {
                context.delete(league)
            }
            try context.save()
            print("Deleted successfully")
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }


    
}
