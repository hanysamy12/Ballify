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
    
    
    
    
    
    
}
