//
//  BallifyTests.swift
//  BallifyTests
//
//  Created by Macos on 18/05/2025.
//

import XCTest
@testable import Ballify

final class BallifyTests: XCTestCase {

 
    
    
    func testFetchLeaguesFromJSONCount(){
        let expectation = expectation(description: "Waiting for api")

        NetworkService.fetchLeaguesFromJSON(sportType: SportType.football.rawValue){ result in
            if result == nil {
                XCTFail()
            }else {
                XCTAssertEqual(result?.result.count, 943)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }
    
    func testFetchLeaguesFromJSONLeagueName(){
        let expectation = expectation(description: "Waiting for api")

        NetworkService.fetchLeaguesFromJSON(sportType: SportType.football.rawValue){ result in
            if result == nil {
                XCTFail()
            }else {
                XCTAssertEqual(result?.result[0].league_name, "UEFA Europa League")
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }

    // test using la liga -- Spain League
    func testFetchFixtureFromJSONCount(){
        let expectation = expectation(description: "Waiting for api")

        NetworkService.fetchFixtureFromJSON(sportType: SportType.football.rawValue, leagueId: 302){ result in
            if result == nil {
                XCTFail()
            }else {
                XCTAssertEqual(result?.result?.count, 14)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }
    
    // test using la liga -- Spain League
    func testFetchFixtureFromJSONByCountryName(){
        let expectation = expectation(description: "Waiting for api")

        NetworkService.fetchFixtureFromJSON(sportType: SportType.football.rawValue, leagueId: 302){ result in
            if result == nil {
                XCTFail()
            }else {
                XCTAssertEqual(result?.result?[0].country_name, "Spain")
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }
    
    
    // test TeamCount using la liga -- Spain League
    func testFetchTeamsFromJSONCount(){
        let expectation = expectation(description: "Waiting for api")

        NetworkService.fetchTeamsFromJSON(sportType: SportType.football.rawValue, leagueId: 302){ result in
            if result == nil {
                XCTFail()
            }else {
                XCTAssertEqual(result?.count, 20) //20
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }
    
    // test Fetch Team using la liga -- Spain League
    func testFetchTeamsFromJSONByTeamName(){
        let expectation = expectation(description: "Waiting for api")

        NetworkService.fetchTeamsFromJSON(sportType: SportType.football.rawValue, leagueId: 302){ result in
            if result == nil {
                XCTFail()
            }else {
                XCTAssertEqual(result?[0].team_name, "Atletico Madrid")
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 3)
    }


}
