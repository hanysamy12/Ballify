//
//  TeamResponse.swift
//  Ballify
//
//  Created by Hany on 12/05/2025.
//

import Foundation

struct TeamResponse: Codable {
    let result: [Team]
}

struct Team : Codable{
    let team_name : String?
    let team_logo : String?
    let players :[Player]?
}

struct Player : Codable{
    let player_image : String?
    let player_name : String?
    let player_number : String?
    let player_type : String?
}
