//
//  FavoriteTableViewController.swift
//  Ballify
//
//  Created by Hany on 10/05/2025.
//

import UIKit
import Reachability

class FavoriteTableViewController: UITableViewController {
    var leagues: [League] = []
    var sportType: SportType!
    var presenter: FavoriteTablePresenter!
    
    var reachability: Reachability!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // controller >> ViewModel to get the data
        presenter  = FavoriteTablePresenter()
        presenter.attachView(favoriteTableViewController: self)
       
        presenter.getDataFromCoreDate(sportType: SportType.football.rawValue)

        
        print("from viewDidLoad in favorite!")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("from viewWillAppear in favorite!")
        presenter.getDataFromCoreDate(sportType: SportType.football.rawValue)
    }
    
    
    // from controller >> to view
    func renderToView(result:[League]){
        
        leagues = result
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leagues.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! CustomTableViewCell
//        cell.cellImage.image = UIImage(named: "Instagram")
//        cell.cellLabel.text = "Instagram Icon"
        
        let league = leagues[indexPath.row]
        
        cell.cellLabel.text = league.league_name
        let url = URL(string: league.league_logo ?? "")
        cell.cellImage.kf.setImage(with: url, placeholder: UIImage(named: "laliga"))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Leagues You Love"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "favDetails") as! FavoriteDetailsViewController
        
        // Setup Reachability
        reachability = try? Reachability()
        
        // Check network status
        if reachability.connection != .unavailable {
            navigationController?.pushViewController(detailsVC, animated: true)
        } else {
            showAlert()
        }
    
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let leagueToDelete = leagues[indexPath.row]

            let alert = UIAlertController(title: "Delete League",
                                          message: "Are you sure you want to delete this league from favorites?",
                                          preferredStyle: .alert)

            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in

                CoreDataService.deleteLeagueFromCoreData(leagueKey: leagueToDelete.league_key)
                
                self.leagues.remove(at: indexPath.row)
                
                tableView.deleteRows(at: [indexPath], with: .fade)
            }

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            alert.addAction(deleteAction)
            alert.addAction(cancelAction)

            self.present(alert, animated: true, completion: nil)
        }
    }


    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: "No Internet Connection",
                                      message: "Please check your internet connection and try again.",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }

}
