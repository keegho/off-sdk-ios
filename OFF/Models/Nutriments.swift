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

    public let sodium: String?
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
        do {
            energy = try container.decodeIfPresent(String.self, forKey: .energy)
        }catch DecodingError.typeMismatch {
            energy = String(try container.decode(Int.self, forKey: .energy))
        }
        do {
            energy100g = try container.decodeIfPresent(String.self, forKey: .energy100g)
        } catch DecodingError.typeMismatch {
            energy100g = String(try container.decode(Int.self, forKey: .energy100g))
        }
        do {
            energyServing = try container.decodeIfPresent(String.self, forKey: .energyServing)
        }catch DecodingError.typeMismatch {
            energyServing = String(try container.decode(Double.self, forKey: .energyServing))
        }
        energyUnit = try container.decodeIfPresent(String.self, forKey: .energyUnit)
        do {
            sugar = try container.decodeIfPresent(String.self, forKey: .sugar)
        }catch DecodingError.typeMismatch {
            sugar = String(try container.decode(Double.self, forKey: .sugar))
        }
        do {
            sugarServing = try container.decodeIfPresent(String.self, forKey: .sugarServing)
        }catch DecodingError.typeMismatch{
            sugarServing = String(try container.decode(Double.self, forKey: .sugarServing))
        }
        do {
            sugar100g = try container.decodeIfPresent(String.self, forKey: .sugar100g)
        }catch DecodingError.typeMismatch {
            sugar100g = String(try container.decode(Double.self, forKey: .sugar100g))
        }
        sugarUnit = try container.decodeIfPresent(String.self, forKey: .sugarUnit)
        do {
            carbohydrates = try container.decodeIfPresent(String.self, forKey: .carbohydrates)
        }catch DecodingError.typeMismatch {
            carbohydrates = String(try container.decode(Double.self, forKey: .carbohydrates))
        }
        do {
            carbohydratesServing = try container.decodeIfPresent(String.self, forKey: .carbohydratesServing)
        }catch DecodingError.typeMismatch {
            carbohydratesServing = String(try container.decode(Double.self, forKey: .carbohydratesServing))
        }
        do {
            carbohydrates100g = try container.decodeIfPresent(String.self, forKey: .carbohydrates100g)
        }catch DecodingError.typeMismatch {
            carbohydrates100g = String(try container.decode(Double.self, forKey: .carbohydrates100g))
        }
        carbohydratesUnit = try container.decodeIfPresent(String.self, forKey: .carbohydratesUnit)
        do {
            sodium = try container.decodeIfPresent(String.self, forKey: .sodium)
        }catch DecodingError.typeMismatch {
            sodium = String(try container.decode(Double.self, forKey: .sodium))
        }
        do {
            sodiumServing = try container.decodeIfPresent(String.self, forKey: .sodiumServing)
        }catch DecodingError.typeMismatch {
            sodiumServing = String(try container.decode(Double.self, forKey: .sodiumServing))
        }
        do {
            sodium100g = try container.decodeIfPresent(String.self, forKey: .sodium100g)
        }catch DecodingError.typeMismatch {
            sodium100g = String(try container.decode(Double.self, forKey: .sodium100g))
        }
        sodiumUnit = try container.decodeIfPresent(String.self, forKey: .sodiumUnit)
        do {
            proteins = try container.decodeIfPresent(String.self, forKey: .proteins)
        }catch DecodingError.typeMismatch {
            proteins = String(try container.decode(Double.self, forKey: .proteins))
        }
        do {
            proteinsServing = try container.decodeIfPresent(String.self, forKey: .proteinsServing)
        }catch DecodingError.typeMismatch {
            proteinsServing = String(try container.decode(Double.self, forKey: .proteinsServing))
        }
        do {
            proteins100g = try container.decodeIfPresent(String.self, forKey: .proteins100g)
        }catch DecodingError.typeMismatch {
            proteins100g = String(try container.decode(Double.self, forKey: .proteins100g))
        }
        proteinsUnit = try container.decodeIfPresent(String.self, forKey: .proteinsUnit)
    }
}
