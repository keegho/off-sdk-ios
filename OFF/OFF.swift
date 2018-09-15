//
//  OpenFoodFacts.swift
//  OFF
//
//  Created by Kegham Karsian on 9/15/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

public class OFF {
    
    private let offProduct = Router<ProductApi>()
    
    ///Choose the API enviroment for testing login is needed
    public var enviroment: NetworkEnviroment
    {
        get {
            return NetworkManager.enviroment
        } set(newEnv) {
            NetworkManager.enviroment = newEnv
        }
        
    }
    
    ///Choose api key "NOT USABLE NOW"
    public var key: String
    {
        get {
            return NetworkManager.apiKey
        } set(newKey) {
            NetworkManager.apiKey = newKey
        }
        
    }
    
    ///Choose the url language prefix
    public var lanugageUrl: LanguageURL {
        get {
            return NetworkManager.languageURL
        } set(newLang) {
            NetworkManager.languageURL = newLang
        }
    }
    
    public init(){}
    
    /**
     Use this function after scanning the product code.
     
     - Parameter code: String barcode number.
     - Parameter completion: A completion handler
     - Returns: product or error message
     
     */
    public func getProduct(code: String, completion:@escaping(_ product:Product?, _ err: String?) ->()){
        offProduct.request(.getScannedProduct(code: code)) { (data, response, err) in
            if err != nil {
                completion(nil, "Please check your network connection")
            }
            
            if let reponse = response as? HTTPURLResponse {
                let result = handelNetworkResponse(reponse)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(ProductResponse.self, from: responseData)
                        if apiResponse.status == 1 {
                            completion(apiResponse.product, nil)
                        } else if apiResponse.status == 0{
                            completion(nil, "Product not found")
                        }
                    }catch(let error) {
                        completion(nil, "\(error.localizedDescription)")
                    }
                case .failure(let failureError):
                    completion(nil, failureError)
                }
            }
        }
    }
}
