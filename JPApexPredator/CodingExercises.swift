//
//  CodingExercises.swift
//  JPApexPredator
//
//  Created by Pallavi Joshi on 02/09/2024.
//

import Foundation

class CodingExercises {
    
    func sortAndFilter(_ stringArray: [String]) -> [String] {
        var filtered = stringArray.filter { x in
            !(x.lowercased().hasPrefix( "a")
            || x.lowercased().hasPrefix("e")
              || x.lowercased().hasPrefix( "i")
              || x.lowercased().hasPrefix("o")
              || x.lowercased().hasPrefix("u"))
            
        }
        filtered.sort { (x, y) in
            x.lowercased() > y.lowercased()
        }
        return filtered
    }
    
}
