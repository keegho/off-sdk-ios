//
//  Product.swift
//  ZUKI
//
//  Created by Kegham Karsian on 9/12/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

public struct ProductResponse {
    public let statusVerbose: String
    public let code: String
    public let status: Int
    public let product: Product?
}


public struct Product {
    public let code: String?
    public let genericName: String?
    public let productName: String?
    public var countriesTags: [String]?
    public var countriesTagsAR: [String]?
    public let brandsTags: [String]?
    public let storesTags: [String]?
    public let ingredientText: String?
    public let ingredientsTextEN: String?
    public let ingredientsTextAR: String?
    public let creator: String?
    public let quantity: String?
    public let firstPackagingCodeGeo: String?
    public var tracesTags: [String]?
    public var tracesTagsAR: [String]?
    public var labelsTags: [String]?
    public var labelsTagsAR: [String]?
    public var packagingTags: [String]?
    //var packagingTagsAR: [String]?
    public let novaGoup: String?
    public let nutritionGrades: String?
    public let nutrietLevels: NutrientLevels?
    public let nutriments: Nutriments?
    
}

extension Product: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case genericName = "generic_name"
        case productName = "product_name"
        case countryTags = "countries_tags"
        case brandsTags = "brands_tags"
        case storesTags = "stores_tags"
        case ingredientsTextEN = "ingredients_text_en"
        case ingredientsTextAR = "ingredients_text_ar"
        case ingredientText = "ingredient_text"
        case creator = "creator"
        case quantity = "quantity"
        case firstPackagingCodeGeo = "first_packaging_code_geo"
        case tracesTags = "traces_tags"
        case labelsTags = "labels_tags"
        case packagingTags = "packaging_tags"
        case novaGroup = "nova_group"
        case nutritionGrades = "nutrition_grades"
        case nutrientLevels = "nutrient_levels"
        case nutriments = "nutriments"
        
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(String.self, forKey: .code)
        genericName = try container.decodeIfPresent(String.self, forKey: .genericName)
        productName = try container.decodeIfPresent(String.self, forKey: .productName)
        novaGoup = try container.decodeIfPresent(String.self, forKey: .novaGroup)
        brandsTags = try container.decodeIfPresent([String].self, forKey: .brandsTags)
        storesTags = try container.decodeIfPresent([String].self, forKey: .storesTags)
        ingredientText = try container.decodeIfPresent(String.self, forKey: .ingredientText)
        ingredientsTextEN = try container.decodeIfPresent(String.self, forKey: .ingredientsTextEN)
        ingredientsTextAR = try container.decodeIfPresent(String.self, forKey: .ingredientsTextAR)
        creator = try container.decodeIfPresent(String.self, forKey: .creator)
        quantity = try container.decodeIfPresent(String.self, forKey: .quantity)
        firstPackagingCodeGeo = try container.decodeIfPresent(String.self, forKey: .firstPackagingCodeGeo)
        nutritionGrades = try container.decodeIfPresent(String.self, forKey: .nutritionGrades)
        nutrietLevels = try container.decodeIfPresent(NutrientLevels.self, forKey: .nutrientLevels)
        nutriments = try container.decodeIfPresent(Nutriments.self, forKey: .nutriments)
        
        countriesTagsAR = try container.decodeIfPresent([String].self, forKey: .countryTags)?.filter{$0.contains(Languages.ar.rawValue)}
        countriesTagsAR = countriesTagsAR != nil && (countriesTagsAR?.isEmpty)! ? nil : countriesTagsAR
        countriesTags = try container.decodeIfPresent([String].self, forKey: .countryTags)?.filter{$0.contains(Languages.en.rawValue)}
        countriesTags = countriesTags != nil && (countriesTags?.isEmpty)! ? nil : countriesTags
        
        tracesTags = try container.decodeIfPresent([String].self, forKey: .tracesTags)?.filter{$0.contains(Languages.en.rawValue)}
        tracesTags = tracesTags != nil && (tracesTags?.isEmpty)! ? nil : tracesTags
        tracesTagsAR = try container.decodeIfPresent([String].self, forKey: .tracesTags)?.filter{$0.contains(Languages.ar.rawValue)}
        tracesTagsAR = tracesTagsAR != nil && (tracesTagsAR?.isEmpty)! ? nil : tracesTagsAR
        labelsTags = try container.decodeIfPresent([String].self, forKey: .labelsTags)?.filter{$0.contains(Languages.en.rawValue)}
        print(labelsTags ?? "NIL")
        labelsTags = labelsTags != nil && (labelsTags?.isEmpty)! ? nil : labelsTags
        labelsTagsAR = try container.decodeIfPresent([String].self, forKey: .labelsTags)?.filter{$0.contains(Languages.ar.rawValue)}
        labelsTagsAR = labelsTagsAR != nil && (labelsTagsAR?.isEmpty)! ? nil : labelsTagsAR
        //        packagingTagsAR = try container.decodeIfPresent([String].self, forKey: .packagingTags)?.filter{$0.contains(Languages.ar.rawValue)}
        //        packagingTagsAR = packagingTagsAR != nil && (packagingTagsAR?.isEmpty)! ? nil : packagingTagsAR
        packagingTags = try container.decodeIfPresent([String].self, forKey: .packagingTags)//?.filter{$0.contains(Languages.en.rawValue)}
        //packagingTags = packagingTags != nil && (packagingTags?.isEmpty)! ? nil : packagingTags
        
    }
    
}

extension ProductResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case statusVerbose = "status_verbose"
        case code = "code"
        case status = "status"
        case product = "product"
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(Int.self, forKey: .status)
        code = try container.decode(String.self, forKey: .code)
        statusVerbose = try container.decode(String.self, forKey: .statusVerbose)
        product = try container.decodeIfPresent(Product.self, forKey: .product)
    }
}



