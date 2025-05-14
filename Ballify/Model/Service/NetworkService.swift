//
//  NetworkService.swift
//  Ballify
//
//  Created by Macos on 12/05/2025.
//

import Foundation
import Alamofire

protocol NetworkProtocol {
    static func fetchLeaguesFromJSON(sportType:String, compilationHandler: @escaping (LeaguesResult?) -> Void)
    static func fetchFixtureFromJSON(sportType:String , leagueId : Int, compilation : @escaping (FixtureResponse?) -> Void)
    static func fetchTeamsFromJSON(leagueId: Int, compilation: @escaping ([Team]?) -> Void) 

}

class NetworkService: NetworkProtocol {
    
    static func fetchLeaguesFromJSON(sportType:String, compilationHandler: @escaping (LeaguesResult?) -> Void) {
        
        let url = "https://apiv2.allsportsapi.com/\(sportType)"
        print(url)
        let parameters: [String: String] = [
            "met": "Leagues",
            "APIkey": "ada750b74f80bd1937fae4524ced00601c971ee2f1b4f22f9c2d8050a8e19ed1"
        ]
        
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]

        
        AF.request(url, parameters: parameters, headers: headers).responseDecodable(of: LeaguesResult.self) { response in
            switch response.result {
            case .success(let result):
                compilationHandler(result)
            case .failure(let error):
                print("Failed to fetch leagues: \(error.localizedDescription)")
                compilationHandler(nil)
            }
        }
    }
    
    static func fetchFixtureFromJSON(sportType: String, leagueId: Int, compilation: @escaping (FixtureResponse?) -> Void) {
        // Construct the URL with query parameters
        let url = "https://apiv2.allsportsapi.com/\(sportType)/?met=Fixtures&APIkey=ada750b74f80bd1937fae4524ced00601c971ee2f1b4f22f9c2d8050a8e19ed1&from=2025-05-11&to=2025-05-16&leagueId=\(leagueId)"
        print("NetworkServices \(url)")
        
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        // Making the request
        AF.request(url, headers: headers).responseDecodable(of: FixtureResponse.self) { response in
            switch response.result {
            case .success(let result):
                compilation(result)
            case .failure(let error):
                print("Failed to fetch leagueDetails: \(error.localizedDescription)")
                compilation(nil)
            }
        }
    }
    
    static func fetchTeamsFromJSON(leagueId: Int, compilation: @escaping ([Team]?) -> Void) {
        let url = "https://apiv2.allsportsapi.com/football/?met=Teams&leagueId=\(leagueId)&APIkey=610a521a58aecd03ccaec21bfe628495b12cf9501f236731a5bac15ae3211843"
        
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
//        AF.request(url, method: .get, headers: headers).responseData { response in
//                switch response.result {
//                case .success(let data):
//                    if let jsonString = String(data: data, encoding: .utf8) {
//                        print("Team Raw JSON response: \(jsonString)")
//                    }
//                    do {
//                        let result = try JSONDecoder().decode(TeamResponse.self, from: data)
//                        compilation(result.result)
//                    }
//                    catch {
//                        print("Decoding error: \(error.localizedDescription)")
//                        compilation(nil)
//                    }
//                    }
//                case .failure(let error):
//                    print("Team Request failed: \(error.localizedDescription)")
//                    compilation(nil)
//                }
//            }

        
        AF.request(url, headers: headers).responseDecodable(of: TeamResponse.self) { response in
            switch response.result {
            case .success(let result):
                compilation(result.result)
            case .failure(let error):
                print("Failed to fetch Matches: \(error.localizedDescription)")
                compilation(nil)
            }
        }
    }


}

