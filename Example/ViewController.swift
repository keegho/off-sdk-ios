//
//  ViewController.swift
//  ClientApp
//
//  Created by Kegham Karsian on 9/14/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import UIKit
import OpenFoodFactsSDK

class ViewController: UIViewController {

    private let off = OFF()
    private var item = OFFProduct()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        off.getProduct(code: "8595229910633") { (product, msg) in
            if product != nil {
                print(product?.genericName ?? "NO NAME")
                self.item = product!
                print(self.item.brandsTags ?? "NO BRAND TAGS")
                print(self.item.nutritionGrades?.rawValue.uppercased() ?? "NO NUTRI-SCORE")
                print(self.item.nutrietLevels?.salt?.rawValue ?? "NO SALT")
                print(self.item.nutrietLevels?.sugar?.rawValue ?? "NOT SUGAR")
                print(self.item.nutrietLevels?.fat?.rawValue ?? "NO FAT")
                print(self.item.nutrietLevels?.saturatedFats?.rawValue ?? "NOT SAT-FAT")
                print(self.item.categoriesTags ?? "NO CATEGORIES")
                print(self.item.categoriesTagsAR ?? "NO CATEGORIES AR")
                print(self.item.categoriesTagsEN ?? "NO CATEGORIES EN")
                print(self.item.additivesTags ?? "NO ADDITIVES")
                print(self.item.additivesTagsEN ?? "NO ADDITIVES EN")
                print(self.item.additivesTagsAR ?? "NO ADDITIVES AR")
                print(self.item.ingredientsTags ?? "NO INGREDIENTS")
                print(self.item.ingredientsTagsEN ?? "NO INGREDIENTS EN")
                print(self.item.ingredientsTagsAR ?? "NO INGREDIENTS AR")
                print(self.item.createdAt.stringDateShort)
                print(self.item.code ?? "NO CODE")
                print(self.item.nutriments?.energyUnit ?? "NO ENGERY UNIT")
                print(self.item.imageIngredientsSmall?.absoluteString ?? "NO INGREDIENTS SMALL IMAGE")
                print(self.item.nutriments?.carbohydrates ?? "NO CARBS")
            } else {
                print(msg ?? "NO MESSAGE")
            }
        }
        //print(off.enviroment)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

