//
//  ViewController.swift
//  Ballify
//
//  Created by Hany on 10/05/2025.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var footballImg: UIImageView!
    
    @IBOutlet weak var tennisImg: UIImageView!
    
    @IBOutlet weak var basketballImg: UIImageView!
    
    @IBOutlet weak var cricketImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("test hany")
        
        addTapGesturesConfigurations()
        
    }
    
    func addTapGesturesConfigurations(){
        
        footballImg.isUserInteractionEnabled = true
        tennisImg.isUserInteractionEnabled = true
        basketballImg.isUserInteractionEnabled = true
        cricketImg.isUserInteractionEnabled = true
        
        footballImg.tag = 0
        tennisImg.tag = 1
        basketballImg.tag = 2
        cricketImg.tag = 3

        let fTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        footballImg.addGestureRecognizer(fTapGesture)

        let tTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        tennisImg.addGestureRecognizer(tTapGesture)

        let bTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        basketballImg.addGestureRecognizer(bTapGesture)

        let cTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        cricketImg.addGestureRecognizer(cTapGesture)
        
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        
        guard let tappedView = sender.view else { return }
        let itemId = tappedView.tag
        
        print("test touching images")
        switch itemId {
        case 0:
            print("Football Leagues Screen")
            let leaguesVC = self.storyboard?.instantiateViewController(withIdentifier: "leagues") as! LeaguesTableViewController
            leaguesVC.sportType = .football
            navigationController?.pushViewController(leaguesVC, animated: true)
        
        case 1:
            print("Tennis Leagues Screen")
            let leaguesVC = self.storyboard?.instantiateViewController(withIdentifier: "leagues") as! LeaguesTableViewController
            leaguesVC.sportType = .tennis
            navigationController?.pushViewController(leaguesVC, animated: true)
            
        case 2:
            print("Basketball Leagues Screen")
            let leaguesVC = self.storyboard?.instantiateViewController(withIdentifier: "leagues") as! LeaguesTableViewController
            leaguesVC.sportType = .basketball
            navigationController?.pushViewController(leaguesVC, animated: true)
            
        case 3:
            print("Cricket Leagues Screen")
            let leaguesVC = self.storyboard?.instantiateViewController(withIdentifier: "leagues") as! LeaguesTableViewController
            leaguesVC.sportType = .cricket
            navigationController?.pushViewController(leaguesVC, animated: true)
            
        default:
            break
        }
        
    }

    

}

