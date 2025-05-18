//
//  LeaguesViewModel.swift
//  Ballify
//
//  Created by Macos on 12/05/2025.
//

import Foundation
import Reachability

class LeaguesTablePresenter{
    
    var reachability: Reachability!
    
    weak var vc: LeaguesTableViewController!

    func attachView(leaguesTableViewController: LeaguesTableViewController){
        vc = leaguesTableViewController
    }
    
    
    func getDataFromModel(sportType: String){
        
        NetworkService.fetchLeaguesFromJSON(sportType: sportType){ res in
            
            // Setup Reachability
            self.reachability = try? Reachability()
            
            //add data to ViewController
            
            // Check network status
            if self.reachability.connection != .unavailable {
                guard let res = res else{return}
                self.vc.renderToView(result:res)

            } else {
                self.vc.noInternet()
            }
            
            
            
        }
        
    }
    
    
}
