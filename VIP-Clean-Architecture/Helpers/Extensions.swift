//
//  Extensions.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import Foundation

extension Collection {
    
    public subscript (safe index: Index) -> Element? {
        return (self.count > distance(from: startIndex, to: index)) ? self[index] : nil
    }
}

extension Array {
    func group<U: Hashable>(by key: (Element) -> U) -> [[Element]] {
        var indexKeys = [U : Int]()
        
        var groupedArray = [[Element]]()
        for element in self {
            let key = key(element)
            
            if let ind = indexKeys[key] {
                groupedArray[ind].append(element)
            }
            else {
                groupedArray.append([element])
                indexKeys[key] = groupedArray.count - 1
            }
        }
        return groupedArray
    }
}
