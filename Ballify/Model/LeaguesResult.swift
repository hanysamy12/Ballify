//
//  LeaguesResult.swift
//  Ballify
//
//  Created by Macos on 12/05/2025.
//

import Foundation


struct LeaguesResult: Codable{
    var result: [League]
    var success: Int
}

struct League: Codable{
    var league_key: Int
    var league_name: String
    var league_year: String?
    var country_key: Int?
    var country_name: String?
    var league_logo: String?
    var country_logo: String?
    var sportType: String?
}
