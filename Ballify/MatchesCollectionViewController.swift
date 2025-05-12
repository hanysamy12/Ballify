//
//  MatchesCollectionViewController.swift
//  Ballify
//
//  Created by Hany on 12/05/2025.
//

import UIKit

private let reuseIdentifier = "leagueCell"

class MatchesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    ///------------
    let finishedFixtures: [FixtureResponse] = [
        FixtureResponse(event_key: 1001, event_date: "2025-05-10", event_time: "15:00", event_home_team: "FC Alpha", event_away_team: "Beta United", event_final_result: "2 - 1", event_status: "Finished", home_team_logo: "https://example.com/logo_alpha.png", away_team_logo: "https://example.com/logo_beta.png"),
        FixtureResponse(event_key: 1002, event_date: "2025-05-10", event_time: "17:30", event_home_team: "Gamma FC", event_away_team: "Delta City", event_final_result: "1 - 1", event_status: "Finished", home_team_logo: "https://example.com/logo_gamma.png", away_team_logo: "https://example.com/logo_delta.png"),
        FixtureResponse(event_key: 1003, event_date: "2025-05-10", event_time: "20:00", event_home_team: "Omega Rovers", event_away_team: "Epsilon SC", event_final_result: "0 - 3", event_status: "Finished", home_team_logo: "https://example.com/logo_omega.png", away_team_logo: "https://example.com/logo_epsilon.png"),
        FixtureResponse(event_key: 1004, event_date: "2025-05-11", event_time: "14:00", event_home_team: "Lions FC", event_away_team: "Sharks FC", event_final_result: "2 - 2", event_status: "Finished", home_team_logo: "https://example.com/logo_lions.png", away_team_logo: "https://example.com/logo_sharks.png"),
        FixtureResponse(event_key: 1005, event_date: "2025-05-11", event_time: "16:45", event_home_team: "Falcons United", event_away_team: "Wolves FC", event_final_result: "3 - 0", event_status: "Finished", home_team_logo: "https://example.com/logo_falcons.png", away_team_logo: "https://example.com/logo_wolves.png")
    ]

    let upcomingFixtures: [FixtureResponse] = [
        FixtureResponse(event_key: 1006, event_date: "2025-05-12", event_time: "18:00", event_home_team: "Kings XI", event_away_team: "Titans Club", event_final_result: nil, event_status: "", home_team_logo: "https://example.com/logo_kings.png", away_team_logo: "https://example.com/logo_titans.png"),
        FixtureResponse(event_key: 1007, event_date: "2025-05-12", event_time: "20:30", event_home_team: "Phoenix FC", event_away_team: "Blazers", event_final_result: nil, event_status: "", home_team_logo: "https://example.com/logo_phoenix.png", away_team_logo: "https://example.com/logo_blazers.png"),
        FixtureResponse(event_key: 1008, event_date: "2025-05-13", event_time: "13:00", event_home_team: "Storm Riders", event_away_team: "Galaxy Stars", event_final_result: nil, event_status: "", home_team_logo: "https://example.com/logo_storm.png", away_team_logo: "https://example.com/logo_galaxy.png"),
        FixtureResponse(event_key: 1009, event_date: "2025-05-13", event_time: "16:15", event_home_team: "Tornado FC", event_away_team: "Comets FC", event_final_result: nil, event_status: "", home_team_logo: "https://example.com/logo_tornado.png", away_team_logo: "https://example.com/logo_comets.png"),
        FixtureResponse(event_key: 1010, event_date: "2025-05-13", event_time: "19:00", event_home_team: "Bulls United", event_away_team: "Rhinos", event_final_result: nil, event_status: "", home_team_logo: "https://example.com/logo_bulls.png", away_team_logo: "https://example.com/logo_rhinos.png"),
        FixtureResponse(event_key: 1011, event_date: "2025-05-14", event_time: "15:30", event_home_team: "Spartans", event_away_team: "Gladiators", event_final_result: nil, event_status: "", home_team_logo: "https://example.com/logo_spartans.png", away_team_logo: "https://example.com/logo_gladiators.png"),
        FixtureResponse(event_key: 1012, event_date: "2025-05-14", event_time: "18:00", event_home_team: "Centaurs", event_away_team: "Griffins", event_final_result: nil, event_status: "", home_team_logo: "https://example.com/logo_centaurs.png", away_team_logo: "https://example.com/logo_griffins.png"),
        FixtureResponse(event_key: 1013, event_date: "2025-05-15", event_time: "12:00", event_home_team: "Panthers", event_away_team: "Cobras", event_final_result: nil, event_status: "", home_team_logo: "https://example.com/logo_panthers.png", away_team_logo: "https://example.com/logo_cobras.png"),
        FixtureResponse(event_key: 1014, event_date: "2025-05-15", event_time: "15:00", event_home_team: "Vikings", event_away_team: "Raiders", event_final_result: nil, event_status: "", home_team_logo: "https://example.com/logo_vikings.png", away_team_logo: "https://example.com/logo_raiders.png"),
        FixtureResponse(event_key: 1015, event_date: "2025-05-15", event_time: "19:30", event_home_team: "Eagles", event_away_team: "Hawks", event_final_result: nil, event_status: "", home_team_logo: "https://example.com/logo_eagles.png", away_team_logo: "https://example.com/logo_hawks.png")
    ]
    
    let teams: [TeamRsponse] = [
        TeamRsponse(
            team_name: "Lions FC",
            team_logo: "https://example.com/logo_lions.png",
            players: [
                Player(
                    player_image: "https://example.com/player1.png",
                    player_name: "John Smith",
                    player_number: "10",
                    player_type: "Forward"
                )
            ]
        ),
        TeamRsponse(
            team_name: "Sharks United",
            team_logo: "https://example.com/logo_sharks.png",
            players: [
                Player(
                    player_image: "https://example.com/player2.png",
                    player_name: "Carlos Mendes",
                    player_number: "5",
                    player_type: "Defender"
                )
            ]
        )
    ]

    //----

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SectionHeader.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")

        self.title = "UFE Champion Matches"
            let rightButton = UIButton(type: .system)
            rightButton.setImage(UIImage(systemName: "heart"), for: .normal)
            rightButton.tintColor = .green
            rightButton.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
            let rightButtonItem = UIBarButtonItem(customView: rightButton)
            self.navigationItem.rightBarButtonItem = rightButtonItem
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGreen
            ]
            navigationController?.navigationBar.titleTextAttributes = textAttributes
        /*
         pre Screen
         let backItem = UIBarButtonItem()
             backItem.title = ""
             navigationItem.backBarButtonItem = backItem
         */
        
        navigationController?.navigationBar.tintColor = UIColor.systemGreen
        
        
        let layout = UICollectionViewCompositionalLayout{index ,environement in
          
            switch(index)
            {
            case 0:
                return self.drawHorezntalSection()
            case 1:
                return self.drawVerticalSection()
            case 2:
                return self.drawHorezntalSection()
            default:
                return nil
            }
            
        }
        self.collectionView.setCollectionViewLayout(layout, animated: true)
    }
    @objc func rightButtonClicked() {
        print("rightButton button tapped!")
    }
    
    func drawHorezntalSection() -> NSCollectionLayoutSection{
     //item size
        
        let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
       // item >> size
       let item = NSCollectionLayoutItem(layoutSize: bigItemSize)
      //groupsize
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
       //group >> size , item
        let myGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        myGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
       //section >> group
     let section = NSCollectionLayoutSection(group: myGroup)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 0)
        //------ animation ----
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.8
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
            
        }
        // Add header
           let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
           let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
               layoutSize: headerSize,
               elementKind: UICollectionView.elementKindSectionHeader,
               alignment: .top
           )
           section.boundarySupplementaryItems = [sectionHeader]

        return section
    }
    
    func drawVerticalSection() -> NSCollectionLayoutSection {
        // Item sizes
        let bigItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        

        // Items
        let bigItem = NSCollectionLayoutItem(layoutSize: bigItemSize)

        // Group: horizontal group combining big and small items
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(200)
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [bigItem]
        )
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 0)

        // Optional animation effect (can be kept if desired)
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midY - offset.y) - environment.container.contentSize.height / 2.0)
                let minScale: CGFloat = 0.8
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.height), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        section.boundarySupplementaryItems = [sectionHeader]

        return section
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch(section)
        {
        case 0:
            return upcomingFixtures.count
        case 1:
            return finishedFixtures.count
        case 2:
            return teams.count
        default:
            return 1
        }
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
                   guard kind == UICollectionView.elementKindSectionHeader else {
                       return UICollectionReusableView()
                   }
                   
                   let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! SectionHeader
                   switch indexPath.section {
                   case 0:
                       
                           headerView.titleLabel.text = "Upcoming Matches"
                   case 1:
                           headerView.titleLabel.text = "Latest Matches"
                   case 2:
                           headerView.titleLabel.text = "Teams"
                   default:
                       headerView.titleLabel.text = ""
                   }
                   
                   return headerView
               }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
                    return CGSize(width: collectionView.bounds.width, height: 50)
                }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var match :FixtureResponse!
        switch(indexPath.section)
        {
        case 0: //get data from upcoming list
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leagueCell", for: indexPath) as! MatcheCollectionViewCell
            match = upcomingFixtures[indexPath.row]
            cell.leftImg.image = UIImage(named: "cricket")
            cell.rightImg.image = UIImage(named: "Instagram")
            cell.leftLabel.text = match.event_home_team
            cell.rightLabel.text = match.event_away_team
            cell.dateLabel.text = match.event_date
            cell.timeLabel.text = match.event_time
            cell.resultLabel.text = ""
            // Configure the cell
            cell.layer.cornerRadius = 20
            cell.clipsToBounds = true
            cell.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.6)
            return cell
        case 1: //get data from Latest Events list
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leagueCell", for: indexPath) as! MatcheCollectionViewCell
            match = finishedFixtures[indexPath.row]
            cell.leftImg.image = UIImage(named: "cricket")
            cell.rightImg.image = UIImage(named: "Instagram")
            cell.leftLabel.text = match.event_home_team
            cell.rightLabel.text = match.event_away_team
            cell.dateLabel.text = match.event_date
            cell.timeLabel.text = match.event_time
            cell.resultLabel.text = match.event_final_result

            // Configure the cell
            cell.layer.cornerRadius = 20
            cell.clipsToBounds = true
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
            let team = teams[indexPath.row]
            cell.teamImg.image = UIImage(named: "Instagram")
            cell.teamName.text = team.team_name
            cell.layer.cornerRadius = 20
            cell.clipsToBounds = true
            cell.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.6)

            return cell
        
        }
    
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2{
            print("Team Clicked")
            
            /*
             let teamVC = self.storyboard?.instantiateViewController(withIdentifier: "teamDetails") as! TeamDetailsViewController
             navigationController?.pushViewController(teamVC, animated: true)

             */
        }
        
    }

}
