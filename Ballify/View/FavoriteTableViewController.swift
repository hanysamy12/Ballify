//
//  FavoriteTableViewController.swift
//  Ballify
//
//  Created by Hany on 10/05/2025.
//

import UIKit
import Network
class FavoriteTableViewController: UITableViewController {
    var leagues: [League] = []
    var sportType: SportType!
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkMonitor")
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // controller >> ViewModel to get the data
        let presenter  = FavoriteTablePresenter()
        presenter.attachView(favoriteTableViewController: self)
       
        self.title = "Football Leagues"
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "favDetails") as! FavoriteDetailsViewController
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("Connected")
            } else {
                print("No connection")
                DispatchQueue.main.async {
                    self.showBasicAlert()
                }

            }
            
        }
        monitor.start(queue: queue)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    func showBasicAlert() {
        // 1. Create the alert controller
        let alert = UIAlertController(
            title: "Wornning",
            message: "Connect To Internet To Show Details",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            print("OK button tapped")
        })
        
        present(alert, animated: true, completion: nil)
    }

}
