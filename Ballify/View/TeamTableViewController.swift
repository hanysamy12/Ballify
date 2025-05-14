//
//  TeamTableViewController.swift
//  Ballify
//
//  Created by Macos on 14/05/2025.
//

import UIKit

class TeamTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 200))

        let imageView = UIImageView(image: UIImage(named: "club_logo"))
        imageView.frame = CGRect(x: (headerView.frame.width - 100)/2, y: 20, width: 100, height: 100)
        imageView.contentMode = .scaleAspectFit
        headerView.addSubview(imageView)

        let nameLabel = UILabel(frame: CGRect(x: 20, y: 130, width: headerView.frame.width - 40, height: 40))
        nameLabel.text = "Real Madrid"
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerView.addSubview(nameLabel)

        tableView.tableHeaderView = headerView
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 12
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        cell.playerImg.image = UIImage(named: "player")
//        cell.cellLabel.text = "Laliga"
        
//        let league = leagues[indexPath.row]
        
//        cell.cellLabel.text = league.league_name
//        let url = URL(string: league.league_logo ?? "")
//        cell.cellImage.kf.setImage(with: url, placeholder: UIImage(named: "laliga"))

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
