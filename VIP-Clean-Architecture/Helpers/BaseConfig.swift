//
//  BaseConfig.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit

typealias Conf = PConfigurator

protocol PPBaseConfig {
    func configure(viewController: UIViewController)
}
class PConfigurator {
    private static var privateShared: PConfigurator = PConfigurator()
    static let shared: PConfigurator = {
        return privateShared
    }()
}
