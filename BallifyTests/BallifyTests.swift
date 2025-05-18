//
//  BallifyTests.swift
//  BallifyTests
//
//  Created by Macos on 18/05/2025.
//

import XCTest
@testable import Ballify

final class BallifyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
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
    

}
