//
//  HelperExtensions.swift
//  OpenFoodFactsSDK
//
//  Created by Kegham Karsian on 9/16/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation
import UIKit

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

public extension UIImageView {
    
    public func downloadImage(url: URL) {
        DispatchQueue.global().async {
            let data: Data!
            do {
                data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }catch {
                self.image = UIImage()
//                print("NO IMAGE IN URL")
//                fatalError("No image url found")
            }
        }
    }
}

//extension Array {
//    func tuplesToDictionary<K,V>() -> [K:V] where Iterator.Element == (K,V) {
//        return self.reduce([:]) {
//            var dict:[K:V] = $0
//            dict[$1.0] = $1.1
//            return dict
//        }
//    }
//}


