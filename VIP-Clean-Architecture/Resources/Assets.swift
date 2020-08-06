//
//  Assets.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import Foundation

typealias SPHAssets = SPHImageAssets.AssetString

struct SPHImageAssets {
    
    enum AssetString: String {
        case downIcon = "down-icon"
        
        var value: String {
            return self.rawValue
        }
    }
}
