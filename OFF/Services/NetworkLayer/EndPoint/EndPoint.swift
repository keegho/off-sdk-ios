//
//  EndPoint.swift
//  ZUKI
//
//  Created by Kegham Karsian on 9/12/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation


protocol EndPointType {
    var baseUrl: URL {get}
    var path: String {get}
    var httpMethod: HTTPMethod {get}
    var task : HTTPTask {get}
    var headers: HTTPHeaders? {get}
}

