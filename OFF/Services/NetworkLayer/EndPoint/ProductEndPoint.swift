//
//  ProductEndPoint.swift
//  ZUKI
//
//  Created by Kegham Karsian on 9/12/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

enum NetworkEnviroment {
    case testing
    case production
}

enum ProductApi {
    case getScannedProduct(code: String)
}

extension ProductApi: EndPointType {
    
    var enviromentBasedUrl : String {
        switch NetworkManager.enviroment {
        case .testing:
            return "https://world.openfoodfacts.org/api/v0/product/"
        case .production:
            return "https://world.openfoodfacts.org/api/v0/product/"
        }
    }
    
    var baseUrl: URL {
        guard let url = URL(string: enviromentBasedUrl) else {fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .getScannedProduct(let code):
            return code
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .request
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
