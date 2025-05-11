//
//  MatchesCollectionViewController.swift
//  Ballify
//
//  Created by Hany on 12/05/2025.
//

import UIKit

private let reuseIdentifier = "leagueCell"

class MatchesCollectionViewController: UICollectionViewController {
    let sectionTitles = ["Upcomming Events", "Latest Events", "Old Events"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UICollectionReusableView.self,                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,                               withReuseIdentifier: "Header")
        
        
            let rightButton = UIButton(type: .system)
            rightButton.setImage(UIImage(systemName: "heart"), for: .normal)
            rightButton.tintColor = .red
            rightButton.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
            let rightButtonItem = UIBarButtonItem(customView: rightButton)
            self.navigationItem.rightBarButtonItem = rightButtonItem
        self.title = "UFE Champion Matches"
        
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
        // Handle the button tap (e.g., toggle favorite status, show alert, etc.)
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
        section.contentInsets = NSDirectionalEdgeInsets(top: 100, leading: 16, bottom: 16, trailing: 0)
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
            return 10
        case 1:
            return 8
        case 2:
            return 7
        default:
            return 1
        }
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {


        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }

        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                withReuseIdentifier: "Header",  for: indexPath)

        header.subviews.forEach { $0.removeFromSuperview() }

        let label = UILabel(frame: CGRect(x: 16, y: 0, width: collectionView.bounds.width, height: 44))
        label.font = .boldSystemFont(ofSize: 18)
        label.text = sectionTitles[indexPath.section]
        header.addSubview(label)

        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MatcheCollectionViewCell
        cell.leftImg.image = UIImage(named: "cricket")
        cell.rightImg.image = UIImage(named: "Instagram")
        cell.leftLabel.text = "Left"
        cell.rightLabel.text = "right"
        cell.dateLabel.text = "2025-6-30"
        cell.timeLabel.text = "11:3"
        // Configure the cell
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true
        return cell
    }



}
