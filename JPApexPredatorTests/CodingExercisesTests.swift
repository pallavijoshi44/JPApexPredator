//
//  ApexPredator.swift
//  JPApexPredatorTests
//
//  Created by Pallavi Joshi on 02/09/2024.
//

import XCTest
@testable import JPApexPredator

final class CodingExercisesTests: XCTestCase {

    func test() throws {
        var exercise = CodingExercises()
        
        let result = exercise.sortAndFilter(["Toothless", "tiger", "skunk", "raccoon", "lion", "Big Bird", "bear", "baboon"])
        
        XCTAssertEqual(result,["Toothless", "tiger", "skunk", "raccoon", "lion", "Big Bird", "bear", "baboon"])
    }

    func test2() throws {
        var exercise = CodingExercises()
        
        
        let result = exercise.sortAndFilter(["Toothless", "tiger", "skunk", "raccoon", "Old Yeller", "lion", "eagle", "Big Bird", "bear", "baboon", "aardvark"])
        
        XCTAssertEqual(result,["Toothless", "tiger", "skunk", "raccoon", "lion", "Big Bird", "bear", "baboon"])
    }

}
