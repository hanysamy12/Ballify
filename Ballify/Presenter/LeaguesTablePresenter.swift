//
//  LeaguesViewModel.swift
//  Ballify
//
//  Created by Macos on 12/05/2025.
//

import Foundation

class LeaguesTablePresenter{
    
    
    weak var vc: LeaguesTableViewController!

    func attachView(leaguesTableViewController: LeaguesTableViewController){
        vc = leaguesTableViewController
    }
    
    
    func getDataFromModel(sportType: String){
        
        NetworkService.fetchLeaguesFromJSON(sportType: sportType){ res in
            
            
            //add data to ViewController
            self.vc.renderToView(result:res!)
            
            
        }
        
    }
    
    
}
