//
//  FixtureResponse.swift
//  Ballify
//
//  Created by Hany on 12/05/2025.
//

import Foundation
struct FixtureResponse :Codable {
    let success: Int
    let result :[Fixture]?
}

struct Fixture : Codable{
    let event_key: Int
    let event_date: String
    let event_time: String
    let event_home_team: String
    let event_away_team: String
    let event_final_result: String
    let event_status: String
    let home_team_logo: String
    let away_team_logo: String
    
}

/*
 in Presnter
 for result in fixtures {
 if result.event_ft_result == "" {
     self.upcomingFixtures.append(result)
 } else {
     self.latestMatch.append(result)
 }
}
 */
