//
//  MatchesCollectionViewController.swift
//  Ballify
//
//  Created by Hany on 12/05/2025.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "leagueCell"

class MatchesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    ///------------
    var finishedFixtures: [Fixture] = [ ]

    var upcomingFixtures: [Fixture] = []
    
    var sportType: SportType!
    
    var leagueId : Int!
    var leagueName : String!
    var teams: [Team] = []


    //----

    override func viewDidLoad() {
        super.viewDidLoad()
//        sportType = SportType.football
        let presenter = LeagueDetailsPresenter()
        presenter.attachToView(leagaDetailsVC: self)
        switch sportType {
        case .football:
            print("Calling Football API")
            self.title = "Football Leagues"
            presenter.getLeagueDetails(sportType: sportType.rawValue, leagueId: self.leagueId)
            presenter.getTeamDetails(sportType: sportType.rawValue, leagueId: leagueId)
        case .tennis:
            print("Calling Tennis API")
            self.title = "Tennis Leagues"
            presenter.getLeagueDetails(sportType: sportType.rawValue, leagueId: self.leagueId)
        case .basketball:
            print("Calling Basketball API")
            self.title = "Basketball Leagues"
            presenter.getLeagueDetails(sportType: sportType.rawValue, leagueId: self.leagueId)
        case .cricket:
            print("Calling Cricket API")
            self.title = "Cricket Leagues"
            presenter.getLeagueDetails(sportType: sportType.rawValue, leagueId: self.leagueId)
        case .none:
            break
        }
        
        collectionView.register(SectionHeader.self,forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")

        self.title = leagueName
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
    
    func renderToView(finitshedMaches :[Fixture], upcomingMatches : [Fixture]){
       // print("Matches Details rederView \(finitshedMaches[0].event_status)")
        self.finishedFixtures = finitshedMaches
        self.upcomingFixtures = upcomingMatches
        collectionView.reloadData()
    }
    func renderTeamToView(teams : [Team])
    {
        self.teams = teams
        print("Collectiion View teams Count = \(teams.count)")
        collectionView.reloadData()
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
        var match :Fixture!
        switch(indexPath.section)
        {
        case 0: //get data from upcoming list
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leagueCell", for: indexPath) as! MatcheCollectionViewCell
            match = upcomingFixtures[indexPath.row]
            
            cell.leftImg.kf.setImage(with: URL(string: match.home_team_logo ?? ""), placeholder: UIImage(named: "laliga"))
            cell.rightImg.kf.setImage(with:URL(string: match.away_team_logo ?? ""), placeholder: UIImage(named: "laliga"))
            if sportType == .tennis
            {
                cell.leftLabel.text = match.event_first_player
                cell.rightLabel.text = match.event_home_team
            }else{
                cell.leftLabel.text = match.event_home_team
                cell.rightLabel.text = match.event_away_team
            }
            
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
            cell.leftImg.kf.setImage(with:URL(string: match.home_team_logo ?? ""), placeholder: UIImage(named: "laliga"))
            cell.rightImg.kf.setImage(with:URL(string: match.away_team_logo ?? ""), placeholder: UIImage(named: "laliga"))
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
            cell.teamImg.kf.setImage(with: URL(string: team.team_logo ?? ""),placeholder: UIImage(named: "laliga"))
            cell.teamName.text = team.team_name
            cell.layer.cornerRadius = 20
            cell.clipsToBounds = true
            cell.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.6)

            return cell
        
        }
    
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2{ /// teams only
            print("Team Clicked")
            let team = teams[indexPath.row]
            print("\(team.team_name!)")
            
            let teamVC = self.storyboard?.instantiateViewController(withIdentifier: "teamDetails") as! TeamTableViewController
            teamVC.teamData = teams[indexPath.row]
            navigationController?.pushViewController(teamVC, animated: true)

             
        }
        
    }

}
