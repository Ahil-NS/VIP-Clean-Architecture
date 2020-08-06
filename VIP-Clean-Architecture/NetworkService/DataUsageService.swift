//
//  DataUsageService.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import Foundation
import Moya

public enum DataUsageService {
    case getDataUsage(offset: Int, limit: Int = 10, resourceId: String)
}

extension DataUsageService: TargetType {
    public var baseURL: URL {
        switch self {
        case .getDataUsage:
            return Environment.baseURL
        }
    }
    
    public var path: String {
        switch self {
        case .getDataUsage : return MicroServicePaths.dataUsage
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getDataUsage: return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getDataUsage:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var parameters: [String: Any] {
        switch self {
        case .getDataUsage(let offset,let limit,let resourceId):
            return ["offset": offset, "limit": limit, "resource_id": resourceId]
        }
    }
}

