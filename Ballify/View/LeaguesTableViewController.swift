//
//  LeaguesTableViewController.swift
//  Ballify
//
//  Created by Macos on 11/05/2025.
//

import UIKit
import Kingfisher

class LeaguesTableViewController: UITableViewController {

    var leagues: [League] = []
//    var viewModel: LeaguesTablePresenter!
    var sportType: SportType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(sportType.rawValue)
        
//        viewModel = LeaguesTablePresenter()
        
        // controller >> ViewModel to get the data
        let presenter  = LeaguesTablePresenter()
        presenter.attachView(leaguesTableViewController: self)
        
        switch sportType {
        case .football:
            print("Calling Football API")
            self.title = "Football Leagues"
            presenter.getDataFromModel(sportType: sportType.rawValue)
        case .tennis:
            print("Calling Tennis API")
            self.title = "Tennis Leagues"
            presenter.getDataFromModel(sportType: sportType.rawValue)
        case .basketball:
            print("Calling Basketball API")
            self.title = "Basketball Leagues"
            presenter.getDataFromModel(sportType: sportType.rawValue)
        case .cricket:
            print("Calling Cricket API")
            self.title = "Cricket Leagues"
            presenter.getDataFromModel(sportType: sportType.rawValue)
        case .none:
            break
        }
        

        
//        viewModel.bindResultToViewController = {[weak self] in
//            self?.renderToView()
//        }
    }

//    // from controller >> to view
//    func renderToView(){
//
//        leagues = self.viewModel.vmResult
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
    // from controller >> to view
    func renderToView(result:LeaguesResult){
        
        leagues = result.result
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesCell", for: indexPath) as! CustomTableViewCell
        
//        cell.cellImage.image = UIImage(named: "laliga")
//        cell.cellLabel.text = "Laliga"
        
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
        print("item no\(indexPath.item)")
        let league = leagues[indexPath.row]
        let matchesVC = self.storyboard?.instantiateViewController(withIdentifier: "matches") as! MatchesCollectionViewController
        matchesVC.leagueId = league.league_key
        matchesVC.leagueName = league.league_name
        matchesVC.sportType = sportType
        matchesVC.leagueLogo = league.league_logo
        navigationController?.pushViewController(matchesVC, animated: true)

    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
