//
//  OpenFoodFacts.swift
//  OFF
//
//  Created by Kegham Karsian on 9/15/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

public enum WriteStatus {
    case success
    case failure
}

public class OFF {
    
    private let offRead = Router<ProductReadApi>()
    private let offWrite = Router<ProductWriteApi>()
    
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
    
    ///Choose username "USERABLE FOR WRITE"
    public var username: String
    {
        get {
            return NetworkManager.username
        } set(newKey) {
            NetworkManager.username = newKey
        }
        
    }
    
    ///Choose password "USERABLE FOR WRITE"
    public var password: String
    {
        get {
            return NetworkManager.password
        } set(newKey) {
            NetworkManager.password = newKey
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
    
    ///Choose language of the product you will display
    public var productLanguage: ProductLang {
        get {
            return LanguageManager.productLanguage
        }set(newProductLanguage) {
            LanguageManager.productLanguage = newProductLanguage
        }
    }
    
    public init(){}
    
    /**
     Use this function after scanning the product code.
     
     - Parameter code: String barcode number.
     - Parameter completion: A completion handler
     - Returns: product or error message
     
     */
    public func getProduct(code: String, completion:@escaping(_ product:OFFProduct?, _ err: String?) ->()){
        offRead.request(.getScannedProduct(code: code), requestType: .read) { (data, response, err) in
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
                        if apiResponse.status == .found {
                            completion(apiResponse.product, nil)
                        } else if apiResponse.status == .notFound{
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
    
    public func addProduct(product: OFFProduct, completion:@escaping(_ status:WriteStatus, _ err: String?) ->()){
        offWrite.request(.addOFFProduct(product: product), requestType: .write) { (data, response, err) in
            if err != nil {
                completion(.failure, "Please check your network connection")
            }
            if let reponse = response as? HTTPURLResponse {
                let result =  handelNetworkResponse(reponse)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(.failure, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(ProductResponse.self, from: responseData)
                        if apiResponse.status == .found {
                            completion(.success, "Poduct has been successfully added")
                        } else {
                            completion(.failure, "Error occured while adding product")
                        }
                    }catch {
                        completion(.failure, "\(error.localizedDescription)")
                    }
                case .failure(let failureError):
                    completion(.failure, failureError)
                }
            }
        }
    }
    
}
