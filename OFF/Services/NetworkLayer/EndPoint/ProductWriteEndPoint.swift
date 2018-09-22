//
//  ProductWriteEndPoint.swift
//  OpenFoodFactsSDK
//
//  Created by Kegham Karsian on 9/19/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

enum ProductWriteApi {
    case addOFFProduct(product: OFFProduct)
}


extension ProductWriteApi: EndPointType {
    
    var writeEnviromentBasedUrl: String {
        switch NetworkManager.enviroment {
        case .testing:
            switch NetworkManager.languageURL {
            case .world:
                return "https://world.openfoodfacts.net/cgi/product_jqm2.pl"
            case .ar:
                return "https://ar.openfoodfacts.net/cgi/product_jqm2.pl"
            case .fr:
                return "https://fr.openfoodfacts.net/cgi/product_jqm2.pl"
            case .de:
                return "https://de.openfoodfacts.net/cgi/product_jqm2.pl"
            }
        case .production:
            switch NetworkManager.languageURL {
            case .world:
                return "https://world.openfoodfacts.org/cgi/product_jqm2.pl"
            case .ar:
                return "https://ar.openfoodfacts.org/cgi/product_jqm2.pl"
            case .fr:
                return "https://fr.openfoodfacts.org/cgi/product_jqm2.pl"
            case .de:
                return "https://de.openfoodfacts.org/cgi/product_jqm2.pl"
            }
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .addOFFProduct(let product):
            var parameters = Parameters()
            let code = product.code!
            let username = NetworkManager.username
            let password = NetworkManager.password
            
            let productValues = [/*code, username, password, */product.genericName, product.productName, product.categoriesText, product.countriesText, product.additivesText, product.ingredientText, product.quantity, product.brandsText, product.storesText, product.labelsText, username]
            
            let keyArray = [/*Constants.OffProduct.code, Constants.username, Constants.password ,*/Constants.OffProduct.genericName, Constants.OffProduct.productName, Constants.OffProduct.categoriesText, Constants.OffProduct.countriesText, Constants.OffProduct.additivesText, Constants.OffProduct.ingredientText, Constants.OffProduct.quantity, Constants.OffProduct.brandsText, Constants.OffProduct.storesText, Constants.OffProduct.labelsText, Constants.OffProduct.lastModifiedBy]
            
            parameters.updateValue(code, forKey: Constants.OffProduct.code)
            parameters.updateValue(username, forKey: Constants.username)
            parameters.updateValue(password, forKey: Constants.password)
            
            
            (0..<productValues.count).forEach {
                if let value = productValues[$0] {
                    parameters.updateValue(value, forKey: keyArray[$0])
                }
            }

            print(parameters)

            return parameters
        }
    }
    
    var baseUrl: URL {
        guard let url = URL(string: writeEnviromentBasedUrl) else {fatalError("writeBaseURL could not be configured.")}
        return url
    }
    
    var path: String {
        return ""
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .requsetParameters(bodyParameters: nil, urlParameters: parameters)
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    
}
