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
    private var item = Product()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        off.getProduct(code: "737628064502") { (product, message) in
            if product != nil {
                print(product?.genericName ?? "NO NAME")
                self.item = product!
                print(self.item.code ?? "NO CODE")
            } else {
                print(message ?? "NO MESSAGE")
            }
        }
        print(off.enviroment)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

