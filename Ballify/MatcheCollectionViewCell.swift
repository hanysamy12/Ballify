//
//  MatcheCollectionViewCell.swift
//  Ballify
//
//  Created by Hany on 12/05/2025.
//

import UIKit

class MatcheCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var leftImg: UIImageView!
    @IBOutlet weak var rightImg: UIImageView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func layoutSubviews() {
        leftImg.layer.cornerRadius = leftImg.frame.size.width / 2
           leftImg.clipsToBounds = true
        
        rightImg.layer.cornerRadius = leftImg.frame.size.width / 2
           leftImg.clipsToBounds = true
    }
}
