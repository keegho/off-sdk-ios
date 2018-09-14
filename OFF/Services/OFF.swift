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
    
    public init(){}
    
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
