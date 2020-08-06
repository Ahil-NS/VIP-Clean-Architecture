//
//  MockApiClient.swift
//  VIP-Clean-ArchitectureTests
//
//  Created by Ahil Ahilendran on 6/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import XCTest
@testable import VIP_Clean_Architecture

class MockApiClient {
    
    func mockResponse() -> SPHDataResponse.DataUsage? {
        if let path = Bundle.main.path(forResource: "response_success", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return try JSONDecoder().decode(SPHDataResponse.DataUsage.self, from: data)
            } catch {
                print("unableToDecode.rawValue")
            }
        }
        return nil
    }
}
