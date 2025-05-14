//
//  LeagueDetailsPresenter.swift
//  Ballify
//
//  Created by Hany on 13/05/2025.
//

import Foundation

class LeagueDetailsPresenter{
    
    var leagueDetailsVC : MatchesCollectionViewController!
    
    func attachToView(leagaDetailsVC : MatchesCollectionViewController)
    {
        self.leagueDetailsVC = leagaDetailsVC
    }
    
    func getLeagueDetails(sportType : String, leagueId: Int){
        var finishedFixture : [Fixture] = []
        var upcomingFixture : [Fixture] = []
        print("League Details Presenter \(sportType)\(leagueId)")
        NetworkService.fetchFixtureFromJSON(sportType: sportType, leagueId: leagueId){ fixtures in
            guard let fixtures = fixtures else {return}
           // print("League Details Presenter Network Call\(fixtures)")
            if let fixtureList = fixtures.result {
                //print("League Details Presenter Fixture List \(fixtures.result!)")
                for f in fixtureList {
                  //  print("F === \(f)")
                    if f.event_final_result == "" || f.event_final_result == "-"{
                        upcomingFixture.append(f)
                    } else {
                        finishedFixture.append(f)
                    }
                }
                self.leagueDetailsVC.renderToView(finitshedMaches: finishedFixture, upcomingMatches: upcomingFixture)
            } else {
                print("No fixtures found.")
            }

        }
    }
    
    func getTeamDetails(sportType:String, leagueId: Int) {
       // print("Team Details Presenter \(leagueId)")
        
        NetworkService.fetchTeamsFromJSON(sportType:sportType, leagueId: leagueId) { teamList in
            guard let teamList = teamList else { return }
            self.leagueDetailsVC.renderTeamToView(teams: teamList)
        }
    }
}
