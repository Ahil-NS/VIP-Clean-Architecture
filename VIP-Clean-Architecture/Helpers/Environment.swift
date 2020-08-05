//
//  Environment.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import Foundation

enum PlistKeys {
    static let baseURL = "BASE_URL"
    static let resourceId = "RESOURCE_ID"
}

public enum Environment {
    
    private static let infoDictionary: [String: Any] = {
        guard let dictionary = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dictionary
    }()
    
    static let baseURL: URL = {
        guard let baseURLString = Environment.infoDictionary[PlistKeys.baseURL] as? String else {
            fatalError("Base URL not set in plist")
        }
        guard let url = URL(string: baseURLString) else {
            fatalError("Invalid URL")
        }
        return url
    }()
    
    static let resourceId: String = {
        guard let resourceId = Environment.infoDictionary[PlistKeys.resourceId] as? String else {
            fatalError("resourceId not set in plist")
        }
        return resourceId
    }()
}
