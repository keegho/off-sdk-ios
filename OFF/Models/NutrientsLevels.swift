//
//  NutrientsLevels.swift
//  ZUKI
//
//  Created by Kegham Karsian on 9/14/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

public enum Levels: String, Codable {
    case low
    case moderate
    case high
}

public struct NutrientLevels: Codable {
    public let salt: Levels?
    public let saturatedFats: Levels?
    public let fat: Levels?
    public let sugar: Levels?
}


extension NutrientLevels {
    
    private enum CodingKeys: String, CodingKey {
        case salt = "salt"
        case fat = "fat"
        case saturatedFats = "saturated-fat"
        case sugar = "sugars"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        salt = try container.decodeIfPresent(Levels.self, forKey: .salt)
        fat = try container.decodeIfPresent(Levels.self, forKey: .fat)
        saturatedFats = try container.decodeIfPresent(Levels.self, forKey: .saturatedFats)
        sugar = try container.decodeIfPresent(Levels.self, forKey: .sugar)
    }
    
    public func encode(to encoder: Encoder) throws {
        
    }
    
}
