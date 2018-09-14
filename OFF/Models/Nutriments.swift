//
//  Nutriments.swift
//  ZUKI
//
//  Created by Kegham Karsian on 9/14/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

public struct Nutriments {
    public let energy: String?
    public let energyServing: String?
    public let energy100g: String?
    public let energyUnit: String?
    
    public let sugar: String?
    public let sugarServing: String?
    public let sugar100g: String?
    public let sugarUnit: String?
    
    public let carbohydrates: String?
    public let carbohydratesServing: String?
    public let carbohydrates100g: String?
    public let carbohydratesUnit: String?
    
    public let sodium: Int?
    public let sodiumServing: String?
    public let sodium100g: String?
    public let sodiumUnit:String?
    
    public let proteins: String?
    public let proteinsServing: String?
    public let proteins100g: String?
    public let proteinsUnit: String?
}

extension Nutriments: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case energy = "energy"
        case energyServing = "energy_serving"
        case energy100g = "energy_100g"
        case energyUnit = "energy_unit"
        case sugar = "sugars"
        case sugarServing = "sugars_serving"
        case sugar100g = "sugars_100g"
        case sugarUnit = "sugars_unit"
        case carbohydrates = "carbohydrates"
        case carbohydratesServing = "carbohydrates_serving"
        case carbohydrates100g = "carbohydrates_100g"
        case carbohydratesUnit = "carbohydrates_unit"
        case sodium = "sodium"
        case sodiumServing = "sodium_serving"
        case sodium100g = "sodium_100g"
        case sodiumUnit = "sodium_unit"
        case proteins = "proteins"
        case proteinsServing = "proteins_serving"
        case proteins100g = "proteins_100g"
        case proteinsUnit = "proteins_unit"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        energy = try container.decodeIfPresent(String.self, forKey: .energy)
        energy100g = try container.decodeIfPresent(String.self, forKey: .energy100g)
        energyServing = try container.decodeIfPresent(String.self, forKey: .energyServing)
        energyUnit = try container.decodeIfPresent(String.self, forKey: .energyUnit)
        sugar = try container.decodeIfPresent(String.self, forKey: .sugar)
        sugarServing = try container.decodeIfPresent(String.self, forKey: .sugarServing)
        sugar100g = try container.decodeIfPresent(String.self, forKey: .sugar100g)
        sugarUnit = try container.decodeIfPresent(String.self, forKey: .sugarUnit)
        carbohydrates = try container.decodeIfPresent(String.self, forKey: .carbohydrates)
        carbohydratesServing = try container.decodeIfPresent(String.self, forKey: .carbohydratesServing)
        carbohydrates100g = try container.decodeIfPresent(String.self, forKey: .carbohydrates100g)
        carbohydratesUnit = try container.decodeIfPresent(String.self, forKey: .carbohydratesUnit)
        sodium = try container.decodeIfPresent(Int.self, forKey: .sodium)
        sodiumServing = try container.decodeIfPresent(String.self, forKey: .sodiumServing)
        sodium100g = try container.decodeIfPresent(String.self, forKey: .sodium100g)
        sodiumUnit = try container.decodeIfPresent(String.self, forKey: .sodiumUnit)
        proteins = try container.decodeIfPresent(String.self, forKey: .proteins)
        proteinsServing = try container.decodeIfPresent(String.self, forKey: .proteinsServing)
        proteins100g = try container.decodeIfPresent(String.self, forKey: .proteins100g)
        proteinsUnit = try container.decodeIfPresent(String.self, forKey: .proteinsUnit)
    }
}
