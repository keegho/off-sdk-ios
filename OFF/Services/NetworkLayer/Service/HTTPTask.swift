//
//  HttpTask.swift
//  ZUKI
//
//  Created by Kegham Karsian on 9/12/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request
    case requsetParameters(bodyParameters: Parameters?, urlParameters:Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters:Parameters?, additionalHeaders: HTTPHeaders?)
    
    //case download...etc
}
