//
//  TeamResponse.swift
//  Ballify
//
//  Created by Hany on 12/05/2025.
//

import Foundation
struct TeamRsponse{
    let team_name : String
    let team_logo : String
    let players :[Player]
}

struct Player{
    let player_image : String
    let player_name : String
    let player_number : String
    let player_type : String
}
