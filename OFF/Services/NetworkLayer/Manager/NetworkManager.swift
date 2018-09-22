//
//  NetworkManager.swift
//  ZUKI
//
//  Created by Kegham Karsian on 9/12/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static var enviroment: NetworkEnviroment = .production
    static var languageURL: LanguageURL = .world
    static var apiKey = ""
    static var username = ""
    static var password = ""

}

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to login first"
    case badRequest = "Bad Request"
    case outdated = "The url you requested is outdated"
    case failed = "Network request falied"
    case noData = "Request returned with no data"
    case unableToDecode = "We could't decode the reponse"
}

public enum Result<String> {
    case success
    case failure(String)
}

public func handelNetworkResponse(_ reponse:HTTPURLResponse) -> Result<String> {
    switch reponse.statusCode {
    case 200...299 : return .success
    case 401...500 : return .failure(NetworkResponse.authenticationError.rawValue)
    case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
    case 600: return .failure(NetworkResponse.outdated.rawValue)
    default:
        return .failure(NetworkResponse.failed.rawValue)
    }
}
