//
//  ProductEndPoint.swift
//  ZUKI
//
//  Created by Kegham Karsian on 9/12/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

enum ProductApi {
    case getScannedProduct(code: String)
}

extension ProductApi: EndPointType {
    
    var enviromentBasedUrl : String {
        switch NetworkManager.enviroment {
        case .testing:
            switch NetworkManager.languageURL {
            case .world:
                return "https://world.openfoodfacts.net/api/v0/product/"
            case .ar:
                return "https://ar.openfoodfacts.net/api/v0/product/"
            case .fr:
                return "https://fr.openfoodfacts.net/api/v0/product/"
            case .de:
                return "https://de.openfoodfacts.net/api/v0/product/"
            }
            
        case .production:
            switch NetworkManager.languageURL {
            case .world:
                return "https://world.openfoodfacts.org/api/v0/product/"
            case .ar:
                return "https://ar.openfoodfacts.org/api/v0/product/"
            case .fr:
                return "https://fr.openfoodfacts.org/api/v0/product/"
            case .de:
                return "https://de.openfoodfacts.org/api/v0/product/"
            }
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
