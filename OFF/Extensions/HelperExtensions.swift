//
//  HelperExtensions.swift
//  OpenFoodFactsSDK
//
//  Created by Kegham Karsian on 9/16/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

public extension Double {
    
    public var stringDateShort: String {
        let date = Date(timeIntervalSince1970: self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current//Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: date)
    }
    
    public var stringDateLong: String {
        let date = Date(timeIntervalSince1970: self)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current//Locale(identifier: "en_US")
        dateFormatter.dateStyle = .long
        
        return dateFormatter.string(from: date)
    }
}
