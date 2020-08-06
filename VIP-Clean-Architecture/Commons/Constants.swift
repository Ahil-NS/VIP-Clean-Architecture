//
//  Constants.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit

typealias SPHL = SPHConstants.SPHLoacalisation

struct SPHConstants {
    
    static var limit = 10
    static var spacingConstaraint40: CGFloat = 40
    
    enum SPHLoacalisation: String {
        case decreasedMessage = "decreasedMessage"
        case tableviewIdentifier = "table--dataConsumptionTableView"
        case downButtonIdentifier = "button--downButton"
        case title = "Mobile Data Usage"
        case decreaseMsg = "Decrease in volume data."
        case okay = "OK"
        case year = "Year:"
        case tryAgain = "Please try Again"
        var localized: String {
            return self.rawValue
        }
    }
}
