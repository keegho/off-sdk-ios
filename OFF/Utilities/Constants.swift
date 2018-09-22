//
//  Constants.swift
//  OpenFoodFactsSDK
//
//  Created by Kegham Karsian on 9/22/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

struct Constants {
    
    static let username = "username"
    static let password = "password"
    
    struct OffProduct {
        static let code = "code"
        static let createdAt = "created_t"
        static let lastModifiedBy = "last_modified_by"
        static let genericName = "generic_name"
        static let productName = "product_name"
        static let countriesText = "countries"
        static let countryTags = "countries_tags"
        static let brandsText = "brands"
        static let brandsTags = "brands_tags"
        static let storesText = "stores"
        static let storesTags = "stores_tags"
        static let ingredientsTextEN = "ingredients_text_en"
        static let ingredientsTextAR = "ingredients_text_ar"
        static let ingredientText = "ingredient_text"
        static let ingredientsTags = "ingredients_hierarchy"
        static let creator = "creator"
        static let quantity = "quantity"
        static let servingSize = "serving_size"
        static let firstPackagingCodeGeo = "first_packaging_code_geo"
        static let tracesText = "traces"
        static let labelsText = "labels"
        static let tracesTags = "traces_tags"
        static let labelsTags = "labels_tags"
        static let packagingTags = "packaging_tags"
        static let novaGroup = "nova_group"
        static let nutritionGrades = "nutrition_grades"
        static let nutrientLevels = "nutrient_levels"
        static let nutriments = "nutriments"
        static let nutritionDataPer = "nutrition_data_per"
        static let additivesTag = "additives_tags"
        static let categoriesText = "categories"
        static let categoriesTags = "categories_hierarchy"
        static let additivesText = "additives"
    }
    
//    struct NutriScore {
//
//        static let a = "a"
//        static let b = "b"
//        static let c = "c"
//        static let d = "d"
//        static let e = "e"
//
//
//    }
    
    struct NutrientLevels {
        
        static let salt = "salt"
        static let fat = "fat"
        static let saturatedFats = "saturated-fat"
        static let sugar = "sugars"
        
    }
    
    struct Nutriments {
        
        static let energy = "energy"
        static let energyServing = "energy_serving"
        static let energy100g = "energy_100g"
        static let energyUnit = "energy_unit"
        static let sugar = "sugars"
        static let sugarServing = "sugars_serving"
        static let sugar100g = "sugars_100g"
        static let sugarUnit = "sugars_unit"
        static let carbohydrates = "carbohydrates"
        static let carbohydratesServing = "carbohydrates_serving"
        static let carbohydrates100g = "carbohydrates_100g"
        static let carbohydratesUnit = "carbohydrates_unit"
        static let sodium = "sodium"
        static let sodiumServing = "sodium_serving"
        static let sodium100g = "sodium_100g"
        static let sodiumUnit = "sodium_unit"
        static let proteins = "proteins"
        static let proteinsServing = "proteins_serving"
        static let proteins100g = "proteins_100g"
        static let proteinsUnit = "proteins_unit"
        static let fat = "fat"
        static let fatServing = "fat_serving"
        static let fat100g = "pfat_100g"
        static let fatUnit = "fat_unit"
        static let saturatedFat = "saturated-fat"
        static let saturatedFatServing = "saturated-fat_serving"
        static let saturatedFat100g = "saturated-fat_100g"
        static let saturatedFatUnit = "saturated-fat_unit"
        static let fiber = "fiber"
        static let fiberServing = "fiber_serving"
        static let fiber100g = "fiber_100g"
        static let fiberUnit = "fiber_unit"
        static let salt = "salt"
        static let saltServing = "salt_serving"
        static let salt100g = "salt_100g"
        static let saltUnit = "salt_unit"
        
    }
    
    struct Images {
        
        static let imageFrontSmall = "image_front_small_url"
        static let imageFrontThumb = "image_front_thumb_url"
        static let imageNutritionSmall = "image_nutrition_small_url"
        static let imageNutritionThumb = "image_nutrition_thumb_url"
        static let imageIngredientsSmall = "image_ingredients_small_url"
        static let imageIngredientsThumb = "image_ingredients_thumb_url"
    }

}
