![GitHub](https://travis-ci.org/keegho/off-sdk-ios.svg?branch=master)  [![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/keegho/off-sdk-ios/blob/master/LICENSE)  [![GitHub](https://img.shields.io/badge/open%20source-OpenFoodFacts-orange.svg)](https://github.com/openfoodfacts)  ![GitHub](https://img.shields.io/badge/swift%20version-4.2-blue.svg) [![GitHub](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)  [![Open Source Helpers](https://www.codetriage.com/keegho/off-sdk-ios/badges/users.svg)](https://www.codetriage.com/keegho/off-sdk-ios)
# Open Food Facts iOS SDK
An easy to use framework for building iOS apps for the [open food facts](https://en.wiki.openfoodfacts.org/API) api.
More features will be added soon this is just an initial start...
## Install using [cocoapods](https://cocoapods.org/)
`pod 'OpenFoodFactsSDK', :git => 'https://github.com/keegho/off-sdk-ios.git'`
## Install using [carthage](https://github.com/Carthage/Carthage)
Install [Homebrew](https://brew.sh/)
```
$ brew update
$ brew install carthage
```
Create Cartfile in your project root folder and add this to it.

```github "keegho/off-sdk-ios"```

Then in your terminal project root folder type.

```carthage update```

Now make sure to drag-and-drop the built frameworks into your Xcode project and import them in the source files that require them.
## How to use the SDK?
Example Read:
```swift
import OpenFoodFactsSDK
//In the AppDelegate.swift setup your enviroment and url prefix
    private let off = OFF()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        off.enviroment = .production   //.production . testing  //Default production
        off.lanugageUrl = .fr          //.world .fr .ar .de     //Default world
        
        return true
    }

//Then in the ViewController
import OpenFoodFactsSDK

private let off = OFF() 
private var item = OFFProduct()

override func viewDidLoad() {
    super.viewDidLoad()
    
    //Call get product closure function
    off.getProduct(code: "737628064502") { (product, message) in
            if product != nil {
                item = product!
                print(item?.genericName ?? "NO PRODUCT NAME")
            } else {
                print(message ?? "NO MESSAGE")
            }
     }
}
```
Example Write:
```swift
import OpenFoodFactsSDK
//In the AppDelegate.swift setup your enviroment and url prefix
    private let off = OFF()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        off.enviroment = .production   //.production . testing  //Default production
        off.lanugageUrl = .fr          //.world .fr .ar .de     //Default world
        off.username = "foo"           // username needed when editing
        off.password = "bar"           // password needed when editing
        
        return true
    }

//Then in the ViewController
import OpenFoodFactsSDK

private let off = OFF() 
private var item = OFFProduct()

override func viewDidLoad() {
    super.viewDidLoad()
    
        item.code = "1"
        item.genericName = "Golden Virginia Tobacco"
        item.productName = "Golden Virginia Classic"
        item.brandsText = "Golden Viginia"
        item.labelsText = "Causes Death, Die young"
        item.quantity = "50g"
    
    //Call add product closure function
    off.addProduct(product: item) { (status, msg) in
            switch status {
            case .success:
                print("ADDED")
            case .failure:
                print("NOT ADDED")
                
            }
     }
}
```
