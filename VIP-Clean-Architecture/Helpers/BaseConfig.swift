//
//  BaseConfig.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit

typealias Conf = NSConfigurator

protocol NSBaseConfig {
    func configure(viewController: UIViewController)
}

class NSConfigurator {
    private static var privateShared: NSConfigurator = NSConfigurator()
    static let shared: NSConfigurator = {
        return privateShared
    }()
}
