//
//  TeamCollectionViewCell.swift
//  Ballify
//
//  Created by Hany on 12/05/2025.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    override func layoutSubviews() {
        teamImg.layer.cornerRadius = teamImg.frame.size.width / 2
           teamImg.clipsToBounds = true
    }
}
