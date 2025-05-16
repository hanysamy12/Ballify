//
//  FavoriteTablePresenter.swift
//  Ballify
//
//  Created by Macos on 16/05/2025.
//

import Foundation

class FavoriteTablePresenter{
    
    weak var favViewController: FavoriteTableViewController!
    
    func attachView(favoriteTableViewController: FavoriteTableViewController){
        favViewController = favoriteTableViewController
    }
    
    
    func getDataFromCoreDate(sportType: String){
        
        CoreDataService.getLeaguesFromCoreData(sportType: sportType) { res in
            self.favViewController.renderToView(result: res!)
        }
        
    }
    
}
