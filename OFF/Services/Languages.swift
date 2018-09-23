//
//  Languages.swift
//  ZUKI
//
//  Created by Kegham Karsian on 9/14/18.
//  Copyright © 2018 idesign. All rights reserved.
//

import Foundation

public enum ProductLang {
    case ar
    case fr
    case en
    case none
}

enum Languages: String {
    case en = "en:"
    case ar = "ar:"
    case fr = "fr:"
}

struct LanguageManager {
    static var productLanguage: ProductLang = .none
}
