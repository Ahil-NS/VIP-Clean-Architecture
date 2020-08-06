//
//  Constants.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import Foundation

typealias SPHL = SPHConstants.SPHLoacalisation

struct SPHConstants {
    
    enum SPHLoacalisation: String {
        case decreasedMessage = "decreasedMessage"
        
        var localized: String {
            return self.rawValue
        }
    }
}
