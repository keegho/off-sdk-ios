//
//  NutrientsLevels.swift
//  ZUKI
//
//  Created by Kegham Karsian on 9/14/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

public struct NutrientLevels {
    public let salt: String?
    public let saturatedFats: String?
    public let fat: String?
    public let sugar: String?
}

extension NutrientLevels: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case salt = "salt"
        case fat = "fat"
        case saturatedFats = "saturated-fat"
        case sugar = "sugars"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        salt = try container.decodeIfPresent(String.self, forKey: .salt)
        fat = try container.decodeIfPresent(String.self, forKey: .fat)
        saturatedFats = try container.decodeIfPresent(String.self, forKey: .saturatedFats)
        sugar = try container.decodeIfPresent(String.self, forKey: .sugar)
    }
    
}
