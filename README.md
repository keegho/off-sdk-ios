[![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg)](https://en.wikipedia.org/wiki/MIT_License)
# Open Food Facts iOS SDK
An easy to use framework for building iOS apps for the open food facts database.
More coming soon...
## Install using cocoapods
`pod 'OpenFoodFactsSDK', :git => 'https://github.com/keegho/off-sdk-ios.git'`
## How to use the SDK?
Example:
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
