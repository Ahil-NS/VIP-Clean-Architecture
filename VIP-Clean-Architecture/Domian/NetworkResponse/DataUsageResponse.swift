//
//  DataUsageResponse.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import Foundation

public typealias SPHDataResponse = MobileDataUsage.DataUsage

public struct MobileDataUsage {
    // MARK: - Welcome
    public struct DataUsage: Codable {
        let help: String?
        let success: Bool?
        let result: Result?
    }
    
    // MARK: - Result
    struct Result: Codable {
        let resourceID: String?
        let fields: [Field]?
        let records: [Record]?
        let links: Links?
        let limit, total, offset: Int?
        
        enum CodingKeys: String, CodingKey {
            case resourceID = "resource_id"
            case fields, records
            case links = "_links"
            case limit, total, offset
        }
    }
    
    // MARK: - Field
    struct Field: Codable {
        let type, id: String?
    }
    
    // MARK: - Links
    struct Links: Codable {
        let start, next: String?
    }
    
    // MARK: - Record
    struct Record: Codable {
        let volumeOfMobileData, quarter: String?
        let id: Int?
        
        var year: String {
            return self.quarter?.components(separatedBy: "-").first ?? ""
        }
        var quarterStr: String {
            return self.quarter?.components(separatedBy: "-").last ?? ""
        }
        
        enum CodingKeys: String, CodingKey {
            case volumeOfMobileData = "volume_of_mobile_data"
            case quarter
            case id = "_id"
        }
    }
}
