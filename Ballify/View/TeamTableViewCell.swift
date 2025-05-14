//
//  TeamTableViewCell.swift
//  Ballify
//
//  Created by Macos on 14/05/2025.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var playerImg: UIImageView!
    
    
    @IBOutlet weak var playerName: UILabel!
    
    @IBOutlet weak var playerPosition: UILabel!
    
    @IBOutlet weak var playerNum: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
