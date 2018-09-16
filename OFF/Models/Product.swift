//
//  Product.swift
//  ZUKI
//
//  Created by Kegham Karsian on 9/12/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

//public struct ProductManager {
//    static var status: ResponseStatus = .notFound
//}

public struct ProductResponse {
    public let statusVerbose: String
    public let code: String
    public var status: ResponseStatus = .notFound
    public let product: OFFProduct?
}

public enum ResponseStatus {
    case notFound
    case found
}


/**
 A Open food facts product model class
*/
public class OFFProduct {
    public var code: String!
    public var createdAt: Double!
    public var lastModifiedBy: String?
    public var genericName: String?
    public var productName: String?
    public var countriesTags: [String]?
    public var countriesTagsAR: [String]?
    public var brandsTags: [String]?
    public var storesTags: [String]?
    //INGREDIENTS
    public var ingredientText: String?
    public var ingredientsTextEN: String?
    public var ingredientsTextAR: String?
    public var ingredientsTags: [String]?
    public var ingredientsTagsEN: [String]?
    public var ingredientsTagsAR: [String]?
    public var creator: String!
    public var quantity: String?
    public var firstPackagingCodeGeo: String?
    //TRACES LABELS PACKAGING
    public var tracesTags: [String]?
    public var tracesTagsAR: [String]?
    public var labelsTags: [String]?
    public var labelsTagsAR: [String]?
    public var packagingTags: [String]?
    //var packagingTagsAR: [String]?
    //GRADES
    public var novaGoup: String?
    public var nutritionGrades: NutriScore?
    public var nutrietLevels: NutrientLevels?
    public var nutriments: Nutriments?
    public var servingSize: String?
    //ADDITIVES
    public var additivesTags: [String]?
    public var additivesTagsEN: [String]?
    public var additivesTagsAR: [String]?
    //CATEGORIES
    public var categoriesTags: [String]?
    public var categoriesTagsEN: [String]?
    public var categoriesTagsAR: [String]?
    //IMAGES
    public var imageFrontSmall: URL?
    public var imageNutritionSmall: URL?
    public var imageIngredientsSmall: URL?
    public var imageFrontThumb: URL?
    public var imageNutritionThumb: URL?
    public var imageIngredientsThumb: URL?
    

    public init(){}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(String.self, forKey: .code)
        createdAt = try container.decode(Double.self, forKey: .createdAt)
        lastModifiedBy = try container.decode(String.self, forKey: .lastModifiedBy)
        genericName = try container.decodeIfPresent(String.self, forKey: .genericName)
        productName = try container.decodeIfPresent(String.self, forKey: .productName)
        do {
            novaGoup = try container.decodeIfPresent(String.self, forKey: .novaGroup)
        }catch DecodingError.typeMismatch {
            novaGoup = String(try container.decode(Int.self, forKey: .novaGroup))
        }
        brandsTags = try container.decodeIfPresent([String].self, forKey: .brandsTags)
        storesTags = try container.decodeIfPresent([String].self, forKey: .storesTags)
        ingredientText = try container.decodeIfPresent(String.self, forKey: .ingredientText)
        ingredientsTextEN = try container.decodeIfPresent(String.self, forKey: .ingredientsTextEN)
        ingredientsTextAR = try container.decodeIfPresent(String.self, forKey: .ingredientsTextAR)
        ingredientsTags = try container.decodeIfPresent([String].self, forKey: .ingredientsTags)
        ingredientsTagsEN = try container.decodeIfPresent([String].self, forKey: .ingredientsTags)?.filter{$0.contains(Languages.en.rawValue)}
        ingredientsTagsEN = ingredientsTagsEN != nil && (ingredientsTagsEN?.isEmpty)! ? nil : ingredientsTagsEN
        ingredientsTagsAR = try container.decodeIfPresent([String].self, forKey: .ingredientsTags)?.filter{$0.contains(Languages.ar.rawValue)}
        ingredientsTagsAR = ingredientsTagsAR != nil && (ingredientsTagsAR?.isEmpty)! ? nil : ingredientsTagsAR
        creator = try container.decodeIfPresent(String.self, forKey: .creator)
        quantity = try container.decodeIfPresent(String.self, forKey: .quantity)
        servingSize = try container.decodeIfPresent(String.self, forKey: .servingSize)
        firstPackagingCodeGeo = try container.decodeIfPresent(String.self, forKey: .firstPackagingCodeGeo)
        nutritionGrades = try container.decodeIfPresent(NutriScore.self, forKey: .nutritionGrades)
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
        labelsTags = labelsTags != nil && (labelsTags?.isEmpty)! ? nil : labelsTags
        labelsTagsAR = try container.decodeIfPresent([String].self, forKey: .labelsTags)?.filter{$0.contains(Languages.ar.rawValue)}
        labelsTagsAR = labelsTagsAR != nil && (labelsTagsAR?.isEmpty)! ? nil : labelsTagsAR
        //        packagingTagsAR = try container.decodeIfPresent([String].self, forKey: .packagingTags)?.filter{$0.contains(Languages.ar.rawValue)}
        //        packagingTagsAR = packagingTagsAR != nil && (packagingTagsAR?.isEmpty)! ? nil : packagingTagsAR
        packagingTags = try container.decodeIfPresent([String].self, forKey: .packagingTags)//?.filter{$0.contains(Languages.en.rawValue)}
        //packagingTags = packagingTags != nil && (packagingTags?.isEmpty)! ? nil : packagingTags
        additivesTags = try container.decodeIfPresent([String].self, forKey: .additivesTag)
        additivesTagsEN = try container.decodeIfPresent([String].self, forKey: .additivesTag)?.filter{$0.contains(Languages.en.rawValue)}
        additivesTagsEN = additivesTagsEN != nil && (additivesTagsEN?.isEmpty)! ? nil : additivesTagsEN
        additivesTagsAR = try container.decodeIfPresent([String].self, forKey: .additivesTag)?.filter{$0.contains(Languages.ar.rawValue)}
        additivesTagsAR = additivesTagsAR != nil && (additivesTagsAR?.isEmpty)! ? nil : additivesTagsAR
        categoriesTags = try container.decodeIfPresent([String].self, forKey: .categoriesTags)
        categoriesTagsEN = try container.decodeIfPresent([String].self, forKey: .categoriesTags)?.filter{$0.contains(Languages.en.rawValue)}
        categoriesTagsEN = categoriesTagsEN != nil && (categoriesTagsEN?.isEmpty)! ? nil : categoriesTagsEN
        categoriesTagsAR = try container.decodeIfPresent([String].self, forKey: .categoriesTags)?.filter{$0.contains(Languages.ar.rawValue)}
        categoriesTagsAR = categoriesTagsAR != nil && (categoriesTagsAR?.isEmpty)! ? nil : categoriesTagsAR
        
        //IMAGES
        imageFrontSmall = try container.decodeIfPresent(URL.self, forKey: .imageFrontSmall)
        imageFrontThumb = try container.decodeIfPresent(URL.self, forKey: .imageFrontThumb)
        imageNutritionSmall = try container.decodeIfPresent(URL.self, forKey: .imageNutritionSmall)
        imageNutritionThumb = try container.decodeIfPresent(URL.self, forKey: .imageNutritionThumb)
        imageIngredientsSmall = try container.decodeIfPresent(URL.self, forKey: .imageIngredientsSmall)
        imageIngredientsThumb = try container.decodeIfPresent(URL.self, forKey: .imageIngredientsThumb)
        
    }
}

extension OFFProduct: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case createdAt = "created_t"
        case lastModifiedBy = "last_modified_by"
        case genericName = "generic_name"
        case productName = "product_name"
        case countryTags = "countries_tags"
        case brandsTags = "brands_tags"
        case storesTags = "stores_tags"
        case ingredientsTextEN = "ingredients_text_en"
        case ingredientsTextAR = "ingredients_text_ar"
        case ingredientText = "ingredient_text"
        case ingredientsTags = "ingredients_hierarchy"
        case creator = "creator"
        case quantity = "quantity"
        case servingSize = "serving_size"
        case firstPackagingCodeGeo = "first_packaging_code_geo"
        case tracesTags = "traces_tags"
        case labelsTags = "labels_tags"
        case packagingTags = "packaging_tags"
        case novaGroup = "nova_group"
        case nutritionGrades = "nutrition_grades"
        case nutrientLevels = "nutrient_levels"
        case nutriments = "nutriments"
        case additivesTag = "additives_tags"
        case categoriesTags = "categories_hierarchy"
        
        //IMAGES
        case imageFrontSmall = "image_front_small_url"
        case imageFrontThumb = "image_front_thumb_url"
        case imageNutritionSmall = "image_nutrition_small_url"
        case imageNutritionThumb = "image_nutrition_thumb_url"
        case imageIngredientsSmall = "image_ingredients_small_url"
        case imageIngredientsThumb = "image_ingredients_thumb_url"
        
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
        let statusReply = try container.decode(Int.self, forKey: .status)
        if statusReply == 0 {
            status = .notFound
        } else if statusReply == 1 {
            status = .found
        }
        code = try container.decode(String.self, forKey: .code)
        statusVerbose = try container.decode(String.self, forKey: .statusVerbose)
        product = try container.decodeIfPresent(OFFProduct.self, forKey: .product)
    }
}



